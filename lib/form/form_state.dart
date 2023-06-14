import 'package:cubit_task/modal/hobbies_modal.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class MyFormState extends Equatable {
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final String selectedGender;
  final String selectedCity;
  final List<String> listOfCity;
  final List<HobbiesModal> listOfHobbies;
  final String selectedHobbies;

  @override
  List<Object?> get props => [selectedGender, selectedGender, listOfCity, selectedCity, listOfHobbies, selectedHobbies];

  const MyFormState({
    required this.firstNameController,
    required this.lastNameController,
    this.selectedGender = "",
    this.selectedCity = "",
    this.listOfCity = const [],
    this.listOfHobbies = const [],
    this.selectedHobbies = "",
  });

  MyFormState copyWith({
    TextEditingController? firstNameController,
    TextEditingController? lastNameController,
    String? selectedGender,
    String? selectedCity,
    List<String>? listOfCity,
    List<HobbiesModal>? listOfHobbies,
    String? selectedHobbies,
  }) {
    return MyFormState(
      firstNameController: firstNameController ?? this.firstNameController,
      lastNameController: lastNameController ?? this.lastNameController,
      selectedGender: selectedGender ?? this.selectedGender,
      selectedCity: selectedCity ?? this.selectedCity,
      listOfCity: listOfCity ?? this.listOfCity,
      listOfHobbies: listOfHobbies ?? this.listOfHobbies,
      selectedHobbies: selectedHobbies ?? this.selectedHobbies,
    );
  }
}
