import 'package:cubit_task/detail_view.dart';
import 'package:cubit_task/form/form_cubit.dart';
import 'package:cubit_task/form/form_view.dart';
import 'package:cubit_task/view_data/view_list_cubit.dart';
import 'package:cubit_task/view_data/view_list_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../form/form_state.dart';

class ViewListData extends StatelessWidget {
  const ViewListData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("View"),
      ),
      body: BlocBuilder<ViewListCubit, ViewListState>(
        builder: (context, state) {
          return ListView.builder(
            itemCount: state.listOfAllData.length,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return DetailView(
                        index: index,
                        list: state.listOfAllData,
                      );
                    },
                  ));
                },
                leading: Text("${index + 1}"),
                title: Text('${state.listOfAllData[index].firstName} ${state.listOfAllData[index].lastName}'),
                trailing: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return BlocProvider(
                              create: (context) => MyFormCubit()..editData(state.listOfAllData[index].id!),
                              child: FormView(id: state.listOfAllData[index].id!));
                        },
                      ),
                    );
                  },
                  icon: const Icon(Icons.edit),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
