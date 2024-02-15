import 'package:brofit/presentation/common/colo_extension.dart';
import 'package:flutter/material.dart';
import 'package:heart_bpm/heart_bpm.dart';
import 'package:lottie/lottie.dart';



class HeartRate extends StatefulWidget {
  const HeartRate({super.key});

  @override
  State<HeartRate> createState() => _HeartRateState();
}

class _HeartRateState extends State<HeartRate> {
   List<SensorValue> data = [];
  int? bpmValue;

  @override
  Widget build(BuildContext context) {
    var media  = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pulse Monitor'),
        centerTitle: true,
        backgroundColor: Tcolo.Primarycolor1,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back)),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Cover both the camera and flash with your finger",
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge
                    ?.copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center),
            SizedBox(
              height: media.height*0.03,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // 
                Lottie.asset(
          'assets/gif/heart2.json', // Replace with your Lottie asset
          width: media.width * 0.2,
          height: media.width * 0.25,
          fit: BoxFit.cover,
        ),
        SizedBox(width: media.width*0.03,),
                HeartBPMDialog(
                  context: context,
                  onRawData: (value) {
                    setState(() {
                      if (data.length == 100) {
                        data.removeAt(0);
                      }
                      data.add(value);
                    });
                  },
                  onBPM: (value) => setState(() {
                    bpmValue = value;
                  }),
                  child: Text(
                    bpmValue?.toString() ?? "-",
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge
                        ?.copyWith(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}