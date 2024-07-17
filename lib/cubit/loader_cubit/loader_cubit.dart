import 'package:flutter_bloc/flutter_bloc.dart';

import 'loader_state.dart';

class Loading extends Cubit<LoadingState> {




  Loading(bool loading) : super(LoadingInitial(loading));


  get show=>emit(const LoadingState(true));

  get hide=>emit(const LoadingState(false));


}
