import 'package:flutter/material.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: Color.fromARGB(255, 244, 79, 87),
        strokeWidth: 2.75,
      ),
    );
  }
}
