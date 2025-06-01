import 'package:fanzhashem/models/fan_election_model.dart';
import 'package:fanzhashem/modules/fan_profile/fan_profile_screen.dart';
import 'package:fanzhashem/modules/fans_election/cubit/cubit.dart';
import 'package:fanzhashem/modules/fans_election/cubit/states.dart';
import 'package:fanzhashem/utilities/colors.dart';
import 'package:fanzhashem/widgets/shared_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:percent_indicator/percent_indicator.dart';

late FToast fToast;

class FansElectionScreen extends StatefulWidget {
  const FansElectionScreen({super.key});

  @override
  _FansElectionScreenState createState() => _FansElectionScreenState();
}

class _FansElectionScreenState extends State<FansElectionScreen> {
  List<FanElectionModel> fansElectionList = [];
  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return BlocProvider(
      create: (BuildContext context) => ElectionCubit()..getFansElectionInfo(),
      child: BlocConsumer<ElectionCubit, ElectionStates>(
        listener: (context, state) {
          if (state is GetFansElectionState) {
            fansElectionList = state.fansElectionList;
          }
        },
        builder: (context, state) {
          return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              title: Text("Fans Election results"),
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
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: fansElectionList.length,
                    itemBuilder: (BuildContext ctx, int index) {
                      return fanElectionWidget(
                        fansElectionList[index],
                        context,
                        width,
                        height,
                      );
                    },
                  )
                  // Column(
                  //   children: [
                  //     fanElectionWidget(context, width, height),
                  //     fanElectionWidget(context, width, height),
                  //   ],
                  // ),
                  ),
            ),
          );
        },
      ),
    );
  }

  Widget fanElectionWidget(
      FanElectionModel fan, BuildContext context, double width, double height) {
    double percentage =
        double.tryParse(fan.votePercentage.replaceFirst("%", ""))! / 100;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () => navigateTo(context, FanProfileScreen()),
                child: CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.white,
                  backgroundImage: NetworkImage(fan.fanAvatar),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    // width: width / 5,
                    // color: Colors.red,
                    child: Text(
                      fan.fanName,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                  IconButton(
                    alignment: Alignment.centerLeft,
                    onPressed: () => showYesNoAlertDialog(
                      false,
                      context,
                      "Are you sure that you want to vote this member?",
                      Icons.how_to_vote_outlined,
                      () => fToast.showToast(
                        gravity: ToastGravity.BOTTOM,
                        child: Container(
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: lightBlackColor,
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Text("You voted this member successfully")),
                      ),
                    ),
                    icon: Icon(
                      Icons.add_circle_outline,
                      color: Colors.white,
                    ),
                  )
                ],
              )
            ],
          ),
          SizedBox(
            width: width / 2,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(fan.votePercentage),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 15.0),
                  child: LinearPercentIndicator(
                    width: width / 2,
                    animation: true,
                    lineHeight: 8.0,
                    animationDuration: 2500,
                    percent: percentage,
                    barRadius: Radius.circular(18.0),
                    backgroundColor: lightBlackColor,
                    progressColor: primaryColor,
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    fan.rate,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          CircleAvatar(
            radius: 18,
            backgroundColor: Colors.white,
            backgroundImage: NetworkImage(fan.championAvatar),
          ),
        ],
      ),
    );
  }
}
