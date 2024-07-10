import 'package:get_it/get_it.dart';
import 'package:test1/features/select_address/presentation/view_model/address_cubit/address_cubit.dart';

import '../../features/select_your_plan_resident/presentation/view_model/choose_worker_cubit/choose_worker_cubit.dart';
import '../networking/api_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  //locator.registerLazySingleton<ApiServices>(() => ApiServices(Dio()));


  //locator.registerLazySingleton<LoginRepoImpl>(() => LoginRepoImpl(locator<ApiServices>()));
  locator.registerFactory<AddressCubit>(() =>AddressCubit());
  locator.registerFactory<ChooseWorkerCubit>(() =>ChooseWorkerCubit());





}
