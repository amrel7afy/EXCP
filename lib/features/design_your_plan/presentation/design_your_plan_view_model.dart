import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test1/cubit/generic_cubit/generic_cubit.dart';
import '../../../controller/hourly_contract/hourly_contract_controller.dart';
import '../../../controller/resource_group/resource_group_controller.dart';

class DesignYourPlanViewModel {
  DesignYourPlanViewModel._();

  static final DesignYourPlanViewModel _instance = DesignYourPlanViewModel._();

  factory DesignYourPlanViewModel.instance() {
    return _instance;
  }

  String? nationalitySelected;
  String? numberOfWorkersSelected;
  String? contractDurationSelected;
  String? durationSelected;
  String? intervalsSelected;
  String? numberOfVisitsSelected;

  TextEditingController nationalityController = TextEditingController();
  TextEditingController numberOfWorkersController = TextEditingController();
  TextEditingController contractDurationController = TextEditingController();
  TextEditingController durationController = TextEditingController();
  TextEditingController intervalsController = TextEditingController();
  TextEditingController numberOfVisitsController = TextEditingController();
  TextEditingController dateOfFirstVisitController = TextEditingController();

  clearControllers() {
    nationalityController.clear();
    numberOfWorkersController.clear();
    contractDurationController.clear();
    durationController.clear();
    intervalsController.clear();
    numberOfVisitsController.clear();
    genericCubit.update();
  }

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
    nationalityController.text = newVal ?? '';
  }

  void updateNumberOfWorkersSelected(String? newVal) {
    numberOfWorkersController.text = newVal ?? '';
  }

  void updateContractDurationSelected(String? newVal) {
    contractDurationController.text = newVal ?? '';
  }

  void updateDurationSelected(String? newVal) {
    durationController.text = newVal ?? '';
  }

  void updateIntervalsSelected(String? newVal) {
    intervalsController.text = newVal ?? '';
  }

  void updateNumberOfVisitsSelected(String? newVal) {
    numberOfVisitsController.text = newVal ?? '';
  }

  String? validateDropdown(String? value) {
    if (value == null || value.isEmpty) {
      return 'هذا الحقل مطلوب';
    }
    return null;
  }
}
