import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class DeleteUserController extends GetxController {
  final idController = TextEditingController().obs;

  final loading = false.obs;

  void deleteUserApi() async {
    loading.value = true;
    try {
      final response = await delete(
        Uri.parse('https://reqres.in/api/users/${idController.value.text}'),
      );
      //This shows HTTP 204 No Content success status response code.
      // It indicates that a request has succeeded, but that the
      // client doesn't need to navigate away from its current page,
      // and it has no data.
      debugPrint('statusCode: ${response.statusCode.toString()}');
      if (response.statusCode == 204) {
        loading.value = false;
        Get.snackbar(
            'Congrats!', 'User${idController.value.text} deleted successfully');
      } else {
        loading.value = false;
        Get.snackbar('error', 'User${idController.value.text} deletion failed');
      }
    } catch (e) {
      loading.value = false;
      Get.snackbar('Exception', e.toString());
    }
  }
}
