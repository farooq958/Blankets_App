import 'package:flutter/cupertino.dart';
import 'package:hbk/Data/AppData/data.dart';
import 'package:hbk/Data/DataSource/Resources/assets.dart';
import 'package:hbk/Domain/Models/DashboardBottomModel/bottom_card_model.dart';
import 'package:hbk/Domain/Models/DashboardBottomModel/custom_card_model.dart';
import 'package:hbk/Domain/Models/Cart/cart_item.dart';
import 'package:hbk/Domain/Models/HomeScreen/category_model.dart';
import 'package:hbk/Domain/Models/HomeScreen/drawer_model.dart';
import 'package:hbk/Domain/Models/HomeScreen/product_model.dart';
import 'package:hbk/Domain/Models/Order/order_item.dart';
import 'package:hbk/Domain/Models/orderModel.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/DashboardBottomScreen/dashboard_screen.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/Orders/orderScreen.dart';
import 'package:hbk/Presentation/Widgets/Dashboard/Statement/statement_screen.dart';

class Utils {
  static  ValueNotifier<String> productTitle=ValueNotifier('All Products');
  static List<String> textList = [
    'Discover Warmth',
    'Effortless Shopping Experience',
    'Secure Checkout & Fast Delivery',
    // Add more texts...
  ];

  static List<String> textSubtitles = [
    'Start your journey with us and discover a wide selection of high-quality blankets that will keep you and your loved ones warm and cozy during chilly nights.',
    'Experience hassle-free shopping with our intuitive app interface. Browse through a wide variety of blankets, filter by size and material, and find the perfect match for your needs.',
    'Rest easy knowing your payments are safe and secure. Our speedy delivery service ensures your cozy blanket will arrive at your doorstep in no time, ready to envelop you in warmth.',
  ];

  // Add your image and content data here for different steps of the onboarding.
  static List<String> imageList = [
    Assets.onboarding1,
    Assets.onboarding2,
    Assets.onboarding3,
    // Add more images...
  ];

  static List<CategoryProduct> categoryDummyProduct = [
    CategoryProduct(
        productId: "1",
        productImage: "assets/images/dummy.png",
        productName: "General Product"),
    CategoryProduct(
        productId: "2",
        productImage: "assets/images/dummy2.png",
        productName: "Baby Blanket"),
    CategoryProduct(
        productId: "3",
        productImage: "assets/images/dummy3.png",
        productName: "Flannel Blanket"),
    CategoryProduct(
        productId: "4",
        productImage: "assets/images/dummy2.png",
        productName: "Baby Blanket"),
    CategoryProduct(
        productId: "5",
        productImage: "assets/images/dummy.png",
        productName: "General Product")
  ];
  static List<ProductModel> dummyProduct = [
    ProductModel(
        productId: "1",
        productImage: "assets/images/appname.png",
        productDescription: "Belpla Teenagers 1 Ply Single Bed Blanket",
        productPrice: "2500"),
    ProductModel(
        productId: "2",
        productImage: "assets/images/appname.png",
        productDescription: "Belpla Teenagers 1 Ply Single Bed Blanket",
        productPrice: "3000"),
    ProductModel(
        productId: "3",
        productImage: "assets/images/dummy3.png",
        productDescription: "Belpla Teenagers 1 Ply Single Bed Blanket",
        productPrice: "1000"),
    ProductModel(
        productId: "4",
        productImage: "assets/images/appname.png",
        productDescription: "Belpla Teenagers 1 Ply Single Bed Blanket",
        productPrice: "9000"),
    ProductModel(
        productId: "5",
        productImage: "assets/images/dummy.png",
        productDescription: "Belpla Teenagers 1 Ply Single Bed Blanket",
        productPrice: "12000")
  ];

  static List<DrawerModel> drawerData = [
    DrawerModel(
        screenName: 'Order',
        iconPath: Assets.bagIcon,
        widgetToNavigate: const OrderScreen()),
    DrawerModel(
        screenName: 'Statement',
        iconPath: Assets.statementIcon,
        widgetToNavigate:  CustomerStatementScreen()),
    DrawerModel(
        screenName: 'Price list',
        iconPath: Assets.priceIcon,
        widgetToNavigate: const DashboardBottom()),
    DrawerModel(
        screenName: 'Reward',
        iconPath: Assets.rewardIcon,
        widgetToNavigate: const DashboardBottom()),
    DrawerModel(
        screenName: 'Invoice',
        iconPath: Assets.invoiceIcon,
        widgetToNavigate: const DashboardBottom()),
    DrawerModel(
        screenName: 'Sale policies',
        iconPath: Assets.salePolicyIcon,
        widgetToNavigate: const DashboardBottom()),
    DrawerModel(
        screenName: 'Feedback',
        iconPath: Assets.feedbackIcon,
        widgetToNavigate: const DashboardBottom()),
    DrawerModel(
        screenName: 'FAQ\'s',
        iconPath: Assets.faqIcon,
        widgetToNavigate: const DashboardBottom()),
    DrawerModel(
        screenName: 'Contact us',
        iconPath: Assets.contactUsIcon,
        widgetToNavigate: const DashboardBottom()),
    DrawerModel(
        screenName: 'Customer survey',
        iconPath: Assets.customerSurveyIcon,
        widgetToNavigate: const DashboardBottom()),
    DrawerModel(
        screenName: 'About us',
        iconPath: Assets.aboutUsIcon,
        widgetToNavigate: const DashboardBottom()),
    DrawerModel(
        screenName: 'Logout',
        iconPath: Assets.logoutIcon,
        widgetToNavigate: const DashboardBottom()),
  ];

