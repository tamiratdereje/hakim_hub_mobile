import '../../domain/entities/hospital_address_domain.dart';

/// Model representing a hospital address.
class AddressModel extends AddressDomain {
  /// Country name.
  String country;

  /// Region name.
  String region;

  /// Zone name.
  String zone;

  /// Woreda name.
  String woreda;

  /// City name.
  String city;

  /// Sub-city name.
  String subCity;

  /// Longitude coordinate.
  double longitude;

  /// Latitude coordinate.
  double latitude;

  /// Summary of full address.
  String summary;

  /// Unique ID of the address.
  String id;

  /// Create an instance with provided address data.
  AddressModel(
      {required this.country,
      required this.region,
      required this.zone,
      required this.woreda,
      required this.city,
      required this.subCity,
      required this.longitude,
      required this.latitude,
      required this.summary,
      required this.id})
      : super(
            city: city,
            country: country,
            id: id,
            latitude: latitude,
            longitude: longitude,
            region: region,
            subCity: subCity,
            summary: summary,
            woreda: woreda,
            zone: zone);

  /// Construct instance from JSON data.
  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      country: json['country'] ?? "country",
      region: json['region'] ?? "region",
      zone: json['zone'] ?? "zone",
      woreda: json['woreda'] ?? "woreda",
      city: json['city'] ?? "city",
      subCity: json['subCity'] ?? "subCity",
      longitude: json['longitude'] ?? 0.0,
      latitude: json['latitude'] ?? 0.0,
      summary: json['summary'] ?? "address summary",
      id: json['id'] ?? "id",
    );
  }

  /// Convert instance to JSON.
  Map<String, dynamic> toJson() {
    return {
      'country': country,
      'region': region,
      'zone': zone,
      'woreda': woreda,
      'city': city,
      'subCity': subCity,
      'longitude': longitude,
      'latitude': latitude,
      'summary': summary,
      'id': id,
    };
  }
}
