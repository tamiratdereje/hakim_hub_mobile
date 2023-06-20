
class AddressModel {
  String country;
  String region;
  String zone;
  String woreda;
  String city;
  String subCity;
  double longitude;
  double latitude;
  String summary;
  String institutionId;
  String id;

  AddressModel({
    required this.country,
    required this.region,
    required this.zone,
    required this.woreda,
    required this.city,
    required this.subCity,
    required this.longitude,
    required this.latitude,
    required this.summary,
    required this.institutionId,
    required this.id,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      country: json['country'],
      region: json['region'],
      zone: json['zone'],
      woreda: json['woreda'],
      city: json['city'],
      subCity: json['subCity'],
      longitude: json['longitude'].toDouble(),
      latitude: json['latitude'].toDouble(),
      summary: json['summary'],
      institutionId: json['institutionId'],
      id: json['id'],
    );
  }
}
