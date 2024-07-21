import 'package:flutter_bloc/flutter_bloc.dart';
import 'loader_state.dart';

class Loading extends Cubit<LoadingState> {
  // Private constructor
  Loading._internal() : super(const LoadingInitial(false));

  // Static instance
  static final Loading _instance = Loading._internal();

  // Factory constructor to return the same instance
  factory Loading.instance() {
    return _instance;
  }

  // Methods to show and hide loading state
  get show => emit(const LoadingState(true));
  get hide => emit(const LoadingState(false));
}
