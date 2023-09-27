// class OrdersModel {
//   int? ordersId;
//   int? ordersUsersid;
//   int? ordersAddress;
//   int? ordersDeliverytype;
//   int? ordersPricedelivery;
//   double? ordersPrice;
//   double? ordersTotalPrice;
//   int? ordersCoupon;
//   String? ordersDatetime;
//   int? ordersPaymentmethod;
//   int? ordersStatus;

//   OrdersModel(
//       {this.ordersId,
//       this.ordersUsersid,
//       this.ordersAddress,
//       this.ordersDeliverytype,
//       this.ordersPricedelivery,
//       this.ordersPrice,
//       this.ordersTotalPrice,
//       this.ordersCoupon,
//       this.ordersDatetime,
//       this.ordersPaymentmethod,
//       this.ordersStatus});

//   OrdersModel.fromJson(Map<String, dynamic> json) {
//     ordersId = json['orders_id'];
//     ordersUsersid = json['orders_usersid'];
//     ordersAddress = json['orders_address'];
//     ordersDeliverytype = json['orders_deliverytype'];
//     ordersPricedelivery = json['orders_pricedelivery'];
//     ordersPrice = json['orders_price'];
//     ordersTotalPrice = json['orders_total_price'];
//     ordersCoupon = json['orders_coupon'];
//     ordersDatetime = json['orders_datetime'];
//     ordersPaymentmethod = json['orders_paymentmethod'];
//     ordersStatus = json['orders_status'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['orders_id'] = ordersId;
//     data['orders_usersid'] = ordersUsersid;
//     data['orders_address'] = ordersAddress;
//     data['orders_deliverytype'] = ordersDeliverytype;
//     data['orders_pricedelivery'] = ordersPricedelivery;
//     data['orders_price'] = ordersPrice;
//     data['orders_total_price'] = ordersTotalPrice;
//     data['orders_coupon'] = ordersCoupon;
//     data['orders_datetime'] = ordersDatetime;
//     data['orders_paymentmethod'] = ordersPaymentmethod;
//     data['orders_status'] = ordersStatus;
//     return data;
//   }
// }


class OrdersModel {
  String? ordersId;
  String? ordersUsersid;
  String? ordersAddress;
  String? ordersType;
  String? ordersPricedelivery;
  String? ordersPrice;
  String? ordersTotalprice;
  String? ordersCoupon;
  String? ordersPaymentmethod;
  String? ordersStatus;
  String? ordersDatetime;
  String? addressId;
  String? addressUsersid;
  String? addressName;
  String? addressCity;
  String? addressStreet;
  String? addressLat;
  String? addressLong;

  OrdersModel(
      {this.ordersId,
      this.ordersUsersid,
      this.ordersAddress,
      this.ordersType,
      this.ordersPricedelivery,
      this.ordersPrice,
      this.ordersTotalprice,
      this.ordersCoupon,
      this.ordersPaymentmethod,
      this.ordersStatus,
      this.ordersDatetime,
      this.addressId,
      this.addressUsersid,
      this.addressName,
      this.addressCity,
      this.addressStreet,
      this.addressLat,
      this.addressLong});

  OrdersModel.fromJson(Map<String, dynamic> json) {
    ordersId = json['orders_id'];
    ordersUsersid = json['orders_usersid'];
    ordersAddress = json['orders_address'];
    ordersType = json['orders_type'];
    ordersPricedelivery = json['orders_pricedelivery'];
    ordersPrice = json['orders_price'];
    ordersTotalprice = json['orders_totalprice'];
    ordersCoupon = json['orders_coupon'];
    ordersPaymentmethod = json['orders_paymentmethod'];
    ordersStatus = json['orders_status'];
    ordersDatetime = json['orders_datetime'];
    addressId = json['address_id'];
    addressUsersid = json['address_usersid'];
    addressName = json['address_name'];
    addressCity = json['address_city'];
    addressStreet = json['address_street'];
    addressLat = json['address_lat'];
    addressLong = json['address_long'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['orders_id'] = ordersId;
    data['orders_usersid'] = ordersUsersid;
    data['orders_address'] = ordersAddress;
    data['orders_type'] = ordersType;
    data['orders_pricedelivery'] = ordersPricedelivery;
    data['orders_price'] = ordersPrice;
    data['orders_totalprice'] = ordersTotalprice;
    data['orders_coupon'] = ordersCoupon;
    data['orders_paymentmethod'] = ordersPaymentmethod;
    data['orders_status'] = ordersStatus;
    data['orders_datetime'] = ordersDatetime;
    data['address_id'] = addressId;
    data['address_usersid'] = addressUsersid;
    data['address_name'] = addressName;
    data['address_city'] = addressCity;
    data['address_street'] = addressStreet;
    data['address_lat'] = addressLat;
    data['address_long'] = addressLong;
    return data;
  }
}