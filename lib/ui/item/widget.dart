import 'package:flutter/material.dart';

class ItemWidget extends StatelessWidget {
  const ItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: const Text('Item'),
        ),
        body: const Center(
          child: CircularProgressIndicator(
            strokeWidth: 1.5,
          ),
        ),
      );
}
