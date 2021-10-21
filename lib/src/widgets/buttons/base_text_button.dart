import 'package:flutter/material.dart';

import '../../decorations/button_styles.dart';
import '../../decorations/text_styles.dart';
import '../../responsiveness/dynamic_size.dart';
import '../texts/base_text.dart';

/// Base text button with custom parameters
/// Wraps [TextButton] with [FittedBox], and gives some paddings.
class BaseTextButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final TextStyle? style;
  final EdgeInsets? padding;
  const BaseTextButton({
    required this.text,
    required this.onPressed,
    this.style,
    this.padding,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DynamicSize dynamicSize = DynamicSize(context);
    return FittedBox(
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyles(context).textButtonStyle(
          padding: padding ?? EdgeInsets.all(dynamicSize.responsiveSize * 3),
        ),
        child: BaseText(
          text,
          style: TextStyles(context).normalStyle().merge(style),
        ),
      ),
    );
  }
}
