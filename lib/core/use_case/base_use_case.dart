import 'package:dartz/dartz.dart';
import 'package:flutter_clean_arch/core/error/failure.dart';

abstract class BaseUseCase<Type> {
  Future<Either<Failure, Type>> call();
}
