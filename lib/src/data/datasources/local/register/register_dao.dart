import '../../../../domain/entities/entities.dart';

abstract class RegisterDao {
  Future<void> saveRegister(final Register register);
}
