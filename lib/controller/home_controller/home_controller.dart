import 'package:get/get.dart';

class HomeController extends GetxController {
  var time = DateTime.now();

  void updateTime() {
    Future.delayed(const Duration(seconds: 1), () {
      time = DateTime.now();
      updateTime();
      update();
    });
  }

  @override
  void onInit() {
    updateTime();
    super.onInit();
  }
}
