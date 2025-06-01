import 'package:fanzhashem/modules/promos/cubit/cubit.dart';
import 'package:fanzhashem/modules/promos/cubit/states.dart';
import 'package:fanzhashem/utilities/colors.dart';
import 'package:fanzhashem/widgets/shared_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Promos extends StatefulWidget {
  const Promos({super.key});

  @override
  _PromosState createState() => _PromosState();
}

class _PromosState extends State<Promos> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return BlocProvider<PromosCubit>(
        create: (context) => PromosCubit()..getPromos(),
        child: BlocConsumer<PromosCubit, PromosStates>(
            listener: (context, state) async {},
            builder: (context, state) => Scaffold(
                key: _scaffoldKey,
                resizeToAvoidBottomInset: false,
                appBar: appBar(_scaffoldKey, "Promos", context),
                backgroundColor: lightBlackColor,
                body: Container(
                  child: BlocProvider.of<PromosCubit>(context).isLoading
                      ? ShowLoading()
                      : ListView.builder(
                          shrinkWrap: true,
                          itemCount: BlocProvider.of<PromosCubit>(context)
                              .promos
                              .length,
                          itemBuilder: (context, index) {
                            return Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 5),
                                child: Card(
                                  color: darkBlackColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: ListTile(
                                    // tileColor: darkBlackColor,
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 10.0, vertical: 10),
                                    minLeadingWidth: width / 7,
                                    title: Text(
                                      BlocProvider.of<PromosCubit>(context)
                                              .promos[index]
                                              .name ??
                                          "",
                                      softWrap: true,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    // subtitle: Text(BlocProvider.of<PromosCubit>(context).promos[index].value??"",
                                    //   softWrap: true,
                                    //   style: TextStyle(
                                    //     color: Colors.white
                                    // ),),
                                    leading: CircleAvatar(
                                      radius: 30,
                                      child: Text(
                                        BlocProvider.of<PromosCubit>(context)
                                                .promos[index]
                                                .value ??
                                            "",
                                        softWrap: true,
                                        style: TextStyle(
                                            color: primaryColor,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),

                                    trailing: IconButton(
                                      onPressed: () {
                                        Clipboard.setData(ClipboardData(
                                            text: BlocProvider.of<PromosCubit>(
                                                        context)
                                                    .promos[index]
                                                    .name ??
                                                ""));
                                        showToast(
                                            msg:
                                                "PromoCode copied to clipboard");
                                      },
                                      icon: Icon(
                                        Icons.copy,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ));
                          }),
                ))));
  }
}
