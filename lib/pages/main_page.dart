import 'package:flutter_crud_using_getx/controllers/post_controller.dart';

import 'package:flutter_crud_using_getx/pages/create_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});

  final postController = Get.put(PostController());

  Future<void> _pullRefresh() async => postController.getList();

  Future<void> _onDelete(int id) async => postController.delete(id);

  Future<void> _onEdit(int id) async {
    postController.postId.value = id;
    postController.toEditPage();
  }

  Future<void> _onDetail(int id) async {
    postController.postId.value = id;
    postController.toDetailPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => RefreshIndicator(
            onRefresh: _pullRefresh,
            child: Stack(
              children: [
                Column(
                  children: [
                    const Text(
                      "Main Page",
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Expanded(
                      child: ListView(
                        children: postController.listPosts.map((postItem) {
                          var index =
                              postController.listPosts.indexOf(postItem);
                          debugPrint(postController.listPosts.toString());
                          index++;
                          return Container(
                            height: 50,
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(index.toString()),
                                    const SizedBox(width: 10),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        GestureDetector(
                                            onTap: () =>
                                                _onDetail(postItem.id as int),
                                            child: Text(
                                              postItem.title.toString().length >
                                                      30
                                                  ? '${postItem.title.toString().substring(0, 30)}...'
                                                  : postItem.title.toString(),
                                            )),
                                      ],
                                    ),
                                    const Spacer(),
                                    GestureDetector(
                                      onTap: () => _onEdit(postItem.id as int),
                                      child: const Icon(
                                        Icons.edit,
                                        color: Colors.blue,
                                      ),
                                    ),
                                    const SizedBox(width: 5),
                                    GestureDetector(
                                      onTap: () =>
                                          _onDelete(postItem.id as int),
                                      child: const Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ],
                                ),
                                const Divider(
                                  thickness: 1,
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  bottom: 20,
                  right: 20,
                  child: FloatingActionButton(
                      backgroundColor: Colors.orange,
                      child: const Icon(Icons.add),
                      onPressed: () {
                        Get.to(() => CreatePage());
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
