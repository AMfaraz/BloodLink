import 'package:flutter/material.dart';

import '../widgets/request_widget.dart';

class RequestScreen extends StatelessWidget {
  const RequestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Column(
        children: [
          RequestWidget(),
          RequestWidget(),
          RequestWidget(),
        ],
      ),
    );
  }
}
