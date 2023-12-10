import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../Model/ApiRespModel.dart';
import '../Repo/api_http_repo.dart';

part 'api_event.dart';
part 'api_state.dart';

class ApiBloc extends Bloc<ApiEvent, ApiState> {
  ApiBloc() : super(ApiInitial()) {
    //GET
    on<ApiGetEvent>((event, emit) async {
      emit(ApiGetOnloadState());
      ApiRespModel resp =
          await ApiHttpRepo(path: event.path, jsonMap: event.jsonMap).get();
      if (resp.status) {
        emit(ApiGetSuccessState(apiRespModel: resp));
      } else {
        emit(ApiGetErrState());
      }
    });
    //POST
    on<ApiPostEvent>((event, emit) async {
      ApiRespModel resp =
          await ApiHttpRepo(path: event.path, jsonMap: event.jsonMap).post();
      if (resp.status) {
        emit(ApiPostSuccessState(apiRespModel: resp));
      } else {
        emit(ApiPostErrState());
      }
    });
  }
}
