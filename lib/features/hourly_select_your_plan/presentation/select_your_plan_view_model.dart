import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:test1/controller/hourly_contract/hourly_contract_controller.dart';
import 'package:test1/models/package/package_model.dart';

import '../../../cubit/generic_cubit/generic_cubit.dart';
import '../../../cubit/loader_cubit/loader_cubit.dart';

class SelectYourPlanViewModel {
  SelectYourPlanViewModel._();

  // Static instance
  static final SelectYourPlanViewModel _instance = SelectYourPlanViewModel._();

  // Factory constructor to return the same instance
  factory SelectYourPlanViewModel.instance() {
    return _instance;
  }

  bool is4Hours = true;
  bool isFrom8AM = true;
  bool isAM = true;
  Loading loading = Loading.instance();
  late TabController tabController;

  GenericCubit genericCubit = GenericCubit();
  List<PackageModel> allFixedPackages = <PackageModel>[];
  List<PackageModel> fixedPackagesAM = <PackageModel>[];
  List<PackageModel> fixedPackagesPM = <PackageModel>[];

  fetchFixedPackages() async {
    loading.show;
    allFixedPackages = await HourlyContractController.fetchFixedPackages();
    filterPackages();
    log(fixedPackagesPM.length.toString(), name: "Length");
    genericCubit.update();
    loading.hide;
  }

  int selectedPackageAMIndex = 0;
  int selectedPackagePMIndex = 0;

  changeSelectedPackageAMIndex(index) {
    selectedPackageAMIndex = index;
  }

  changeSelectedPackagePMIndex(index) {
    selectedPackagePMIndex = index;
  }

  changeSelectedPackagePM() {}

  void filterPackages() {
    fixedPackagesAM = allFixedPackages.where((package) {
      return package.visitShiftName == 'صباحي';
    }).toList();
    fixedPackagesPM = allFixedPackages.where((package) {
      return package.visitShiftName == 'مسائي';
    }).toList();
  }

  designYourFixedPlanAM(int index) async {
    changeSelectedPackageAMIndex(index);
    await HourlyContractController.designYourFixedPackage(
        selectedHourlyPricingId:
            fixedPackagesAM[index].selectedHourlyPricingId!);
  }

  designYourFixedPlanPM(index) async {
    changeSelectedPackagePMIndex(index);
    await HourlyContractController.designYourFixedPackage(
        selectedHourlyPricingId:
        fixedPackagesPM[index].selectedHourlyPricingId!);
  }
}
