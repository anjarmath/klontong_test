import 'package:equatable/equatable.dart';
import 'package:klontong_management/feature/domain/entity/product.dart';

abstract class KlontongProductListState extends Equatable {
  @override
  List<Object?> get props => [];
}

class Empty extends KlontongProductListState {}

class Loading extends KlontongProductListState {}

class Creating extends KlontongProductListState {}

class Created extends KlontongProductListState {}

class Error extends KlontongProductListState {
  final String message;

  Error(this.message);

  @override
  List<Object?> get props => [message];
}

class Loaded extends KlontongProductListState {
  final List<KlontongProduct> category;
  Loaded(this.category);

  @override
  List<Object?> get props => category.map((c) => c.id).toList();
}
