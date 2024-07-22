import 'package:test1/controller/saved_contact_location/saved_contact_location_controller.dart';
import 'package:test1/cubit/generic_cubit/generic_cubit.dart';

import '../../../cubit/loader_cubit/loader_cubit.dart';

class SelectAddressViewModel {
  Loading loading = Loading.instance();

  GenericCubit genericCubit=GenericCubit();
  int selectedIndex=0;
  selectAddress(index){
    loading.show;
   selectedIndex = index;
   genericCubit.update();
    loading.hide;
  }

  getSavedContacts()async{
    await SavedContactLocationController.getSavedContacts();
  }
}
