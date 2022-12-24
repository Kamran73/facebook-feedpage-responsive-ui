import 'package:flutter/material.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 100,
        width: 100,
        child: LayoutBuilder(
          builder: (context, constraints){
            return Center(
                child: Text(
                    constraints.maxWidth.toStringAsFixed(2)));
          },
        ),
      ),
    );
  }
}
