
import 'package:hakim_hub_mobile/features/chatbot/domain/entities/chat_doctor_entity.dart'
    as _i3;
import 'package:hakim_hub_mobile/features/chatbot/domain/entities/chat_institute_entity.dart'
    as _i2;
import 'package:mockito/mockito.dart' as _i1;


class MockChatInstituteEntity extends _i1.Mock
    implements _i2.ChatInstituteEntity {
  MockChatInstituteEntity() {
    _i1.throwOnMissingStub(this);
  }

  @override
  String get instituteName => (super.noSuchMethod(
        Invocation.getter(#instituteName),
        returnValue: '',
      ) as String);
  @override
  set instituteName(String? _instituteName) => super.noSuchMethod(
        Invocation.setter(
          #instituteName,
          _instituteName,
        ),
        returnValueForMissingStub: null,
      );
  @override
  List<_i3.ChatDoctorEntity> get doctors => (super.noSuchMethod(
        Invocation.getter(#doctors),
        returnValue: <_i3.ChatDoctorEntity>[],
      ) as List<_i3.ChatDoctorEntity>);
  @override
  set doctors(List<_i3.ChatDoctorEntity>? _doctors) => super.noSuchMethod(
        Invocation.setter(
          #doctors,
          _doctors,
        ),
        returnValueForMissingStub: null,
      );
  @override
  String get instituteId => (super.noSuchMethod(
        Invocation.getter(#instituteId),
        returnValue: '',
      ) as String);
  @override
  set instituteId(String? _instituteId) => super.noSuchMethod(
        Invocation.setter(
          #instituteId,
          _instituteId,
        ),
        returnValueForMissingStub: null,
      );
  @override
  String get logoUrl => (super.noSuchMethod(
        Invocation.getter(#logoUrl),
        returnValue: '',
      ) as String);
  @override
  set logoUrl(String? _logoUrl) => super.noSuchMethod(
        Invocation.setter(
          #logoUrl,
          _logoUrl,
        ),
        returnValueForMissingStub: null,
      );
  @override
  List<Object?> get props => (super.noSuchMethod(
        Invocation.getter(#props),
        returnValue: <Object?>[],
      ) as List<Object?>);
}
