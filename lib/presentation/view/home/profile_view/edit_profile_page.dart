// ignore_for_file: use_build_context_synchronously

import 'package:brofit/presentation/common/colo_extension.dart';
import 'package:brofit/presentation/common_widget/round_button_1.dart';
import 'package:brofit/presentation/common_widget/round_textfield.dart';
import 'package:brofit/presentation/view/home/home_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lottie/lottie.dart';


class EditProfileView extends StatefulWidget {
  const EditProfileView({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _EditProfileViewState createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  TextEditingController nameController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  String? selectedGender;
  DateTime? selectedDate;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    try {
      User? user = _auth.currentUser;

      if (user != null) {
        DocumentSnapshot userData =
            await _firestore.collection('UserDetails').doc(user.email).get();

        setState(() {
          nameController.text = userData['Name'];
          selectedGender = userData['gender'];
          selectedDate = userData['Dob'] != null
              ? DateTime.parse(userData['Dob'])
              : null;
          weightController.text = userData['Weight'];
          heightController.text = userData['Height'];
        });
      }
    } catch (error) {
      if (kDebugMode) {
        print('Error loading user data: $error');
      }
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> saveChangesToFirestore() async {
    try {
      User? user = _auth.currentUser;

      if (user != null) {
        await _firestore.collection('UserDetails').doc(user.email).update({
          'Name': nameController.text,
          'gender': selectedGender,
          'Dob': selectedDate?.toString(),
          'Height': heightController.text,
          'Weight': weightController.text,
        });
      }
    } catch (error) {
      if (kDebugMode) {
        print('Error updating user details: $error');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:const Text('Edit Profile'),
      ),
      backgroundColor: Tcolo.white,
      body: SingleChildScrollView(
        child: Column(
           
        
          children: [
               SizedBox(
               height: media.height*0.2,
                child:  Lottie.asset(
              'assets/gif/editprofile.json', 
            
              fit: BoxFit.cover,
            ),),
         
            SingleChildScrollView(
              child: SizedBox(
                height:media.height*0.6,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Form(
                   
                    key: _formKey,
                    child: SizedBox(
                      child: SingleChildScrollView(
                        child: Column(
                          
                        
                          children: [
                            
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    width: 50,
                                    height: 50,
                                    padding:
                                        const EdgeInsets.symmetric(horizontal: 15),
                                    child:  Icon(
                                      Icons.person,
                                      size: 20,
                                      color: Tcolo.gray,
                                    ),
                                  ),
                                  Expanded(
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton<String>(
                                        value: selectedGender,
                                        items: ["Male", "Female"]
                                            .map((name) {
                                          return DropdownMenuItem<String>(
                                            value: name,
                                            child: Text(
                                              name,
                                              style: const TextStyle(
                                                  color: Colors.grey, fontSize: 14),
                                            ),
                                          );
                                        }).toList(),
                                        onChanged: (value) {
                                          setState(() {
                                            selectedGender = value;
                                          });
                                        },
                                        isExpanded: true,
                                        hint:  Text(
                                          "Choose Gender",
                                          style: TextStyle(
                                              color: Tcolo.gray, fontSize: 12),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                ],
                              ),
                            ),
                             SizedBox(height: media.width * 0.04),
                            RoundTextField(
                              icon: 'assets/img/Profile.png',
                              controller: nameController,
                              hintText: 'Name',
                            ),
                           
                            
                            SizedBox(height: media.width * 0.04),
                            GestureDetector(
                              onTap: () => _selectDate(context),
                              child: AbsorbPointer(
                                child: RoundTextField(
                                  controller: TextEditingController(
                                      text: selectedDate?.toLocal().toString().split(' ')[0]),
                                  hintText: 'Date of Birth',
                                  icon: 'assets/img/Calendar.png', 
                                ),
                              ),
                            ),
                            SizedBox(height: media.width * 0.04),
                            RoundTextField(
                              icon: 'assets/img/weight-scale 1.png',
                              controller: weightController,
                              hintText: 'Weight',
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your weight';
                                }
                                double weight = double.tryParse(value) ?? 0.0;
                                if (weight <= 0 || weight > 500) {
                                  return 'Please enter a valid weight';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: media.width * 0.04),
                            RoundTextField(
                              icon:'assets/img/Swap.png',
                              controller: heightController,
                              hintText: 'Height',
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your height';
                                }
                                double height = double.tryParse(value) ?? 0.0;
                                if (height <= 0 || height > 300) {
                                  return 'Please enter a valid height';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: media.width * 0.09),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: RoundButton(title: 'Update', onPressed: ()async{
                if (_formKey.currentState!.validate()) {
                    saveChangesToFirestore();
                    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
          
            child: Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Lottie.asset(
                    'assets/gif/profile updated.json', 
                   fit: BoxFit.fill
                  ),
                
                ],
              ),
            ),
          );
        },
      );
      await Future.delayed(const Duration(seconds: 3));
      Navigator.pop(context);

                   
                    Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (ctx2) => const HomePage()),
                    (route)=>false);
                  }
                },
               buttonColor: Tcolo.Primarycolor1, textColor: Tcolo.white),
            )
            
          ],
        ),
      ),
    );
  }
}
