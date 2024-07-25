import 'step_details_vm.dart';

class StepModel {
  final String stepId;
  final StepDetailsVm stepDetailsVm;
  final dynamic data;

  StepModel({
    required this.stepId,
    required this.stepDetailsVm,
    this.data,
  });

  factory StepModel.fromJson(Map<String, dynamic> json) {
    return StepModel(
      stepId: json['stepId'] as String,
      stepDetailsVm:
          StepDetailsVm.fromJson(json['stepDetailsVm'] as Map<String, dynamic>),
      data: json['data'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'stepId': stepId,
      'stepDetailsVm': stepDetailsVm.toJson(),
      'data': data,
    };
  }
}


