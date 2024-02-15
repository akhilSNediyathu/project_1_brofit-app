import 'package:brofit/presentation/common/colo_extension.dart';
import 'package:brofit/presentation/common/common_text_styles.dart';
import 'package:brofit/presentation/common_widget/round_button_1.dart';


import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BmiWelcome extends StatefulWidget {
  const BmiWelcome({super.key});

  @override
  State<BmiWelcome> createState() => _BmiWelcomeState();
}

class _BmiWelcomeState extends State<BmiWelcome> {
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final border =BorderRadius.circular(15);
    var media = MediaQuery.of(context).size;

    double calculateBMI(double height, double weight) {
      return weight / ((height / 100) * (height / 100));
    }

    String getBMIStatus(double bmi) {
      if (bmi < 18.5) {
        return 'Underweight';
      } else if (bmi >= 18.5 && bmi < 24.9) {
        return 'Normal weight';
      } else if (bmi >= 25 && bmi < 29.9) {
        return 'Overweight';
      } else {
        return 'Obese';
      }
    }

    void showBMIResultDialog() {
      double height = double.tryParse(heightController.text) ?? 0.0;
      double weight = double.tryParse(weightController.text) ?? 0.0;

      double bmi = calculateBMI(height, weight);

      String bmiStatus = getBMIStatus(bmi);

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Center(child: Text('BMI Result')),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: Image.asset(
                    'assets/img/bmi 3.png',
                    width: 100,
                    height: 100,
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: 10),
                Text('Height: $height cm'),
                Text('Weight: $weight kg'),
                const SizedBox(height: 10),
                Text('BMI: ${bmi.toStringAsFixed(2)}'),
                const SizedBox(height: 10),
                Text('Status: $bmiStatus'),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      backgroundColor: Tcolo.white,
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          height: media.height * 0.85,
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: media.height * 0.15,
                child: Center(child: Image.asset('assets/img/bmi welcome.png')),
              ),
              SizedBox(height: media.height * 0.02,),
              Center(
                child: Text(
                  "Check your BMI regularly",
                  style: AppTextStyles.new1,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: media.height * 0.02,),
              Center(
                child: Text(
                  "it's a key indicator for your overall health, guiding ",
                  style:AppTextStyles.new2,
                ),
              ),
              Center(
                child: Text(
                  ' you toward better lifestyle choices.',
                  style: AppTextStyles.new2,
                ),
              ),
              SizedBox(height: media.height * 0.06,),
              Form(
                key: _formKey,
                // autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Tcolo.Lightgrey,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Container(
                              width: media.width * 0.5,
                              decoration: BoxDecoration(
                                color: Tcolo.Lightgrey,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Center(
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  controller: heightController,
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
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: border,
                                     
                                    borderSide: BorderSide(
                                      width: 2,color: Tcolo.Primarycolor1
                                    )
                                  ),
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 15, horizontal: 15),
                                    enabledBorder:OutlineInputBorder(
                                      borderRadius: border,
                                    borderSide: BorderSide(
                                      width: 2,color: Tcolo.Primarycolor1
                                    )
                                  ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: border,
                                    borderSide: BorderSide(
                                      width: 2,color: Tcolo.Secondarycolor1
                                    )
                                  ),
                                    prefixIcon: Container(
                                      alignment: Alignment.center,
                                      width: 20,
                                      height: 20,
                                      child: Image.asset(
                                        'assets/img/Swap.png',
                                        width: 20,
                                        height: 20,
                                        fit: BoxFit.contain,
                                        color: Tcolo.gray,
                                      ),
                                    ),
                                    hintText: 'Enter Your Height',
                                    hintStyle: TextStyle(
                                      color: Tcolo.gray,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8,),
                          Container(
                
                            width: 50,
                            height: 50,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: Tcolo.SecondaryG),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Text(
                              'CM',
                              style: TextStyle(
                                color: Tcolo.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: media.height * 0.02,),
                    Container(
                      decoration: BoxDecoration(
                        color: Tcolo.Lightgrey,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Center(
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                controller: weightController,
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
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: border,
                                    borderSide: BorderSide(
                                      width: 2,color: Tcolo.Primarycolor1
                                    )
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 15),
                                  enabledBorder:  OutlineInputBorder(
                                    borderRadius: border,
                                    borderSide: BorderSide(
                                      width: 2,color: Tcolo.Primarycolor1
                                    )
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: border,
                                    borderSide: BorderSide(
                                      
                                      width: 2,color: Tcolo.Secondarycolor1
                                    )
                                  ),
                                  prefixIcon: Container(
                                    alignment: Alignment.center,
                                    width: 20,
                                    height: 20,
                                    child: Image.asset(
                                      'assets/img/weight-scale 1.png',
                                      width: 20,
                                      height: 20,
                                      fit: BoxFit.contain,
                                      color: Tcolo.gray,
                                    ),
                                  ),
                                  hintText: 'Enter Your Weight',
                                  hintStyle: TextStyle(
                                    color: Tcolo.gray,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8,),
                          Container(
                          
                            width: 50,
                            height: 50,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: Tcolo.SecondaryG),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Text(
                              'KG',
                              style: TextStyle(
                                color: Tcolo.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
             
              const Spacer(),
              RoundButton(
               
                title: 'check',
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    showBMIResultDialog();
                    heightController.clear();
                    weightController.clear();
                  }
                },
                buttonColor: Tcolo.Primarycolor1,
                textColor: Tcolo.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
