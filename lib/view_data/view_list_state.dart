import 'package:cubit_task/modal/form_modal.dart';

class ViewListState {
final List<FormModal> listOfAllData;

const ViewListState({
    this.listOfAllData=const[],
  });

ViewListState copyWith({
  List<FormModal>? listOfAllData,
}) {
  return ViewListState(
    listOfAllData: listOfAllData ?? this.listOfAllData,
  );
}
}
