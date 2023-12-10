import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_api/Controller/BLoc/Api/api_bloc.dart';
import 'package:flutter_bloc_api/Model/DataModel.dart';

class GetPage extends StatefulWidget {
  const GetPage({super.key});

  @override
  State<GetPage> createState() => _GetPageState();
}

class _GetPageState extends State<GetPage> {
  final ApiBloc apiBloc = ApiBloc();

  @override
  void initState() {
    apiBloc.add(ApiGetEvent(path: '/posts'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Page'),
      ),
      body: BlocConsumer<ApiBloc, ApiState>(
        bloc: apiBloc,
        listener: (context, state) {},
        listenWhen: (previous, current) => current is ApiPOSTAction,
        buildWhen: (previous, current) => current is! ApiPOSTAction,
        builder: (context, state) {
          switch (state.runtimeType) {
            case ApiGetOnloadState:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case ApiGetSuccessState:
              final successSate = state as ApiGetSuccessState;
              var resp = successSate.apiRespModel;
              var dataList = resp.jsonMap;
              List<DataModel> datas = [];
              for (int i = 0; i < dataList.length; i++) {
                DataModel data = DataModel.fromJson(dataList[i]);
                datas.add(data);
              }
              return ListView.builder(
                  itemCount: datas.length,
                  itemBuilder: (_, i) {
                    return Container(
                      color: Colors.grey.shade200,
                      padding: const EdgeInsets.all(16),
                      margin: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(datas[i].title),
                          Text(datas[i].body),
                        ],
                      ),
                    );
                  });
            default:
              return const SizedBox();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          apiBloc.add(ApiPostEvent(path: '/posts', jsonMap: const {
            'title': 'Eve is good at Flutter',
            'body': 'Eve made it',
            'userId': "111",
          }));
        },
      ),
    );
  }
}
