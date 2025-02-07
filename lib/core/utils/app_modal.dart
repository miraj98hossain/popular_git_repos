import 'package:flutter/material.dart';

class AppModal {
  static Future<T?> showCustomModal<T>(BuildContext context,
      {String? title, Widget? content, bool barrierDismissible = false}) {
    return showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) => Dialog(
        alignment: Alignment.center,
        backgroundColor: Theme.of(context).colorScheme.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        insetPadding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: content,
      ),
    );
  }
}
