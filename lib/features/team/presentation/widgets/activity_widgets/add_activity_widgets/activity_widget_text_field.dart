import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:resala/configs/colors.dart';
import '../../../../../../core/utils/assets_manager.dart';
import '../../../../domain/usecases/set_data_activity_uc.dart';
import '../../../controller/team_bloc.dart';

class ActivityWidgetTextField extends StatelessWidget {
  const ActivityWidgetTextField(
      {Key? key,
      required this.hintText,
      this.controller,
      this.height,
      this.maxLines = 1,
      this.isDate = false})
      : super(key: key);
  final String hintText;
  final double? height;
  final int maxLines;
  final bool isDate;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    String? pickDate;
    return BlocBuilder<TeamBloc, TeamState>(
      builder: (context, state) => InkWell(
        onTap: isDate
            ? () => showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1950),
                        lastDate: DateTime.now())
                    .then((pickedDate) {
                  if (pickedDate == null) return;
                  pickDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                  context.read<TeamBloc>().add(SetDateActivityEvent(
                      parameters: SetDateActivityParameters(date: pickDate!)));
                })
            : () {},
        child: Padding(
            padding: const EdgeInsets.only(bottom: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                isDate
                    ? Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: backGroundBlueColor,
                            borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(20),
                                topLeft: Radius.circular(20))),
                        child: const Text(
                          'تحديد التاريخ',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: FontAssets.arabicSmoothFont,
                          ),
                        ),
                      )
                    : Text(hintText,
                        style: const TextStyle(
                            color: Colors.white,
                            fontFamily: FontAssets.arabicSmoothFont,
                            fontSize: 18)),
                Container(
                  margin: EdgeInsets.only(top: isDate ? 0 : 15),
                  width: double.infinity,
                  height: height,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomRight: const Radius.circular(20),
                        bottomLeft: const Radius.circular(20),
                        topLeft: Radius.circular(isDate ? 0 : 20),
                        topRight: Radius.circular(isDate ? 0 : 20),
                      )),
                  child: TextField(
                    maxLines: maxLines,
                    enabled: !isDate,
                    textAlign: TextAlign.center,
                    controller: controller,
                    cursorColor: Colors.black,
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: FontAssets.arabicSmoothFont,
                        fontSize: 20),
                    decoration: InputDecoration(
                        hintStyle: isDate
                            ? const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontFamily: FontAssets.arabicSmoothFont,
                                fontSize: 20)
                            : null,
                        hintText: isDate
                            ? context.watch<TeamBloc>().state.date.isEmpty
                            ? hintText:context.watch<TeamBloc>().state.date
                            : null,
                        isDense: true,
                        border: InputBorder.none),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
