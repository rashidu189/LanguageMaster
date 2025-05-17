import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:languagemaster/screens/login_screen.dart';
import 'package:languagemaster/utils/constants.dart';

void main() {
  runApp(const MyApp());
}

final GoRouter _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const LoginView(),
    ),
    GoRoute(
      path: '/home/:userId',
      builder: (context, state) {
        final userId = state.pathParameters['userId']!;
        return HomeView(userId: int.parse(userId));
      },
    ),
    GoRoute(
      path: '/profile/:userId',
      builder: (context, state) {
        final userId = state.pathParameters['userId']!;
        return ProfileView(userId: int.parse(userId));
      },
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'User App',
      routerConfig: _router,
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: kBackgroundColor,
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: kPrimaryColor,
              fontFamily: 'Montserrat',
            ),
      ),
      home: const LoginScreen(),
    );
  }
}

class HomeView extends StatelessWidget {
  final int userId;
  const HomeView({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome, User ID: $userId'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => context.go('/profile/$userId'),
              child: const Text('Go to Profile'),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileView extends StatelessWidget {
  final int userId;
  const ProfileView({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Profile of User ID: $userId'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => context.go('/home/$userId'),
              child: const Text('Back to Home'),
            ),
          ],
        ),
      ),
    );
  }
}
