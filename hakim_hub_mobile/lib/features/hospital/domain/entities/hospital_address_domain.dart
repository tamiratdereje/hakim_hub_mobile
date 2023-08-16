import 'package:equatable/equatable.dart';

/// Domain entity representing an address.
class AddressDomain extends Equatable {
  /// Country name.
  final String country;

  /// Region name.
  final String region;

  /// Zone name.
  final String zone;

  /// Woreda name.
  final String woreda;

  /// City name.
  final String city;

  /// Sub-city name.
  final String subCity;

  /// Longitude coordinate.
  final double longitude;

  /// Latitude coordinate.
  final double latitude;

  /// Summary of the full address.
  final String summary;

  /// Unique identifier for the address.
  final String id;

  /// Create a new instance with the provided address data.
  AddressDomain(
      {required this.country,
      required this.region,
      required this.zone,
      required this.woreda,
      required this.city,
      required this.subCity,
      required this.longitude,
      required this.latitude,
      required this.summary,
      required this.id});

  /// List of properties to check for equality.
  @override
  List<Object?> get props => [
        country,
        region,
        zone,
        woreda,
        city,
        subCity,
        longitude,
        latitude,
        summary,
        id
      ];

  toJson() {}
}
