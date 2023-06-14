import 'package:cubit_task/form/form_cubit.dart';
import 'package:cubit_task/form/form_state.dart';
import 'package:cubit_task/form/form_view.dart';
import 'package:cubit_task/view_data/view_list_cubit.dart';
import 'package:cubit_task/view_data/view_list_view.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Home"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: double.maxFinite,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return BlocProvider(
                        create: (context) => MyFormCubit(),
                        child: const FormView(),
                      );
                    },
                  ));
                },
                child: const Text("Form"),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              width: double.maxFinite,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return BlocProvider(
                          create: (context) => ViewListCubit()..viewInit(),
                          child: const ViewListData(),
                        );
                      },
                    ),
                  );
                },
                child: const Text("View"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
