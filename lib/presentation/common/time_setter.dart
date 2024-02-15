import 'package:brofit/presentation/common/colo_extension.dart';
import 'package:flutter/material.dart';

class TimeSetter extends StatelessWidget {
  final String wokoutName;

  const TimeSetter({Key? key, required this.wokoutName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    TextEditingController timeController = TextEditingController();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Tcolo.Lightgrey,
        borderRadius: BorderRadius.circular(15),
      ),
      height: media.height * 0.08,
      child: Center(
        child: Row(
          children: [
            Image.asset('assets/img/Time Circle.png'),
            SizedBox(width: media.width * 0.02),
            Text(timeController.text.isNotEmpty ? timeController.text : wokoutName),
          ],
        ),
      ),
    );
  }


}