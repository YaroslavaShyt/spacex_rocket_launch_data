import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:spacex_rocket_launch_data/core/constants/colors.dart';
import 'package:url_launcher/url_launcher.dart';


class UrlsDialog extends StatelessWidget {
  final String youtube;
  final String wikipedia;
  final String webpage;

  const UrlsDialog({
    Key? key,
    required this.wikipedia,
    required this.youtube,
    required this.webpage,
  }) : super(key: key);


  void launchURL(String url) async {
    final Uri urlUri = Uri.parse(url);
    if (await canLaunchUrl(urlUri)) {
      await launchUrl(urlUri);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.lightBlack,
      title: const Text(
        'Open in',
        style: TextStyle(color: Colors.white),
      ),
      content: SizedBox(
        height: 100,
        width: 250,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    launchURL(youtube);
                  },
                  icon: const FaIcon(FontAwesomeIcons.youtube),
                  color: Colors.white,
                ),
                const Text(
                  'YouTube',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            const SizedBox(width: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    launchURL(wikipedia);
                  },
                  icon: const FaIcon(FontAwesomeIcons.wikipediaW),
                  color: Colors.white,
                ),
                const Text(
                  'Wikipedia',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            const SizedBox(width: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    launchURL(webpage);
                  },
                  icon: const FaIcon(FontAwesomeIcons.html5),
                  color: Colors.white,
                ),
                const Text(
                  'WebPage',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            )
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(
            'Cancel',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
