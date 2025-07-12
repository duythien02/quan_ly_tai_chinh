// Package imports:
import 'package:injectable/injectable.dart';

// Project imports:
import '../../core/usecase/usecase.dart';
import '../repositories/helper_repository.dart';

@lazySingleton
class DeviceInfoGetUseCase implements UseCase<Map<String, dynamic>, void> {
  const DeviceInfoGetUseCase(
    this._helperRepository,
  );

  final HelperRepository _helperRepository;

  @override
  Future<Map<String, dynamic>> call({final void params}) {
    return _helperRepository.deviceInfo;
  }
}
