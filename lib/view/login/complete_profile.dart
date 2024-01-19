
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_app/common/colo_extension.dart';
import 'package:flutter/material.dart';

import '../../common_widget/round_button_1.dart';
import '../../common_widget/round_textfield.dart';
import 'carousal_view.dart';

class CompleteProfileView extends StatefulWidget {
  final String name;
  const CompleteProfileView({Key? key,required this.name}) : super(key: key);

  @override
  State<CompleteProfileView> createState() => _CompleteProfileViewState();
}

class _CompleteProfileViewState extends State<CompleteProfileView> {
  TextEditingController txtDate = TextEditingController();
   TextEditingController heightController = TextEditingController();
    TextEditingController weightController = TextEditingController();
  String? selectedGender;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
   final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> saveDataToFirebase() async {
    try {
      final User? user = _auth.currentUser;

      if (user != null) {
      
        String documentId = user.email ?? '';

        
        await _firestore.collection('UserDetails').doc(documentId).set({
           'Name':widget.name,
          'gender': selectedGender,
          'Dob': txtDate.text,
          'Height':heightController.text,
          'Weight':weightController.text
          
        });

       
        // print('Data saved to Firebase successfully!');
      }
    } catch (error) {
      // print('Error saving data to Firebase: $error');
     
    }
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Tcolo.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Image.asset('assets/img/complete profile.png', width: media.width, fit: BoxFit.fitWidth),
              SizedBox(height: media.width * 0.05),
              Text(
                "Let's complete your profile",
                style: TextStyle(color: Tcolo.black, fontSize: 20, fontWeight: FontWeight.w700),
              ),
              Text(
                "It will help us to know more about you!",
                style: TextStyle(color: Tcolo.gray, fontSize: 13),
              ),
              SizedBox(height: media.width * 0.05),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  key: _formKey,
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(color: Tcolo.Lightgrey, borderRadius: BorderRadius.circular(15)),
                        child: Row(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              width: 50,
                              height: 50,
                              padding: const EdgeInsets.symmetric(horizontal: 15),
                              child: Image.asset(
                                "assets/img/2 User.png",
                                width: 20,
                                height: 20,
                                fit: BoxFit.contain,
                                color: Tcolo.gray,
                              ),
                            ),
                            Expanded(
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  value: selectedGender,
                                  items: ["Male", "Female"].map((name) {
                                    return DropdownMenuItem<String>(
                                      value: name,
                                      child: Text(
                                        name,
                                        style: TextStyle(color: Tcolo.gray, fontSize: 14),
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      selectedGender = value;
                                    });
                                  },
                                  isExpanded: true,
                                  hint: Text(
                                    "Choose Gender",
                                    style: TextStyle(color: Tcolo.gray, fontSize: 12),
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
                        controller: txtDate,
                        hintText: 'Date of Birth',
                        icon: 'assets/img/Calendar.png',
                        keyboardType: TextInputType.emailAddress,
                        obscureText: false,
                      validator: (value) {
  
    RegExp dateRegex = RegExp(r'^\d{2}-\d{2}-\d{4}$');

    if (value == null || value.isEmpty) {
      return 'Please enter your date of birth';
    } else if (!dateRegex.hasMatch(value)) {
      return 'Please enter a valid date in the format dd-mm-yyyy';
    }

    return null;
  },
                      ),
                      SizedBox(height: media.width * 0.04),
                      Row(
                        children: [
                          Expanded(
                            
                            child: RoundTextField(
                              controller: weightController,
                              hintText: 'Your Weight',
                              icon: 'assets/img/weight-scale 1.png',
                              keyboardType: TextInputType.number,
                              obscureText: false,
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
                          ),
                          const SizedBox(width: 8),
                          Container(
                            width: 50,
                            height: 50,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(colors: Tcolo.SecondaryG),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Text(
                              'KG',
                              style: TextStyle(color: Tcolo.white, fontSize: 12),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: media.width * 0.04),
                      Row(
                        children: [
                          Expanded(
                            child: RoundTextField(
                              controller: heightController,
                              hintText: 'Your Height',
                              icon: 'assets/img/Swap.png',
                              keyboardType: TextInputType.number,
                              obscureText: false,
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
                          ),
                          const SizedBox(width: 8),
                          Container(
                            width: 50,
                            height: 50,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(colors: Tcolo.SecondaryG),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Text(
                              'CM',
                              style: TextStyle(color: Tcolo.white, fontSize: 12),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: media.width * 0.09),
                      
                    ],
                  ),
                ),
                
              ),
              RoundButton(
                        textColor: Tcolo.white,
                        title: 'Next >',
                        onPressed: () {
                          if (_formKey.currentState!.validate()&&weightController.text.isNotEmpty&&heightController.text.isNotEmpty&&txtDate.text.isNotEmpty&&selectedGender!=null) {
                           
                           saveDataToFirebase();
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const WhoNeedsMe()));
                            weightController.clear();
                            heightController.clear();
                            
                            txtDate.clear();

                          }
                          else{}
                        },
                        buttonColor: Tcolo.Primarycolor1,
                      ),
              
            ],
          ),
        ),
      ),
    );
  }
}
