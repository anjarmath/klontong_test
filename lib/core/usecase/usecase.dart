import 'package:equatable/equatable.dart';
import '../error/failure.dart';

abstract class UseCase<Type, Params> {
  Future<(Type?, Failure?)> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
