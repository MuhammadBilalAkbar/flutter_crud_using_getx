import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class GetUserController extends GetxController {
  final idController = TextEditingController().obs;
  final userData = ''.obs;

  final loading = false.obs;

  void getUserApi() async {
    loading.value = true;
    try {
      final response = await get(
        Uri.parse('https://reqres.in/api/users/${idController.value.text}'),
      );
      final data = jsonDecode(response.body);
      debugPrint('statusCode: ${response.statusCode}\ndata => $data');
      if (response.statusCode != 200) {
        loading.value = false;
        Get.snackbar(data['error'],
            'User${idController.value.text} data loading failed');
        return;
      }
      loading.value = false;
      userData.value = data.toString();
      Get.snackbar('Congrats!',
          'User${idController.value.text} data loaded successfully');
    } catch (e) {
      loading.value = false;
      Get.snackbar('Exception', e.toString());
    }
  }
}
