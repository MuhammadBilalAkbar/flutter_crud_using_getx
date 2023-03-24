import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class UpdateUserController extends GetxController {
  final nameController = TextEditingController().obs;
  final jobController = TextEditingController().obs;
  final idController = TextEditingController().obs;
  final updatedData = ''.obs;

  final loading = false.obs;

  void updateUserApi() async {
    loading.value = true;
    try {
      final response = await put(
        Uri.parse('https://reqres.in/api/users/${idController.value.text}'),
        body: {
          'name': nameController.value.text,
          'job': jobController.value.text
        },
      );
      var data = jsonDecode(response.body);
      debugPrint('statusCode: ${response.statusCode}\ndata => $data');
      if (response.statusCode == 200) {
        loading.value = false;
        updatedData.value = data.toString();
        Get.snackbar('Congrats!',
            'User${idController.value.text} data updated successfully');
      } else {
        loading.value = false;
        Get.snackbar(
            'Error', 'User${idController.value.text} data updating error');
      }
    } catch (e) {
      loading.value = false;
      Get.snackbar('Exception', e.toString());
    }
  }
}
