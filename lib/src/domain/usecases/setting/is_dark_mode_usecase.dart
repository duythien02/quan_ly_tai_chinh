// Package imports:
import 'package:injectable/injectable.dart';

// Project imports:
import '../../../core/usecase/usecase.dart';
import '../../repositories/setting_repository.dart';

@injectable
class IsDarkModeUseCase implements UseCase<bool, void> {
  const IsDarkModeUseCase(this._settingRepository);

  final SettingRepository _settingRepository;

  @override
  Future<bool> call({final void params}) {
    return _settingRepository.isDarkMode;
  }
}
