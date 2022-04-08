import 'package:btp/screens/disease.dart';
import 'package:btp/screens/symptoms.dart';
import 'package:btp/screens/symptoms_list.dart';
import 'package:btp/screens/test.dart';
import 'package:btp/widgets/symptom_column.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> selectedSymptoms = [];
  SymptomsList symptoms = SymptomsList();
  List<String> symptomsList = SymptomsList().symptomsList;

  void addtoSelectedSymptom(List<dynamic> tempSelectedSymptom) {
    for (var i = 0; i < tempSelectedSymptom.length; i++) {
      if (!selectedSymptoms.contains(tempSelectedSymptom[i])) {
        symptoms.addData(tempSelectedSymptom[i]);
      }
    }
    selectedSymptoms = symptoms.selectedSymptoms;
  }

  void addSelectedSymptoms(String str) {
    symptoms.addData(str);
  }

  void deleteSelected(String str) {
    symptoms.deleteData(str);
    selectedSymptoms = symptoms.selectedSymptoms;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'MedBuddy',
        ),
        backgroundColor: Color(0xFF2d8089),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        color: Color(0xFFe4efef),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(
                left: 10,
                right: 10,
                top: 20,
                bottom: 10,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFe8e8e8),
                    spreadRadius: 2,
                    blurRadius: 4,
                    offset: Offset(0.0, 0.0),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Selected Symptoms",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 55,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: symptoms.selectedSymptoms.length,
                      itemBuilder: (context, index) {
                        final selSymptom = symptoms.selectedSymptoms[index];
                        return Container(
                          margin: EdgeInsets.only(
                            right: 5,
                          ),
                          padding: EdgeInsets.only(
                            left: 10,
                            right: 10,
                            top: 18,
                            bottom: 18,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Color(0xFFe4efef),
                          ),
                          child: Row(
                            children: [
                              Text(
                                selSymptom,
                                style: TextStyle(
                                  color: Color(0xFF2d8089),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    deleteSelected(selSymptom);
                                  });
                                  Get.snackbar(
                                    'Symptom Removed',
                                    'Symptom Removed',
                                    duration: Duration(milliseconds: 600),
                                  );
                                },
                                child: Icon(
                                  Icons.close,
                                  size: 18,
                                  color: Colors.blueGrey,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.only(
                left: 10,
                right: 10,
                top: 20,
                bottom: 10,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFe8e8e8),
                    spreadRadius: 2,
                    blurRadius: 4,
                    offset: Offset(0.0, 0.0),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "All Symptoms",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          var tempSelectedSymptoms =
                              await Get.to(() => Symptoms());
                          setState(() {
                            addtoSelectedSymptom(tempSelectedSymptoms);
                          });
                        },
                        child: Text(
                          'See more',
                          style: TextStyle(
                            color: Color(0xFF2d8089),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (!selectedSymptoms.contains('Fever')) {
                            selectedSymptoms.add('Fever');
                            setState(() {
                              addSelectedSymptoms('Fever');
                              Get.snackbar(
                                'Item Selected',
                                'Symptom Selected',
                                duration: Duration(milliseconds: 600),
                              );
                            });
                          }
                        },
                        child: SymptomColumn(
                          imageUrl: 'assets/image/fever.png',
                          text: 'Fever',
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (!selectedSymptoms.contains('Cough')) {
                            selectedSymptoms.add('Cough');
                            setState(() {
                              addSelectedSymptoms('Cough');
                              Get.snackbar(
                                'Item Selected',
                                'Symptom Selected',
                                duration: Duration(milliseconds: 600),
                              );
                            });
                          }
                        },
                        child: SymptomColumn(
                          imageUrl: 'assets/image/cough.png',
                          text: 'Cough',
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (!selectedSymptoms.contains('Vomiting')) {
                            selectedSymptoms.add('Vomiting');
                            setState(() {
                              addSelectedSymptoms('Vomiting');
                              Get.snackbar(
                                'Item Selected',
                                'Symptom Selected',
                                duration: Duration(milliseconds: 600),
                              );
                            });
                          }
                        },
                        child: SymptomColumn(
                          imageUrl: 'assets/image/vomit.png',
                          text: 'Vomiting',
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (!selectedSymptoms.contains('Runnning Nose')) {
                            selectedSymptoms.add('Runnning Nose');
                            setState(() {
                              addSelectedSymptoms('Running Nose');
                              Get.snackbar(
                                'Item Selected',
                                'Symptom Selected',
                                duration: Duration(milliseconds: 600),
                              );
                            });
                          }
                        },
                        child: SymptomColumn(
                          imageUrl: 'assets/image/running-nose.png',
                          text: 'Running Nose',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (!selectedSymptoms.contains('Diarrhea')) {
                            selectedSymptoms.add('Diarrhea');
                            setState(() {
                              addSelectedSymptoms('Diarrhea');
                              Get.snackbar(
                                'Item Selected',
                                'Symptom Selected',
                                duration: Duration(milliseconds: 600),
                              );
                            });
                          }
                        },
                        child: SymptomColumn(
                          imageUrl: 'assets/image/diarrhea.png',
                          text: 'Diarrhea',
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (!selectedSymptoms.contains('Headache')) {
                            selectedSymptoms.add('Headache');
                            setState(() {
                              addSelectedSymptoms('Headache');
                              Get.snackbar(
                                'Item Selected',
                                'Symptom Selected',
                                duration: Duration(milliseconds: 600),
                              );
                            });
                          }
                        },
                        child: SymptomColumn(
                          imageUrl: 'assets/image/decreased-concentration.png',
                          text: 'Headache',
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (!selectedSymptoms.contains('Shivering')) {
                            selectedSymptoms.add('Shivering');
                            setState(() {
                              addSelectedSymptoms('Shivering');
                              Get.snackbar(
                                'Item Selected',
                                'Symptom Selected',
                                duration: Duration(milliseconds: 600),
                              );
                            });
                          }
                        },
                        child: SymptomColumn(
                          imageUrl: 'assets/image/shivers.png',
                          text: 'Shivering',
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (!selectedSymptoms.contains('Joint Pain')) {
                            selectedSymptoms.add('Joint Pain');
                            setState(() {
                              addSelectedSymptoms('Joint Pain');
                              Get.snackbar(
                                'Item Selected',
                                'Symptom Selected',
                                duration: Duration(milliseconds: 600),
                              );
                            });
                          }
                        },
                        child: SymptomColumn(
                          imageUrl: 'assets/image/broken-bone.png',
                          text: 'Joint Pain',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                Get.to(() => Test(), arguments: selectedSymptoms);
                //selectedSymptoms = [];
                //SymptomsList().emptySelected();
              },
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color(0xFF2d8089),
                ),
                child: Center(
                  child: Text(
                    'Predict Disease',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
