import 'package:flutter/material.dart';
import 'package:resala/core/utils/assets_manager.dart';

class ActivityDetailWidgetAlertDialog extends StatelessWidget {
  const ActivityDetailWidgetAlertDialog({Key? key, required this.flaggedFun})
      : super(key: key);
  final Function() flaggedFun;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40)
      ),
      contentPadding: EdgeInsets.zero,
      content:  Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40), topRight: Radius.circular(40)),
              color: Colors.red,
            ),
            child: const Center(
              child: CircleAvatar(
                radius: 25,
                backgroundColor: Colors.yellow,
                child: Center(
                  child: Text(
                    '!',
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 32,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
          const Padding(padding: EdgeInsets.only(bottom: 15)),
          const Text('! تنبيه',
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: FontAssets.arabicTitleFont,
                  fontSize: 25,
                  fontWeight: FontWeight.bold)),
          const Padding(padding: EdgeInsets.only(bottom: 22)),
          const Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Text('هل ترغب في تقديم اعتراض علي نتيجة الحدث',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: FontAssets.arabicTitleFont),
                textAlign: TextAlign.end),
          ),
          Container(
            margin: const EdgeInsets.only(left: 26, right: 26, top: 10),
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        side: const BorderSide(color: Colors.red, width: 1),
                        borderRadius: BorderRadius.circular(20))),
                child: const Text(
                  'لا',
                  style: TextStyle(
                    color: Colors.red,
                    fontFamily: FontAssets.arabicSmoothFont,
                    fontSize: 20,
                  ),
                )),
          ),
          Container(
            margin: const EdgeInsets.only(left: 26, right: 26),
            width: double.infinity,
            child: ElevatedButton(
                onPressed: (){
                  flaggedFun();
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        side: const BorderSide(color: Colors.red, width: 1),
                        borderRadius: BorderRadius.circular(20))),
                child: const Text(
                  'نعم',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: FontAssets.arabicSmoothFont,
                    fontSize: 20,
                  ),
                )),
          )
        ],
      ),
    );
  }
}
