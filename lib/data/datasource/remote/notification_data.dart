import 'package:ecommerce_application/core/class/crud.dart';
import 'package:ecommerce_application/linkapi.dart';

class NotificationData {
  Crud crud;
  NotificationData(this.crud);
  getData(String usersid) async {
    var response = await crud.postData(AppLink.notification, {
      "usersid": usersid.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }
}
