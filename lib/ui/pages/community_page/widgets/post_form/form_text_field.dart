import 'package:flutter/material.dart';

import 'package:youtube_clone/ui/styles/styles.dart';

class FormTextField extends StatelessWidget {
  const FormTextField();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final textStyle = context.t.headline4;
        final textScaleFactor = MediaQuery.of(context).textScaleFactor;
        final maxLines =
            constraints.minHeight ~/ (textScaleFactor * textStyle.fontSize);

        return TextField(
          style: textStyle,
          maxLines: maxLines,
          decoration: InputDecoration(
            hintStyle: textStyle,
            fillColor: context.c.background,
            hintText: "What's on your mind?",
          ),
        );
      },
    );
  }
}
