
import '../../domain/entities/hospital_address_domain.dart';

class AddressModel extends AddressDomain {
  

  AddressModel({
    required String country,
    required String region,
    required String zone,
    required String woreda,
    required String city,
    required String subCity,
    required double longitude,
    required double latitude,
    required String summary,
    required String institutionId,
    required String id,
  }) :super(city:city, country:country, id:id, institutionId:institutionId, latitude:latitude, longitude:longitude, region:region, subCity:subCity, summary:summary, woreda:woreda, zone:zone);

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
