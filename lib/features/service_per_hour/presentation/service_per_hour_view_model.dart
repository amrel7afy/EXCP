import 'package:test1/cubit/generic_cubit/generic_cubit.dart';
import 'package:test1/models/service_per_hour/service_class.dart';

import '../../../controller/service_per_hour/service_per_hour_controller.dart';
import '../../../cubit/loader_cubit/loader_cubit.dart';

class ServicePerHourViewModel {
  late final ServicePerHourController servicePerHourController;

  ServicePerHourViewModel() {
    servicePerHourController = ServicePerHourController();
  }

  GenericCubit<List<ServiceModel>> sliderCubit =
      GenericCubit<List<ServiceModel>>();
  Loading loading = Loading(false);

  fetchServicePerHour() async {
    loading.show;

    List<ServiceModel> service =
        await servicePerHourController.fetchServicesForService();
    sliderCubit.update(service);
    loading.hide;
  }
}
