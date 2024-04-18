import 'package:flutter/material.dart';
import '../core/app_export.dart';
import 'base_button.dart';

class CustomElevatedButton extends BaseButton {
  CustomElevatedButton({
    Key? key,
    this.decoration,
    this.leftIcon,
    this.rightIcon,
    EdgeInsets? margin,
    VoidCallback? onPressed,
    ButtonStyle? buttonStyle,
    Alignment? alignment,
    TextStyle? buttonTextStyle,
    bool? isDisabled,
    double? height,
    double? width,
    required String text,
  }) : super(
          text: text,
          onPressed: onPressed,
          buttonStyle: buttonStyle,
          isDisabled: isDisabled,
          buttonTextStyle: buttonTextStyle,
          height: height,
          width: width,
          alignment: alignment,
          margin: margin,
        );

  final BoxDecoration? decoration;
  final Widget? leftIcon;
  final Widget? rightIcon;

  @override
  Widget build(BuildContext context) {
    // Utiliza MediaQuery para determinar el ancho disponible de la pantalla
    double screenWidth = MediaQuery.of(context).size.width;

    // Calcula el ancho del botón en base al ancho de la pantalla
    double buttonWidth = (screenWidth / 2) - 40; // 40 puede ser ajustado dependiendo del padding/margin deseado

    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: buildElevatedButtonWidget(buttonWidth),
          )
        : buildElevatedButtonWidget(buttonWidth);
  }

  Widget buildElevatedButtonWidget(double buttonWidth) => Container(
        height: this.height ?? 38.v,
        width: this.width ?? buttonWidth,
        margin: margin,
        decoration: decoration,
        child: ElevatedButton(
          style: buttonStyle,
          onPressed: isDisabled ?? false ? null : onPressed ?? () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (leftIcon != null) leftIcon!,
              Text(
                text,
                style: buttonTextStyle ?? CustomTextStyles.labelLargeIndigo400,
                textAlign: TextAlign.center,
              ),
              if (rightIcon != null) rightIcon!,
            ],
          ),
        ),
      );
}
