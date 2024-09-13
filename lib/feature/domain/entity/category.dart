import 'package:equatable/equatable.dart';

class KlontongCategory extends Equatable {
  final String id;
  final String categoryName;

  const KlontongCategory({
    required this.id,
    required this.categoryName,
  });

  @override
  List<Object?> get props => [id, categoryName];
}
