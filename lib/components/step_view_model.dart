import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:test1/core/helper/extensions.dart';
import 'package:test1/utility/repository/repository.dart';

import '../controller/steps/steps_controller.dart';
import '../cubit/loader_cubit/loader_cubit.dart';
import '../models/fist_step/first_step_obj_parameter.dart';

class StepsViewModel {
  StepsViewModel._();
  static final StepsViewModel _inst=StepsViewModel._();
  factory StepsViewModel.instance(){
    return _inst;
  }
Loading loading=Loading.instance();
   goToFirstStep(BuildContext context) async {
     loading.show;
     final String object=jsonEncode(FirstStepObjParameter(
         fromOffer: false,
         selectedPricingId: null,
         serviceId: Repository.supServiceId
     ).toJson());
    var fistStep = await StepsController.fetchFirstStep(object);
    Repository.stepIdFromFirstStep=fistStep!.stepId!;
    log(Repository.stepIdFromFirstStep,name:'StepID');
     loading.hide;
    if(context.mounted){
      context.pushNamed('/${fistStep.name}');
    }
  }
}




// 1 -  "stepType":2, // screen redirect .. check
// 2 -   name":"SavedAddresses",

// 3 - "controller":"HourlyContract", "action":"SavedAddresses" ,"httpMethod":"Post"

