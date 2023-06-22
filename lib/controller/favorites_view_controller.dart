import 'package:get/get.dart';

import '../core/class/statusrequest.dart';
import '../core/functions/handingdatacontroller.dart';
import '../core/services/services.dart';
import '../data/datasource/remote/view_favorites_data.dart';
import '../data/model/myfavoritemodel.dart';

class FavoritesViewController extends GetxController {
  FavoritesViewData favoritesViewData = FavoritesViewData(Get.find());
  MyServices myServices = Get.find();
  late StatusRequest statusRequest;
  List<MyFavoriteModel> data = [];
  /*
      goToItemsDetailsScreen(itemsModel) {
    Get.toNamed("itemdetails", arguments: {
      "itemsmodel": itemsModel,
    });
  }
  */
  viewFavorites() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await favoritesViewData
        .getViewData(myServices.sharedPreferences.getString("id")!);

    //print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responsedata = response['data'];

        data.addAll(responsedata.map((e) => MyFavoriteModel.fromJson(e)));
        // print("data");
        // print(data);
      } else {
        statusRequest = StatusRequest.failure;
      }
      //end
    }
    update();
  }

  deleteFavorites(String favoriteId) {
    favoritesViewData.deleteViewData(favoriteId);

    data.removeWhere((element) => element.favoriteId.toString() == favoriteId);

    //end

    update();
  }

  @override
  void onInit() {
    viewFavorites();
    super.onInit();
  }
}
