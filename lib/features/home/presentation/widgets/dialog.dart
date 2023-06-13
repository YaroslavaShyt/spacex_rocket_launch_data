import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlsDialog extends StatelessWidget {
  final String youtube;
  final String wikipedia;
  final String webpage;
  const UrlsDialog({Key? key, required this.wikipedia, required this.youtube, required this.webpage}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    void launchURL(String url) async {
      if (await canLaunch(url)) {
        await launch(url, forceWebView: true, enableJavaScript: true);
      } else {
        throw 'Could not launch $url';
      }
    }


    return AlertDialog(
      title: const Text('Open in'),
      content: SizedBox(
        height: 100,
        width: 250,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(onPressed: (){
                  launchURL(youtube ?? '');
                }, icon: const FaIcon(FontAwesomeIcons.youtube)),
                const Text('YouTube')
              ],
            ),
            const SizedBox(width: 10,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                  IconButton(onPressed: (){
                    launchURL(wikipedia ?? '');
                  }, icon: const FaIcon(FontAwesomeIcons.wikipediaW)),
                const Text('Wikipedia')
                ]),
            const SizedBox(width: 10,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(onPressed: (){
                  launchURL(webpage ?? '');
                }, icon: const FaIcon(FontAwesomeIcons.html5)),
                const Text('WebPage')
                ])
        ],),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
      ],
    );
  }
}
