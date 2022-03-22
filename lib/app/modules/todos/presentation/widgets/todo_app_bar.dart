import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart' show SvgPicture;
import 'package:todo1st/app/app_constants.dart';

class TodoAppBar extends StatelessWidget {
  final String title;

  const TodoAppBar(this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: kPrimaryColor,
      foregroundColor: Colors.white,
      expandedHeight: 170,
      flexibleSpace: FlexibleSpaceBar(
        background: DecoratedBox(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 30.0),
            child: SvgPicture.asset(
              'images/todo_logo_alpha.svg',
              semanticsLabel: 'To-do 1st Logo',
            ),
          ),
          position: DecorationPosition.background,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[
                kPrimaryColor,
                Colors.lightBlue,
              ],
            ),
          ),
        ),
        title: Text(
          title,
          style: kWhiteText,
        ),
        stretchModes: const <StretchMode>[
          StretchMode.zoomBackground,
          StretchMode.fadeTitle,
          StretchMode.blurBackground,
        ],
      ),
      pinned: true,
      stretch: true,
    );
  }
}
