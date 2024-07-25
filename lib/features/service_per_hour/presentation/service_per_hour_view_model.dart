import 'dart:developer';

import 'package:test1/cubit/generic_cubit/generic_cubit.dart';
import 'package:test1/models/service_per_hour/service_class.dart';

import '../../../controller/service_per_hour/service_per_hour_controller.dart';
import '../../../cubit/loader_cubit/loader_cubit.dart';
import '../../../utility/repository/repository.dart';

class ServicePerHourViewModel {
  ServicePerHourViewModel._internal();

  static final ServicePerHourViewModel _instance =
      ServicePerHourViewModel._internal();

  factory ServicePerHourViewModel.instance() {
    return _instance;
  }

  GenericCubit<List<ServiceModel>> serviceCubit =
      GenericCubit<List<ServiceModel>>();

  Loading loading = Loading.instance();

  fetchServicePerHour() async {
    loading.show;

    List<ServiceModel> service =
        await ServicePerHourController.fetchServicesForService();
    Repository.supServiceId=service[1].id;
    log(Repository.supServiceId,name: 'SubServiceId');

    serviceCubit.update(service);
    loading.hide;
  }
}
