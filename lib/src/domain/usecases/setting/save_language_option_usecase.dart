// Package imports:
import 'package:injectable/injectable.dart';

// Project imports:
import '../../../core/usecase/usecase.dart';
import '../../repositories/setting_repository.dart';

@injectable
class SaveLanguageOptionUseCase implements UseCase<void, String> {
  const SaveLanguageOptionUseCase(this._settingRepository);

  final SettingRepository _settingRepository;

  @override
  Future<void> call({required final String params}) {
    return _settingRepository.saveLanguageOption(params);
  }
}
