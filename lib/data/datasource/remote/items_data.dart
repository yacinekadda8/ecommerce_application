import 'package:ecommerce_application/core/class/crud.dart';
import 'package:ecommerce_application/linkapi.dart';

class ItemsData {
  Crud crud;
  ItemsData(this.crud);
  getData(String id,int userid) async {
    var response = await crud.postData(AppLink.items, {"id" : id.toString(),"usersid":userid.toString()});
    return response.fold((l) => l, (r) => r);
  }
}
