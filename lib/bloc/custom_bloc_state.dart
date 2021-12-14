import 'package:equatable/equatable.dart';

enum CustomBlocStatus{
  yetToInvoke,
  invoking,
  reset
}
class CustomBlocState extends Equatable{
  final CustomBlocStatus status;
  const CustomBlocState(this.status);
  CustomBlocState copyWith(CustomBlocStatus blocStatus)
  {
    return CustomBlocState(blocStatus);
  }

  @override
  List<Object?> get props => [status];
  
}