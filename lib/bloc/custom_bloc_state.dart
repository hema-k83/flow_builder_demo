import 'package:equatable/equatable.dart';

enum CustomBlocStatus{
  yetToInvoke,
  invoking,
  reset
}
class CustomBlocState extends Equatable{
  CustomBlocStatus status;
  CustomBlocState(this.status);
  CustomBlocState copyWith(CustomBlocStatus blocStatus)
  {
    return CustomBlocState(blocStatus);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [status];
  
}