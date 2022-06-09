import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import '../data/datas.dart';
import '../models/video.dart';

class PlayerController extends StatefulWidget {
  final Video video;
  const PlayerController({Key? key , required this.video}) : super(key: key);

  @override
  PlayerControllerState createState() => PlayerControllerState();
}

class PlayerControllerState extends State<PlayerController> {
  late VideoPlayerController _VideoPlayerController;
  late Video _video;
  late int index;
  bool canMountVideoPlayer() => _VideoPlayerController.value.isInitialized;
  bool isPlaying() => _VideoPlayerController.value.isPlaying;
  int getIndex() => Datas().parseVideo().indexWhere((element) => _video.urlVideo == element.urlVideo);

  @override
  void initState() {
    super.initState();
    _video = widget.video;
    index = getIndex();
    configurePlayer();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    delePlayer();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text(_video.title),),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            canMountVideoPlayer()
                ? AspectRatio(aspectRatio: _VideoPlayerController.value.aspectRatio,
              child: VideoPlayer(_VideoPlayerController),)
                : Container(),
            Text(_video.title, style: TextStyle(color: Theme.of(context).colorScheme.secondary, fontSize: 20, fontWeight: FontWeight.w400),),
            Container(
              margin: EdgeInsets.all(10),
              child: Card(
                elevation: 3,
                child: Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(onPressed: previous, icon: Icon(Icons.skip_previous), color: Theme.of(context).colorScheme.secondary),
                      IconButton(onPressed: playPause, icon: Icon(isPlaying() ? Icons.play_arrow : Icons.pause), color: Theme.of(context).colorScheme.secondary),
                      IconButton(onPressed: next, icon: Icon(Icons.skip_next), color: Theme.of(context).colorScheme.secondary)
                    ],
                  ),
                ),
              ),
            ),
            VideoProgressIndicator(_VideoPlayerController, allowScrubbing: true),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(_VideoPlayerController.value.position.inSeconds.toString() + "s"),
                Text(_VideoPlayerController.value.duration.inSeconds.toString() + "s")
              ],
            ),
            Container(
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final newVideo = Datas().parseVideo()[index];
                    return InkWell(
                      onTap: (() => null),
                      child: Padding(
                        padding: EdgeInsets.all(5),
                        child: ClipRect(
                          child: Image.network(newVideo.thurbString),
                        ),
                      ),
                    );
                  },itemCount: Datas().parseVideo().length,),
            ),
          ],
        ),
      ),
    );
  }

  configurePlayer(){
    _VideoPlayerController = VideoPlayerController.network(_video.urlVideo);
    _VideoPlayerController.initialize().then((isInit) => update());
    _VideoPlayerController.setLooping(true);
    _VideoPlayerController.addListener(() => update());
    _VideoPlayerController.play();
  }

  delePlayer(){
    _VideoPlayerController.dispose();
  }

  update(){
    setState(() {

    });
  }

  playPause(){
    isPlaying() ? _VideoPlayerController.pause() : _VideoPlayerController.play();
    update();
  }

  next(){
  index = (index == Datas().parseVideo().length -1) ? 0 : index + 1;
  _video = Datas().parseVideo()[index];
  configurePlayer();
  }

  previous(){
    index = (index == 0) ? Datas().parseVideo().length -1 : index -1;
    _video = Datas().parseVideo()[index];
    configurePlayer();
  }
}