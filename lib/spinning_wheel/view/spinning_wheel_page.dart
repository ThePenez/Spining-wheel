// ignore: unnecessary_import
// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:page_flip_builder/page_flip_builder.dart';
import 'package:spinning_wheel/l10n/l10n.dart';
import 'package:spinning_wheel/spinning_wheel/spinning_wheel.dart';
import 'package:spinning_wheel/spinning_wheel/view/widgets/flip_card_page/back_side.dart';
import 'package:spinning_wheel/spinning_wheel/view/widgets/flip_card_page/front_side.dart';

class SpinningWheelPage extends StatelessWidget {
  const SpinningWheelPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SpinningWheelCubit(),
      child: const SpinningWheelView(),
    );
  }
}

class SpinningWheelView extends StatelessWidget {
  const SpinningWheelView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return WillPopScope(
      onWillPop: () async => false,
      child: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/pozadinaaaa.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: PlatformScaffold(
          backgroundColor: Colors.transparent,
          iosContentPadding: true,
          body: PageFlipBuilder(
            maxScale: 0.8,
            frontBuilder: (context) => const FrontSide(),
            backBuilder: (context) => const BackSide(),
          ),
        ),
      ),
    );
  }
}
