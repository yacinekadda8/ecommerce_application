import 'package:ecommerce_application/core/class/crud.dart';
import 'package:ecommerce_application/linkapi.dart';

class VerfiyCodeSignUpData {
  Crud crud;
  VerfiyCodeSignUpData(this.crud);
  postdata(String email, String verifycode) async {
    var response = await crud.postData(
        AppLink.verifycodessignup, {"email": email, "verifycode": verifycode});
    return response.fold((l) => l, (r) => r);
  }
  resendCodeData(String email) async {
    var response = await crud.postData(
        AppLink.resendcode, {"email": email});
    return response.fold((l) => l, (r) => r);
  }
}
