// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:spinning_wheel/app/view/custom_scroll_behaviour.dart';
import 'package:spinning_wheel/l10n/l10n.dart';
import 'package:spinning_wheel/spinning_wheel/spinning_wheel.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final materialTheme = ThemeData(
      cupertinoOverrideTheme: const CupertinoThemeData(
        primaryColor: Color(0xff127EFB),
      ),
      primarySwatch: Colors.green,
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(const EdgeInsets.all(16)),
          foregroundColor: MaterialStateProperty.all(const Color(0xFF3DDC84)),
        ),
      ),
    );

    return Theme(
      data: materialTheme,
      child: PlatformProvider(
        settings: PlatformSettingsData(iosUsesMaterialWidgets: true),
        builder: (context) => PlatformApp(
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          title: 'Flutter Platform Widgets',
          home: const SpinningWheelPage(),
          material: (_, __) => MaterialAppData(
            theme: materialTheme,
            scrollBehavior:
                CustomScrollBehavior(), //Enables scrolling via vertical drag in web application
          ),
          cupertino: (_, __) => CupertinoAppData(
            theme: const CupertinoThemeData(
              primaryColor: Color(0xff127EFB),
            ),
          ),
        ),
      ),
    );
  }
}
