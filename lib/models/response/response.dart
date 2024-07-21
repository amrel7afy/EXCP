class GetResponse {
  GetResponse({
    this.status,
    this.code,
    this.message,
    this.data,
    this.location,
  });

  int? status;
  dynamic code;
  dynamic message;
  dynamic data;
  dynamic location;

  factory GetResponse.fromJson(Map<String, dynamic> json) => GetResponse(
    status: json["status"],
    code: json["code"],
    message: json["message"],
    data: json["data"],
    location: json["location"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "code": code,
    "message": message,
    "data": data,
    "location": location,
  };
}