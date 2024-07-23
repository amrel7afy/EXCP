import 'dart:developer';

import 'package:test1/controller/saved_contact_location/saved_contact_location_controller.dart';
import 'package:test1/cubit/generic_cubit/generic_cubit.dart';
import 'package:test1/models/address/address_model.dart';

import '../../../controller/hourly_contract/hourly_contract_controller.dart';
import '../../../cubit/loader_cubit/loader_cubit.dart';

class SelectAddressViewModel {
  Loading loading = Loading.instance();

  GenericCubit<AddressData> genericCubit = GenericCubit<AddressData>();

  int selectedIndex = 0;
  List<AddressLocation> locations = <AddressLocation>[];

  selectAddress(index) async{
    loading.show;
    selectedIndex = index;
    genericCubit.update();
    await HourlyContractController.selectAddress(selectedLocationId: locations[index].id);
    loading.hide;
  }

  getSavedContacts() async {
    loading.show;
    AddressData addressData =
        await SavedContactLocationController.getSavedContacts();
    filterLocationIfHourlyAvailable(addressData);
    genericCubit.update(addressData);
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
