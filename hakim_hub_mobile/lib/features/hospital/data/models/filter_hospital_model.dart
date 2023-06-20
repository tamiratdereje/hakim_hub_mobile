

class FilterHospitalModel {
  bool openNow;
  int activeFor;
  List<String> services;

  FilterHospitalModel({required this.activeFor, required this.openNow, required this.services});
  
  toJson() {
    return {
      'openNow': openNow,
      'activeFor': activeFor,
      'services': services
    };
  }
}