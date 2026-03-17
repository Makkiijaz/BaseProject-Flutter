import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomElevatedButton extends StatelessWidget {
  final Function()? onTap;
  final String text;
  final Widget? icon;
  final Color? backgroundColor;
  final Color? textColor;
  final bool isLoading;

  const CustomElevatedButton({
    super.key,
    this.onTap,
    required this.text,
    this.icon,
    this.backgroundColor,
    this.textColor,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ElevatedButton(
      onPressed: isLoading ? null : onTap,
      style: theme.elevatedButtonTheme.style?.copyWith(
        backgroundColor: WidgetStatePropertyAll(
          backgroundColor ?? theme.colorScheme.primary,
        ),
        foregroundColor: WidgetStatePropertyAll(
          textColor ?? theme.colorScheme.onPrimary,
        ),
        minimumSize: const WidgetStatePropertyAll(Size.fromHeight(54)),
        maximumSize: const WidgetStatePropertyAll(Size.fromHeight(54)),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        ),
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (isLoading)
            SpinKitFadingCircle(
              color: textColor ?? theme.colorScheme.onPrimary,
              size: 25,
            )
          else
            Text(
              text,
              style: theme.textTheme.bodyLarge?.copyWith(
                color: textColor ?? theme.colorScheme.onPrimary,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),

          if (icon != null) ...[const SizedBox(width: 10), icon!],
        ],
      ),
    );
  }
}
