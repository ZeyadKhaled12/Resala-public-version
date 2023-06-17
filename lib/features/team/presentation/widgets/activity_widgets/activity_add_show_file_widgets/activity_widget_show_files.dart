import 'package:flutter/material.dart';
import 'package:resala/core/utils/assets_manager.dart';

import '../../../../domain/entities/file.dart';
import '../../../screens/activity_screens/activity_show_file_screen.dart';

class ActivityWidgetShowFiles extends StatelessWidget {
  const ActivityWidgetShowFiles(
      {Key? key, this.videosPaths = const [], this.photosPaths = const [], this.isVideos = false})
      : super(key: key);
  final List<File> videosPaths;
  final List<File> photosPaths;
  final bool isVideos;

  @override
  Widget build(BuildContext context) {
    final List<File> files = videosPaths.isEmpty ? photosPaths : videosPaths;

    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Container(
          width: double.infinity,
          height: files.isNotEmpty
              ? MediaQuery.of(context).size.height * 1 / 2.6
              : null,
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(10)),
          child: files.isEmpty?
          Center(child: Text(isVideos?'لا توجد فيديوهات':'لا يوجد صور', style: const TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.w800,
            fontFamily: FontAssets.sansFont
          ))):
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (_, index) => InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (ctx) {
                  return ActivityShowFileScreen(
                      isShowAct: true,
                      filePath: files[index].file,
                      isVideo: isVideos);
                }));
              },
              child: Container(
                  height: 90,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      border: Border.all(color: Colors.white, width: 8),
                      borderRadius: BorderRadius.circular(15)),
                  child: isVideos
                      ? const Center(
                      child: Icon(Icons.play_circle_filled, color: Colors.white, size: 54))
                      : Image.network(photosPaths[index].file)),
            ),
            itemCount: files.length,
          )),
    );
  }
}
