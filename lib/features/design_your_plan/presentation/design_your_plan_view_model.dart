import 'package:flutter/cupertino.dart';

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

  List<String> nationality = [];
  List<String> numberOfWorkers = [];
  List<String> contractDuration = [];
  List<String> duration = [];
  List<String> intervals = [];
  List<String> numberOfVisits = [];

  TextEditingController dateOfFirstVisitController =
  TextEditingController(text: 'اختر');

  setData() {
    if (nationality.isNotEmpty) nationalitySelected = nationality.first;
    if (numberOfWorkers.isNotEmpty) numberOfWorkersSelected = numberOfWorkers.first;
    if (contractDuration.isNotEmpty) contractDurationSelected = contractDuration.first;
    if (duration.isNotEmpty) durationSelected = duration.first;
    if (intervals.isNotEmpty) intervalsSelected = intervals.first;
    if (numberOfVisits.isNotEmpty) numberOfVisitsSelected = numberOfVisits.first;
  }

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
    intervals = List<String>.from(results[4].map((item) => item.value).toList());
    numberOfVisits =
    List<String>.from(results[5].map((item) => item.value).toList());

    setData();
  }

  void updateNationalitySelected(String? newVal) {
    nationalitySelected = newVal;
  }

  void updateNumberOfWorkersSelected(String? newVal) {
    numberOfWorkersSelected = newVal;
  }

  void updateContractDurationSelected(String? newVal) {
    contractDurationSelected = newVal;
  }

  void updateDurationSelected(String? newVal) {
    durationSelected = newVal;
  }

  void updateIntervalsSelected(String? newVal) {
    intervalsSelected = newVal;
  }

  void updateNumberOfVisitsSelected(String? newVal) {
    numberOfVisitsSelected = newVal;
  }

  String? validateDropdown(String? value) {
    if (value == null || value.isEmpty) {
      return 'هذا الحقل مطلوب';
    }
    return null;
  }
}


