import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/getx_controllers/get_user_controller.dart';

class GetUserPage extends StatefulWidget {
  const GetUserPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<GetUserPage> createState() => _GetUserPageState();
}

class _GetUserPageState extends State<GetUserPage> {
  final getUserController = Get.put(GetUserController());

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  TextFormField(
                    controller: getUserController.idController.value,
                    decoration: const InputDecoration(hintText: 'User ID'),
                  ),
                  const SizedBox(height: 24),
                  Obx(
                    () => getUserController.loading.value
                        ? const CircularProgressIndicator()
                        : ElevatedButton(
                            onPressed: getUserController.getUserApi,
                            child: const Text('Get user'),
                          ),
                  ),
                  const SizedBox(height: 24),
                  Obx(
                    () => Text(getUserController.userData.value),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
