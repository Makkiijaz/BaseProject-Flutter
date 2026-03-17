import 'package:flutter/material.dart';
import '../app/theme/text_styles.dart';
import 'custom_sized_box.dart';
import 'custom_text.dart';

class CustomLabelTextField extends StatelessWidget {
  final String? label;
  final TextEditingController? controller;
  final Function(String c)? onChanged;
  final Function(String c)? onSubmit;
  final bool? readOnly;
  final bool? isObscure;
  final Widget? suffix;
  final Widget? prefix;
  final TextInputType? type;
  final String? hintText;

  const CustomLabelTextField({
    super.key,
    this.label,
    this.controller,
    this.onChanged,
    this.readOnly,
    this.isObscure,
    this.suffix,
    this.prefix,
    this.onSubmit,
    this.type,
    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          AppText(
            text: label!,
            style: AppTextStyles.h2(context).copyWith(
              color: theme.colorScheme.onSurface,
            ),
          ),
        if (label != null) const CustomSizedBox(height: 12),
        TextField(
          controller: controller,
          onChanged: onChanged,
          onSubmitted: onSubmit,
          keyboardType: type,
          readOnly: readOnly ?? false,
          obscureText: isObscure ?? false,
          style: AppTextStyles.bodyLarge(context).copyWith(
            color: theme.colorScheme.onSurface,
          ),
          decoration: InputDecoration(
            hintText: hintText,
            suffixIcon: suffix,
            prefixIcon: prefix,
            hintStyle: AppTextStyles.bodyRegular(context).copyWith(
              color: theme.hintColor,
            ),
          ),
        ),
      ],
    );
  }
}