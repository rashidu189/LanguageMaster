import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  final String userId;

  const ProfileView({super.key, required this.userId}); // Fix is here

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile")),
      body: Center(child: Text("User ID: $userId")),
    );
  }
}
