import 'package:flow_builder/flow_builder.dart';
import 'package:flow_builder_demo/custom_flow_state.dart';
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