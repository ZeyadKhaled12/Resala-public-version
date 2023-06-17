import 'dart:io';

import 'package:flutter/material.dart';
import 'package:resala/core/utils/assets_manager.dart';

import '../../../screens/activity_screens/activity_show_file_screen.dart';

class ActivityWidgetAddFileCard extends StatelessWidget {
  const ActivityWidgetAddFileCard(
      {Key? key,
      required this.hintText,
      required this.addFun,
      required this.removeFun,
      required this.isVideos,
      required this.maxFiles,
      required this.filePaths})
      : super(key: key);

  final String hintText;
  final Function() addFun;
  final int maxFiles;
  final Function(int index) removeFun;
  final List<String> filePaths;
  final bool isVideos;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(hintText,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontFamily: FontAssets.arabicSmoothFont)),
          Container(
              margin: const EdgeInsets.only(top: 15),
              height: MediaQuery.of(context).size.height * 1 / 2.6,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white.withOpacity(0.29),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent:
                          MediaQuery.of(context).size.width * 1 / 2),
                  itemBuilder: (_, index) => InkWell(
                      onTap: !(index + 1 > filePaths.length)
                          ? () async {
                              await Navigator.push(context,
                                  MaterialPageRoute(builder: (ctx) {
                                return ActivityShowFileScreen(
                                    isShowAct: false,
                                    filePath: filePaths[index],
                                    isVideo: isVideos);
                              }));
                            }
                          : filePaths.length >= maxFiles
                              ? () {}
                              : addFun,
                      child: Container(
                        margin: const EdgeInsets.all(6),
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            index + 1 > filePaths.length
                                ? Center(
                                    child: Icon(
                                      isVideos
                                          ? Icons.video_call_outlined
                                          : Icons.add_photo_alternate_outlined,
                                      color: Colors.white,
                                      size: 35,
                                    ),
                                  )
                                : isVideos
                                    ? const Center(
                                        child: Icon(
                                          Icons.play_arrow,
                                          color: Colors.black,
                                          size: 34,
                                        ),
                                      )
                                    : Image.file(File(filePaths[index])),
                            if (!(index + 1 > filePaths.length))
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          Colors.white.withOpacity(0.4),
                                      elevation: 0),
                                  onPressed: () => removeFun(index),
                                  child: const Icon(
                                    Icons.delete,
                                    size: 28,
                                    color: Colors.black,
                                  ))
                          ],
                        ),
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.white, width: 2)),
                      )),
                  itemCount: maxFiles,
                ),
              )),
          Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              '${filePaths.length} / $maxFiles',
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
