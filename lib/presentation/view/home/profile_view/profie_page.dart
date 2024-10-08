import 'package:brofit/database/hive/functions/functions_of_reminder.dart';
import 'package:brofit/presentation/utils/colo_extension.dart';
import 'package:brofit/presentation/utils/common_text_styles.dart';
import 'package:brofit/presentation/common_widget/profile_list_tile.dart';
import 'package:brofit/local_notifications/local_notification.dart';
import 'package:brofit/presentation/view/home/profile_view/activity_history.dart';
import 'package:brofit/presentation/view/home/profile_view/drink_water_reminder/drink_water_welcome.dart';
import 'package:brofit/presentation/view/home/profile_view/edit_profile_page.dart';
import 'package:brofit/presentation/view/home/profile_view/profile_page_showdialogues.dart';
import 'package:brofit/presentation/view/login/login_view.dart';
import 'package:brofit/presentation/view/meals_planner/welcome_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // ignore: unused_field
  User? _user;
  String? _userName;
  String? _height;
  String? _weight;
  String? _gender;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      DocumentSnapshot userData = await FirebaseFirestore.instance
          .collection('UserDetails')
          .doc(user.email)
          .get();

      String userName = userData['Name'];
      String height = userData['Height'];
      String gender = userData['gender'];
      String weight = userData['Weight'];

      setState(() {
        _user = user;
        _userName = userName;
        _gender = gender;
        _height = height;
        _weight = weight;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Tcolo.white,
      appBar: AppBar(
        title: Text(
          'Profile',
          style: AppTextStyles.carousalHeading2TextStyle,
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildProfileName(),
              SizedBox(height: media.height * 0.03),
              _buildProfileStats(media),
              SizedBox(height: media.height * 0.03),
              Card(
                
                child: SizedBox(
                  height: media.height*0.2,
                  width: media.width,
                  child:  SingleChildScrollView(
                    child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: media.height*0.02,),
                         Center(child: Text('Wellness Planner',style: AppTextStyles.profileStyle2,)),
                       
                        ProfileListTile(icon: Icons.restaurant_menu, title: 'Plan Your Meals', onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (ctx)=>const MealsPlannerWelcome()));
                        }),
                         ProfileListTile(icon: Icons.local_drink_outlined, title: 'Drink Water Reminder', 
                        onTap: (){
                         Navigator.push(context, MaterialPageRoute(builder: (ctx)=>const DrinkWaterReminder()));
                        }),
                        ProfileListTile(icon: Icons.auto_graph_sharp, title: 'Activity History', onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder:(context) =>const ActivityHistory()));
                        })
                    
                    
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: media.height * 0.03),
              Card(
                
                child: SizedBox(
                  height: media.height*0.35,
                  width: media.width,
                  child:  SingleChildScrollView(
                    child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: media.height*0.02,),
                         Center(child: Text('Profile Settings',style: AppTextStyles.profileStyle2,)),
                          ProfileListTile(icon: Icons.person, title: 'Edit Profile', onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (ctx)=> const EditProfileView()));
                            
                          }),
                       
                        ProfileListTile(icon: Icons.domain_verification_rounded, title: 'contact Us', onTap: (){
                          ContactUsDialog.show(context);
                        }),
                        ProfileListTile(icon: Icons.privacy_tip_outlined, title: 'Privacy Polilcy', onTap: (){
                        showPrivacyPolicyDialog(context);
                        }),
                         ProfileListTile(icon: Icons.logout , title: 'Logout', 
                         onTap: (){
                           _showLogoutConfirmationDialog(context);
                         }),
                          ProfileListTile(icon: Icons.doorbell_rounded , title: 'Stop Notifications', 
                         onTap: (){
                          showStopAllNotificationsDialog(context);
                         }),
                         SizedBox(height: media.height*0.01,),
                         Center(child: Text('Version V1.2',style: AppTextStyles.loginEnding,)),
                    
                    
                    
                      ],
                    ),
                  ),
                ),
              )
              
              
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileName() {
    return Center(
      child: Text(
        _userName != null ? _userName! : 'loading..',
        style: AppTextStyles.profileStyle1,
      ),
    );
  }

  Widget _buildProfileStats(Size media) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildProfileCard('Gender', _gender != null ? _gender! : '..',
            media),
        _buildProfileCard('Height', _height != null ? _height! : '..', media),
        _buildProfileCard('Weight', _weight != null ? _weight! : '..', media),
       
      ],
    );
  }

  Widget _buildProfileCard(String label, String value, Size media) {
    return Card(
      child: SizedBox(
        height: media.height * 0.12,
        width: media.width * 0.25,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(label, style: AppTextStyles.welcomeSubtitle),
              const SizedBox(height: 5),
              Text(value, style: AppTextStyles.profileStyle2),
            ],
          ),
        ),
      ),
    );
  }
  void _showLogoutConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('SignOut?'),
          content: const Text('Are you sure you want to SignOut?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
               
                         FirebaseAuth.instance.signOut();
        Navigator.pushAndRemoveUntil(
  context,
  MaterialPageRoute(
    builder: (context) => const LoginView(),
  ),
  (route) => false,
);

              },
              child: const Text('Logout'),
            ),
          ],
        );
      },
    );
  }
   Future<void> showStopAllNotificationsDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Stop All Notifications?'),
          content: const Text('Are you sure you want to stop receiving  notifications?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); 
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                 deletereminder(id: '1');
                LocalNotifications.cancelAllNotifications();
                Navigator.of(context).pop(); 
              },
              child: const Text('Confirm'),
            ),
          ],
        );
      },
    );
  }

}
