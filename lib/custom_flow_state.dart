import 'package:equatable/equatable.dart';

class CustomFlowState extends Equatable
{
  final String result;
  const CustomFlowState(this.result);
  CustomFlowState copyWith(String value)
  {
    return CustomFlowState(value);
  }

  @override
  List<Object?> get props => [result];
  
}