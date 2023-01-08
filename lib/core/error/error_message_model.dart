import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable {
  final num statusCode;
  final String statusMessage;
  final bool? success;

  const ErrorMessageModel({
    required this.statusCode,
    required this.statusMessage,
    this.success,
  });

  factory ErrorMessageModel.fromJSON(Map<String, dynamic> json) {
    return ErrorMessageModel(
      statusCode: json['status_code'],
      statusMessage: json['status_message'],
      success: json['success'],
    );
  }
  @override
  List<Object?> get props => [
        statusCode,
        statusMessage,
        success,
      ];
}
