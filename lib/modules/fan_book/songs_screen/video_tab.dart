import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utilities/colors.dart';
import '../cubit/cubit.dart';
import '../cubit/states.dart';

class VideoTab extends StatefulWidget {
  const VideoTab({super.key});

  @override
  State<VideoTab> createState() => _VideoTabState();
}

class _VideoTabState extends State<VideoTab> {
  static late double width, height;
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return BlocConsumer<FanBookCubit, FanBookStates>(
        listener: (context, state) {},
        builder: (context, state) {
          final fanBookCubit = BlocProvider.of<FanBookCubit>(context);
          return fanBookCubit.videosList.isEmpty
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: fanBookCubit.videosList.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext ctx, int index) {
                    return Container(
                      height: height * 0.165,
                      width: width,
                      padding: const EdgeInsets.all(8.0),
                      child:
                          //Container(
                          // decoration: BoxDecoration(
                          //   color: lightBlackColor,
                          //   border: Border.all(color: Color(0xFF424242)),
                          //   borderRadius: const BorderRadius.only(
                          //     bottomRight: Radius.circular(12.0),
                          //     bottomLeft: Radius.circular(12.0),
                          //     topRight: Radius.circular(12.0),
                          //   ),
                          // ),
                          Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12.0),
                            child: Image.network(
                              fanBookCubit.videosList[index]['image_url'],
                              height: height * 0.15,
                              width: width * 0.4,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: width * 0.015),
                          SizedBox(
                            width: width * 0.53,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  fanBookCubit.videosList[index]['title'],
                                  maxLines: 2,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      overflow: TextOverflow.ellipsis),
                                ),
                                SizedBox(height: width * 0.015),
                                Text(
                                  fanBookCubit.videosList[index]['match_name'],
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      overflow: TextOverflow.ellipsis),
                                ),
                                Text(
                                  fanBookCubit.videosList[index]['description'],
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      overflow: TextOverflow.ellipsis),
                                ),
                                Text(
                                  fanBookCubit.videosList[index]['video_linke'],
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      overflow: TextOverflow.ellipsis),
                                ),
                                // Text(
                                //   "sponser:${fanBookCubit.videosList[index]['sponser']}",
                                //   style: TextStyle(
                                //     color: primaryColor,
                                //     fontSize: 12,
                                //   ),
                                // ),
                                SizedBox(height: width * 0.015),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          Icons.favorite_border_outlined,
                                          color: darkGoldColor,
                                        ),
                                        Text(
                                          "100",
                                          style: TextStyle(fontSize: 9),
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          Icons.subdirectory_arrow_right,
                                          color: darkGoldColor,
                                        ),
                                        Text(
                                          "95",
                                          style: TextStyle(fontSize: 9),
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          Icons.comment,
                                          color: darkGoldColor,
                                        ),
                                        Text(
                                          "50",
                                          style: TextStyle(fontSize: 9),
                                        )
                                      ],
                                    ),
                                    SizedBox()
                                  ],
                                )
                              ],
                            ),
                          ),
                          SizedBox(width: width * 0.01),
                        ],
                      ),
                    );
                  },
                );
        });
  }
}
