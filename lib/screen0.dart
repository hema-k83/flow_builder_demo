import 'package:flutter/material.dart';

import 'custom_flow.dart';

class Screen0 extends StatelessWidget {

  const Screen0({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: ElevatedButton(
        child:const Text("Start Flow"),
        onPressed: ()=> Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => const CustomFlow()),
      ),),)
    );
  }
}