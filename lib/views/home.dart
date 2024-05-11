import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_getx/controller/addControler.dart';

// ignore: must_be_immutable
class HomeView extends StatelessWidget {
  HomeView({super.key});
  TextEditingController _toDoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var toDoController = Get.find<AddController>();
    return Scaffold(
        backgroundColor: const Color(0xFFEEEFF5),
        appBar: AppBar(
          title: const Text("ToDO App"),
          backgroundColor: const Color(0xFFEEEFF5),
        ),
        body: Obx(
          () => Column(
            children: [
              // Container(
              //   padding: EdgeInsets.symmetric(horizontal: 20),
              //   // margin: EdgeInsets.only(left: 10, right: 10, top: 10),
              //   decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(20),
              //       color: Colors.white),
              //   child: TextField(
              //     decoration: InputDecoration(
              //         enabled: true,
              //         border: InputBorder.none,
              //         prefix: Icon(Icons.search,size: 22,),
              //         hintText: "Search Your ToDos Item",
              //         contentPadding: EdgeInsets.all(10)
              //         ),

              //   ),
              // ),
              TextField(
                onChanged: (query) {
                  toDoController.searchQuery.value = query;
                },
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: const TextStyle(),
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 12.0, horizontal: 16.0),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                ),
              ),

              SizedBox(
                height: 40,
              ),
              SizedBox(),

              Container(
                margin: EdgeInsets.only(top: 70, bottom: 20),
                child: Text(
                  "All ToDoS Items",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                ),
              ),

              Expanded(
                child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: toDoController.items.length,
                    itemBuilder: (context, index) {
                      // var toDo = toDoController.items[index];
                      var ind = index;
                      return Container(
                        height: 90,
                        child: Card(
                          child: ListTile(
                            leading: Icon(
                              toDoController.items[index].isDone
                                  ? Icons.check_box_outline_blank_outlined
                                  : Icons.check_box,
                              color: Colors.blue,
                            ),
                            title: Text(
                              "${toDoController.items[index].text}",
                              style: TextStyle(
                                  fontSize: 20,
                                  decoration: toDoController.items[index].isDone
                                      ? TextDecoration.lineThrough
                                      : TextDecoration.none),
                            ),
                            trailing: Container(
                              margin: const EdgeInsets.only(top: 10, bottom: 2),
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(15)),
                              child: IconButton(
                                  onPressed: () {
                                    toDoController.onRemove(index);
                                    debugPrint("$index");
                                  },
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Color.fromARGB(255, 255, 255, 255),
                                  )),
                            ),
                            onTap: () {
                              toDoController.onCompleted(index);
                              print(toDoController.items[index].isDone);
                            },
                          ),
                        ),
                      );
                    }),
              ),

              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(
                            left: 20, bottom: 20, right: 20),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 7, vertical: 7),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(
                                    0.0,
                                    0.0,
                                  ),
                                  blurRadius: 10.0,
                                  spreadRadius: 0,
                                  blurStyle: BlurStyle.normal)
                            ]),
                        child: TextField(
                          controller: _toDoController,
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Enter Your ToDo List"),
                        ),
                      ),
                    ),
                    const SizedBox(width: 3),
                    Container(
                      height: 50,
                      margin: const EdgeInsets.only(right: 20, bottom: 20),
                      child: ElevatedButton(
                        style: const ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.blue),
                            minimumSize: MaterialStatePropertyAll(Size(60, 50)),
                            elevation: MaterialStatePropertyAll(10)),
                        onPressed: () {
                          toDoController.addTo(_toDoController.text);
                          _toDoController.clear();
                        },
                        child: const Text(
                          "+",
                          style: TextStyle(fontSize: 30, color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
              )

              //       Row(
              //         children: [
              //           TextFormField(
              //   controller: _toDoController,
              //   decoration: InputDecoration(labelText: "Enter your toDo",border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),contentPadding:EdgeInsets.all(8)),
              // ),
              //         ],
              //       ),
              // ElevatedButton(
              //     onPressed: () {
              //       toDoController.addTo(_toDoController.text);
              //       _toDoController.clear();
              //       // _toDoController.clear();
              //     },

              //     child: Text("Add")),

              //    toDoController.items.isEmpty? const Text("u dont have any task") :SizedBox(),
            ],
          ),
        ));
  }
}
