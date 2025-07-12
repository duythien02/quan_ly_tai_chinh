import '../../../../domain/entities/entities.dart';
import '../cache/hive/ez_cache.dart';
import '../key/keys.dart';
import 'register_dao.dart';

class RegisterDaoImpl implements RegisterDao {
  RegisterDaoImpl(this._ezCache);
  final EZCache _ezCache;
  @override
  Future<void> saveRegister(final Register register) async {
    return _ezCache.save(
      Keys.register,
      register,
    );
  }
}
