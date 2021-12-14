import 'package:flow_builder_demo/custom_flow_state.dart';
import 'package:flow_builder_demo/screens.dart';
import 'package:flutter/material.dart';
import 'package:flow_builder/flow_builder.dart';

class CustomFlow extends StatelessWidget {
  const CustomFlow({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FlowBuilder<CustomFlowState>(
         state: const CustomFlowState(""),
        onGeneratePages: _onGeneratePages);
    
  }
    List<Page> _onGeneratePages(CustomFlowState state,  List<Page> pages)
  {
    return [
      if(state.result.isEmpty)const MaterialPage(child:Screen1()),
      if(state.result.isNotEmpty)MaterialPage(child:Screen2(param:state.result)),
    ];
  }
}
