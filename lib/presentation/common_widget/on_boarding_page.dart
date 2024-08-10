import 'package:brofit/presentation/utils/colo_extension.dart';
import 'package:brofit/presentation/view/login/signup_view.dart';

import 'package:flutter/material.dart';

class OnBoardingpage extends StatelessWidget {
  final Map pObj;
  const OnBoardingpage({super.key,  required this.pObj});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: SizedBox(
        width: media.width,
        height: media.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(
                top: 10,
              ),
              alignment: Alignment.bottomRight,
              child: TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (ctx) => const SignUpView()),
                  );
                },
                child: Text(
                  'Skip >',
                  style: TextStyle(fontSize: 17, color: Tcolo.Primarycolor1),
                ),
              ),
            ),
            FittedBox(
              fit: BoxFit.cover,
              child: SizedBox(
                width: media.width,
                height: media.height * 0.4,
                child: Image.asset(
                  pObj['image'].toString(),
                ),
              ),
            ),
            SizedBox(height: media.width * 0.1),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                pObj['title'].toString(),
                style: TextStyle(
                  color: Tcolo.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                pObj['subtitle'].toString(),
                style: TextStyle(
                  color: Tcolo.gray,
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
