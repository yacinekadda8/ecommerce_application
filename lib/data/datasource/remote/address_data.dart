import 'package:ecommerce_application/core/class/crud.dart';
import 'package:ecommerce_application/linkapi.dart';

class AddressData {
  Crud crud;
  AddressData(this.crud);
  getData(String usersid) async {
    var response = await crud.postData(AppLink.addressView, {
      "usersid": usersid.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }

  addData(String usersid, String name, String city, String street, String lat,
      String long, String phone) async {
    var response = await crud.postData(AppLink.addressAdd, {
      "usersid": usersid.toString(),
      "name": name,
      "city": city,
      "street": street,
      "lat": lat,
      "long": long,
      "phone": phone,
    });
    return response.fold((l) => l, (r) => r);
  }

  editData(String name, String city, String street, String lat, String long,
      String phone) async {
    var response = await crud.postData(AppLink.addressEdit, {
      "name": name,
      "city": city,
      "street": street,
      "lat": lat,
      "long": long,
      "phone": phone,
    });
    return response.fold((l) => l, (r) => r);
  }

  removeData(String addressid) async {
    var response = await crud.postData(AppLink.addressRemove, {
      "addressid": addressid ,
    });
    return response.fold((l) => l, (r) => r);
  }
}
