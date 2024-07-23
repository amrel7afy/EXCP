import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:test1/core/helper/extensions.dart';
import 'package:test1/utility/repository/repository.dart';

import '../controller/steps/steps_controller.dart';

class StepsViewModel {
  StepsViewModel._();
  static final StepsViewModel _inst=StepsViewModel._();
  factory StepsViewModel.instance(){
    return _inst;
  }

   goToFirstStep(BuildContext context) async {
    var fistStep = await StepsController.fetchFirstStep();
    Repository.stepIdFromFirstStep=fistStep!.stepId!;
    log(Repository.stepIdFromFirstStep,name:'StepID');
    if(context.mounted){
      context.pushNamed('/${fistStep.name}');
    }
  }
}
