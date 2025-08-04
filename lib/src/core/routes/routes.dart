class Routes {
  static const String landing = '/';
  static const String auth = '/auth';
  static const String home = '/home';
  static const String createTransaction = '/createTransaction';
  static const String profile = '/profile';
  static const String initAccount = '/initAccount';
  static const String tabbar = '/tabbar';
  static const String onboarding = '/onboarding';
  static const String onboardingOne = '/onboardingOne';
  static const String onboardingTwo = '/onboardingTwo';
  static const String onboardingThree = '/onboardingThree';
  static const List<String> onboardingPages = [
    onboardingOne,
    onboardingTwo,
    onboardingThree,
  ];
  static const List<String> tabBarPages = [
    home,
    createTransaction,
    profile,
  ];
  static const String unknown = '/unknown';
}
