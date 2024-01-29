import 'package:brofit/common/colo_extension.dart';
import 'package:brofit/common/common_text_styles.dart';
import 'package:brofit/common_widget/profile_list_tile.dart';
import 'package:brofit/local_notification.dart';
import 'package:brofit/view/home/profile_view/drink_water_reminder/drink_water_welcome.dart';
import 'package:brofit/view/login/login_view.dart';
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
                  child:  Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       Center(child: Text('Account',style: AppTextStyles.loginHeading1,)),
                      ProfileListTile(icon: Icons.person, title: 'Edit Profile', onTap: (){}),
                      ProfileListTile(icon: Icons.auto_graph, title: 'Your Activity', onTap: (){})


                    ],
                  ),
                ),
              ),
              SizedBox(height: media.height * 0.03),
              Card(
                
                child: SizedBox(
                  height: media.height*0.35,
                  width: media.width,
                  child:  Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       Center(child: Text('Others',style: AppTextStyles.loginHeading1,)),
                      ProfileListTile(icon: Icons.local_drink_outlined, title: 'Drink Water Reminder', 
                      onTap: (){
                       Navigator.push(context, MaterialPageRoute(builder: (ctx)=>const DrinkWaterReminder()));
                      }),
                      ProfileListTile(icon: Icons.domain_verification_rounded, title: 'contact Us', onTap: (){}),
                      ProfileListTile(icon: Icons.privacy_tip_outlined, title: 'Privacy Polilcy', onTap: (){
                      
                      }),
                       ProfileListTile(icon: Icons.logout , title: 'Logout', 
                       onTap: (){
                         _showLogoutConfirmationDialog(context);
                       }),
                        ProfileListTile(icon: Icons.doorbell_rounded , title: 'Stop Notifications', 
                       onTap: (){
                        showStopAllNotificationsDialog(context);
                       }),



                    ],
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
