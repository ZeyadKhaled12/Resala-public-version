import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:resala/configs/colors.dart';
import 'package:resala/core/services/services_locator.dart';
import 'package:resala/features/login/domain/entities/login.dart';
import 'package:resala/features/team/domain/entities/activity.dart';
import 'package:resala/features/team/domain/entities/category.dart';

import '../../../../../core/utils/enums.dart';
import '../../../../../core/utils/general_widgets/general_bottom_widgets/general_widget_bottom.dart';
import '../../../../../core/utils/general_widgets/general_title_body_widget.dart';
import '../../../../../core/utils/general_widgets/general_widget_circular_view.dart';
import '../../../../../core/utils/general_widgets/general_widget_show_error_message.dart';
import '../../../domain/usecases/add_activity_uc.dart';
import '../../../domain/usecases/chose_photos_paths_uc.dart';
import '../../../domain/usecases/chose_videos_paths_uc.dart';
import '../../../domain/usecases/remove_photo_path_uc.dart';
import '../../../domain/usecases/remove_video_path_uc.dart';
import '../../controller/team_bloc.dart';
import '../../widgets/activity_widgets/add_activity_widgets/activity_widget_add_button.dart';
import '../../widgets/activity_widgets/add_activity_widgets/add_activity_widget_body.dart';

class AddActivityScreen extends StatelessWidget {
  AddActivityScreen(
      {Key? key,
      required this.category,
      required this.login,
      required this.activities})
      : super(key: key);
  final List<Activity> activities;
  final Category category;
  final Login login;
  final List<TextEditingController> _controllers =
      List.generate(3, (index) => TextEditingController());

  @override
  Widget build(BuildContext context) {
    return GeneralTitleBodyWidget(
      title: 'أضافة حركة/ حدث',
      body: BlocProvider(
        create: (context) => sl<TeamBloc>(),
        child: BlocConsumer<TeamBloc, TeamState>(
          listener: (context, state) {
            if (state.teamRequestState == RequestState.error) {
              generalWidgetShowErrorMessage(context, state.errorTeamMessage);
            } else if (state.activities.length > activities.length) {
              Future.delayed(const Duration(milliseconds: 100), () async {
                Navigator.pop(context);
                Navigator.pop(context);
                await Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GeneralWidgetBottom(login: login),
                    ));
              });
            }
          },
          listenWhen: (previous, current) =>
              previous.teamRequestState != current.teamRequestState,
          buildWhen: (previous, current) =>
              previous.teamRequestState != current.teamRequestState,
          builder: (context, state) {
            return Stack(
              children: [
                SingleChildScrollView(
                  child: Container(
                    margin: const EdgeInsets.only(top: 50),
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50)),
                        gradient: LinearGradient(
                            colors: [
                              backGroundOrangeColor,
                              backGroundBlueColor
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          AddActivityWidgetBody(
                            maxVideos: category.maxVideos,
                            maxImages: category.maxPhotos,
                            removePhotoFun: (index) => context
                                .read<TeamBloc>()
                                .add(RemovePhotoPathEvent(
                                    parameters: RemovePhotoPathParameters(
                                        index: index))),
                            removeVideoFun: (index) => context
                                .read<TeamBloc>()
                                .add(RemoveVideoPathEvent(
                                    parameters: RemoveVideoPathParameters(
                                        index: index))),
                            photosPaths: context
                                .watch<TeamBloc>()
                                .state
                                .chosenPhotosPaths,
                            videosPaths: context
                                .watch<TeamBloc>()
                                .state
                                .chosenVideosPaths,
                            controllers: _controllers,
                            addPhotoFun: () async {
                              PickedFile? image = await ImagePicker()
                                  .getImage(source: ImageSource.gallery);
                              context.read<TeamBloc>().add(
                                  ChosePhotosPathsEvent(
                                      parameters: ChosePhotosPathsParameters(
                                          photosPaths: state.chosenPhotosPaths,
                                          path: image!.path)));
                            },
                            addVideoFun: () async {
                              PickedFile? video = await ImagePicker()
                                  .getVideo(source: ImageSource.gallery);
                              if ((File(video!.path).lengthSync() / 1000000)
                                      .ceil() <=
                                  50) {
                                context.read<TeamBloc>().add(
                                    ChoseVideosPathsEvent(
                                        parameters: ChoseVideosPathsParameters(
                                            videosPaths:
                                                state.chosenVideosPaths,
                                            path: video.path)));
                              } else {
                                generalWidgetShowErrorMessage(context,
                                    'المقطع تخطي الحد المسموح(10 mega byte)');
                              }
                            },
                          ),
                          ActivityWidgetAddButton(fun: () {
                            if (_controllers[0].text.isEmpty) {
                              generalWidgetShowErrorMessage(
                                  context, 'عنوان الحدث مطلوب');
                            }
                            else if (_controllers[1].text.isEmpty) {
                              generalWidgetShowErrorMessage(
                                  context, 'اسم المكان مطلوب');
                            } else if (state.date.isEmpty) {
                              generalWidgetShowErrorMessage(
                                  context, 'التاريخ مطلوب');
                            } else if (_controllers[2].text.isEmpty) {
                              generalWidgetShowErrorMessage(
                                  context, 'الوصف مطلوب');
                            } else if (BlocProvider.of<TeamBloc>(context,
                                        listen: false)
                                    .state
                                    .chosenPhotosPaths
                                    .length <
                                category.minPhotos) {
                              generalWidgetShowErrorMessage(context,
                                  '${'مطلوب'} ${category.minPhotos} صورة علي الاقل ');
                            } else if (BlocProvider.of<TeamBloc>(context,
                                        listen: false)
                                    .state
                                    .chosenVideosPaths
                                    .length <
                                category.minVideos) {
                              generalWidgetShowErrorMessage(context,
                                  '${'مطلوب'} ${category.minVideos} فيديو علي الاقل ');
                            } else {
                              context.read<TeamBloc>().add(AddActivityEvent(
                                  parameters: AddActivityParameters(
                                      photosPaths: state.chosenPhotosPaths,
                                      activities: activities,
                                      categoryId: category.id,
                                      videosPath: state.chosenVideosPaths,
                                      locationName: _controllers[1].text,
                                      activityTitle: _controllers[0].text,
                                      date: state.date,
                                      description: _controllers[2].text,
                                      token: login.token)));
                            }
                          }),
                        ],
                      ),
                    ),
                  ),
                ),
                if (context.watch<TeamBloc>().state.teamRequestState ==
                    RequestState.loading)
                  const GeneralWidgetCircularView()
              ],
            );
          },
        ),
      ),
    );
  }
}
