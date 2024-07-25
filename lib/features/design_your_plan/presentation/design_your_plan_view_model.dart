import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test1/core/helper/extensions.dart';
import 'package:test1/cubit/container_label_border_cubit/container_label_border_cubit.dart';
import 'package:test1/cubit/generic_cubit/generic_cubit.dart';
import '../../../controller/hourly_contract/hourly_contract_controller.dart';
import '../../../controller/resource_group/resource_group_controller.dart';

class DesignYourPlanViewModel {
  DesignYourPlanViewModel._();

  // Static instance
  static final DesignYourPlanViewModel _instance = DesignYourPlanViewModel._();

  // Factory constructor to return the same instance
  factory DesignYourPlanViewModel.instance() {
    return _instance;
  }

  String? nationalitySelected;
  String? numberOfWorkersSelected;
  String? contractDurationSelected;
  String? durationSelected;
  String? intervalsSelected;
  String? numberOfVisitsSelected;
  TextEditingController dateOfFirstVisitController = TextEditingController();
//for border handling
LabelBorderCubit labelBorderCubit=LabelBorderCubit();


  bool nationalityCheckSelected= true;
  bool numberOfWorkersCheckSelected= true;
  bool contractDurationCheckSelected= true;
  bool durationCheckSelected= true;
  bool intervalsCheckSelected= true;
  bool numberOfVisitsCheckSelected=true;

  checkValidate() {
    if (!nationalitySelected.isNullOrEmpty() &&
        !numberOfWorkersSelected.isNullOrEmpty() &&
        !contractDurationSelected.isNullOrEmpty() &&
        !durationSelected.isNullOrEmpty() &&
        !intervalsSelected.isNullOrEmpty() &&
        !numberOfVisitsSelected.isNullOrEmpty() &&
        !dateOfFirstVisitController.text.isNullOrEmpty()) {
      return true;
    }
  }

/*  clearControllers() {
    nationalityController.clear();
    numberOfWorkersController.clear();
    contractDurationController.clear();
    durationController.clear();
    intervalsController.clear();
    numberOfVisitsController.clear();
    genericCubit.update();
  }*/

  List<String> nationality = [];
  List<String> numberOfWorkers = [];
  List<String> contractDuration = [];
  List<String> duration = [];
  List<String> intervals = [];
  List<String> numberOfVisits = [];

  GenericCubit genericCubit = GenericCubit();

  fetchDataOfFields() async {
    List results = await Future.wait([
      ResourceGroupController.fetchGetResourceGroupsByService(),
      HourlyContractController.fetchKeyAndValueData(action: 'NumOfWorkers'),
      HourlyContractController.fetchKeyAndValueData(action: 'ContractDuration'),
      HourlyContractController.fetchKeyAndValueData(action: 'Shifts'),
      HourlyContractController.fetchKeyAndValueData(action: 'NumOfVisits'),
      HourlyContractController.fetchKeyAndValueData(action: 'NumOfHours'),
    ]);

    nationality =
        List<String>.from(results[0].map((item) => item.value).toList());
    numberOfWorkers =
        List<String>.from(results[1].map((item) => item.value).toList());
    contractDuration =
        List<String>.from(results[2].map((item) => item.value).toList());
    duration = List<String>.from(results[3].map((item) => item.value).toList());
    intervals =
        List<String>.from(results[4].map((item) => item.value).toList());
    numberOfVisits =
        List<String>.from(results[5].map((item) => item.value).toList());

    genericCubit.update();
  }

  void updateNationalitySelected(String? newVal) {
    nationalitySelected = newVal ?? '';
    if(newVal!=null){
      nationalityCheckSelected=true;
      genericCubit.update();
    }
  }

  void updateNumberOfWorkersSelected(String? newVal) {
    numberOfWorkersSelected = newVal ?? '';

  }

  void updateContractDurationSelected(String? newVal) {
    contractDurationSelected = newVal ?? '';
  }

  void updateDurationSelected(String? newVal) {
    durationSelected = newVal ?? '';
  }

  void updateIntervalsSelected(String? newVal) {
    intervalsSelected = newVal ?? '';
  }

  void updateNumberOfVisitsSelected(String? newVal) {
    numberOfVisitsSelected = newVal ?? '';
    genericCubit.update();
  }

  String? validateDropdown(String? value) {
    if (value == null || value.isEmpty) {
      return 'هذا الحقل مطلوب';
    }
    return null;
  }

}
