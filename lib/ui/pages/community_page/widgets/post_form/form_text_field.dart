import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_clone/cubits/post_form_cubit/post_form_cubit.dart';

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

        final postFormCubit =
            BlocProvider.of<PostFormCubit>(context, listen: false);

        return TextFormField(
          initialValue: postFormCubit.state.text,
          style: textStyle,
          maxLines: maxLines,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) {
            if (value.trim().isEmpty) return 'Text must not be empty!';
            return null;
          },
          onChanged: (value) => postFormCubit.changeText(value),
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
