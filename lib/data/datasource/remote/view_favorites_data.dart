import 'package:ecommerce_application/core/class/crud.dart';
import 'package:ecommerce_application/linkapi.dart';

class FavoritesViewData {
  Crud crud;
  FavoritesViewData(this.crud);
  getViewData(String id) async {
    var response = await crud.postData(AppLink.favoritesView, {"id": id});
    return response.fold((l) => l, (r) => r);
  }
deleteViewData(String id) async {
    var response = await crud.postData(AppLink.deletefromfavorires, {"id": id});
    return response.fold((l) => l, (r) => r);
  }
}
