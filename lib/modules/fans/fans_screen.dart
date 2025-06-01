import 'package:fanzhashem/modules/fans/fans_item.dart';
import 'package:fanzhashem/utilities/colors.dart';
import 'package:fanzhashem/widgets/shared_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'cubit/cubit.dart';
import 'cubit/states.dart';

class FansScreen extends StatefulWidget {
  const FansScreen({super.key});

  @override
  State<FansScreen> createState() => _FansScreenState();
}

class _FansScreenState extends State<FansScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FansCubit>(
      create: (context) => FansCubit()..getFansList(),
      child: BlocConsumer<FansCubit, FansStates>(
        listener: (context, state) async {},
        builder: (context, state) {
          final fans = FansCubit.get(context).fans;

          return Scaffold(
            key: _scaffoldKey,
            backgroundColor: darkBlackColor,
            appBar: appBar(
              _scaffoldKey,
              "Fans",
              context,
              isMain: false,
              isHome: true,
              isShowFilter: true,
              goldEdgeColor: false,
              refresh: () {},
            ),
            body: fans != null
                ? ScreenUtilInit(
                    minTextAdapt: true,
                    splitScreenMode: true,
                    builder: (context, child) {
                      return Container(
                        margin:
                            EdgeInsets.only(top: ScreenUtil().setHeight(15)),
                        child: SingleChildScrollView(
                          child: ListView.separated(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: fans.fans!.length,
                            itemBuilder: (BuildContext context, int index) {
                              return FanItem(
                                fan: fans.fans![index],
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return SizedBox(
                                height: ScreenUtil().setHeight(10),
                              );
                            },
                          ),
                        ),
                      );
                    },
                  )
                : Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }
}
