import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_getx/model/todo.dart';

class AddController extends GetxController {
  var items = <TODoItems>[].obs;
  var searchQuery = ''.obs;
  var removeItem =false.obs;

  List<TODoItems> get results {
    if (searchQuery.isEmpty) {
      return items;
    } else {
      return items
          .where((items) => items.text!
              .toLowerCase()
              .contains(searchQuery.value.toLowerCase()))
          .toList();
    }
  }

  addTo(String a) {
    items.add(TODoItems(text: a));
  }

  onCompleted(int index) {
    items[index].onChanged();
    items.refresh();
  }

  onRemove(int index) {
    // if (index < 0 || index >= items.length) {
    //   return;
    // }
    Get.defaultDialog(
        title: 'confirm delete',
        content: Text("Are you sure you want to delete"),
        actions: [
          ElevatedButton(
              onPressed: () {
                          removeItem(true);
                items.removeAt(index);
                Get.back();

                if(removeItem.value == true){
                  
          Get.snackbar(
                  'message',
                  "Task cleared",
                  snackPosition: SnackPosition.TOP,
                  backgroundColor: Colors.blueAccent,
                  colorText: Colors.white,
                  borderRadius: 10.0,
                  margin: EdgeInsets.all(20.0),
                  duration: Duration(seconds: 3),
                  animationDuration: Duration(milliseconds: 500),
                  isDismissible: true,
                  dismissDirection: DismissDirection.horizontal,
                  forwardAnimationCurve: Curves.easeOut,
                  reverseAnimationCurve: Curves.easeIn,
                  snackStyle: SnackStyle.FLOATING,
                  icon: Icon(Icons.info_outline, color: Colors.white),
                  shouldIconPulse: true,
                );
                }
                else{
                  Get.back();
              
                }

              },
              child: Text("Yes")),
          ElevatedButton(
              onPressed: () {
                Get.back();
              },
              child: Text("No"))
        ]);
  }
}
