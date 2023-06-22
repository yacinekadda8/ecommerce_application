import 'package:ecommerce_application/core/class/crud.dart';
import 'package:ecommerce_application/linkapi.dart';

class OffersData {
  Crud crud;
  OffersData(this.crud);
  getData() async {
    var response = await crud.postData(AppLink.offers, {});
    return response.fold((l) => l, (r) => r);
  }
}
