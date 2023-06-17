import 'package:flutter/material.dart';
import '../activity_add_show_file_widgets/activity_widget_add_file_card.dart';
import 'activity_widget_text_field.dart';

class AddActivityWidgetBody extends StatelessWidget {
  const AddActivityWidgetBody(
      {Key? key,
      required this.controllers,
      required this.photosPaths,
      required this.videosPaths,
      required this.addPhotoFun,
      required this.removePhotoFun,
      required this.removeVideoFun,
      required this.addVideoFun,
      required this.maxVideos,
      required this.maxImages})
      : super(key: key);
  final List<TextEditingController> controllers;
  final Function() addPhotoFun;
  final Function() addVideoFun;
  final int maxVideos;
  final int maxImages;
  final Function(int index) removePhotoFun;
  final Function(int index) removeVideoFun;
  final List<String> photosPaths;
  final List<String> videosPaths;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 140),
      child: Column(
        children: [
          ActivityWidgetTextField(
              height: 55,
              hintText: 'عنوان الحدث', controller: controllers[0]),
          ActivityWidgetTextField(
              height: 55,
              hintText: 'أسم المكان', controller: controllers[1]),
          const ActivityWidgetTextField(isDate: true, hintText: 'التاريخ'),

          if (maxImages > 0)
            ActivityWidgetAddFileCard(addFun: addPhotoFun,
                removeFun: removePhotoFun,
                isVideos: false,
                filePaths: photosPaths,
                hintText: 'أضافة صور',
                maxFiles: maxImages),
          if (maxVideos > 0)
            ActivityWidgetAddFileCard(
                hintText: 'أضافة الفيديوهات',
                addFun: addVideoFun,
                isVideos: true,
                removeFun: removeVideoFun,
                filePaths: videosPaths,
                maxFiles: maxVideos),
          ActivityWidgetTextField(
              hintText: 'اضافة وصف',
              controller: controllers[2],
              height: MediaQuery.of(context).size.height * 1 / 4,
              maxLines: 6),
        ],
      ),
    );
  }
}
