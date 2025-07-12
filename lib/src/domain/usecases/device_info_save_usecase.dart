// Package imports:
import 'package:injectable/injectable.dart';

// Project imports:
import '../../core/usecase/usecase.dart';
import '../repositories/helper_repository.dart';

@injectable
class DeviceInfoSaveUseCase implements UseCase<void, Map<String, dynamic>> {
  const DeviceInfoSaveUseCase(this._helperRepository);

  final HelperRepository _helperRepository;

  @override
  Future<void> call({required final Map<String, dynamic> params}) {
    return _helperRepository.saveDeviceInfo(params);
  }
}
