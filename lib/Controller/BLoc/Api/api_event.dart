part of 'api_bloc.dart';

@immutable
abstract class ApiEvent {}

class ApiGetEvent extends ApiEvent {
  final String path;
  final Map<String, dynamic>? jsonMap;
  ApiGetEvent({required this.path, this.jsonMap});
}

class ApiPostEvent extends ApiEvent {
  final String path;
  final Map<String, dynamic> jsonMap;
  ApiPostEvent({required this.path, required this.jsonMap});
}
