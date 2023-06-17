
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/services/services_locator.dart';
import '../../../../core/utils/enums.dart';
import '../../../../core/utils/general_widgets/general_widget_transparent_app_bar.dart';
import '../../../login/domain/entities/login.dart';
import '../../domain/usecases/get_activities_uc.dart';
import '../../domain/usecases/get_categories_uc.dart';
import '../controller/team_bloc.dart';
import '../widgets/categories_widgets/categories_widget_body.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key, required this.login}) : super(key: key);
  final Login login;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => sl<TeamBloc>()
        ..add(GetAllCategoriesAndActivitiesEvent(
            activitiesParameters: GetActivitiesParameters(token: login.token),
            categoriesParameters: GetCategoriesParameters(token: login.token))),
      child: Scaffold(
        appBar: generalTransparentAppBar,
        body: BlocBuilder<TeamBloc, TeamState>(
            buildWhen: (previous, current) =>
                previous.teamRequestState != current.teamRequestState,
            builder: (context, state) {
              switch (state.teamRequestState) {
                case RequestState.loading:
                  return CategoriesWidgetBody(
                      categories: const [],
                      activities: const [],
                      login: login,
                      isLoading: true);
                case RequestState.loaded:
                  return CategoriesWidgetBody(
                    activities: state.activities,
                    categories: state.categories,
                    isLoading: false,
                    login: login,
                  );
                case RequestState.error:
                  return CategoriesWidgetBody(
                      categories: const [],
                      login: login,
                      activities: const [],
                      isLoading: false);
              }
            }),
      ),
    );
  }
}
