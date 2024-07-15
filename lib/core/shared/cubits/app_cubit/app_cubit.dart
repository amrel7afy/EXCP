
import 'package:bloc/bloc.dart';
import '../../../helper/app_regex.dart';
import 'app_state.dart';
class AppCubit extends Cubit<AppState> {

  AppCubit() : super(AppInitial());

  update()=>emit(AppUpdateState());

  phoneValidator(String? value) {
    if (value == null || value.isEmpty || !AppRegex.isPhoneNumberValid(value)) {
      return 'Please, enter a valid phone number.';
    }
    return null;
  }
  passwordValidator(String? value) {
    if (value == null || value.isEmpty || !AppRegex.isPasswordValid(value)) {
      return 'Please, enter a valid phone number.';
    }
    return null;
  }
}
