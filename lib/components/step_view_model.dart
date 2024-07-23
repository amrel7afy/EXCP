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

  static goToFirstStep(BuildContext context) async {
    var fistStep = await StepsController.fetchFirstStep(Repository.supServiceId);
    Repository.stepIdFromFirstStep=fistStep!.stepId;
    if(context.mounted){
      context.pushNamed('/${fistStep.name}');
    }
  }
}
