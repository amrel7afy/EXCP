import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:test1/features/login/domain/use_cases/login_use_case.dart';

import '../../features/login/data/repos/login_repo_impl.dart';
import '../../features/select_your_plan_resident/presentation/view_model/choose_worker_cubit/choose_worker_cubit.dart';
import '../networking/api_service.dart';

GetIt locator = GetIt.instance;

void setupLocator<T>() {
  locator.registerLazySingleton<DioApiServices>(() => DioApiServices(Dio()));
  locator.registerLazySingleton<LoginRepoImpl>(() => LoginRepoImpl(locator<DioApiServices>()));
  locator.registerLazySingleton<LoginUseCase>(() => LoginUseCase(locator<LoginRepoImpl>()));


  locator.registerFactory<ChooseWorkerCubit>(() => ChooseWorkerCubit());


}
