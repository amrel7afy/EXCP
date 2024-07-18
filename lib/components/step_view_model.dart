import 'package:flutter/cupertino.dart';
import 'package:test1/core/helper/extensions.dart';

import '../controller/steps/steps_controller.dart';

class StepsViewModel {
  StepsViewModel._();
  static goToFirstStep(BuildContext context) async {
    var fistStep = await StepsController.fetchFirstStep();
    if(context.mounted){
      context.pushNamed('/${fistStep!.name}');
    }
  }
}
