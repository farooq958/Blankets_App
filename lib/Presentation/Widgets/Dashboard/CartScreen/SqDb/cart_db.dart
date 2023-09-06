import 'package:flutter/material.dart';
import 'package:hbk/Domain/Models/Cart/cart_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
class CartDatabase {
  CartDatabase._init();

  ///03:
  //global instance to call this class constructor
  static final CartDatabase cartDatabaseInstance = CartDatabase._init();

  ///04:
  //this field is for our database
  static Database? _database;

  ///05:
  //before CRUD operation we will use this for connection
  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB(
        'cart.db'); //file 'ride.db' is where our db will be stored

    return _database!;
  }

  ///06:
  //here we are initializing our database
  Future<Database> _initDB(String filePath) async {
    //01.here we are storing our db in our file storage system
    final dbPath = await getDatabasesPath();
    //On Android, it is typically data/data/ /databases
    // On iOS and MacOS, it is the Documents directory.
    //if you want to add other path you can use path_provider package
    //and replace 'getDatabasePath()' method with desired path

    //02.from our 'dbPath' and 'filePath' (which we define above) we here
    //create a new path object
    final path = join(dbPath, filePath);

    //03.now we are opening our db and putting our path inside here
    //secondly we are supplying a version here (default 1)
    //third we are defining our db schema (data skeleton) here
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  ///07:
  //here we made this method to close our app
  Future close() async {
    //01. we are accessing our db here
    final db = await cartDatabaseInstance.database;
    //02. then we simply call this close() method
    db.close();
  }

//08:
  ///here we are defining our db schema
  ///note: this method will only executed one time when we initially want to set a local db
  Future _createDB(Database db, int version) async {
    //Note: here first create a model 'here: RideModel' then continue here further

    const idType =
        'INTEGER PRIMARY KEY AUTOINCREMENT'; //final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT'; (try for all)
    const textType = 'TEXT NOT NULL';
    const integerType = 'num NOT NULL';
    await db.execute('''
    CREATE TABLE CartTable (
     id $idType,
      productId TEXT,
       productImage TEXT,
       productName TEXT,
        productPrice TEXT,
        pcsCtn TEXT,
        productQuantity TEXT,
            multiplier TEXT
          )
    ''');
  }
  Future<int> insertCart(CartModel cart) async {
    final db = await cartDatabaseInstance.database;
 int status=  await db.insert(
      'CartTable',
      cart.toMap()
     // conflictAlgorithm: ConflictAlgorithm.ignore,
    );
 print(status);
    return status;
  }
  Future<int?> createOrInsert(CartModel cart) async {
    try {
      //01. get db reference
      final db = await cartDatabaseInstance.database;

      //02.call insert method
      final id = await db.insert("CartTable", cart.toMap());

      //03. here 'id' is a unique  id which we want to pass to our 'cart' object
      return id;
    } catch (error) {
      debugPrint('error at adding cart method $error');
      return null;
    }
  }

  Future<List<CartModel>> getAllCartItems() async {
    final db = await cartDatabaseInstance.database;
    final List<Map<String, dynamic>> maps = await db.query('CartTable');
    return List.generate(maps.length, (i) {
      return CartModel(
       // id: maps[i]['id'],
        productId: maps[i]['productId'],
        productImage: maps[i]['productImage'],
        productName: maps[i]['productName'],
        productPrice: maps[i]['productPrice'],
        pcsCtn: maps[i]['pcsCtn'],
        productQuantity: maps[i]['productQuantity'],
        multiplier: maps[i]['multiplier']
      );
    });
  }
  Future<Object> calculateGrandTotal() async {
    final db = await cartDatabaseInstance.database;

    // Calculate the total for each item and sum them up to get the grand total
    final result = await db.rawQuery('''
    SELECT SUM(CAST(productQuantity AS REAL) * CAST(productPrice AS REAL)) AS grandTotal
    FROM CartTable
  ''');

    // Extract the grand total from the query result
    final grandTotal = result.isNotEmpty ? result.first['grandTotal'] ?? 0.0 : 0.0;
print('from db total');
    print(grandTotal);
    return grandTotal;
  }

  Future<Object> getTotalQuantity() async {
    final db = await cartDatabaseInstance.database;

    // Calculate the total quantity by summing up all productQuantity values
    final result = await db.rawQuery('SELECT SUM(productQuantity) AS totalQuantity FROM CartTable');

    // Extract the total quantity from the query result
    final totalQuantity = result.isNotEmpty ? result.first['totalQuantity'] ?? 0 : 0;

    return totalQuantity;
  }
  Future<void> clearCart() async {
    final db = await cartDatabaseInstance.database;

    // Delete all rows from the 'cart' table
    await db.delete('CartTable');
  }


  Future<int> updateCart(CartModel cart) async {
    final db = await cartDatabaseInstance.database;

    // Update the record where productId matches
    int status=   await db.update(
      'CartTable',
      cart.toMap(),
      where: 'productId = ?',
      whereArgs: [cart.productId],
    );
    print('updating...');
    print(status);
    return status;
  }

  Future<int> deleteCart(String productId) async {
    final db = await cartDatabaseInstance.database;

    // Delete the record where productId matches
 int status=   await db.delete(
      'CartTable',
      where: 'productId = ?',
      whereArgs: [productId],
    );
    return status;
  }

  Future<bool> isProductInCart(String productId) async {
    final db = await cartDatabaseInstance.database;

    // Check if a row with the given productId exists in the 'cart' table
    List<Map<String, dynamic>> result = await db.query(
      'CartTable',
      where: 'productId = ?',
      whereArgs: [productId],
      limit: 1, // Limit the query to one result to check existence
    );
    print('fromDbbool');
    print(result);
bool res= result.isEmpty ? true :false;
    return  res; // If the list is not empty, the product exists; otherwise, it doesn't.
  }




}