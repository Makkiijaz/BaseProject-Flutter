import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../app/theme/text_styles.dart';
import 'custom_elevated_button.dart';
import 'custom_text.dart';

class AppUpdateDialog extends StatefulWidget {
  final String? currentVersion;
  final String? liveVersion;
  final String? appUrl;
  final bool? isForceUpdate;
  final Function? function;

  const AppUpdateDialog({
    this.currentVersion,
    this.liveVersion,
    this.appUrl,
    this.isForceUpdate,
    this.function,
    super.key,
  });

  @override
  State<StatefulWidget> createState() {
    return AppUpdateDialogState();
  }
}

class AppUpdateDialogState extends State<AppUpdateDialog> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Dialog(
      backgroundColor: colorScheme.surface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(
              text: "New app version: ${widget.liveVersion}",
              style: AppTextStyles.h1(
                context,
              ).copyWith(color: colorScheme.onSurface),
            ),
            const SizedBox(height: 20),
            AppText(
              text:
              "Your current App Version ${widget.currentVersion}. "
                  "Major Updated version ${widget.liveVersion} is available now. "
                  "${widget.isForceUpdate == true ? "You have to update app now to continue" : "Please update your app now"}",
              style: AppTextStyles.bodyLarge(
                context,
              ).copyWith(color: colorScheme.onSurface),
            ),
            const SizedBox(height: 20),
            CustomElevatedButton(
              text: "Update",
              onTap: () async {
                final url = Uri.tryParse(widget.appUrl ?? "");
                if (url != null) {
                  await launchUrl(url);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}