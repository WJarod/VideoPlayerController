import 'package:custom_player/controller/player_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/video.dart';

class VideoTileView extends StatelessWidget {
  final Video video;
  const VideoTileView({Key? key, required this.video}): super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: () => tapeAction(context),
      child: Container(
        margin: const EdgeInsets.only(top: 5, bottom: 5, right: 8, left: 8),
        height: MediaQuery.of(context).size.height / 2.5,
        child: Card(
          child: Column(
            children: [
              Image.network(video.thurbString),
              Text(video.title, style: TextStyle(color: Theme.of(context).colorScheme.secondary, fontSize: 18, fontWeight: FontWeight.bold),)
            ],
          ),
        ),
      ),
    );
  }

  tapeAction(BuildContext context) {
    final route = MaterialPageRoute(builder: (context) => PlayerController(video: video));
    Navigator.push(context, route);
  }
}