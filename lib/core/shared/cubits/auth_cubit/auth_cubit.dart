import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test1/core/shared/cubits/auth_cubit/auth_states.dart';

import '../../../helper/app_regex.dart';

class AuthCubit extends Cubit<AuthStates> {
  /* SignUpRepo signUpRepo;
  LoginUseCase loginUseCase;*/

  // AuthCubit(this.signUpRepo,this.loginUseCase) : super(AuthInitial());

  bool isObscureText = true;
  bool isSwitched = false;

  AuthCubit() : super(AuthInitial());
  final signUpFormKey = GlobalKey<FormState>();

  toggleIsObscureText() {
    isObscureText = !isObscureText;
    emit(AuthChangeIsObscureText());
  }

  toggleIsSwitched(value) {
    isSwitched = value;
    emit(AuthChangeIsSwitched());
  }

  //List<User> users = [];

  /* TextEditingController firstNameController = TextEditingController();
  TextEditingController middleNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  final loginFormKey = GlobalKey<FormState>();

*/ /*  void assignUserData(User user) {
    user.firstName = firstNameController.text.trim();
    user.middleName = middleNameController.text.trim();
    user.lastName = lastNameController.text.trim();
    user.phoneNumber = phoneNumberController.text.trim();
    user.email = emailController.text.trim();
    user.password = passwordController.text.trim();
  }*/ /*

  /// set request body
  Map<String, dynamic> assignSignUpRequestData() {
    SignUpRequest signUpRequest = SignUpRequest(
      userName: phoneNumberController.text.trim(),
      name: 'name',
      firstName: firstNameController.text.trim(),
      middleName: middleNameController.text.trim(),
      lastName: lastNameController.text.trim(),
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
      confirmPassword: passwordController.text.trim(),
    );
    return signUpRequest.toMap();
  }

  emitSignUp() async {
    emit(AuthLoading());
    Either<Failure, SignUpResponse> result =
        await signUpRepo.signUp(assignSignUpRequestData());
    result.fold((failure) {
      failure.errorMessage;
      emit(AuthFailure(failure.errorMessage));
    }, (successResponse) {
      log(successResponse.data?.phoneNumber.toString() ?? 'No phone');
      emit(AuthSignUpSuccess(successResponse));
    });
  }

  Map<String, dynamic> assignLoginRequestData() {
    LoginRequest loginRequest = LoginRequest(
        userName: phoneNumberController.text.trim(),
        password: passwordController.text.trim());
    log(loginRequest.toString());
    return loginRequest.toMap();
  }

  emitLogin() async {
    emit(AuthLoading());
    Either<Failure, LoginSuccessResponse> result = await loginUseCase.call(assignLoginRequestData());
    result.fold((failure) {
      failure.errorMessage;
      emit(AuthFailure(failure.errorMessage));
    }, (successResponse) {
      log(successResponse.data.user.email);
      // cacheUserData with secure package
      cacheUserData(successResponse);

      emit(AuthLoginSuccess(successResponse));
    });
  }

  void cacheUserData(LoginSuccessResponse successResponse) {
     User user=successResponse.data.user;
    String userAsString=jsonEncode(user);
    SharedPrefHelper.setSecuredString(AppConstants.userDataKey, userAsString);
  }*/
/*  signUp() async {
    emit(AuthLoading());
    try {
      await getUsersFromCache();
      User? user = findUserByPhoneNumber(phoneNumberController.text.trim());
      if (user != null) {
        emit(AuthUserIsExists());
      } else {
        await createNewUser(user);
      }
    } catch (e) {
      emit(AuthFailure());
    }
  }*/

/*
  Future<void> createNewUser(User? user) async {
    user = User();
    assignUserData(user);
    users.add(user);
    String jsonData = User.encode(users);
    await SharedPrefHelper.setData(AppConstants.usersListKey, jsonData);
    emit(AuthCreateUserSuccess());
  }

  logIn() async {
    try {
      await getUsersFromCache();
      User? user = findUserByPhoneNumber(phoneNumberController.text.trim());
      if (user != null) {
        emit(AuthSuccess());
      } else {
        emit(AuthUserNotExists());
      }
    } catch (e) {
      log(e.toString());
      emit(AuthFailure(e.toString()));
    }
  }*/

/*  Future<void> getUsersFromCache() async {
    String users = await SharedPrefHelper.getString(AppConstants.usersListKey);

    this.users = User.decode(users);
    log(this.users.length.toString());
  }

  User? findUserByPhoneNumber(String phoneNumber) {
    for (var user in users) {
      if (user.phoneNumber == phoneNumber) {
        log(user.phoneNumber ?? 'empty phone number');
        return user;
      }
    }
    return null;
  }*/

  firstNameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please, enter a valid name.';
    }
    return null;
  }

  middleNameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please, enter a valid name.';
    }
    return null;
  }

  lastNameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please, enter a valid name.';
    }
    return null;
  }

  phoneValidator(String? value) {
    if (value == null || value.isEmpty || !AppRegex.isPhoneNumberValid(value)) {
      return 'Please, enter a valid phone number.';
    }
    return null;
  }

  emailValidator(String? value) {
    if (value == null || value.isEmpty || !AppRegex.isEmailValid(value)) {
      return 'Please, enter a valid email.';
    }
    return null;
  }

  passwordValidator(String? value) {
    if (value == null || value.isEmpty || !AppRegex.isPasswordValid(value)) {
      return 'Please, enter a valid phone number.';
    }
    return null;
  }

  confirmPasswordValidator(String? value) {
    if (value == null || value.isEmpty || !AppRegex.isPasswordValid(value)) {
      return 'Please, enter a valid phone number.';
    }
    return null;
  }
}
