import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/services/services_locator.dart';
import '../../../../core/utils/enums.dart';
import '../../../../core/utils/general_widgets/general_widget_circular_view.dart';
import '../../../../core/utils/general_widgets/general_widget_transparent_app_bar.dart';
import '../../../login/domain/entities/login.dart';
import '../../domain/usecases/get_ref_categories_uc.dart';
import '../controller/ref_bloc.dart';
import '../widgets/ref_categories_widgets/ref_categories_body.dart';

class RefCategoriesScreen extends StatelessWidget {
  const RefCategoriesScreen({Key? key, required this.login}) : super(key: key);
  final Login login;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: generalTransparentAppBar,
        body: BlocProvider(
      create: (context) => sl<RefBloc>()
        ..add(GetRefCategoriesEvent(
            parameters: GetRefCategoriesParameters(token: login.token))),
      child: BlocBuilder<RefBloc, RefState>(builder: (context, state) {
        switch (state.refRequestState) {
          case RequestState.loading:
            return const GeneralWidgetCircularView();
          case RequestState.loaded:
            return RefCategoriesBody(
                refCategories: state.refCategories, login: login);
          case RequestState.error:
            return const GeneralWidgetCircularView();
        }
      }),
    ));
  }
}
