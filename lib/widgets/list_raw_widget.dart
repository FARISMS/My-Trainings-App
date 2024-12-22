import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_trainings_app/model/training_model.dart';
import 'package:my_trainings_app/utill/color.dart';
import 'package:my_trainings_app/widgets/vertical_divider.dart';

class ListRawWidget extends StatelessWidget{
  const ListRawWidget({super.key, required this.training});

  final Training training;


  @override
  Widget build(BuildContext context) {
    return Card(

      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            // First child (30% width)
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(training.date,
                    maxLines: 2,
                    style: TextStyle(
                        color: Colors.black, fontSize: 20,fontWeight: FontWeight.w800),
                  ),
                  SizedBox(height: 8,),
                  Text('${training.startTime} ${training.endTime}' ,
                    style: TextStyle(
                        color: Colors.black, fontSize: 12),
                  ),
                  SizedBox(height: 16,),
                  Text(training.venue ,
                    maxLines: 3,
                    style: TextStyle(
                        color: Colors.black, fontSize: 16),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DashedVerticalLine(height: 100,),
            ),

            Expanded(
              flex: 7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(training.name,
                    style: TextStyle(
                        color: Colors.black, fontSize: 26,fontWeight: FontWeight.w900),
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundImage: NetworkImage(training.trainerImage, // Replace with your image URL
                        ),
                        backgroundColor: Colors.grey[200], // Fallback background color
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(training.trainerName,
                              style: TextStyle(
                                  color: Colors.black, fontSize: 16,fontWeight: FontWeight.w700),
                            ),
                            Text('details',
                              style: TextStyle(
                                  color: Colors.black, fontSize: 16,),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      print('Enroll Now button pressed');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary, // Button color
                      foregroundColor: AppColors.background, // Text color
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5), // Rounded edges
                      ),
                    ),
                    child: Text(
                      'Enroll Now',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),


                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}