import 'package:flutter/cupertino.dart';

class DesignYourPlanViewModel{
  DesignYourPlanViewModel._();

  // Static instance
  static final DesignYourPlanViewModel _instance = DesignYourPlanViewModel._();

  // Factory constructor to return the same instance
  factory DesignYourPlanViewModel.instance() {
    return _instance;
  }

  List<String> nationality = ['المجر', 'الفلبين', 'اندونيسيا'];
  List<String> contractDuration = ['3 شهور', '5 شهور'];
  List<String> duration = ['صباحي', 'مسائي'];
  List<String> intervals = ['من 8ص الي 10ص', 'من 10ص الي 12ص'];
  List<String> numberOfVisits = ['1', '2', '3', '4', '5'];

  TextEditingController dateOfFirstVisitController =
  TextEditingController(text: 'اختر');

}