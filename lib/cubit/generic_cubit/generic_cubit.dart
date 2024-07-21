import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/helper/app_regex.dart';
import 'generic_state.dart';

class GenericCubit<T> extends Cubit<GenericState<T>> {
  GenericCubit({T? data}) : super( GenericInitial(data));

  update([T? data]) {
    emit(GenericUpdate( change : !state.change , data: data));
  }

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
