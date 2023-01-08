import 'package:flutter_clean_arch/core/error/error_message_model.dart';

class Failure {
  final String message;
  Failure({required this.message});
}

class ServerFailure extends Failure {
  ErrorMessageModel? errorMessageModel;
  ServerFailure({this.errorMessageModel})
      : super(message: errorMessageModel!.statusMessage);
}

class DatabaseFailure extends Failure {
  DatabaseFailure({required super.message});
}
