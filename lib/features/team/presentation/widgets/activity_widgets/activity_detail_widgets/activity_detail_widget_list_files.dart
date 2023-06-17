import 'package:flutter/material.dart';
import 'package:resala/core/utils/assets_manager.dart';

import '../../../../domain/entities/file.dart';
import '../../../screens/activity_screens/activity_show_file_screen.dart';

class ActivityDetailWidgetListFiles extends StatelessWidget {
  const ActivityDetailWidgetListFiles({Key? key, required this.isVideos, required this.files})
      : super(key: key);
  final bool isVideos;
  final List<File> files;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height * 1 / 3,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Text(isVideos?'فيديوهات':'الصور',
                  style: const TextStyle(
                      color: Colors.white,
                      fontFamily: FontAssets.arabicSmoothFont,
                      fontSize: 20)),
            ),
            const Padding(padding: EdgeInsets.only(bottom: 20)),
            Expanded(
              child: ListView.builder(
                reverse: true,
                  itemBuilder: (context, index) => InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (ctx) {
                        return ActivityShowFileScreen(
                            isShowAct: true,
                            filePath: files[index].file,
                            isVideo: isVideos);
                      }));
                    },
                    child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white.withOpacity(0.25)),
                          margin: const EdgeInsets.only(left: 20),
                          padding: const EdgeInsets.all(40),
                          child: Center(
                            child: isVideos?Icon(Icons.play_arrow,
                                size: 50, color: Colors.white.withOpacity(0.5)):
                            Image.network(files[index].file),
                          ),
                        ),
                  ),
                  scrollDirection: Axis.horizontal, itemCount: files.length),
            )
          ],
        ));
  }
}
