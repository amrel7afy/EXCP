import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test1/core/helper/cache_helper.dart';
import 'package:test1/core/shared/cubits/auth_cubit/auth_states.dart';
import 'package:test1/core/shared/models/user.dart';

import '../../../../main.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitial());
  List<User> users = [];

  TextEditingController firstNameController = TextEditingController();
  TextEditingController middleNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  void assignUserData(User user) {
    user.firstName = firstNameController.text.trim();
    user.middleName = middleNameController.text.trim();
    user.lastName = lastNameController.text.trim();
    user.phoneNumber = phoneNumberController.text.trim();
    user.email = emailController.text.trim();
    user.password = passwordController.text.trim();
  }

  signUp() async {
    emit(AuthLoading());
    try {
      User user = User();
      assignUserData(user);
      users.add(user);
      String jsonData = User.encode(users);
      await SharedPrefHelper.setData(usersListKey, jsonData);
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthFailure());
    }
  }


  logIn()async{
    try{
      await getUsersFromCache();
      User? user=findUserByPhoneNumber(phoneNumberController.text.trim());
      if(user!=null){
        emit(AuthSuccess());
      }else{
        emit(AuthUserNotExists());
      }
    }
    catch(e){
      log(e.toString());
      emit(AuthFailure());
    }
  }

  Future<void> getUsersFromCache() async {
    String users=await SharedPrefHelper.getString(usersListKey);

    this.users=User.decode(users) ;
    log(this.users.length.toString());
  }



  User? findUserByPhoneNumber(String phoneNumber) {
    for (var user in users) {
      if (user.phoneNumber == phoneNumber) {
        log(user.phoneNumber??'empty phone number');
        return user;
      }
    }
    return null;
  }

}
