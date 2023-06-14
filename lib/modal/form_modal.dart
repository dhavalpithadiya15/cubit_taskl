import 'package:cubit_task/modal/hobbies_modal.dart';
import 'package:equatable/equatable.dart';

class FormModal extends Equatable {
  final int? id;
  final String firstName;
  final String lastName;
  final String gender;
  final String city;
  final String hobbies;

  @override
  List<Object?> get props => [firstName, lastName, gender, city, hobbies, id];

  const FormModal({
    this.id,
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.city,
    required this.hobbies,
  });

  FormModal copyWith({
    int? id,
    String? firstName,
    String? lastName,
    String? gender,
    String? city,
    String? hobbies,
  }) {
    return FormModal(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      gender: gender ?? this.gender,
      city: city ?? this.city,
      hobbies: hobbies ?? this.hobbies,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'gender': gender,
      'city': city,
      'hobbies': hobbies,
    };
  }

  factory FormModal.fromMap(Map<String, dynamic> map) {
    return FormModal(
      id: map['id'] as int,
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      gender: map['gender'] as String,
      city: map['city'] as String,
      hobbies: map['hobbies'] as String,
    );
  }
}
