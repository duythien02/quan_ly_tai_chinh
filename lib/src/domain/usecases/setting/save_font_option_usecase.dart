// Package imports:
import 'package:injectable/injectable.dart';

// Project imports:
import '../../../core/usecase/usecase.dart';
import '../../repositories/setting_repository.dart';

@injectable
class SaveFontOptionUseCase implements UseCase<void, int> {
  const SaveFontOptionUseCase(this._settingRepository);

  final SettingRepository _settingRepository;

  @override
  Future<void> call({required final int params}) {
    return _settingRepository.saveFontOption(params);
  }
}
