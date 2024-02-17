import 'package:brofit/presentation/common/colo_extension.dart';
import 'package:brofit/presentation/common_widget/round_button_1.dart';
import 'package:brofit/local_notifications/local_notification.dart';
import 'package:brofit/presentation/view/home/home_page.dart';
import 'package:brofit/presentation/view/home/profile_view/drink_water_reminder/datamodel2.dart';
import 'package:brofit/database/hive/functions/functions_of_reminder.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class DrinkWaterReminder extends StatefulWidget {
  const DrinkWaterReminder({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _DrinkWaterReminderState createState() => _DrinkWaterReminderState();
}

class _DrinkWaterReminderState extends State<DrinkWaterReminder> {
  int selectedHours = 0;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Tcolo.white,
      appBar: AppBar(
        backgroundColor: Tcolo.Primarycolor2,
        title:  Text('Set Reminder', style: TextStyle(color: Tcolo.black)),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (ctx) => const HomePage()),
            );
          },
          icon:  Icon(Icons.arrow_back, color: Tcolo.black),
        ),
      
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(media.width * 0.04),
          child: Column(
            children: [
              Image.asset('assets/img/water1.png', height: media.height * 0.3),
              const SizedBox(height: 16),
               Text(
                "Hydrate your body, nourish your soul. Sip by sip, you're taking steps towards a healthier and more vibrant you. Cheers to wellness, one glass of water at a time!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: media.width * 0.04,
                  color: Tcolo.gray, 
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: media.width * 0.5,
                height: media.width * 0.5,
                child: Lottie.asset(
                  'assets/gif/Animation - 1706513554703.json',
                  fit: BoxFit.cover,
                ),
              ),
               Text(
                'Hydrate every hour for optimal well-being, set the reminder now',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: media.width * 0.04,
                  color: Tcolo.gray, 
                ),
              ),
              const SizedBox(height: 20),
             
             reminder.isEmpty? RoundButton(
                title: 'Set Reminder',
                onPressed: () async {
                  LocalNotifications.periodicNotification(
                    title: 'Hydration Reminder',
                    body: 'Time for a quick water break! Grab a glass and stay refreshed',
                    payload: 'drink_water_reminder',
                  );
                  addreminderDatas(reminder: ReminderModel(id: '1', status: 'set'));
                  showSetNotificationsDialog(context);
                },
                buttonColor: Tcolo.Primarycolor1,
                textColor: Tcolo.white,
              ):RoundButton(title: 'Stop Notifications', onPressed: (){
                 showStopNotificationsDialog(context);
               
              }, buttonColor: Tcolo.Primarycolor1, textColor: Tcolo.white),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> showStopNotificationsDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title:  Text('Stop Drink Water Notifications?', style: TextStyle(color: Tcolo.black)),
          content:  Text('Are you sure you want to stop receiving drink water notifications?', style: TextStyle(color: Tcolo.black)),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child:  Text('Cancel', style: TextStyle(color: Tcolo.black)),
            ),
            TextButton(
              onPressed: () {
                LocalNotifications.cancelNotification(1);
                 deletereminder(id: '1');
                Navigator.of(context).pop();
                getRemiderDatas();
                setState(() {
                  
                });
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (ctx)=>const DrinkWaterReminder()));
              },
              child:  Text('Confirm', style: TextStyle(color: Tcolo.black)),
            ),
          ],
        );
      },
    );
  }
  Future<void> showSetNotificationsDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title:  Text('Hurray! ', style: TextStyle(color: Tcolo.black)),
          content:  Text('Your drink water reminder is all set! Cheers to a hydrated and healthy you!', style: TextStyle(color: Tcolo.black)),
          actions: [
            
            TextButton(
              onPressed: () {
               
                  setState(() {
                  
                });
                Navigator.of(context).pop();
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (ctx)=>const DrinkWaterReminder()));
              },
              child:  Text('ok', style: TextStyle(color: Tcolo.black)),
            ),
          ],
        );
      },
    );
  }
}
