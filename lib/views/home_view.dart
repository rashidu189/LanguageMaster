import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeView extends StatelessWidget {
  final String userId;

  const HomeView({super.key, required this.userId}); // Fix is here

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Welcome, User ID: $userId"),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => context.push('/profile/$userId'),
              child: const Text("Go to Profile"),
            ),
          ],
        ),
      ),
    );
  }
}
