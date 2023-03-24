import 'package:flutter/material.dart';
import '/getx_controllers/post_login_controller.dart';
import 'package:get/get.dart';

class PostLoginPage extends StatefulWidget {
  const PostLoginPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<PostLoginPage> createState() => _PostLoginPageState();
}

class _PostLoginPageState extends State<PostLoginPage> {
  final postLoginController = Get.put(PostLoginController());

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                TextFormField(
                  controller: postLoginController.emailController.value,
                  decoration: const InputDecoration(hintText: 'Email'),
                ),
                TextFormField(
                  controller: postLoginController.passwordController.value,
                  decoration: const InputDecoration(hintText: 'Password'),
                ),
                const SizedBox(height: 48),
                Obx(
                  () => postLoginController.loading.value
                      ? const CircularProgressIndicator()
                      : ElevatedButton(
                          onPressed: postLoginController.loginApi,
                          child: const Text('Login'),
                        ),
                ),
              ],
            ),
          ),
        ),
      );
}
