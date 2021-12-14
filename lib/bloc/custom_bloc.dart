
import 'package:flow_builder_demo/bloc/custom_bloc_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'custom_bloc_state.dart';

class CustomBloc extends Bloc<CustomBlocEvent,CustomBlocState>
{
  CustomBloc(initState):super(initState)
  {
    on<CustomBlocInvokeEvent>(_customBlocInvokeEvent);
     on<CustomBlocResetEvent>(_customBlocResetEvent);
  }
  _customBlocInvokeEvent(CustomBlocInvokeEvent event,Emitter<CustomBlocState>emit)
  {
    emit(state.copyWith(CustomBlocStatus.invoking));
  }
  _customBlocResetEvent(CustomBlocResetEvent event,Emitter<CustomBlocState>emit)
  {
   emit(state.copyWith(CustomBlocStatus.reset)); 
  }
}