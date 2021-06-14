import 'package:flutter/material.dart';

class LoadingContainer extends StatelessWidget {
  const LoadingContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Container(
        color: Colors.grey.shade600,
        height: 40,
        margin: EdgeInsets.only(bottom: 4),
      ),
      subtitle: Container(
        color: Colors.grey.shade600,
        height: 30,
      ),
      // ),
    );
  }
}
