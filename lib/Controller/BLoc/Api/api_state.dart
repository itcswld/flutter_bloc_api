part of 'api_bloc.dart';

@immutable
abstract class ApiState {}

//POST
abstract class ApiPOSTAction extends ApiState {}

class ApiInitial extends ApiState {}

//GET
class ApiGetOnloadState extends ApiState {}

class ApiGetSuccessState extends ApiState {
  final ApiRespModel apiRespModel;
  ApiGetSuccessState({required this.apiRespModel});
}

class ApiGetErrState extends ApiState {}

//POST
class ApiPostSuccessState extends ApiPOSTAction {
  final ApiRespModel apiRespModel;
  ApiPostSuccessState({required this.apiRespModel});
}

class ApiPostErrState extends ApiPOSTAction {}
