// Package imports:
import 'package:injectable/injectable.dart';

// Project imports:
import '../../../core/usecase/usecase.dart';
import '../../repositories/setting_repository.dart';

@injectable
class GetLanguageOptionUseCase implements UseCase<String, void> {
  const GetLanguageOptionUseCase(this._settingRepository);

  final SettingRepository _settingRepository;

  @override
  Future<String> call({final void params}) {
    return _settingRepository.getLanguageOption();
  }
}
