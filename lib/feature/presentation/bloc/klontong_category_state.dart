import 'package:equatable/equatable.dart';
import 'package:klontong_management/feature/domain/entity/category.dart';

abstract class KlontongCategoryState extends Equatable {
  @override
  List<Object?> get props => [];
}

class Empty extends KlontongCategoryState {}

class Loading extends KlontongCategoryState {}

class Creating extends KlontongCategoryState {}

class Created extends KlontongCategoryState {}

class Error extends KlontongCategoryState {
  final String message;

  Error(this.message);

  @override
  List<Object?> get props => [message];
}

class Loaded extends KlontongCategoryState {
  final List<KlontongCategory> category;
  Loaded(this.category);

  @override
  List<Object?> get props => category.map((c) => c.id).toList();
}
