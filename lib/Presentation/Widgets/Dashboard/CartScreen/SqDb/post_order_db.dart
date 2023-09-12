import 'package:hbk/Domain/Models/Cart/order_db_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class PostOrderDb {
  PostOrderDb._init();

  ///03:
  //global instance to call this class constructor
  static final PostOrderDb orderDatabaseInstance = PostOrderDb._init();

  ///04:
  //this field is for our database
  static Database? _database;

  ///05:
  //before CRUD operation we will use this for connection
  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB(
        'order.db'); //file 'ride.db' is where our db will be stored

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
    final db = await orderDatabaseInstance.database;
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
    CREATE TABLE OrderTable (
     id $idType,
      productId TEXT,
       productName TEXT,
        productQuantity TEXT,
        productDateTime TEXT
          )
    ''');
  }

  Future<int> insertOrder(OrderDbModel cart) async {
    final db = await orderDatabaseInstance.database;
    int status = await db.insert('OrderTable', cart.toMap()
        // conflictAlgorithm: ConflictAlgorithm.ignore,
        );
    print(status);
    return status;
  }

  Future<int> updateOrder(OrderDbModel cart) async {
    final db = await orderDatabaseInstance.database;

    // Update the record where productId matches
    int status = await db.update(
      'OrderTable',
      cart.toMap(),
      where: 'productId = ?',
      whereArgs: [cart.productId],
    );
    print('updating...');
    print(status);
    return status;
  }

  Future<String> updateOrInsertProduct(DateTime dateTime1, String productId,
      String productName, String quantity) async {
    // Check if the product exists for the given dateTime
    final database = await orderDatabaseInstance.database;
    final dateTime = DateTime(dateTime1.year, dateTime1.month, dateTime1.day);

    print('Input DateTime: $dateTime1');
    print('Truncated DateTime: $dateTime');

    final existingProduct = await database.query(
      'OrderTable',
      where: 'productDateTime = ? AND productId = ?',
      whereArgs: [dateTime.toIso8601String(), productId],
    );

    if (existingProduct.isNotEmpty) {
      // Product exists for the given dateTime
      final existingQuantity =
          int.parse(existingProduct.first['productQuantity'].toString());
      final newQuantity = existingQuantity + int.parse(quantity);

      if (newQuantity > 50) {
        return 'Quantity limit exceeded for $productName Quantity Limit left is ${50 - existingQuantity}';
      } else {
        await database.update(
          'OrderTable',
          {'productQuantity': newQuantity.toString()},
          where: 'productDateTime = ? AND productId = ?',
          whereArgs: [dateTime.toIso8601String(), productId],
        );
        return '1';
      }
    } else {
      // Check if the product exists with the same ID but a different dateTime
      final existingProductWithSameId = await database.query(
        'OrderTable',
        where: 'productId = ?',
        whereArgs: [productId],
      );

      if (existingProductWithSameId.isNotEmpty) {
        // Product with the same ID exists but with a different dateTime
        await database.update(
          'OrderTable',
          {
            'productQuantity': quantity,
            'productDateTime': dateTime.toIso8601String()
          },
          where: 'productId = ?',
          whereArgs: [productId],
        );
        // await database.insert(
        //   'OrderTable',
        //   {
        //     'productDateTime': dateTime.toIso8601String(),
        //     'productId': productId,
        //     'productName': productName,
        //     'productQuantity': quantity,
        //   },
        // );
        return '1';
      } else {
        // Product does not exist for the given dateTime or ID
        await database.insert(
          'OrderTable',
          {
            'productDateTime': dateTime.toIso8601String(),
            'productId': productId,
            'productName': productName,
            'productQuantity': quantity,
          },
        );
        return '1';
      }
    }
  }

  Future<void> clearOrders() async {
    final db = await orderDatabaseInstance.database;

    // Delete all rows from the 'cart' table
    await db.delete('OrderTable');
  }
}
