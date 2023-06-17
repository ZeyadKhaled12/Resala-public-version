import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../configs/colors.dart';
import '../../../../../core/utils/app_constance.dart';
import '../../../../../core/utils/assets_manager.dart';
import '../../../domain/entities/login.dart';
import '../../../domain/usecases/update_profile_uc.dart';
import '../../controller/login_bloc.dart';
import 'profile_widget_image_title.dart';
import 'profile_widget_list_card.dart';
import 'profile_widget_title_card.dart';

class ProfileWidgetBody extends StatelessWidget {
  const ProfileWidgetBody(
      {Key? key, required this.logoutFun, required this.login})
      : super(key: key);
  final Function() logoutFun;
  final Login login;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [Color(0XFF331659), Colors.transparent, Color(0XFF331659)],
          )),
          width: double.infinity,
          height: double.infinity,
        ),
        SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              if (!login.isReferee)
                Column(
                  children: [
                    ProfileWidgetImageTitle(
                      title: login.profileData.name,
                      funChangeTitle: (value) {
                        if (value.isNotEmpty) {
                          context.read<LoginBloc>().add(UpdateProfileEvent(
                              updateProfileParameters: UpdateProfileParameters(
                                  login: login,
                                  token: login.token,
                                  teamName: value)));
                          Navigator.pop(context);
                        }
                      },
                      funChangeImage: () async {
                        PickedFile? image = await ImagePicker()
                            .getImage(source: ImageSource.gallery);
                        context.read<LoginBloc>().add(UpdateProfileEvent(
                            updateProfileParameters: UpdateProfileParameters(
                                login: login,
                                token: login.token,
                                imagePath: image!.path)));
                      },
                      imageUrl: login.profileData.image
                              .contains(AppConstance.baseUrl)
                          ? login.profileData.image
                          : '${AppConstance.baseUrl}${login.profileData.image}',
                    ),
                    ProfileWidgetTitleCard(
                        title: 'اسم النشاط',
                        isBrunch: false,
                        updateFunSingle: (value) {
                          if (value.isNotEmpty) {
                            context.read<LoginBloc>().add(UpdateProfileEvent(
                                updateProfileParameters:
                                    UpdateProfileParameters(
                                        login: login,
                                        token: login.token,
                                        activityName: value)));
                            Navigator.pop(context);
                          }
                        },
                        body: login.profileData.activityName,
                        iconData: Icons.title),
                    ProfileWidgetTitleCard(
                        title: 'الفرع',
                        isBrunch: true,
                        updateFunSingle: (value) {
                          if (value.isNotEmpty) {
                            context.read<LoginBloc>().add(UpdateProfileEvent(
                                updateProfileParameters:
                                    UpdateProfileParameters(
                                        login: login,
                                        token: login.token,
                                        brunch: value)));
                            Navigator.pop(context);
                          }
                        },
                        body: login.profileData.brunch,
                        iconData: Icons.location_on),
                    ProfileWidgetListCard(
                        updateFunList: (values) {
                          if (!values.contains('')) {
                            context.read<LoginBloc>().add(UpdateProfileEvent(
                                updateProfileParameters:
                                    UpdateProfileParameters(
                                        login: login,
                                        token: login.token,
                                        members: values)));
                            Navigator.pop(context);
                          }
                        },
                        title: 'الاعضاء',
                        list: login.profileData.members),
                    ProfileWidgetListCard(
                        updateFunList: (values) {
                          if (!values.contains('')) {
                            context.read<LoginBloc>().add(UpdateProfileEvent(
                                updateProfileParameters:
                                    UpdateProfileParameters(
                                        login: login,
                                        token: login.token,
                                        leaders: values)));
                            Navigator.pop(context);
                          }
                        },
                        title: 'القادة',
                        list: login.profileData.leaders),
                  ],
                ),
              const Padding(padding: EdgeInsets.only(bottom: 25)),
              login.isReferee
                  ? Center(child: logoutBtn(logoutFun))
                  : logoutBtn(logoutFun),
              const Padding(padding: EdgeInsets.only(bottom: 25)),
            ],
          ),
        ),
      ],
    );
  }
}

Widget logoutBtn(Function() logoutFun) {
  return Padding(
    padding: const EdgeInsets.only(left: 25, right: 25),
    child: TextButton(
        onPressed: logoutFun,
        child: Text('تسجيل الخروج',
            style: TextStyle(
                color: orangeColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: FontAssets.arabicTitleFont))),
  );
}
