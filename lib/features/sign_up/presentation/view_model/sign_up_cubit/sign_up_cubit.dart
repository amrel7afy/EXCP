
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test1/features/sign_up/presentation/view_model/sign_up_cubit/sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());


}
