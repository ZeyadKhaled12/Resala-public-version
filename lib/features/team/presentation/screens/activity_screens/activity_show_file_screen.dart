import 'dart:io';

import 'package:flutter/material.dart';
import '../../../../../core/utils/general_widgets/general_widget_transparent_app_bar.dart';
import 'activity_play_video_from_url_screen.dart';

class ActivityShowFileScreen extends StatelessWidget {
  const ActivityShowFileScreen(
      {Key? key,
      required this.filePath,
      required this.isVideo,
      required this.isShowAct})
      : super(key: key);
  final String filePath;
  final bool isVideo;
  final bool isShowAct;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: generalTransparentAppBar,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: isVideo
            ? VideoPlayerScreen(videoPath: filePath, isShowAct: isShowAct)
             //GeneralWidgetVideoPlayer(file: File(filePath), isShowAct: isShowAct, url: filePath)
            : isShowAct
                ? Image.network(filePath)
                : Image.file(File(filePath)),
      ),
    );
  }
}
