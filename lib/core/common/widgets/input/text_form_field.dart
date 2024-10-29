import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final InputBorder? errorBorder;
  final InputBorder? focusedErrorBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final TextStyle? style;
  final bool? isDense;
  final String? hintText;
  final String? labelText;
  final bool obsecureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final IconData? visibilityOn;
  final IconData? visibilityOff;
  final Color? backgroundColor;
  final bool? isFilled;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool password;
  const CustomTextFormField({
    super.key,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.inputTextStyle,
    this.style,
    this.errorBorder,
    this.focusedErrorBorder,
    this.isDense,
    this.hintStyle,
    this.hintText,
    this.labelText,
    this.labelStyle,
    this.obsecureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.visibilityOn,
    this.visibilityOff,
    this.backgroundColor,
    this.isFilled,
    this.controller,
    this.validator,
    this.password = false,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool invisible = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        isDense: widget.isDense,
        prefixIcon: widget.prefixIcon,
        contentPadding: widget.contentPadding,
        focusedBorder: widget.focusedBorder,
        enabledBorder: widget.enabledBorder,
        errorBorder: widget.errorBorder,
        focusedErrorBorder: widget.focusedErrorBorder,
        hintStyle: widget.hintStyle,
        hintText: widget.hintText,
        labelText: widget.labelText,
        labelStyle: widget.labelStyle,
        suffixIcon: widget.password
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    invisible = !invisible;
                  });
                },
                child: Icon(invisible
                    ? widget.visibilityOff ?? Icons.visibility_off
                    : widget.visibilityOn ?? Icons.visibility),
              )
            : widget.suffixIcon,
        fillColor: widget.backgroundColor,
        filled: widget.isFilled,
      ),
      obscureText: widget.password ? invisible : widget.obsecureText,
      style: widget.style,
      validator: widget.validator,
    );
  }
}
