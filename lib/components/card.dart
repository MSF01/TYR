import 'package:flutter/material.dart';

class TheCard extends StatelessWidget {
  final String imageLink;
  final String description;
  final Function() onTap;

  const TheCard(
      {super.key,
      required this.onTap,
      required this.imageLink,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // By changing sizebox height of Card and text widget you can increase character limit
      height: 450,
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
                      imageLink,
                      loadingBuilder: ((context, child, loadingProgress) {
                        // Will check if the loading progress is null, indicating that loading is complete
                        if (loadingProgress == null) {
                          return child; // Simply returning child widget
                        } else {
                          return Center(
                            child: CircularProgressIndicator(
                              // Calculating progress values based on the progress
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes!
                                  : null,
                            ),
                          );
                        }
                      }),
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
                child: SizedBox(
                  height: 125,
                  child: Text(
                    // Note: Only 180 characters can be inserted
                    description, // This line of 169 Chracters
                    softWrap: true,
                    style: const TextStyle(
                      fontSize: 18,
                    ),
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
