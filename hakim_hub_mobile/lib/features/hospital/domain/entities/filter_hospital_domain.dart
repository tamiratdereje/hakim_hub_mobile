

class FilterHospitalDomain {
  bool openNow;
  int activeFor;
  List<String> services;

  FilterHospitalDomain({required this.activeFor, required this.openNow, required this.services});

}