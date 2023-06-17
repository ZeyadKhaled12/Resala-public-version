import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../configs/colors.dart';
import '../../../../core/services/services_locator.dart';
import '../../../../core/utils/assets_manager.dart';
import '../../../../core/utils/enums.dart';
import '../../../../core/utils/general_widgets/general_bottom_widgets/general_widget_bottom.dart';
import '../../../../core/utils/general_widgets/general_widget_circular_view.dart';
import '../../../login/domain/entities/login.dart';
import '../../domain/entities/ref_category.dart';
import '../../domain/usecases/get_ref_activities_uc.dart';
import '../controller/ref_bloc.dart';
import '../widgets/ref_activities_widgets/ref_activities_widget_body.dart';

class RefActivitiesScreen extends StatelessWidget {
  const RefActivitiesScreen(
      {Key? key, required this.refCategory, required this.login})
      : super(key: key);
  final RefCategory refCategory;
  final Login login;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        iconTheme: const IconThemeData(size: 40, color: Colors.white),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Text(refCategory.name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.w500,
                  fontFamily: FontAssets.arabicSmoothFont,
                )),
          ),
        ),
      ),
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [backGroundBlueColor, const Color(0XFF351A69)],
                begin: Alignment.topLeft,
                end: Alignment.bottomCenter)),
        child: BlocProvider(
          create: (context) => sl<RefBloc>()
            ..add(GetRefActivitiesEvent(
                parameters: GetRefActivitiesParameters(
                    categoryId: refCategory.id, token: login.token))),
          child: BlocConsumer<RefBloc, RefState>(
            buildWhen: (previous, current) =>
                previous.refRequestState != current.refRequestState,
            listener: (context, state) {
              if(state.isUpdateRef){
                Future.delayed(const Duration(milliseconds: 150), () async{
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
                previous.refRequestState != current.refRequestState,
            builder: (context, state) {
              switch (state.refRequestState) {
                case RequestState.loading:
                  return const GeneralWidgetCircularView();
                case RequestState.loaded:
                  return RefActivitiesWidgetBody(
                      refCategory: refCategory,
                      login: login,
                      activities: state.updateActivities);
                case RequestState.error:
                  return const GeneralWidgetCircularView();
              }
            },
          ),
        ),
      ),
    );
  }
}