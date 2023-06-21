import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/filter_hospital_domain.dart';
import '../../../domain/entities/hospital_detail_domain.dart';
import '../../../domain/usecases/get_hospitals_by_filter.dart';
import '../../../domain/usecases/get_hospitals_by_name.dart';

part 'hospital_detail_event.dart';
part 'hospital_detail_state.dart';

class HospitalDetailBloc
    extends Bloc<HospitalDetailEvent, HospitalDetailState> {
  // final GetHospitalsByFilter getHospitalsByFilter;
  // final GetHospitalsByName getHospitalsByName;

  HospitalDetailBloc(
      //{ required this.getHospitalsByFilter, required this.getHospitalsByName}
      )
      : super(HospitalDetailInitial()) {
    on<HospitalDetailEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<HospitalDetailGetEvent>((event, emit) async {
      emit(DetailHospitalLoading());
      // await getHospitalsByFilter(event.id).then((value) {
      //   value.fold((l) => emit(DetailHospitalError(message: l.toString())), (r) => emit(DetailHospitalSuccess(institutionDetailDomain: r)));
      // });
    });

    on<DoctorFilterEvent>((event, emit) async {
      emit(DetailHospitalLoading());
      // await getHospitalsByName(event.filter).then((value) {
      //   value.fold((l) => emit(DetailHospitalError(message: l.toString())),
      //       (r) { 
      //         event.institutionDetailDomain.doctors = r;
      //         return emit(DetailHospitalSuccess(institutionDetailDomain: event.institutionDetailDomain)); } 
      //       );
      // });
    });
  }
}
