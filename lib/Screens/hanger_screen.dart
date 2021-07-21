import 'package:flutter/material.dart';

class HangerScreen extends StatelessWidget {
  const HangerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Center(
          child: Container(
            height: 300,
            width: 300,
            color: Colors.green,
          ),
        )
      ),
    );
  }
}