import 'package:fitness_app/common/colo_extension.dart';
import 'package:flutter/material.dart';

class OnBoardingpage extends StatelessWidget {
  final Map pObj;
  const OnBoardingpage({super.key, required this.pObj});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return SizedBox(
      width: media.width,
      height: media.height,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(
                top: 10,
              ),
              alignment: Alignment.bottomRight,
              child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Skip >',
                    style: TextStyle(fontSize: 17, color: Tcolo.Primarycolor1),
                  )),
            ),
            Image.asset(
              pObj['image'].toString(),
              width: media.width,
              fit: BoxFit.fill,
            ),
            SizedBox(
              height: media.width * 0.1,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                pObj['title'].toString(),
                style: TextStyle(
                    color: Tcolo.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height:10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                pObj['subtitle'].toString(),
                style: TextStyle(
                  color: Tcolo.gray,
                  fontSize: 15,
                ),
              ),
            )
          ]),
    );
  }
}
