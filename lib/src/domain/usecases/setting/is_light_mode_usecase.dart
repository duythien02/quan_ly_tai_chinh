// Package imports:
import 'package:injectable/injectable.dart';

// Project imports:
import '../../../core/usecase/usecase.dart';
import '../../repositories/setting_repository.dart';

@injectable
class IsLightModeUseCase implements UseCase<bool, void> {
  const IsLightModeUseCase(this._settingRepository);

  final SettingRepository _settingRepository;

  @override
  Future<bool> call({final void params}) {
    return _settingRepository.isLightMode;
  }
}
