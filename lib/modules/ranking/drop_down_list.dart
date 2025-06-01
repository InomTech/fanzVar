import 'package:fanzhashem/utilities/colors.dart';
import 'package:flutter/material.dart';

class DropDownList extends StatelessWidget {
  final arrList;
  final dropdownValue;
  final void Function(String?) fun;
  const DropDownList(
      {required this.dropdownValue,
      required this.arrList,
      required this.fun,
      super.key});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.065,
      width: size.width * 0.46,
      padding: const EdgeInsets.only(left: 10, right: 5),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(
              width: 1.0, style: BorderStyle.solid, color: primaryColor),
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          items: arrList.map<DropdownMenuItem<String>>((selectedItem) {
            return DropdownMenuItem<String>(
              value: selectedItem,
              child: Text(
                selectedItem,
                maxLines: 1,
              ),
            );
          }).toList(),
          onChanged: fun,
          value: dropdownValue,
        ),
      ),
    );
  }
}
