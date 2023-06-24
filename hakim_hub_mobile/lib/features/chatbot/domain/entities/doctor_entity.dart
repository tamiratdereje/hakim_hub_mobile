import 'package:equatable/equatable.dart';

class DoctorEntity extends Equatable {
  String name;
  String photoUrl;
  String id; 
  
  DoctorEntity({
    required this.name,
    required this.photoUrl,
    required this.id,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [id];
}
