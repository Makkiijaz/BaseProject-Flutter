import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../app/theme/app_colors.dart';
import '../app/theme/text_styles.dart';
import '../widgets/custom_text.dart';

class CustomSnackbar {
  static final GlobalKey<ScaffoldMessengerState> snackbarKey =
      GlobalKey<ScaffoldMessengerState>();
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static showSnackBar({String? msg, bool? isError, Color? textColor}) {
    snackbarKey.currentState?.showSnackBar(
      SnackBar(
        dismissDirection: DismissDirection.horizontal,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        padding: EdgeInsets.zero,
        margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
        content: CustomToast(text: msg ?? "", isError: isError ?? false),
        duration: const Duration(seconds: 3),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  static bool _isDialogOpen = false;

  static void show({String? msg, bool? isError, Color? textColor}) {
    final context = navigatorKey.currentContext!;
    final navigator = Navigator.of(context);

    if (_isDialogOpen && navigator.canPop()) {
      navigator.pop();
    }

    _isDialogOpen = true;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return ToastDialog(text: msg ?? "", isError: isError ?? false);
      },
    ).then((_) {
      _isDialogOpen = false;
    });
  }
}

class CustomToast extends StatelessWidget {
  final String text;
  final bool isError;

  const CustomToast({super.key, required this.text, required this.isError});

  @override
  Widget build(BuildContext context) {
    final Color mainColor = isError ? Colors.red : Colors.green;
    final Color iconBgColor = isError
        ? Colors.red.withOpacity(0.3)
        : Colors.green.withOpacity(0.3);

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
            spreadRadius: 2,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: IntrinsicHeight(
          child: Row(
            children: [
              Container(width: 6, color: mainColor),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 4. Icon with Soft Background Circle
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: iconBgColor,
                        ),
                        child: Icon(
                          isError
                              ? CupertinoIcons.exclamationmark_triangle_fill
                              : CupertinoIcons.checkmark_alt,
                          color: mainColor,
                          size: 20,
                        ),
                      ),
                      const SizedBox(width: 14),

                      // 5. Text Content
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Title
                            AppText(
                              text: isError ? "Error" : "Success",
                              style: AppTextStyles.h6(context).copyWith(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 4),
                            AppText(
                              text: text,
                              style: AppTextStyles.bodyRegular(context)
                                  .copyWith(
                                    color: Colors.grey,
                                    fontSize: 12,
                                    height: 1.4,
                                  ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // 6. Close Button (Optional but professional)
              IconButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                },
                icon: Icon(Icons.close, color: Colors.grey, size: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ToastDialog extends StatelessWidget {
  final String text;
  final bool isError;

  const ToastDialog({super.key, required this.text, required this.isError});

  @override
  Widget build(BuildContext context) {
    final Color mainColor = isError ? Colors.red : Colors.green;
    final Color iconBgColor = isError
        ? Colors.red.withOpacity(0.3)
        : Colors.green.withOpacity(0.3);

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      insetPadding: const EdgeInsets.symmetric(horizontal: 24),
      elevation: 8,
      backgroundColor: ColorPalette.white,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 16, 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Top Icon
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: iconBgColor,
              ),
              child: Icon(
                isError
                    ? CupertinoIcons.exclamationmark_triangle_fill
                    : CupertinoIcons.checkmark_alt,
                color: mainColor,
                size: 26,
              ),
            ),
            const SizedBox(height: 16),

            // Title
            AppText(
              text: isError ? "Error" : "Success",
              style: AppTextStyles.h6(
                context,
              ).copyWith(fontSize: 16, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),

            // Message
            AppText(
              text: text,
              style: AppTextStyles.bodyRegular(
                context,
              ).copyWith(fontSize: 13, height: 1.5, color: Colors.grey),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 20),

            // Action button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: mainColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  elevation: 0,
                ),
                child: AppText(
                  text: "OK",
                  style: AppTextStyles.bodyRegular(
                    context,
                  ).copyWith(color: Colors.white, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
