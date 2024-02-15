import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void showCustomDialogDone(BuildContext context, String lottieFilePath) {
  var media = MediaQuery.of(context).size;

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: SizedBox(
          width: media.width * 0.7,
          height: media.height * 0.35,  // Keep the original height
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Lottie.asset(
                    lottieFilePath,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}