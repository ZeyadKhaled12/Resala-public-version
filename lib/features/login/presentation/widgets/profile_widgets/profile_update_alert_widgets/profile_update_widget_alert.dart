import 'package:flutter/material.dart';
import 'package:resala/configs/colors.dart';
import 'package:resala/core/utils/assets_manager.dart';

import 'profile_update_widget_drop_down_alert.dart';
import 'profile_update_widget_txt_field_alert.dart';

class ProfileUpdateWidgetAlert extends StatefulWidget {
  const ProfileUpdateWidgetAlert(
      {Key? key,
      this.hintText = '',
      this.hintTexts = const [],
      required this.updateFunSingle,
      required this.updateFunList,
      required this.isList,
      this.isBrunch = false,
      this.isName = false})
      : super(key: key);
  final String hintText;
  final List<String> hintTexts;
  final bool isList;
  final Function(String value) updateFunSingle;
  final Function(List<String> values) updateFunList;
  final bool isBrunch;
  final bool isName;

  @override
  State<ProfileUpdateWidgetAlert> createState() =>
      _ProfileUpdateWidgetAlertState();
}

class _ProfileUpdateWidgetAlertState extends State<ProfileUpdateWidgetAlert> {
  late List<TextEditingController> controllers = [];
  late TextEditingController controller = TextEditingController();
  String itemSelected = '';

  @override
  void initState() {
    if (widget.isList) {
      controllers = List.generate(widget.hintTexts.length,
          (index) => TextEditingController(text: widget.hintTexts[index]));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(28),
      ),
      content: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: backGroundBlueColor.withOpacity(0.8),
          borderRadius: BorderRadius.circular(28),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text('ادخل اسم جديد',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: FontAssets.arabicTitleFont)),
              if (widget.isList)
                IconButton(
                    onPressed: () {
                      setState(() {
                        controllers.insert(0, TextEditingController());
                      });
                    },
                    icon: const Icon(
                      Icons.add_circle_outline,
                      color: Colors.white,
                      size: 38,
                    )),
              const Padding(padding: EdgeInsets.only(top: 20)),
              !widget.isList
                  ? widget.isName
                      ? ProfileUpdateWidgetTxtFieldAlert(
                          hintText: widget.hintText,
                          textEditingController: controller)
                      : ProfileUpdateWidgetDropDownAlert(
                          isBrunch: widget.isBrunch,
                          onChanged: (value) {
                            setState(() {
                              itemSelected = value!;
                            });
                          },
                          firstItemSelected: widget.hintText,
                        )
                  : SizedBox(
                      height: MediaQuery.of(context).size.height * 1 / 4,
                      child: ListView(
                        shrinkWrap: true,
                        children: List.generate(
                            controllers.length,
                            (index) => ProfileUpdateWidgetTxtFieldAlert(
                                removeFun: () {
                                  setState(() {
                                    controllers.removeAt(index);
                                  });
                                },
                                hintText: 'ادخل اسم جديد',
                                textEditingController: controllers[index])),
                      ),
                    ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(left: 15, right: 15),
                child: ElevatedButton(
                    onPressed: !widget.isList
                        ? () => widget.updateFunSingle(
                            widget.isName ? controller.text : itemSelected)
                        : () => widget.updateFunList(
                            controllers.toList().map((e) => e.text).toList()),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: backGroundOrangeColor,
                    ),
                    child: const Text('تعديل',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: FontAssets.arabicTitleFont))),
              ),
              const Padding(padding: EdgeInsets.only(top: 20)),
            ],
          ),
        ),
      ),
    );
  }
}
