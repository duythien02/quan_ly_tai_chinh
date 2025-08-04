import 'package:injectable/injectable.dart';

import '../../../core/params/params.dart';
import '../../../core/resources/data_state.dart';
import '../../../core/usecase/usecase.dart';
import '../../entities/entities.dart';
import '../../repositories/category_repository.dart';

@injectable
class GetCategoriesUsecase
    implements UseCase<DataState<Category?>, GetCategoriesRequestParams> {
  GetCategoriesUsecase(this._categoryRepository);

  final CategoryRepository _categoryRepository;

  @override
  Future<DataState<Category?>> call({
    required final GetCategoriesRequestParams params,
  }) {
    return _categoryRepository.getCategories(params);
  }
}
