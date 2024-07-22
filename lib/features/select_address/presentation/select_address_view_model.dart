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
}
