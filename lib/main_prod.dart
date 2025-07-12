// Project imports:
import 'app.dart';
import 'bootstrap.dart';
import 'config.dart';

Future<void> main() => bootstrap(
      env: Environment.prod,
      builder: () => const Main(),
    );
