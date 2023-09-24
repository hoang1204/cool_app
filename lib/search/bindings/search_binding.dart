import 'package:brandshop/search/controller/seach-controller.dart';
import 'package:get/get.dart';

class SearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchController1>(
      () => SearchController1(),
    );
  }
}
