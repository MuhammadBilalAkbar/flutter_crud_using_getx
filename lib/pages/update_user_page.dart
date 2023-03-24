import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/getx_controllers/update_user_controller.dart';

class UpdateUserPage extends StatefulWidget {
  const UpdateUserPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<UpdateUserPage> createState() => _UpdateUserPageState();
}

class _UpdateUserPageState extends State<UpdateUserPage> {
  final updateUserController = Get.put(UpdateUserController());

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
                    controller: updateUserController.idController.value,
                    decoration: const InputDecoration(hintText: 'User ID'),
                  ),
                  TextFormField(
                    controller: updateUserController.nameController.value,
                    decoration: const InputDecoration(hintText: 'Name'),
                  ),
                  TextFormField(
                    controller: updateUserController.jobController.value,
                    decoration: const InputDecoration(hintText: 'Job'),
                  ),
                  const SizedBox(height: 24),
                  Obx(
                    () => updateUserController.loading.value
                        ? const CircularProgressIndicator()
                        : ElevatedButton(
                            onPressed: updateUserController.updateUserApi,
                            child: const Text('Update user data'),
                          ),
                  ),
                  const SizedBox(height: 24),
                  Obx(
                    () => Text(updateUserController.updatedData.value),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
