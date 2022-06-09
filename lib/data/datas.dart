import 'package:custom_player/models/video.dart';

class Datas {
  Video Video1 = Video(title: "Backshot of a Young Caucasian 1",
  thurbString: "https://cdn.videvo.net/videvo_files/video/premium/getty_43/customThumbnails/istock-1067908172.jpg",
  urlVideo: "https://cdn.videvo.net/videvo_files/video/premium/getty_43/large_watermarked/istock-1067908172_preview.mp4");
  Video Video2 = Video(title: "NF - The Search",
      thurbString: "https://cdn.videvo.net/videvo_files/video/premium/getty_43/customThumbnails/istock-1067908172.jpg",
      urlVideo: "https://www.youtube.com/watch?v=fnlJw9H0xAM&list=PLtWvUfdCEHkBmn07jbOrBuVSS3v3YEBRq&index=1");
  Video Video3 = Video(title: "Backshot of a Young Caucasian 3",
      thurbString: "https://cdn.videvo.net/videvo_files/video/premium/getty_43/customThumbnails/istock-1067908172.jpg",
      urlVideo: "https://cdn.videvo.net/videvo_files/video/premium/getty_43/large_watermarked/istock-1067908172_preview.mp4");
  Video Video4 = Video(title: "Backshot of a Young Caucasian 4",
      thurbString: "https://cdn.videvo.net/videvo_files/video/premium/getty_43/customThumbnails/istock-1067908172.jpg",
      urlVideo: "https://cdn.videvo.net/videvo_files/video/premium/getty_43/large_watermarked/istock-1067908172_preview.mp4");
  List<Video> parseVideo(){
    return [Video1, Video2, Video3, Video4];
  }
}