import 'package:equatable/equatable.dart';

/// Domain entity representing a hospital's availability schedule.
class InstitutionAvailabilityDomain extends Equatable {
  /// Index of the start day of the schedule (0-6).
  final String startDay;

  /// Index of the end day of the schedule (0-6).
  final String endDay;

  /// Opening time.
  final String opening;

  /// Closing time.
  final String closing;

  /// Whether open 24 hours.
  final bool twentyFourHours;

  /// Unique identifier.
  final String id;

  /// Create a new instance with provided availability data.
  InstitutionAvailabilityDomain({
    required this.startDay,
    required this.endDay,
    required this.opening,
    required this.closing,
    required this.twentyFourHours,
    required this.id,
  });

  /// Properties to check for equality.
  @override
  List<Object?> get props =>
      [startDay, endDay, opening, closing, twentyFourHours, id];

  /// Convert to JSON.
  ///
  /// This base class returns an empty map. Subclasses should override to fully implement.
  toJson() {}
}
