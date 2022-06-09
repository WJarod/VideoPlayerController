import 'package:custom_player/models/video.dart';
import 'package:custom_player/view/video_tile_view.dart';
import 'package:flutter/material.dart';

import '../data/datas.dart';

class ListController extends StatelessWidget {
  List<Video> videos = Datas().parseVideo();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(itemBuilder: (context, index) => VideoTileView(video: videos[index]), itemCount: videos.length,)
    );
  }
}