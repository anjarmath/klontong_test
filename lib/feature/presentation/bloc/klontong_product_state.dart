import 'package:equatable/equatable.dart';
import 'package:klontong_management/feature/domain/entity/product.dart';

abstract class KlontongProductState extends Equatable {
  @override
  List<Object?> get props => [];
}

class Empty extends KlontongProductState {}

class Loading extends KlontongProductState {}

class Updating extends KlontongProductState {}

class Updated extends KlontongProductState {}

class Deleting extends KlontongProductState {}

class Deleted extends KlontongProductState {}

class Error extends KlontongProductState {
  final String message;

  Error(this.message);

  @override
  List<Object?> get props => [message];
}

class Loaded extends KlontongProductState {
  final KlontongProduct product;
  Loaded(this.product);

  @override
  List<Object?> get props => [product.id];
}
