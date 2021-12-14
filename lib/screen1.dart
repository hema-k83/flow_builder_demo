import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';

import 'custom_flow_state.dart';

class Screen1 extends StatelessWidget {
  const Screen1({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text("Next"),
          onPressed: ()
          {
            context.flow<CustomFlowState>().update((customFlowState)=>customFlowState.copyWith("Next Screen"));
          },
        ),
      ),
    );
  }
}