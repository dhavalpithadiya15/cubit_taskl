import 'package:cubit_task/view_data/view_list_cubit.dart';
import 'package:cubit_task/view_data/view_list_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'modal/form_modal.dart';

class DetailView extends StatelessWidget {
  final int index;
  final List<FormModal> list;

  const DetailView({Key? key, required this.index, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Detail"),
        ),
        body: Column(
          children: [
            Text(list[index].firstName),
            Text(list[index].gender),
            Text(list[index].hobbies),
            Text(list[index].lastName),
            Text(list[index].city),
          ],
        ),
      ),
    );
  }
}
