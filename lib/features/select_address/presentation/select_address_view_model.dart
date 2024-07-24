import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:test1/controller/saved_contact_location/saved_contact_location_controller.dart';
import 'package:test1/core/helper/extensions.dart';
import 'package:test1/cubit/generic_cubit/generic_cubit.dart';
import 'package:test1/models/address/address_model.dart';
import 'package:test1/models/steps/step_model.dart';

import '../../../controller/hourly_contract/hourly_contract_controller.dart';
import '../../../cubit/loader_cubit/loader_cubit.dart';

class SelectAddressViewModel {
  SelectAddressViewModel._();

  // Static instance
  static final SelectAddressViewModel _instance = SelectAddressViewModel._();

  // Factory constructor to return the same instance
  factory SelectAddressViewModel.instance() {
    return _instance;
  }

  Loading loading = Loading.instance();

  GenericCubit<AddressData> addressDataCubit = GenericCubit<AddressData>();
  GenericCubit<StepModel> stepCubit = GenericCubit<StepModel>();

  int selectedIndex = 0;
  List<AddressLocation> locations = <AddressLocation>[];

  selectAddress(BuildContext context,index) async {
    loading.show;
    selectedIndex = index;

    StepModel stepModel=await HourlyContractController.selectAddress(
        selectedLocationId: locations[index].id);

    addressDataCubit.update();
    loading.hide;
    context.pushNamed('/${stepModel.stepDetailsVm.name}');

  }

  getSavedContacts() async {
    loading.show;
    AddressData addressData =
        await SavedContactLocationController.getSavedContacts();
    filterLocationIfHourlyAvailable(addressData);
    addressDataCubit.update(addressData);
    loading.hide;
  }

  void filterLocationIfHourlyAvailable(AddressData addressData) {
    var filteredData = [];
    filteredData = addressData.subLocation.where((location) {
      return location.availableForHourly == true;
    }).toList();
    locations = List<AddressLocation>.from(filteredData);
  }
}
