

import 'package:fitness_app/common/colo_extension.dart';
import 'package:flutter/material.dart';
import 'dart:async';



class CustomCounterDialog1 extends StatefulWidget {
  final String gifPath;
  final int initialCounter;

  const CustomCounterDialog1({
    Key? key,
    required this.gifPath,
    required this.initialCounter,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CustomCounterDialogState createState() => _CustomCounterDialogState();
}

class _CustomCounterDialogState extends State<CustomCounterDialog1> {
  late int counter;
   Timer? timer;

  @override
  void initState() {
    super.initState();
    counter = widget.initialCounter;
  }

  void startCounter() {
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(oneSec, (Timer t) {
      if (counter == 0) {
        t.cancel();
        Navigator.of(context).pop(); 
      } else {
        setState(() {
          counter--;
        });
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel(); // Cancel the timer to avoid memory leaks
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Tcolo.Primarycolor1,
        centerTitle: true,
        title:const  Text('Workout Guide'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/img/bg1.jpg'),fit: BoxFit.cover),
         
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                 
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30)
                ),
                
                height: media.height*0.4,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    
                    child: Image.asset(
                      
                      widget.gifPath,
                      width: media.width*0.8,
                      height: media.height*0.35,
                      fit: BoxFit.cover,
                    ),
                    // child: Lottie.asset(
                    //   widget.gifPath
                    // ),
                  ),
                ),
              ),
            ),
            SizedBox(height: media.height*0.03,),
                        Container(
                          
                          height: media.height*0.09,
                          decoration: BoxDecoration(
                            color: Tcolo.white,
                            shape: BoxShape.circle,
                            
                          ),
                          child: Center(child: Text('$counter  sec',style: TextStyle(fontWeight: FontWeight.w600,color: Tcolo.black),))),
                         SizedBox(height: media.height*0.08,),
              ElevatedButton(
  onPressed: () {
    startCounter();
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.transparent, 
    elevation: 4,
  ),
  child: Container(
    width: 200,
    height: 50,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: Tcolo.cardBg, 
      ),
      borderRadius: BorderRadius.circular(20), 
    ),
    child: Center(
      child: Text(
        'Start Timer',
        style: TextStyle(
          color: Tcolo.Lightgrey,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  ),
)
          ],
        ),
      ),
    );
  }
}