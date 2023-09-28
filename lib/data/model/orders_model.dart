class OrdersModel {
  int? ordersId;
  int? ordersUsersid;
  int? ordersAddress;
  int? ordersDeliverytype;
  int? ordersPricedelivery;
  double? ordersPrice;
  double? ordersTotalPrice;
  int? ordersCoupon;
  String? ordersDatetime;
  int? ordersPaymentmethod;
  int? ordersStatus;
  int? addressId;
  int? addressUsersid;
  String? addressName;
  String? addressCity;
  String? addressStreet;
  double? addressLat;
  double? addressLong;
  String? addressUsersphone;

  OrdersModel(
      {this.ordersId,
      this.ordersUsersid,
      this.ordersAddress,
      this.ordersDeliverytype,
      this.ordersPricedelivery,
      this.ordersPrice,
      this.ordersTotalPrice,
      this.ordersCoupon,
      this.ordersDatetime,
      this.ordersPaymentmethod,
      this.ordersStatus,
      this.addressId,
      this.addressUsersid,
      this.addressName,
      this.addressCity,
      this.addressStreet,
      this.addressLat,
      this.addressLong,
      this.addressUsersphone});

  OrdersModel.fromJson(Map<String, dynamic> json) {
    ordersId = json['orders_id'];
    ordersUsersid = json['orders_usersid'];
    ordersAddress = json['orders_address'];
    ordersDeliverytype = json['orders_deliverytype'];
    ordersPricedelivery = json['orders_pricedelivery'];
    ordersPrice = json['orders_price'];
    ordersTotalPrice = json['orders_total_price'];
    ordersCoupon = json['orders_coupon'];
    ordersDatetime = json['orders_datetime'];
    ordersPaymentmethod = json['orders_paymentmethod'];
    ordersStatus = json['orders_status'];
    addressId = json['address_id'];
    addressUsersid = json['address_usersid'];
    addressName = json['address_name'];
    addressCity = json['address_city'];
    addressStreet = json['address_street'];
    addressLat = json['address_lat'];
    addressLong = json['address_long'];
    addressUsersphone = json['address_usersphone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['orders_id'] = ordersId;
    data['orders_usersid'] = ordersUsersid;
    data['orders_address'] = ordersAddress;
    data['orders_deliverytype'] = ordersDeliverytype;
    data['orders_pricedelivery'] = ordersPricedelivery;
    data['orders_price'] = ordersPrice;
    data['orders_total_price'] = ordersTotalPrice;
    data['orders_coupon'] = ordersCoupon;
    data['orders_datetime'] = ordersDatetime;
    data['orders_paymentmethod'] = ordersPaymentmethod;
    data['orders_status'] = ordersStatus;
    data['address_id'] = addressId;
    data['address_usersid'] = addressUsersid;
    data['address_name'] = addressName;
    data['address_city'] = addressCity;
    data['address_street'] = addressStreet;
    data['address_lat'] = addressLat;
    data['address_long'] = addressLong;
    data['address_usersphone'] = addressUsersphone;
    return data;
  }
}
