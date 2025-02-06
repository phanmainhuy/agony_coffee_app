import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingDialog {
  static void show(BuildContext context, {String? message}) {
    const double space = 24;

    showDialog(
      context: context,
      barrierDismissible: false, // Prevent dismissing by tapping outside
      builder: (context) {
        return WillPopScope(
          onWillPop: () async =>
              false, // Prevent dismissing with the back button
          child: CupertinoAlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: space),
                const CupertinoActivityIndicator(
                  radius: 16, // Spinner size
                ),
                const SizedBox(height: 16),
                if (message != null)
                  Text(
                    message,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                const SizedBox(height: space),
              ],
            ),
          ),
        );
      },
    );
  }

  static void hide(BuildContext context) {
    Navigator.of(context).pop();
  }
}
