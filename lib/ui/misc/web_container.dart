import 'package:flutter/material.dart';

class WebContainer extends StatelessWidget {
  final Widget child;
  const WebContainer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: const Alignment(0.8, 0.0),
            colors: <Color>[
              Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.primary.withAlpha(75)
            ],
            tileMode: TileMode.clamp,
          ),
        ),
        child: Theme(
          data: Theme.of(context).copyWith(
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(const Size(64, 52)),
                maximumSize: MaterialStateProperty.all(const Size(256, 52)),
              ),
            ),
          ),
          child: SizedBox.expand(
            child: FractionallySizedBox(
              widthFactor: 0.5,
              heightFactor: 0.5,
              child: Center(
                child: Card(
                  elevation: 16.0,
                  child: Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: child,
                  ),
                ),
              ),
            ),
          ),
        ),
      );
}
