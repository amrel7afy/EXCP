class FirstStepObjParameter {
  String? serviceId;
  String? selectedPricingId;
  bool? fromOffer;

  FirstStepObjParameter({this.serviceId, this.selectedPricingId, this.fromOffer});

  FirstStepObjParameter.fromJson(Map<String, dynamic> json) {
    serviceId = json['ServiceId'];
    selectedPricingId = json['SelectedPricingId'];
    fromOffer = json['FromOffer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ServiceId'] = serviceId;
    data['SelectedPricingId'] = selectedPricingId;
    data['FromOffer'] = fromOffer;
    return data;
  }
}