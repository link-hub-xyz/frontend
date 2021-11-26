import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: const Text('Profile'),
        ),
        body: const Center(
          child: CircularProgressIndicator(
            strokeWidth: 1.5,
          ),
        ),
      );
}
