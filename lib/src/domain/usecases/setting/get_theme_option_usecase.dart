// Package imports:
import 'package:injectable/injectable.dart';

// Project imports:
import '../../../core/usecase/usecase.dart';
import '../../repositories/setting_repository.dart';

@injectable
class GetThemeOptionUseCase implements UseCase<int, void> {
  const GetThemeOptionUseCase(this._settingRepository);

  final SettingRepository _settingRepository;

  @override
  Future<int> call({final void params}) {
    return _settingRepository.getThemeOption();
  }
}
