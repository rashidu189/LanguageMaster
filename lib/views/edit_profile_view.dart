import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/user_controller.dart';
import '../models/user_model.dart';

class EditProfileView extends StatefulWidget {
  const EditProfileView({super.key});

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  final _formKey = GlobalKey<FormState>();
  late String _name;
  late String _mobileNo;

  @override
  Widget build(BuildContext context) {
    final userController = Provider.of<UserController>(context);
    final user = userController.user;

    if (user == null) {
      return const Scaffold(
        body: Center(child: Text('No user data')),
      );
    }

    _name = user.name;
    _mobileNo = user.mobileNo;

    return Scaffold(
      appBar: AppBar(title: const Text('Edit Profile')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: _name,
                decoration: const InputDecoration(labelText: 'Name'),
                onSaved: (value) => _name = value ?? '',
              ),
              TextFormField(
                initialValue: _mobileNo,
                decoration: const InputDecoration(labelText: 'Mobile Number'),
                onSaved: (value) => _mobileNo = value ?? '',
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _formKey.currentState?.save();
                  final updatedUser = UserModel(
                    id: user.id,
                    email: user.email,
                    name: _name,
                    isActive: user.isActive,
                    mobileNo: _mobileNo,
                    permission: user.permission,
                    password: user.password,
                    joinedDate: user.joinedDate,
                  );
                  userController.updateUser(updatedUser);
                  Navigator.pop(context);
                },
                child: const Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
