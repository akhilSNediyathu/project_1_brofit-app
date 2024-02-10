import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void showCustomDialogDone(BuildContext context, String lottieFilePath) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Lottie.asset(
                  lottieFilePath,
                  fit: BoxFit.fill,
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}