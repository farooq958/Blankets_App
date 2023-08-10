
class OrderModel {
  final String orderId;
  final String image;
  final String orderNo;
  final OrderStatus orderStatus;
  final int noOfItems;
  final double totalRS;

  OrderModel({
    required this.orderId,
    required this.image,
    required this.orderNo,
    required this.orderStatus,
    required this.noOfItems,
    required this.totalRS,
  });
}

enum OrderStatus {
  Pending,
  Completed,
  Active,
}
