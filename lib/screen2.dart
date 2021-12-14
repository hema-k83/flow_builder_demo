import 'package:flow_builder/flow_builder.dart';
import 'package:flow_builder_demo/bloc/custom_bloc.dart';
import 'package:flow_builder_demo/bloc/custom_bloc_event.dart';
import 'package:flow_builder_demo/bloc/custom_bloc_state.dart';
import 'package:flow_builder_demo/custom_flow_state.dart';
import 'package:flow_builder_demo/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Screen2 extends StatelessWidget {
   Screen2({Key? key, required this.param}) : super(key: key);
  final String param;
  final CustomBloc customBloc = CustomBloc(CustomBlocState(CustomBlocStatus.yetToInvoke));
  @override
  Widget build(BuildContext context) {
    return BlocListener<CustomBloc, CustomBlocState>(
      bloc: customBloc,
      listener: (context, state) {
        if (state.status == CustomBlocStatus.invoking) {
          showDialog(
                  context: context, builder: (context) => const CustomDialog())
              .then((value) => {
                    if (value)
                      {
                        customBloc.add(CustomBlocResetEvent()),
                         context.flow<CustomFlowState>().complete(),
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const Screen3())),
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Screen3()))
                        //context.flow<CustomFlowState>().complete(),
                      }
                    else
                      {
                        customBloc.add(CustomBlocResetEvent()),
                       print("Not Leaving")
                      }
                  });
        }
      },
      child: BlocBuilder<CustomBloc, CustomBlocState>(
        bloc: customBloc,
        builder: (context, state) {
          return Scaffold(
            body: Center(
              child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Text(param),
                    ),
                    ElevatedButton(
                        child: const Text("Leave"),
                        onPressed: () => customBloc.add(CustomBlocInvokeEvent()))
                  ]),
            ),
          );
        },
      ),
    );
  }

  _onPressed(BuildContext context) {}
}

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(content: const Text("Are you sure"), actions: [
      ElevatedButton(
        child: const Text("Yes"),
        onPressed: () => Navigator.pop(context, true),
      ),
      ElevatedButton(
        child: const Text("No"),
        onPressed: () => Navigator.pop(context, false),
      ),
    ]);
  }
}
