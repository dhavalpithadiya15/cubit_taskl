import 'package:equatable/equatable.dart';

class HobbiesModal extends Equatable{
  final String hobbyName;
  final bool isSelected;

  const HobbiesModal({
     this.hobbyName="",
     this.isSelected=false,
  });

  HobbiesModal copyWith({
    String? hobbyName,
    bool? isSelected,
  }) {
    return HobbiesModal(
      hobbyName: hobbyName ?? this.hobbyName,
      isSelected: isSelected ?? this.isSelected,
    );
  }

  @override
  List<Object?> get props => [hobbyName,isSelected];

  Map<String, dynamic> toMap() {
    return {
      'hobbyName': hobbyName,
      'isSelected': isSelected,
    };
  }

  factory HobbiesModal.fromMap(Map<String, dynamic> map) {
    return HobbiesModal(
      hobbyName: map['hobbyName'] as String,
      isSelected: map['isSelected'] as bool,
    );
  }
}