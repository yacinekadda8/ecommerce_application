class CouponModel {
  int? couponId;
  String? couponCode;
  int? couponCount;
  int? couponDiscount;
  String? couponExpiredate;

  CouponModel(
      {this.couponId,
      this.couponCode,
      this.couponCount,
      this.couponDiscount,
      this.couponExpiredate});

  CouponModel.fromJson(Map<String, dynamic> json) {
    couponId = json['coupon_id'];
    couponCode = json['coupon_code'];
    couponCount = json['coupon_count'];
    couponDiscount = json['coupon_discount'];
    couponExpiredate = json['coupon_expiredate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['coupon_id'] = couponId;
    data['coupon_code'] = couponCode;
    data['coupon_count'] = couponCount;
    data['coupon_discount'] = couponDiscount;
    data['coupon_expiredate'] = couponExpiredate;
    return data;
  }
}
