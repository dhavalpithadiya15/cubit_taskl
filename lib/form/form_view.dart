import 'package:cubit_task/form/form_cubit.dart';
import 'package:cubit_task/form/form_state.dart';

import 'package:cubit_task/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FormView extends StatelessWidget {
  final int? id;

  const FormView({Key? key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Form"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            CustomTextField(controller: context.read<MyFormCubit>().state.firstNameController, hintText: "First name"),
            CustomTextField(controller: context.read<MyFormCubit>().state.lastNameController, hintText: "Last name"),
            BlocSelector<MyFormCubit, MyFormState, String>(
              selector: (state) {
                return state.selectedGender;
              },
              builder: (context, state) {
                return Column(
                  children: [
                    RadioListTile(
                      contentPadding: EdgeInsets.zero,
                      title: const Text("Male"),
                      value: "male",
                      groupValue: state,
                      onChanged: (value) => BlocProvider.of<MyFormCubit>(context).selectGender(value!),
                    ),
                    RadioListTile(
                      contentPadding: EdgeInsets.zero,
                      title: const Text("Female"),
                      value: "female",
                      groupValue: state,
                      onChanged: (value) => BlocProvider.of<MyFormCubit>(context).selectGender(value!),
                    ),
                  ],
                );
              },
            ),
            BlocBuilder<MyFormCubit, MyFormState>(
              builder: (context, state) {
                print(state.selectedCity);
                return DropdownButton<String>(
                    elevation: 1,
                    isExpanded: true,
                    padding: const EdgeInsets.all(10),
                    hint: state.selectedCity.isEmpty ? const Text("Select City") : Text(state.selectedCity),
                    items: state.listOfCity.map((e) => DropdownMenuItem<String>(value: e, child: Text(e))).toList(),
                    onChanged: (value) => BlocProvider.of<MyFormCubit>(context).onChangeCites(value!));
              },
            ),
            BlocBuilder<MyFormCubit, MyFormState>(
              builder: (context, state) {
                return ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: state.listOfHobbies.length,
                  itemBuilder: (context, index) {
                    return CheckboxListTile(
                      title: Text(state.listOfHobbies[index].hobbyName),
                      value: state.listOfHobbies[index].isSelected,
                      onChanged: (value) => BlocProvider.of<MyFormCubit>(context).onChangeCheckBox(index),
                    );
                  },
                );
              },
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              width: double.maxFinite,
              child: ElevatedButton(
                onPressed: () {
                  BlocProvider.of<MyFormCubit>(context).submit(id).then((value) {
                    Navigator.pop(context);
                  });
                },
                child: id != null ? const Text("Update") : const Text("Submit"),
              ),
            )
          ],
        ),
      ),
    );
  }
}

