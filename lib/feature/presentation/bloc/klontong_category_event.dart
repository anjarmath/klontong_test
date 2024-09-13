import 'package:equatable/equatable.dart';

abstract class KlontongCategoryEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetKlontongCategory extends KlontongCategoryEvent {}

class CreateKlontongCategory extends KlontongCategoryEvent {
  final String name;

  CreateKlontongCategory(this.name);

  @override
  List<Object?> get props => [name];
}
