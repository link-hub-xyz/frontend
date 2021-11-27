import 'package:flutter/foundation.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:linkhub/misc/app_colors.dart';
import 'package:linkhub/ui/misc/web_container.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class SignProps extends Equatable {
  final bool? isAuthorised;
  final VoidCallback google;

  const SignProps({required this.isAuthorised, required this.google});

  @override
  List<Object?> get props => [isAuthorised, google];
}

class SignWidget extends StatelessWidget {
  final SignProps props;
  const SignWidget({Key? key, required this.props}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final content = Column(
      children: [
        const SizedBox(width: double.infinity),
        const Spacer(flex: 2),
        _SignInWithGoogleButton(onPressed: props.google),
        const SizedBox(height: 8),
        _SignInWithFacebookButton(),
        if ([TargetPlatform.iOS, TargetPlatform.macOS]
            .contains(Theme.of(context).platform))
          Column(
            children: [
              const SizedBox(height: 8),
              _SignInWithAppleButton(),
            ],
          ),
        const Spacer(flex: 1),
      ],
    );
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Row(
          children: [
            SvgPicture.asset(
              'assets/images/logo.svg',
              width: 24,
            ),
            const SizedBox(width: 8),
            const Text('LinkHub'),
          ],
        ),
      ),
      body: [
        TargetPlatform.android,
        TargetPlatform.iOS,
      ].contains(Theme.of(context).platform)
          ? _MobileContainer(child: content)
          : WebContainer(child: content),
    );
  }
}

class _MobileContainer extends StatelessWidget {
  final Widget child;
  const _MobileContainer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) => Theme(
        data: Theme.of(context).copyWith(
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(const Size(56, 44)),
            ),
          ),
        ),
        child: SafeArea(
          minimum: const EdgeInsets.symmetric(
            horizontal: 24.0,
            vertical: 64.0,
          ),
          child: child,
        ),
      );
}

@immutable
class _SignInWithGoogleButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const _SignInWithGoogleButton({this.onPressed});

  @override
  Widget build(BuildContext context) => ElevatedButton(
        onPressed: onPressed,
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: SvgPicture.asset(
                'assets/images/google.svg',
                color: Colors.white,
              ),
            ),
            const Align(
              alignment: Alignment.center,
              child: Text('Sign in with Google'),
            ),
          ],
        ),
      );
}

class _SignInWithFacebookButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(AppColors.facebook),
        ),
        onPressed: () => {},
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: SvgPicture.asset('assets/images/facebook.svg'),
            ),
            const Align(
              alignment: Alignment.center,
              child: Text('Sign in With Facebook'),
            ),
          ],
        ),
      );
}

class _SignInWithAppleButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.black),
        ),
        onPressed: () => {},
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                width: 24 * (25 / 31),
                height: 24,
                margin: const EdgeInsets.only(left: 4),
                child: const CustomPaint(
                  painter: AppleLogoPainter(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const Align(
              alignment: Alignment.center,
              child: Text('Sign in With Apple'),
            ),
          ],
        ),
      );
}
