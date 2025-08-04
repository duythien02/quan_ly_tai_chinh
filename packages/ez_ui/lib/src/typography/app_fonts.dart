// Package imports:
// Project imports:
import 'package:google_fonts/google_fonts.dart';

import 'app_font_type.dart';

/// Namespace for Default App Fonts
class AppFonts {
  /// Define app font data
  static final appFontData = {
    AppFontType.base: GoogleFonts.robotoTextTheme(),
    AppFontType.roboto: GoogleFonts.robotoTextTheme(),
    AppFontType.oswald: GoogleFonts.oswaldTextTheme(),
    AppFontType.notoSansJP: GoogleFonts.ibmPlexSansJpTextTheme(),
  };
}
