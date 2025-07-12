// Project imports:
import '../ez_firebase.dart';

const _defaultScope = [
  'email',
];

class GoogleSignInParams {
  GoogleSignInParams({
    this.hostedDomain,
    this.clientId,
    this.scope = _defaultScope,
    this.signInOption = SignInOption.standard,
  });

  final SignInOption signInOption;
  final List<String> scope;
  final String? hostedDomain;
  final String? clientId;
}
