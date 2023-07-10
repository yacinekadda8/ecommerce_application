import 'package:ecommerce_application/core/class/crud.dart';
import 'package:ecommerce_application/linkapi.dart';

class CartData {
  Crud crud;
  CartData(this.crud);
  addCart(int itemid, String userid) async {
    var response = await crud.postData(AppLink.cartAdd,
        {"itemsid": itemid.toString(), "usersid": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  removeCart(int itemid, String userid) async {
    var response = await crud.postData(AppLink.cartRemove,
        {"itemsid": itemid.toString(), "usersid": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  itemsCardCount(int itemid, String userid) async {
    var response = await crud.postData(AppLink.itemsCardCount,
        {"itemsid": itemid.toString(), "usersid": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }
}
