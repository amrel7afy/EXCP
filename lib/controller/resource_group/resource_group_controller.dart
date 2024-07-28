import 'dart:convert';

import 'package:test1/models/resource_group/resource_group_model.dart';
import 'package:test1/services/app_service.dart';
import 'package:test1/utility/repository/repository.dart';

class ResourceGroupController {
  static fetchGetResourceGroupsByService() async {
    var result = await AppService.callService(
        actionType: ActionType.get,
        apiName:
            '/api/ResourceGroup/GetResourceGroupsByService?serviceId=${Repository.supServiceId}',
        body: null);
    return result != null
        ? List<ResourceGroupModel>.from(jsonDecode(result)
            .map((worker) => ResourceGroupModel.fromJson(worker)))
        : <ResourceGroupModel>[];
  }
}
