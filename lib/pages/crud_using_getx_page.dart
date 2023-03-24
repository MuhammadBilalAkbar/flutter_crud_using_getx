import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/pages/post_login_page.dart';
import '/pages/get_user_page.dart';
import '/pages/delete_user_page.dart';
import '/pages/update_user_page.dart';

class CrudUsingGetX extends StatefulWidget {
  const CrudUsingGetX({Key? key}) : super(key: key);

  @override
  State<CrudUsingGetX> createState() => _CrudUsingGetXState();
}

class _CrudUsingGetXState extends State<CrudUsingGetX> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('CRUD Using GetX'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () => Get.to(
                    () => const GetUserPage(title: 'Get User Page'),
                  ),
                  child: const Text('Get User Page'),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () => Get.to(
                    () => const PostLoginPage(title: 'Post Login Page'),
                  ),
                  child: const Text('Post Login Page'),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () => Get.to(
                    () => const DeleteUserPage(title: 'Delete User Page'),
                  ),
                  child: const Text('Delete User Page'),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () => Get.to(
                    () => const UpdateUserPage(title: 'Update User Page'),
                  ),
                  child: const Text('Update User Page'),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      );
}
