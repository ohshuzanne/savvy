import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../utils/colors.dart';

class YoutubeIcon extends StatelessWidget {
  late var link;

  YoutubeIcon({super.key, required this.link});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: lighterBlue,
      onTap: () {
        _launchURL(link);
        print("Youtubed Tab-ed");
      },
      child: const Row(
        children: [
          Icon(Icons.play_circle_outline, color: darkBlue),
          Text(
            "Youtube",
            style: TextStyle(fontSize: 10, fontStyle: FontStyle.italic),
          )
        ],
      ),
    );
  }
}

_launchURL(link) async {
  final uri = Uri.parse(link);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    throw 'Could not launch $uri';
  }
}
