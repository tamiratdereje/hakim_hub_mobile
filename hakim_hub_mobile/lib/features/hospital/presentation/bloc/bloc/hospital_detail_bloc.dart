import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hakim_hub_mobile/features/hospital/domain/usecases/get_hospital_detail.dart';

import '../../../domain/entities/filter_hospital_domain.dart';
import '../../../domain/entities/hospital_detail_domain.dart';

part 'hospital_detail_event.dart';
part 'hospital_detail_state.dart';

class HospitalDetailBloc
    extends Bloc<HospitalDetailEvent, HospitalDetailState> {
  // final GetHospitalsByFilter getHospitalsByFilter;
  final GetHospitalDetail getHospitalDetail;

  HospitalDetailBloc({required this.getHospitalDetail})
      : super(HospitalDetailInitial()) {
    on<HospitalDetailEvent>((event, emit) {});

    on<HospitalDetailGetEvent>((event, emit) async {
      emit(DetailHospitalLoading());
      await getHospitalDetail(event.id).then((value) {
        value.fold((l) => emit(DetailHospitalError(message: l.toString())),
            (r) => emit(DetailHospitalSuccess(institutionDetailDomain: r)));
      });
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
