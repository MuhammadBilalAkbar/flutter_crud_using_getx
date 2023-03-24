import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/getx_controllers/delete_user_controller.dart';

class DeleteUserPage extends StatefulWidget {
  const DeleteUserPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<DeleteUserPage> createState() => _DeleteUserPageState();
}

class _DeleteUserPageState extends State<DeleteUserPage> {
  final deleteUserController = Get.put(DeleteUserController());

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
                    controller: deleteUserController.idController.value,
                    decoration: const InputDecoration(hintText: 'User ID'),
                  ),
                  const SizedBox(height: 24),
                  Obx(
                    () => deleteUserController.loading.value
                        ? const CircularProgressIndicator()
                        : ElevatedButton(
                            onPressed: deleteUserController.deleteUserApi,
                            child: const Text('Delete user'),
                          ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
