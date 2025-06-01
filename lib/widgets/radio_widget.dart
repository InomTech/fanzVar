import 'package:flutter/material.dart';

class RadioWidget extends StatelessWidget {
  final String title;
  final String selectedOption;
  final List<String> options;
  final Function onSelected;

  const RadioWidget(
      {super.key,
      required this.title,
      required this.options,
      required this.onSelected,
      required this.selectedOption});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Container(
      alignment: Alignment.centerLeft,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            Container(
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: (12 / 3),
                controller: ScrollController(keepScrollOffset: false),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: options.map((String value) {
                  return Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          onSelected(value);
                        },
                        icon: Icon(
                          selectedOption == value
                              ? Icons.radio_button_checked
                              : Icons.radio_button_off,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        value,
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                    ],
                  );
                }).toList(),
              ),
            ),
          ]),
    );
  }
}
