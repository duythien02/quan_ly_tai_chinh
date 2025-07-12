// Project imports:
import 'app.dart';
import 'bootstrap.dart';
import 'config.dart';

Future<void> main() => bootstrap(
      env: Environment.dev,
      builder: () => const Main(),
    );
