import 'dart:convert';

import 'package:flutter_crud_using_getx/model/post.dart';
import 'package:flutter_crud_using_getx/pages/detail_page.dart';
import 'package:flutter_crud_using_getx/pages/edit_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_crud_using_getx/utils/internet.dart';

class PostController extends GetxController {
  final loading = false.obs;
  late Map<String, dynamic> body;
  RxList<Post> listPosts = <Post>[].obs;
  final postDetail = Post().obs;

  final createTitleController = TextEditingController();
  final createBodyController = TextEditingController();
  final createUserIdController = TextEditingController();

  final editIdController = TextEditingController();
  final editTitleController = TextEditingController();
  final editBodyController = TextEditingController();
  final editUserIdController = TextEditingController();

  RxInt postId = 0.obs;

  @override
  void onInit() {
    super.onInit();
    getList();
  }

  void toEditPage() async {
    Get.to(() => EditPage());
  }

  void toDetailPage() async {
    Get.to(() => DetailPage());
  }

  void getList() async {
    HttpConnect request = HttpConnect(url: "posts/");
    request.list().then((value) {
      if (value.statusCode == 200) {
        final responseJson = jsonDecode(value.body);
        List jsonResponse = responseJson;
        listPosts.value = jsonResponse.map((e) => Post.fromJson(e)).toList();
        debugPrint("LIST");
        debugPrint(body.toString());
      } else {
        debugPrint('LIST ERROR');
      }
    }).catchError((onError) {
      printError();
    });
  }

  void detail(int id) async {
    HttpConnect request = HttpConnect(url: 'posts/$id/');
    request.detail().then((value) {
      body = jsonDecode(value.body);
      if (value.statusCode == 200) {
        postDetail.value = Post.fromJson(body);
        debugPrint("DETAIL");
        debugPrint(body.toString());
      } else {
        debugPrint('DETAIL ERROR');
      }
    }).catchError((onError) {
      printError();
    });
  }

  void delete(int id) async {
    HttpConnect request = HttpConnect(url: 'posts/$id/');
    request.delete().then((value) {
      body = jsonDecode(value.body);
      if (value.statusCode == 200) {
        debugPrint("DELETE");
        debugPrint(body.toString());
      } else {
        debugPrint('DELETE ERROR');
      }
    }).catchError((onError) {
      printError();
    });
  }

  void edit(int id) async {
    HttpConnect request = HttpConnect(
        url: 'posts/$id/',
        body: jsonEncode(<String, dynamic>{
          'id': editIdController.text,
          'title': editTitleController.text,
          'body': editBodyController.text,
          'userId': editUserIdController.text,
        }));

    request.edit().then((value) {
      body = jsonDecode(value.body);
      if (value.statusCode == 200) {
        debugPrint("EDIT");
        debugPrint(body.toString());
        Get.back();
      } else {
        debugPrint('EDIT ERROR');
      }
    }).catchError((onError) {
      printError();
    });
  }

  void create() async {
    HttpConnect request = HttpConnect(
        url: 'posts',
        body: jsonEncode(<String, dynamic>{
          'title': createTitleController.text,
          'body': createBodyController.text,
          'userId': createUserIdController.text,
        }));
    request.create().then((value) {
      body = jsonDecode(value.body);
      if (value.statusCode == 201) {
        debugPrint("CREATED");
        debugPrint(body.toString());
        Get.back();
      } else {
        debugPrint("CREATED ERROR");
      }
    }).catchError((onError) {
      printError();
    });
  }
}
