import 'package:equatable/equatable.dart';

/// Domain entity for hospital filter criteria.
class FilterHospitalDomain extends Equatable {
  /// Whether the hospital should be open currently.
  final bool openStatus;

  /// Number of years the hospital has been operating.
  final int operationYears;

  /// List of services offered by the hospital.
  final List<String> services;

  /// Create a new instance with the provided filter criteria.
  FilterHospitalDomain({
    required this.operationYears,
    required this.openStatus,
    required this.services,
  });

  /// List of properties to check for equality.
  @override
  List<Object?> get props => [openStatus, operationYears, services];
}
