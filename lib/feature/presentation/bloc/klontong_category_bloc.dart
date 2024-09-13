import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:klontong_management/core/usecase/usecase.dart';
import 'package:klontong_management/feature/domain/usecase/create_category.dart';
import 'package:klontong_management/feature/domain/usecase/get_category.dart';
import 'package:klontong_management/feature/presentation/bloc/klontong_category_event.dart';
import 'package:klontong_management/feature/presentation/bloc/klontong_category_state.dart';

class KlontongCategoryBloc
    extends Bloc<KlontongCategoryEvent, KlontongCategoryState> {
  final GetCategory _getCategory;
  final CreateCategory _createCategory;

  KlontongCategoryBloc({
    required GetCategory getCategory,
    required CreateCategory createCategory,
  })  : _getCategory = getCategory,
        _createCategory = createCategory,
        super(Empty()) {
    on<GetKlontongCategory>(_getCategoryHandler);
    on<CreateKlontongCategory>(_createCategoryHandler);
  }

  Future<void> _getCategoryHandler(
      GetKlontongCategory event, Emitter<KlontongCategoryState> emit) async {
    emit(Loading());
    final res = await _getCategory(NoParams());
    if (res.$2 != null) {
      emit(Error("Oops! Error"));
      return;
    }

    emit(Loaded(res.$1));
    return;
  }

  Future<void> _createCategoryHandler(
      CreateKlontongCategory event, Emitter<KlontongCategoryState> emit) async {
    emit(Creating());
    final res = await _createCategory(CreateCategoryParams(event.name));
    if (res.$2 != null) {
      emit(Error("Oops! Error"));
    } else {
      emit(Created());
    }

    add(GetKlontongCategory());
  }
}
