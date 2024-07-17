class StepsModel {
  final String stepHeaderId;
  final int? stepOrder; // Using nullable int for stepOrder
  final String? dbResourceName; // Using nullable String for dbResourceName
  final String dbResourceFieldName;
  final bool isAvailable;
  final bool isAuthorized;
  final String name;
  final String controller;
  final String action;
  final String? iconClass; // Using nullable String for iconClass
  final String? previousStepAction; // Using nullable String for previousStepAction
  final String nextStepAction;
  final String stepKeyword;
  final String description;
  final int stepType;
  final bool isVisible;
  final String stepId;
  final String httpMethod;

  StepsModel({
    required this.stepHeaderId,
    this.stepOrder,
    this.dbResourceName,
    required this.dbResourceFieldName,
    required this.isAvailable,
    required this.isAuthorized,
    required this.name,
    required this.controller,
    required this.action,
    this.iconClass,
    this.previousStepAction,
    required this.nextStepAction,
    required this.stepKeyword,
    required this.description,
    required this.stepType,
    required this.isVisible,
    required this.stepId,
    required this.httpMethod,
  });

  factory StepsModel.fromJson(Map<String, dynamic> json) {
    return StepsModel(
      stepHeaderId: json['stepHeaderId'],
      stepOrder: json['stepOrder'],
      dbResourceName: json['dbResourceName'],
      dbResourceFieldName: json['dbResourceFieldName'],
      isAvailable: json['isAvailable'],
      isAuthorized: json['isAuthorized'],
      name: json['name'],
      controller: json['controller'],
      action: json['action'],
      iconClass: json['iconClass'],
      previousStepAction: json['previousStepAction'],
      nextStepAction: json['nextStepAction'],
      stepKeyword: json['stepKeyword'],
      description: json['description'],
      stepType: json['stepType'],
      isVisible: json['isVisible'],
      stepId: json['stepId'],
      httpMethod: json['httpMethod'],
    );
  }
}
