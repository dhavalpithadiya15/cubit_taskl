import 'package:bloc/bloc.dart';
import 'package:cubit_task/database/database_helper.dart';
import 'package:cubit_task/modal/form_modal.dart';

import 'view_list_state.dart';

class ViewListCubit extends Cubit<ViewListState> {
  ViewListCubit() : super(const ViewListState());

  Future<void> viewInit() async {
    List<FormModal> tempList = List.from(state.listOfAllData);
    tempList = await DbHelper.viewAllData();
    emit(state.copyWith(listOfAllData: tempList));
  }
}
