import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:team_soccer_coach/theme.dart';

class SoccerButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final EdgeInsets padding;

  const SoccerButton(
      {Key? key,
      required this.onTap,
      required this.text,
      this.padding = const EdgeInsets.all(14)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: SoccerColors.yellowColor,
      ),
      child: Padding(
        padding: padding,
        child: InkWell(
          onTap: onTap,
          splashColor: Colors.red,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .caption!
                .copyWith(fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
