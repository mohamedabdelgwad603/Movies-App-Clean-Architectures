import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/error/failures.dart';

abstract class BaseUseCase<T, params> {
  Future<Either<Failure, T>> call(params params);
}

class NoParam extends Equatable {
  const NoParam();
  @override
  List<Object?> get props => [];
}
