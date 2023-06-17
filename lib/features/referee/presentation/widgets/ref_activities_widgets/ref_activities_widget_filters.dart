import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/app_constance.dart';
import '../../../../../core/utils/assets_manager.dart';
import '../../../domain/entities/ref_category.dart';
import '../../controller/ref_bloc.dart';

class RefActivitiesWidgetFilters extends StatefulWidget {
  const RefActivitiesWidgetFilters(
      {Key? key, required this.token, required this.refCategory})
      : super(key: key);
  final String token;
  final RefCategory refCategory;

  @override
  State<RefActivitiesWidgetFilters> createState() =>
      _RefActivitiesWidgetFiltersState();
}

class _RefActivitiesWidgetFiltersState
    extends State<RefActivitiesWidgetFilters> {
  late int index;

  late List<String> titles;
  late List<String> status;
  late List<int> values;
  late List<Color> primaryColors;
  late List<Color> secondaryColors;

  @override
  void initState() {
    index = 0;
    titles = ['الكل', 'جديد', 'مقبول', 'اعتراض', 'مرفوض'];
    status = [
      'all',
      AppConstance.pending,
      AppConstance.accept,
      AppConstance.flag,
      AppConstance.rejected
    ];
    values = [
      (widget.refCategory.pendingCount +
          widget.refCategory.acceptedCount +
          widget.refCategory.objectedCount +
          widget.refCategory.rejectedCount),
      widget.refCategory.pendingCount,
      widget.refCategory.acceptedCount,
      widget.refCategory.objectedCount,
      widget.refCategory.rejectedCount
    ];
    primaryColors = [
      Colors.white,
      const Color(0XFFF5BA83),
      const Color(0XFF83F5A3),
      Colors.blue,
      const Color(0XFFF58383),
    ];
    secondaryColors = [
      Colors.grey,
      const Color(0XFFE38C3A),
      const Color(0XFF19E151),
      Colors.blue,
      const Color(0XFFC14444),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      margin: const EdgeInsets.only(left: 20),
      width: double.infinity,
      child: ListView(
        shrinkWrap: true,
        reverse: true,
        scrollDirection: Axis.horizontal,
        children: List.generate(
            titles.length,
            (index) => filter(
                    context,
                    titles[index],
                    values[index],
                    primaryColors[index],
                    secondaryColors[index],
                    this.index == index, () {
                  setState(() {
                    this.index = index;
                  });
                  context
                      .read<RefBloc>()
                      .add(GetUpdateRefActivitiesEvent(status: status[index]));
                })),
      ),
    );
  }
}

Widget filter(BuildContext context, String title, int num, Color primary,
    Color secondary, bool isChosen, Function() fun) {
  return InkWell(
    onTap: fun,
    child: Container(
      width: MediaQuery.of(context).size.width * 1 / 3,
      margin: const EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
          color: primary,
          border: isChosen ? Border.all(color: Colors.white, width: 4) : null,
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Padding(
            padding: EdgeInsets.only(
              top: 15,
            ),
          ),
          Text(title,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontFamily: FontAssets.arabicTitleFont)),
          const Padding(
            padding: EdgeInsets.only(bottom: 8),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 12, bottom: 12),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: secondary),
            child: Center(
              child: Text('$num',
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
            ),
          )
        ],
      ),
    ),
  );
}
