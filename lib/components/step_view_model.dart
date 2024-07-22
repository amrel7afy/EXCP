import 'package:flutter/cupertino.dart';
import 'package:test1/core/helper/extensions.dart';

import '../controller/steps/steps_controller.dart';

class StepsViewModel {
  StepsViewModel._();
  static final StepsViewModel _inst=StepsViewModel._();
  factory StepsViewModel.instance(){
    return _inst;
  }
  static String supServiceId = '';
  static goToFirstStep(BuildContext context) async {
    var fistStep = await StepsController.fetchFirstStep(supServiceId);
    if(context.mounted){
      context.pushNamed('/${fistStep!.name}');
    }
  }
}
