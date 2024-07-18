import 'package:flutter/cupertino.dart';
import 'package:test1/controller/steps/steps_controller.dart';
import 'package:test1/core/helper/extensions.dart';
import 'package:test1/cubit/generic_cubit/generic_cubit.dart';
import 'package:test1/models/service_per_hour/service_class.dart';
import '../../../controller/service_per_hour/service_per_hour_controller.dart';
import '../../../cubit/loader_cubit/loader_cubit.dart';

class ServicePerHourViewModel {
  GenericCubit<List<ServiceModel>> serviceCubit =
      GenericCubit<List<ServiceModel>>();

  Loading loading = Loading.instance();

  fetchServicePerHour() async {
    loading.show;

    List<ServiceModel> service =
        await ServicePerHourController.fetchServicesForService();
    serviceCubit.update(service);
    loading.hide;
  }


}


