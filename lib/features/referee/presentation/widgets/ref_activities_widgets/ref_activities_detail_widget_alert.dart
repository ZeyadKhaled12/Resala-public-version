import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:resala/configs/colors.dart';
import 'package:resala/core/utils/assets_manager.dart';

class RefActivitiesDetailWidgetAlert extends StatefulWidget {
  const RefActivitiesDetailWidgetAlert(
      {Key? key,
      this.refuseFun,
      this.acceptFun,
      this.refuseFlagFun,
      required this.isFlag})
      : super(key: key);
  final Function()? refuseFun;
  final Function(int score)? acceptFun;
  final Function()? refuseFlagFun;
  final bool isFlag;

  @override
  State<RefActivitiesDetailWidgetAlert> createState() =>
      _RefActivitiesDetailWidgetAlertState();
}

class _RefActivitiesDetailWidgetAlertState
    extends State<RefActivitiesDetailWidgetAlert> {
  bool isScore = false;
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      contentPadding: EdgeInsets.zero,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('تعديل حالة الحدث',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontFamily: FontAssets.arabicTitleFont)),
          if (isScore)
            Container(
              margin: const EdgeInsets.only(left: 25, right: 25),
              child: TextField(
                cursorColor: Colors.black,
                textAlign: TextAlign.center,
                controller: controller,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  hintText: 'score',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 22,
                  ),
                ),
              ),
            ),
          if (isScore)
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: button(
                  title: 'تعديل',
                  onPressed: () {
                    widget.acceptFun!(int.parse(controller.text));
                    Navigator.pop(context);
                  },
                  backGroundColor: backGroundOrangeColor),
            ),
          if (!isScore)
            button(
                title: widget.isFlag ? 'قبول الاعتراض' : ' قبول الحدث',
                onPressed: () {
                  setState(() {
                    isScore = true;
                  });
                },
                backGroundColor: Colors.green.withOpacity(0.6)),
          if (!isScore)
            button(
                title: widget.isFlag ? 'رفض الاعتراض' : 'رفض الحدث',
                onPressed: () {
                  if (widget.isFlag) {
                    widget.refuseFlagFun!();
                  } else {
                    widget.refuseFun!();
                  }
                  Navigator.pop(context);
                },
                backGroundColor: Colors.red.withOpacity(0.6)),
        ],
      ),
    );
  }
}

Widget button(
    {required String title,
    required Color backGroundColor,
    required Function() onPressed}) {
  return Container(
    padding: const EdgeInsets.only(left: 40, right: 40, bottom: 12),
    width: double.infinity,
    child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: backGroundColor,
            padding: const EdgeInsets.all(8),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15))),
        child: Text(
          title,
          style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontFamily: FontAssets.arabicSmoothFont),
        )),
  );
}
