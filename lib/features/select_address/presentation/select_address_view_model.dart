import 'package:test1/controller/saved_contact_location/saved_contact_location_controller.dart';
import 'package:test1/cubit/generic_cubit/generic_cubit.dart';
import 'package:test1/models/address/address_model.dart';

import '../../../cubit/loader_cubit/loader_cubit.dart';

class SelectAddressViewModel {
  Loading loading = Loading.instance();

  GenericCubit<AddressData> genericCubit = GenericCubit<AddressData>();

  int selectedIndex = 0;
List<AddressLocation>locations=<AddressLocation>[];
  selectAddress(index) {
    loading.show;
    selectedIndex = index;
    genericCubit.update();
    loading.hide;
  }

  getSavedContacts() async {
    loading.show;
   AddressData addressData= await SavedContactLocationController.getSavedContacts();
    locations=addressData.subLocation;
   genericCubit.update(addressData);
    loading.hide;
  }
}
