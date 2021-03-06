import 'package:e_posyandu/app_color.dart';
import 'package:flutter/material.dart';

enum AppButtonStyle {
  primary,
  secondary,
}

class BaseButton extends StatelessWidget {
  final AppButtonStyle? style;
  final String? text;
  final bool? isLoading;
  final bool? isDisabled;
  final double? radius;
  final VoidCallback? onPressed;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? padding;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final double? elevation;
  final BorderSide? border;

  const BaseButton(
      {Key? key,
      @required this.onPressed,
      this.style = AppButtonStyle.primary,
      this.text = '',
      this.isLoading = false,
      this.isDisabled = false,
      this.fontSize = 14,
      this.radius = 81,
      this.fontWeight = FontWeight.w600,
      this.padding = 12,
      this.prefixIcon,
      this.suffixIcon,
      this.elevation = 0,
      this.border = const BorderSide(
        color: Colors.transparent,
        width: 0,
      )})
      : super(key: key);

  Color? _getButtonColorByStyle(AppButtonStyle style, bool isLoading) {
    Color? color;

    if (isLoading) {
      return Colors.grey;
    }

    switch (style) {
      case AppButtonStyle.primary:
        color = AppColor.primary;
        break;

      case AppButtonStyle.secondary:
        color = Colors.white;
        break;

      default:
        break;
    }

    return color;
  }

  Color? _getFontColorByStyle(AppButtonStyle style) {
    Color? color;

    switch (style) {
      case AppButtonStyle.primary:
        color = Colors.white;
        break;

      case AppButtonStyle.secondary:
        color = AppColor.primary;
        break;

      default:
        break;
    }

    return color;
  }

  @override
  Widget build(BuildContext context) {
    // The other basic button
    return RaisedButton(
        onPressed: !isDisabled! ? onPressed : null,
        color: _getButtonColorByStyle(style!, isLoading!),
        elevation: elevation,
        focusElevation: 0,
        highlightElevation: 0,
        hoverElevation: 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius!), side: border!),
        child: Container(
            padding: EdgeInsets.symmetric(vertical: padding!),
            child: _buttonMainContentChild()));
  }

  Widget _buttonMainContentChild() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        prefixIcon ?? SizedBox(width: 0, height: 0),
        Text(
          text!,
          style: TextStyle(
              fontSize: fontSize!,
              color: _getFontColorByStyle(style!),
              fontWeight: fontWeight),
        ),
        suffixIcon ?? SizedBox(width: 0, height: 0),
      ],
    );
  }
}
