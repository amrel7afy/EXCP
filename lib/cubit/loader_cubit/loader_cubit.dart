import 'package:flutter_bloc/flutter_bloc.dart';

import 'loader_state.dart';

class LoaderCubit extends Cubit<LoaderState> {
  LoaderCubit(bool loading) : super(LoaderInitial(loading));

  update(bool loading) => emit(LoaderState(loading));


}
