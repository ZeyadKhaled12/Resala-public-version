import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:resala/core/utils/assets_manager.dart';

import '../../../../../../core/utils/app_constance.dart';

class ProfileUpdateWidgetDropDownAlert extends StatelessWidget {
  const ProfileUpdateWidgetDropDownAlert(
      {Key? key,
      required this.onChanged,
      required this.firstItemSelected,
      required this.isBrunch})
      : super(key: key);
  final Function(String? value) onChanged;
  final String firstItemSelected;
  final bool isBrunch;

  @override
  Widget build(BuildContext context) {

    print(AppConstance.itemsBrunches.length);
    print(AppConstance.itemsActivities.length);

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: DropdownSearch(
        popupProps: PopupProps.menu(
          showSelectedItems: true,
          showSearchBox: true,
          searchFieldProps: const TextFieldProps(
              cursorColor: Colors.black,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black))),
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 19,
                  fontFamily: FontAssets.arabicTitleFont)),
          disabledItemFn: (String s) => s.startsWith('I'),
        ),
        items: isBrunch
            ? AppConstance.itemsBrunches
            : AppConstance.itemsActivities,
        onChanged: onChanged,
        dropdownDecoratorProps: const DropDownDecoratorProps(
            baseStyle: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: FontAssets.arabicTitleFont)),
        dropdownButtonProps: const DropdownButtonProps(
          color: Colors.white,
        ),
        selectedItem: firstItemSelected,
      ),
    );
  }
}
