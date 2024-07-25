class PackageModel {
  String? selectedHourlyPricingId;
  String? displayName;
  String? serviceId;
  String? resourceGroupId;
  String? resourceGroupName;
  int? employeeNumber;
  String? employeeNumberName;
  int? hoursNumber;
  int? weeklyVisits;
  String? weeklyVisitName;
  int? contractDuration;
  String? contractDurationName;
  int? visitShift;
  String? visitShiftName;
  String? timeSlotId;
  String? timeSlotDisplayName;
  String? promotionCodeId;
  String? promotionCode;
  String? promotionCodeDescription;
  double? oneVisitPrice;
  int? totalVisits;
  int? visitHours;
  bool? isAvalable;
  double? packagePrice;
  double? totalPriceWithVatBeforePromotion;
  double? packagePercentDiscount;
  double? packageDiscountAmount;
  double? packagePriceAfterPackageDiscount;
  double? promotionTotalDiscountAmount;
  double? promotionTotalDiscountPercent;
  double? totalDiscountPercent;
  double? totalDiscountAmount;
  double? priceAfterTotalDiscount;
  int? freeVisitsCount;
  String? promotionEndDate;
  PromotionState? promotionState;
  double? vatRate;
  double? vatAmount;
  double? finalPrice;
  List<dynamic>? promotionOfferList;

  PackageModel({
    this.selectedHourlyPricingId,
    this.displayName,
    this.serviceId,
    this.resourceGroupId,
    this.resourceGroupName,
    this.employeeNumber,
    this.employeeNumberName,
    this.hoursNumber,
    this.weeklyVisits,
    this.weeklyVisitName,
    this.contractDuration,
    this.contractDurationName,
    this.visitShift,
    this.visitShiftName,
    this.timeSlotId,
    this.timeSlotDisplayName,
    this.promotionCodeId,
    this.promotionCode,
    this.promotionCodeDescription,
    this.oneVisitPrice,
    this.totalVisits,
    this.visitHours,
    this.isAvalable,
    this.packagePrice,
    this.totalPriceWithVatBeforePromotion,
    this.packagePercentDiscount,
    this.packageDiscountAmount,
    this.packagePriceAfterPackageDiscount,
    this.promotionTotalDiscountAmount,
    this.promotionTotalDiscountPercent,
    this.totalDiscountPercent,
    this.totalDiscountAmount,
    this.priceAfterTotalDiscount,
    this.freeVisitsCount,
    this.promotionEndDate,
    this.promotionState,
    this.vatRate,
    this.vatAmount,
    this.finalPrice,
    this.promotionOfferList,
  });

  factory PackageModel.fromJson(Map<String, dynamic> json) {
    return PackageModel(
      selectedHourlyPricingId: json['selectedHourlyPricingId'],
      displayName: json['displayName'],
      serviceId: json['serviceId'],
      resourceGroupId: json['resourceGroupId'],
      resourceGroupName: json['resourceGroupName'],
      employeeNumber: json['employeeNumber'],
      employeeNumberName: json['employeeNumberName'],
      hoursNumber: json['hoursNumber'],
      weeklyVisits: json['weeklyVisits'],
      weeklyVisitName: json['weeklyVisitName'],
      contractDuration: json['contractDuration'],
      contractDurationName: json['contractDurationName'],
      visitShift: json['visitShift'],
      visitShiftName: json['visitShiftName'],
      timeSlotId: json['timeSlotId'],
      timeSlotDisplayName: json['timeSlotDisplayName'],
      promotionCodeId: json['promotionCodeId'],
      promotionCode: json['promotionCode'],
      promotionCodeDescription: json['promotionCodeDescription'],
      oneVisitPrice: (json['oneVisitPrice'] as num?)?.toDouble(),
      totalVisits: json['totalVisits'],
      visitHours: json['visitHours'],
      isAvalable: json['isAvaliable'],
      packagePrice: (json['packagePrice'] as num?)?.toDouble(),
      totalPriceWithVatBeforePromotion: (json['totalPriceWithVatBeforePromotion'] as num?)?.toDouble(),
      packagePercentDiscount: (json['packagePercentDiscount'] as num?)?.toDouble(),
      packageDiscountAmount: (json['packageDiscountAmount'] as num?)?.toDouble(),
      packagePriceAfterPackageDiscount: (json['packagePriceAfterPackageDiscount'] as num?)?.toDouble(),
      promotionTotalDiscountAmount: (json['promotionTotalDiscountAmount'] as num?)?.toDouble(),
      promotionTotalDiscountPercent: (json['promotionTotalDiscountPercent'] as num?)?.toDouble(),
      totalDiscountPercent: (json['totalDiscountPercent'] as num?)?.toDouble(),
      totalDiscountAmount: (json['totalDiscountAmount'] as num?)?.toDouble(),
      priceAfterTotalDiscount: (json['priceAfterTotalDiscount'] as num?)?.toDouble(),
      freeVisitsCount: json['freeVisitsCount'],
      promotionEndDate: json['promotionEndDate'],
      promotionState: json['promotionState'] != null ? PromotionState.fromJson(json['promotionState']) : null,
      vatRate: (json['vatRate'] as num?)?.toDouble(),
      vatAmount: (json['vatAmount'] as num?)?.toDouble(),
      finalPrice: (json['finalPrice'] as num?)?.toDouble(),
      promotionOfferList: json['promotionOfferList'] != null ? List<dynamic>.from(json['promotionOfferList']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'selectedHourlyPricingId': selectedHourlyPricingId,
      'displayName': displayName,
      'serviceId': serviceId,
      'resourceGroupId': resourceGroupId,
      'resourceGroupName': resourceGroupName,
      'employeeNumber': employeeNumber,
      'employeeNumberName': employeeNumberName,
      'hoursNumber': hoursNumber,
      'weeklyVisits': weeklyVisits,
      'weeklyVisitName': weeklyVisitName,
      'contractDuration': contractDuration,
      'contractDurationName': contractDurationName,
      'visitShift': visitShift,
      'visitShiftName': visitShiftName,
      'timeSlotId': timeSlotId,
      'timeSlotDisplayName': timeSlotDisplayName,
      'promotionCodeId': promotionCodeId,
      'promotionCode': promotionCode,
      'promotionCodeDescription': promotionCodeDescription,
      'oneVisitPrice': oneVisitPrice,
      'totalVisits': totalVisits,
      'visitHours': visitHours,
      'isAvaliable': isAvalable,
      'packagePrice': packagePrice,
      'totalPriceWithVatBeforePromotion': totalPriceWithVatBeforePromotion,
      'packagePercentDiscount': packagePercentDiscount,
      'packageDiscountAmount': packageDiscountAmount,
      'packagePriceAfterPackageDiscount': packagePriceAfterPackageDiscount,
      'promotionTotalDiscountAmount': promotionTotalDiscountAmount,
      'promotionTotalDiscountPercent': promotionTotalDiscountPercent,
      'totalDiscountPercent': totalDiscountPercent,
      'totalDiscountAmount': totalDiscountAmount,
      'priceAfterTotalDiscount': priceAfterTotalDiscount,
      'freeVisitsCount': freeVisitsCount,
      'promotionEndDate': promotionEndDate,
      'promotionState': promotionState?.toJson(),
      'vatRate': vatRate,
      'vatAmount': vatAmount,
      'finalPrice': finalPrice,
      'promotionOfferList': promotionOfferList,
    };
  }
}

class PromotionState {
  String? promotionName;
  int? promotionStatus;
  String? promotionValidationDescription;

  PromotionState({
    this.promotionName,
    this.promotionStatus,
    this.promotionValidationDescription,
  });

  factory PromotionState.fromJson(Map<String, dynamic> json) {
    return PromotionState(
      promotionName: json['promotionName'],
      promotionStatus: json['promotionStatus'],
      promotionValidationDescription: json['promotionValidationDescription'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'promotionName': promotionName,
      'promotionStatus': promotionStatus,
      'promotionValidationDescription': promotionValidationDescription,
    };
  }
}
