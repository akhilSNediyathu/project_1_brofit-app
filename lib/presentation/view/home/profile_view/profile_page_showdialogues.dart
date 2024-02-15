import 'package:flutter/material.dart';

// contact_us_dialog.dart



class ContactUsDialog {
  static void show(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Contact Us'),
          content: const Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.email,
                    color: Colors.blue,
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Send your inquiries to:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              SelectableText(
                'creativeflutterapps@gmail.com',
                style: TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }
}

void showPrivacyPolicyDialog(BuildContext context) {
  var media = MediaQuery.of(context).size;

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Container(
          width: media.width * 0.8, // Adjust as needed
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Privacy Policy',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Your privacy is important to us. This privacy policy explains how we collect, use, and safeguard your personal information.Thanks for choosing BroFit!',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 12),
              const Text(
                'Information We Collect:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'We collect your name, email, height, weight, and gender for personalized fitness recommendations.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 12),
              const Text(
                'How We Use Your Information:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Your information is used to provide tailored fitness plans and improve our services. We do not share your data with third parties.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Close'),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}