  static List<CustomCardModel> customCardData = [
    CustomCardModel(amount: "10000", name: "Credit limit"),
    CustomCardModel(amount: "2000", name: "Grace limit(0%)"),
    CustomCardModel(amount: "00", name: "Special deal"),
  ];
  static List<CustomCardModel> customCardData1 = [
    CustomCardModel(amount: "10000", name: "Max limit"),
    CustomCardModel(amount: "2000", name: "Over limit"),
    CustomCardModel(amount: "00", name: "Available limit"),
  ];

  static List<BottomCardModel> customCardData2 = [
    BottomCardModel('Running Status', 'Blue', Assets.dashboardRunningStatus),
    BottomCardModel('Next Target', 'Bronze', Assets.dashboardNextTime),
    BottomCardModel(
        'Sale Required', 'Rs 2,500,000', Assets.dashboardSaleRequired),
    BottomCardModel(
        'Total Winning Points', 'Rs 0', Assets.dashboardTotalWinning),
    BottomCardModel(
        'Sale of Session', 'Rs 2,500,000', Assets.dashboardSaleOfSession),
    BottomCardModel('Pending Orders', 'Rs 0', Assets.dashboardPendingOrders),
  ];
  static List<CustomCardModel> customInfoData = [
    CustomCardModel(amount: "Sale Person", name: "Management"),
    CustomCardModel(amount: "Group", name: "Common, B, H"),
    CustomCardModel(amount: "Loyal", name: "No"),
  ];

  static List<CartItem> cartItems = [
    CartItem('1', 'assets/images/applogo.png',
        'Belpla Teenagers 1 Ply Single Bed Blanket', 5, 5490, 2),
    CartItem('2', 'assets/images/borjan.png',
        'Burjjan 1 ply Double bed embossed blanket', 5, 5490, 4),
  ];

  static List<OrderModel> orders = [
    OrderModel(
      orderId: "123456",
      image: Assets.bagIcon,
      orderNo: "123",
      orderStatus: OrderStatus.Pending,
      noOfItems: 05,
      totalRS: 1500.0,
    ),
    OrderModel(
      orderId: "123456",
      image: Assets.bagIcon,
      orderNo: "123",
      orderStatus: OrderStatus.Active,
      noOfItems: 05,
      totalRS: 1500.0,
    ),
    OrderModel(
      orderId: "123456",
      image: Assets.bagIcon,
      orderNo: "123",
      orderStatus: OrderStatus.Active,
      noOfItems: 05,
      totalRS: 1500.0,
    ),
    OrderModel(
      orderId: "123456",
      image: Assets.bagIcon,
      orderNo: "123",
      orderStatus: OrderStatus.Pending,
      noOfItems: 05,
      totalRS: 1500.0,
    ),
    OrderModel(
      orderId: "123456",
      image: Assets.bagIcon,
      orderNo: "123",
      orderStatus: OrderStatus.Pending,
      noOfItems: 05,
      totalRS: 1500.0,
    ),
    OrderModel(
      orderId: "123456",
      image: Assets.bagIcon,
      orderNo: "123",
      orderStatus: OrderStatus.Completed,
      noOfItems: 05,
      totalRS: 1500.0,
    ),
    OrderModel(
      orderId: "123456",
      image: Assets.bagIcon,
      orderNo: "123",
      orderStatus: OrderStatus.Completed,
      noOfItems: 05,
      totalRS: 1500.0,
    ),
    OrderModel(
      orderId: "123456",
      image: Assets.bagIcon,
      orderNo: "123",
      orderStatus: OrderStatus.Completed,
      noOfItems: 05,
      totalRS: 1500.0,
    ),
    OrderModel(
      orderId: "123456",
      image: Assets.bagIcon,
      orderNo: "123",
      orderStatus: OrderStatus.Completed,
      noOfItems: 05,
      totalRS: 1500.0,
    )
  ];

  static final List<OrderItem> orderItems = [
    OrderItem(
        image: Assets.bagIcon,
        itemTitle: 'Baby Perla Gold 1 Ply Blanket ( Large )',
        itemCount: 03,
        amount: 2000),
    OrderItem(
        image: Assets.bagIcon,
        itemTitle: 'Burjjan 1 ply Double bed embossed blanket',
        itemCount: 03,
        amount: 2000),
    OrderItem(
        image: Assets.bagIcon,
        itemTitle: 'Baby Perla Gold 1 Ply Blanket ( Large )',
        itemCount: 03,
        amount: 2000),
    OrderItem(
        image: Assets.bagIcon,
        itemTitle: 'Burjjan 1 ply Double bed embossed blanket',
        itemCount: 03,
        amount: 2000),
  ];



  void function() {
    Data data = Data();

    data.user;
  }
}
