

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'address_state.dart';

class AddressCubit extends Cubit<AddressState> {
  AddressCubit() : super(AddressInitial());
  String? cityNameSelectedValue;
  String? areaNameSelectedValue;
  String? houseTypeSelectedValue;
  final PageController pageController = PageController(initialPage: 0);

  final List<String> cityNameOptions = ['الرياض', 'الدمام', 'جدة'];
  final List<String> areaNameOptions = ['الاندلس', 'الدمام', 'جدة'];
  final List<String> houseTypeOptions = ['عمارة', 'فيلا', 'منزل خاص'];
}
