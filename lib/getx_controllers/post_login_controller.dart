import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class PostLoginController extends GetxController {
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  final loading = false.obs;

  void loginApi() async {
    loading.value = true;
    try {
      final response = await post(
        Uri.parse('https://reqres.in/api/login'),
        body: {
          'email': emailController.value.text,
          'password': passwordController.value.text
        },
      );
      final data = jsonDecode(response.body);
      debugPrint('statusCode: ${response.statusCode}\ndata => $data');
      if (response.statusCode != 200) {
        loading.value = false;
        Get.snackbar(data['error'], 'Login failed');
        return;
      }
      loading.value = false;
      Get.snackbar('Congrats!', 'Login successful');
    } catch (e) {
      loading.value = false;
      Get.snackbar('Exception', e.toString());
    }
  }
}
