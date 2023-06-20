
class Experience {
  String title;
  String institution;
  DateTime startDate;
  DateTime endDate;

  Experience({
    required this.title,
    required this.institution,
    required this.startDate,
    required this.endDate,
  });

  factory Experience.fromJson(Map<String, dynamic> json) {
    return Experience(
      title: json['title'],
      institution: json['institution'],
      startDate: DateTime.parse(json['startDate']),
      endDate: DateTime.parse(json['endDate']),
    );
  }
}
