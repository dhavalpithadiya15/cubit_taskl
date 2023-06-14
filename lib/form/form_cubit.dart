import 'package:bloc/bloc.dart';
import 'package:cubit_task/database/database_helper.dart';
import 'package:cubit_task/form/form_state.dart';
import 'package:cubit_task/modal/form_modal.dart';
import 'package:cubit_task/modal/hobbies_modal.dart';
import 'package:flutter/cupertino.dart';

class MyFormCubit extends Cubit<MyFormState> {
  MyFormCubit() : super(MyFormState(firstNameController: TextEditingController(), lastNameController: TextEditingController())) {
    addCites();
    addHobbies();
  }

  void selectGender(String value) {
    emit(state.copyWith(selectedGender: value));
  }

  void addCites() {
    List<String> tempList = List.from(state.listOfCity);
    tempList = ["Mumbai", "Surat", "Chennai"];
    emit(state.copyWith(listOfCity: tempList));

    print(state.selectedGender);
  }

  void onChangeCites(String value) {
    emit(state.copyWith(selectedCity: value));
    print(state.selectedGender);
  }

  void addHobbies() {
    List<HobbiesModal> tempList = List.from(state.listOfHobbies);
    tempList = [
      const HobbiesModal(isSelected: false, hobbyName: "Cricket"),
      const HobbiesModal(isSelected: false, hobbyName: "Singing"),
      const HobbiesModal(isSelected: false, hobbyName: "Dancing"),
      const HobbiesModal(isSelected: false, hobbyName: "Reading"),
    ];
    emit(state.copyWith(listOfHobbies: tempList));
    print(state.listOfHobbies);
  }

  void onChangeCheckBox(int index) {
    List<HobbiesModal> tempList = List.from(state.listOfHobbies);
    tempList[index] = tempList[index].copyWith(isSelected: !tempList[index].isSelected);
    String values = tempList.where((element) => element.isSelected).toList().map((e) => e.hobbyName).toList().join(",");
    emit(state.copyWith(selectedHobbies: values, listOfHobbies: tempList));
    print(state.selectedHobbies);
  }

  Future<void> submit(int? id) {
    if (id != null) {
      var newFormModal = FormModal(
        id: id,
        firstName: state.firstNameController.text,
        lastName: state.lastNameController.text,
        gender: state.selectedGender,
        hobbies: state.selectedHobbies,
        city: state.selectedCity,
      );
      return DbHelper.updateData(newFormModal);



    } else {
      var formModal = FormModal(
        firstName: state.firstNameController.text,
        lastName: state.lastNameController.text,
        gender: state.selectedGender,
        hobbies: state.selectedHobbies,
        city: state.selectedCity,
      );
      return DbHelper.insertData(formModal);
    }
  }

  Future<void> editData(int id) async {
    await DbHelper.selectData(id).then((value) {
      FormModal i = value[0];
      print(value);
      state.firstNameController.text = i.firstName;
      state.lastNameController.text = i.lastName;
      String hobbies = i.hobbies;
      List<String> listOfHobbies = hobbies.split(",");
      List<HobbiesModal> tempList = List.from(state.listOfHobbies);
      for (var newValue in listOfHobbies) {
        int index = tempList.indexWhere((element) => element.hobbyName == newValue);
        if (index != -1) {
          tempList[index] = tempList[index].copyWith(isSelected: true);
        }
      }
      emit(state.copyWith(listOfHobbies: tempList, selectedCity: i.city, selectedGender: i.gender));
    });
  }
}
