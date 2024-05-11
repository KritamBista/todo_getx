import 'package:get/get.dart';
import 'package:todo_getx/controller/addControler.dart';

class BindingController extends Bindings {
  @override
  void dependencies() {
    Get.put(AddController());
  }
}
