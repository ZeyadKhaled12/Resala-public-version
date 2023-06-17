import 'package:flutter/material.dart';
import 'package:resala/core/utils/assets_manager.dart';
import 'package:resala/features/login/domain/entities/login.dart';
import '../../../../../configs/colors.dart';
import '../../../domain/entities/ref_category.dart';
import 'ref_categories_widget_card.dart';

class RefCategoriesBody extends StatelessWidget {
  const RefCategoriesBody(
      {Key? key, required this.refCategories, required this.login})
      : super(key: key);
  final List<RefCategory> refCategories;
  final Login login;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [backGroundOrangeColor, backGroundBlueColor],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: const [0, 0.6])),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 2/3.8,
            decoration:BoxDecoration(
                gradient: LinearGradient(colors: [
                  const Color(0XFF381663).withOpacity(0.6),
                  Colors.transparent,
                  const Color(0XFF381663).withOpacity(0.6),
                ])),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25, top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Padding(padding: EdgeInsets.only(top: 40)),
                const Text(
                  'مرحبا بك في تطبيق',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.9,
                      fontFamily: FontAssets.arabicTitleFont),
                ),
                const Text(
                  'مسابقات رسالة',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                      fontFamily: FontAssets.arabicTitleFont),
                ),
                const Padding(padding: EdgeInsets.only(bottom: 20)),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) => RefCategoriesWidgetCard(
                        refCategory: refCategories[index], login: login),
                    itemCount: refCategories.length,
                  ),
                )
              ],
            ),
          ),

        ],
      ),
    );
  }
}
