import 'package:flutter/material.dart';
import 'package:specifit/src/presentation/widgets/cards/workout_detail_item.dart';

class WorkoutDetailScreen extends StatelessWidget {
  final List<dynamic> titleWorkout;
  final String imageUrl;
  final List<dynamic> timeWorkout;

  const WorkoutDetailScreen({
    Key? key,
    required this.titleWorkout,
    required this.imageUrl,
    required this.timeWorkout,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String descWorkout = "Istirahat setiap 5 menit selama 1 menit";
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(descWorkout),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: titleWorkout[0].length,
                itemBuilder: (ctx, idx) {
                  return WorkoutDetailItem(
                    title: titleWorkout[0][idx].toString(),
                    time: timeWorkout[0][idx].toString(),
                  );
                },
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                child: const Text("Mulai"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
