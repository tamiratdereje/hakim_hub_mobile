import 'package:equatable/equatable.dart';

class ChatRequest extends Equatable {
  String message;
  String address;
  bool isNew;

  ChatRequest({
    required this.address,
    required this.isNew,
    required this.message,
  });

  @override
  List<Object?> get props => [isNew, address];
}
