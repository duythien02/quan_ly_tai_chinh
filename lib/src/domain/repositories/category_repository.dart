import '../../core/params/params.dart';
import '../../core/resources/data_state.dart';
import '../entities/entities.dart';

abstract class CategoryRepository {
  Future<DataState<Category?>> getCategories(
    final GetCategoriesRequestParams params,
  );
}
