class OrderPendingModel {
  int? ordersId;
  int? ordersUsersId;
  int? ordersAddress;
  int? ordersPrice;
  int? ordersType;
  int? ordersPricedelivery;
  int? ordersCoupon;
  String? ordersDatetime;
  int? ordersPaymentMethod;
  int? ordersTotalprice;
  int? ordersStatus;

  OrderPendingModel(
      {this.ordersId,
      this.ordersUsersId,
      this.ordersAddress,
      this.ordersPrice,
      this.ordersType,
      this.ordersPricedelivery,
      this.ordersCoupon,
      this.ordersDatetime,
      this.ordersPaymentMethod,
      this.ordersTotalprice,
      this.ordersStatus});

  OrderPendingModel.fromJson(Map<String, dynamic> json) {
    ordersId = json['orders_id'];
    ordersUsersId = json['orders_users_id'];
    ordersAddress = json['orders_address'];
    ordersPrice = json['orders_price'];
    ordersType = json['orders_type'];
    ordersPricedelivery = json['orders_pricedelivery'];
    ordersCoupon = json['orders_coupon'];
    ordersDatetime = json['orders_datetime'];
    ordersPaymentMethod = json['orders_payment_method'];
    ordersTotalprice = json['orders_totalprice'];
    ordersStatus = json['orders_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orders_id'] = ordersId;
    data['orders_users_id'] = ordersUsersId;
    data['orders_address'] = ordersAddress;
    data['orders_price'] = ordersPrice;
    data['orders_type'] = ordersType;
    data['orders_pricedelivery'] = ordersPricedelivery;
    data['orders_coupon'] = ordersCoupon;
    data['orders_datetime'] = ordersDatetime;
    data['orders_payment_method'] = ordersPaymentMethod;
    data['orders_totalprice'] = ordersTotalprice;
    data['orders_status'] = ordersStatus;
    return data;
  }
}