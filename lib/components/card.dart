import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/framework.dart';

class TheCard extends StatelessWidget {
  final String title;
  final String description;
  final Function() onTap;

  const TheCard(
      {super.key,
      required this.onTap,
      required this.title,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 428,
      width: 330,
      child: Card(
        color: Colors.black26,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Column(
          children: [
            const SizedBox(height: 16),
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(9),
                  child: SizedBox(
                    child: Image.network(
                      'https://images.unsplash.com/photo-1504197832061-98356e3dcdcf?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8N3x8fGVufDB8fHx8fA%3D%3D&w=1000&q=80',
                      fit: BoxFit.cover,
                      height: 218,
                      width: 300,
                    ),
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0).copyWith(bottom: 0),
                child: const Text(
                  // Note: Only 170 characters can be inserted
                  'Boost productivity with TYR: The ultimate app to track your routine. Achieve goals effortlessly and stay organized. Your personal assistant for a balanced life and more!!',
                  softWrap: true,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.start,
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white60,
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Edit info',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
