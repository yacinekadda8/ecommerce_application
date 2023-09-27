import 'package:ecommerce_application/core/class/crud.dart';
import 'package:ecommerce_application/linkapi.dart';

class FavoriteData {
  Crud crud;
  FavoriteData(this.crud);
  addFavotie(String itemid, int userid) async {
    var response = await crud.postData(AppLink.favoriteAdd,
        {"itemsid": itemid.toString(), "usersid": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  removeFavotie(String itemid, int userid) async {
    var response = await crud.postData(AppLink.favoriteRemove,
        {"itemsid": itemid.toString(), "usersid": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }
}
