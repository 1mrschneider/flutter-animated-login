import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../decorations/button_styles.dart';
import '../../decorations/text_styles.dart';
import '../../providers/login_theme.dart';
import '../../responsiveness/dynamic_size.dart';
import '../texts/base_text.dart';

/// An [ElevatedButton] with rounded corners.
/// Takes some parameters to customize the design,
/// and uses "ButtonStyles(context).roundedStyle" to give roundness.
class RoundedButton extends StatelessWidget {
  const RoundedButton({
    required this.buttonText,
    required this.onPressed,
    this.backgroundColor,
    this.borderColor,
    this.borderRadius,
    this.borderWidth = 1.4,
    this.textStyle,
    this.width,
    this.height,
    this.buttonStyle,
    Key? key,
  }) : super(key: key);

  final String buttonText;
  final Function() onPressed;
  final Color? backgroundColor;
  final Color? borderColor;
  final BorderRadius? borderRadius;
  final double borderWidth;
  final TextStyle? textStyle;
  final double? width;
  final double? height;
  final ButtonStyle? buttonStyle;

  @override
  Widget build(BuildContext context) {
    final bool isLandscape = context.read<LoginTheme>().isLandscape;
    return ElevatedButton(
      style: buttonStyle != null
          ? buttonStyle!.merge(_defaultButtonStyle(context, isLandscape))
          : _defaultButtonStyle(context, isLandscape),
      onPressed: onPressed,
      child: BaseText(
        buttonText,
        style: TextStyles(context)
            .bodyStyle(
                color: isLandscape ? null : Theme.of(context).primaryColor)
            .merge(textStyle),
      ),
    );
  }

  /// Calls the rounded style from [ButtonStyles] class with custom parameters.
  ButtonStyle _defaultButtonStyle(BuildContext context, bool isLandscape) =>
      ButtonStyles(context).roundedStyle(
        borderWidth: borderWidth,
        backgroundColor: backgroundColor,
        borderColor: borderColor ?? (isLandscape ? null : Colors.white),
        borderRadius: borderRadius,
        width: width ?? DynamicSize(context).width * (isLandscape ? 14 : 30),
        height: height ?? DynamicSize(context).height * (isLandscape ? 9 : 7.3),
      );
}
