
import 'package:flutter_bloc/flutter_bloc.dart';

import 'choose_worker_state.dart';

class ChooseWorkerCubit extends Cubit<ChooseWorkerState> {
  ChooseWorkerCubit() : super(ChooseWorkerInitial());

  bool isFromApp = true;

  void selectFromApp() {
    isFromApp = true;
    emit(ChooseWorkerChangeState(isFromApp));
  }

  void selectFromCompany() {
    isFromApp = false;
    emit(ChooseWorkerChangeState(isFromApp));
  }
}

