import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utilities/colors.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class VotingScreen extends StatelessWidget {
  const VotingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return BlocProvider(
        create: (BuildContext context) => VotingCubit()..getPlayersFun(),
        child: BlocConsumer<VotingCubit, VotingScreenStates>(
            listener: (context, state) async {},
            builder: (context, state) {
              return Scaffold(
                  backgroundColor: darkBlackColor,
                  appBar: AppBar(
                    title: Text('Voting'),
                    centerTitle: true,
                    backgroundColor: lightBlackColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(30),
                      ),
                    ),
                    leading: IconButton(
                      icon: const Icon(Icons.arrow_back_ios_new_rounded),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),
                  body: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 40,
                            child: ListView.separated(
                              itemCount:
                                  VotingCubit.get(context).rowOfList.length,
                              itemBuilder: (context, index) => ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: VotingCubit.get(context)
                                                .indexlist ==
                                            index
                                        ? WidgetStateProperty.all(primaryColor)
                                        : null,
                                  ),
                                  onPressed: () {
                                    VotingCubit.get(context).indexchange(index);
                                    if (VotingCubit.get(context).indexlist ==
                                        0) {
                                      VotingCubit.get(context).getPlayersFun();
                                    } else if (VotingCubit.get(context)
                                            .indexlist ==
                                        1) {
                                      VotingCubit.get(context)
                                          .getCoachesListFun();
                                    } else if (VotingCubit.get(context)
                                            .indexlist ==
                                        2) {
                                      VotingCubit.get(context).getClubsFun();
                                    } else if (VotingCubit.get(context)
                                            .indexlist ==
                                        3) {
                                      VotingCubit.get(context)
                                          .getjournalistsFun();
                                    }
                                  },
                                  child: Text(
                                    VotingCubit.get(context).rowOfList[index],
                                  )),
                              scrollDirection: Axis.horizontal,
                              separatorBuilder:
                                  (BuildContext context, int index) => SizedBox(
                                width: 5,
                              ),
                            ),
                          ),
                          state is LoadingState
                              ? Expanded(
                                  child: Center(
                                      child: CircularProgressIndicator()))
                              : Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: ListView.separated(
                                      itemCount:
                                          VotingCubit.get(context).list.length,
                                      itemBuilder: (context, index) => item(
                                          context,
                                          height,
                                          width,
                                          index,
                                          VotingCubit.get(context).list[index]),
                                      separatorBuilder:
                                          (BuildContext context, int index) =>
                                              SizedBox(
                                        width: 5,
                                      ),
                                    ),
                                  ),
                                )
                        ],
                      ),
                    ),
                  ));
            }));
  }

  Widget item(context, height, width, index, item) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 2),
        child: Stack(
          children: [
            Container(
              height: height / 9,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 7),
              decoration: BoxDecoration(
                  color: lightBlackColor,
                  border: Border.all(color: Color(0xFF424242)),
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  Column(
                    children: [
                      Text(
                        "Rank",
                        style: TextStyle(
                          fontSize: 10,
                          color: Color(0xFF8EA2AB),
                        ),
                      ),
                      SizedBox(height: height / 40),
                      Text('${index + 1}'),
                    ],
                  ),
                  SizedBox(
                    width: width / 1.9,
                    height: 75,
                    child: Center(
                      child: ListTile(
                        horizontalTitleGap: 5.0,
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.network(
                            item['image'],
                            fit: BoxFit.cover,
                            width: width / 7,
                            height: 90,
                          ),
                        ),
                        title: Text(
                          item['name'],
                          maxLines: 2,
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        "Votes Number",
                        style: TextStyle(
                          fontSize: 10,
                          color: Color(0xFF8EA2AB),
                        ),
                      ),
                      SizedBox(height: height / 30),
                      Text("${item['vote_num']}"),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "  Vote %",
                        style: TextStyle(
                          fontSize: 10,
                          color: Color(0xFF8EA2AB),
                        ),
                      ),
                      SizedBox(height: height / 30),
                      Text(
                        "${item['vote_presentage']}",
                        style: TextStyle(
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
