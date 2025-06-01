import 'package:easy_localization/easy_localization.dart';
import 'package:fanzhashem/modules/jop_profile/cubit/cubit.dart';
import 'package:fanzhashem/modules/jop_profile/cubit/states.dart';
import 'package:fanzhashem/widgets/buttons_widget.dart';
import 'package:fanzhashem/widgets/shared_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../translations/locale_keys.g.dart';
import '../../utilities/colors.dart';

class JopProfileScreen extends StatefulWidget {
  const JopProfileScreen({super.key});

  @override
  State<JopProfileScreen> createState() => _JopProfileScreenState();
}

class _JopProfileScreenState extends State<JopProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => JopProfileCubit()..getJopsList(),
        child: BlocConsumer<JopProfileCubit, JopProfileStates>(
            listener: (context, state) {},
            builder: (context, state) {
              return Scaffold(
                  backgroundColor: darkBlackColor,
                  appBar: AppBar(
                    title: Text(LocaleKeys.side_menu_jop_profile.tr()),
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
                    child: ListView.builder(
                        itemCount: JopProfileCubit.get(context).jopsList.length,
                        itemBuilder: (context, index) => jopProfileItem(
                            JopProfileCubit.get(context).jopsList[index],
                            context,
                            index)),
                  ));
            }));
  }

  jopProfileItem(item, context, index) => ExpansionTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(100.0),
          child: Image.network(
            item['image'],
            width: 55,
            height: 55,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(item['title']),
        subtitle: Text('Tap to see description'),
        children: [
          Text(
            item['description'],
          ),
          SizedBox(
            height: 10,
          ),
          item['upload'] != null
              ? Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.05,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50)),
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            JopProfileCubit.get(context).path,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      TxtButton(
                        color: primaryColor,
                        text: 'Send',
                        onPressed: () {
                          showToast(
                            msg: 'Send Successflly',
                          );
                        },
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      TxtButton(
                        color: primaryColor,
                        text: '   Upload New File  ',
                        onPressed: () {
                          JopProfileCubit.get(context).filePickerFun(index);
                        },
                      )
                    ],
                  ),
                )
              : TxtButton(
                  color: primaryColor,
                  text: 'Apply Now',
                  onPressed: () {
                    JopProfileCubit.get(context).filePickerFun(index);
                  },
                )
        ],
      );
}
