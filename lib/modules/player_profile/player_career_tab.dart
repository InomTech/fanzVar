import 'dart:developer';

import 'package:fanzhashem/modules/player_profile/cubit/cubit.dart';
import 'package:fanzhashem/utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/dropdown_menu_widget.dart';
import 'cubit/states.dart';

class PlayerCareerTab extends StatefulWidget {
  final career;
  const PlayerCareerTab({required this.career, super.key});
  @override
  State<PlayerCareerTab> createState() => _PlayerCareerTabState();
}

class _PlayerCareerTabState extends State<PlayerCareerTab> {
  var careeryear;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    String? selectedValueCategory;
    print(widget.career);
    careeryear = widget.career[0];
    // List<String,dynamic> careerYear ;
    // = widget.career[0];
    return BlocProvider(
      create: (BuildContext context) => PlayerProfileCubit(),
      child: BlocConsumer<PlayerProfileCubit, PlayerProfileStates>(
        listener: (context, state) async {
          if (state is SelectValueCYear) {
            careeryear = widget.career
                .firstWhere((e) => e["year"] == selectedValueCategory);
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView(
                children: [
                  Container(
                      padding: EdgeInsets.only(top: 25.0, right: 0, left: 0),
                      child: DropDownMenuWidget(
                        isMatchSchdual: true,
                        hint: 'Choose Year',
                        items: PlayerProfileCubit.get(context).Years,
                        selectedValue: selectedValueCategory,
                        onChanged: (val) {
                          PlayerProfileCubit.get(context)
                              .selectValueYear(val.toString());
                          log("${PlayerProfileCubit.get(context).selectedYear}");
                          setState(() {
                            selectedValueCategory = val;
                            careeryear = widget.career
                                .firstWhere((e) => e["year"] == val);
                          });
                          print(careeryear);
                        },
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: DataTable(
                      // horizontalMargin: 10,
                      decoration: BoxDecoration(

                          // color: darkBlackColor,
                          ),
                      headingRowColor: WidgetStateProperty.all(darkBlackColor),
                      columnSpacing: 40,
                      // dataRowColor :Color
                      columns: const <DataColumn>[
                        DataColumn(
                          label: Text(
                            "Club",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        DataColumn(
                            label: Text(
                          "Matches",
                          style: TextStyle(color: Colors.white),
                        )),
                        DataColumn(
                          label: Text(
                            "Goals",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            "Assit",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                      rows: <DataRow>[
                        DataRow(
                          cells: <DataCell>[
                            DataCell(Text(
                              careeryear['team_name'],
                              style: TextStyle(color: primaryColor),
                            )),
                            DataCell(Text(
                              careeryear['matches'],
                              style: TextStyle(color: primaryColor),
                            )),
                            DataCell(Text(
                              careeryear['goals'],
                              style: TextStyle(color: primaryColor),
                            )),
                            DataCell(Text(
                              careeryear['assit'],
                              style: TextStyle(color: primaryColor),
                            )),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
    // return Padding(
    //   padding: const EdgeInsets.symmetric(vertical: 8.0),
    //   child: ListView.builder(
    //     itemCount: playerCareer.length,
    //     itemBuilder: (BuildContext context, int index) {
    //       return careerWidget(playerCareer[index], width, height);
    //     },
    //   ),
    // );
  }
}



// class PlayerCareerTab extends StatelessWidget {
//   final List<CareerModel> playerCareer;
//   const PlayerCareerTab({required this.playerCareer, Key? key})
//       : super(key: key);

//   @override
 

//   Widget careerWidget(CareerModel careerObj, double width, double height) {
//     return Padding(
//       padding: const EdgeInsets.all(10.0),
//       child: Container(
//         decoration: BoxDecoration(
//           color: lightBlackColor,
//           borderRadius: BorderRadius.all(
//             Radius.circular(15.0),
//           ),
//         ),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
        
           
//           ],
//         ),
//       ),
//     );
//   }
// }
