import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:test1/core/shared/cubits/auth_cubit/auth_cubit.dart';
import 'package:test1/features/login/domain/use_cases/login_use_case.dart';
import 'package:test1/features/select_address/presentation/view_model/address_cubit/address_cubit.dart';
import 'package:test1/features/sign_up/data/repos/sign_up_repo_impl.dart';
import 'package:test1/features/sign_up/data/repos/sign_up_repo_impl.dart';

import '../../features/login/data/repos/login_repo_impl.dart';
import '../../features/select_your_plan_resident/presentation/view_model/choose_worker_cubit/choose_worker_cubit.dart';
import '../networking/api_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<ApiServices>(() => ApiServices(Dio()));
  locator.registerLazySingleton<SignUpRepoImpl>(() => SignUpRepoImpl(locator<ApiServices>()));
  locator.registerLazySingleton<LoginRepoImpl>(() => LoginRepoImpl(locator<ApiServices>()));
  locator.registerLazySingleton<LoginUseCase>(() => LoginUseCase(locator<LoginRepoImpl>()));


  //locator.registerLazySingleton<LoginRepoImpl>(() => LoginRepoImpl(locator<ApiServices>()));
  locator.registerFactory<AddressCubit>(() => AddressCubit());
  locator.registerFactory<ChooseWorkerCubit>(() => ChooseWorkerCubit());

  locator
      .registerFactory<AuthCubit>(() => AuthCubit(locator<SignUpRepoImpl>(),locator<LoginUseCase>()));
}
