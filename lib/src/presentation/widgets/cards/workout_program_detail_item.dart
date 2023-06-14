import 'package:flutter/material.dart';
import 'package:specifit/src/presentation/themes.dart';

class WorkoutProgramDetailItem extends StatelessWidget {
  const WorkoutProgramDetailItem({Key? key}) : super(key: key);
  final String imageUrl = "assets/images/program_1.png";

  @override
  Widget build(BuildContext context) {
    const String title = "Full body workout";
    const String time = "10 Menit";
    const String calories = "260";
    return GestureDetector(
      // onTap: () => Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (ctx) => WorkoutDetailScreen(
      //         // TODO: fetch time from API
      //         titleWorkout: title,
      //         imageUrl: imageUrl,
      //         time: "5 menit"),
      //   ),
      // ),
      child: const Card(
        color: Colors.white,
        surfaceTintColor: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(
                        Icons.watch_later_outlined,
                        color: grey2Color,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(time),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.local_fire_department_outlined,
                        color: grey2Color,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text("$calories Kalori dibakar (est.)"),
                    ],
                  ),
                ],
              ),
              Text("08.00"),
            ],
          ),
        ),
      ),
    );
  }
}
