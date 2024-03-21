import 'package:flutter/material.dart';

class ProfilePicture extends StatelessWidget {
  String picUrl;
  double width;
  double height;

  ProfilePicture({required this.picUrl, required this.width, required this.height ,super.key});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Image(
        width: width,
        height: height,
        image: NetworkImage(picUrl),
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return const Center(child: CircularProgressIndicator()); // Display a progress indicator while loading
        },
        errorBuilder: (context, error, stackTrace) {
          return Center(
              child: SizedBox(
                  width: width,
                  height: height,
                  child: const ClipOval(
                      child: Column(
                        children: [
                          Icon(Icons.person_off_rounded),
                          Text(
                            "Failed to load",
                            style:
                            TextStyle(fontSize: 8, fontStyle: FontStyle.italic),
                          )
                        ],
                      )))); // Display error message on failure
        },
      ),
    );
  }
}

