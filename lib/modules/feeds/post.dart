import 'package:fanzhashem/utilities/colors.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

class PostItem extends StatelessWidget {
  final String? profileImg;
  final String? profileName;
  final String? profileID;
  final String? caption;
  final String? likes;
  final String? comments;
  final String? shares;
  final bool isMainScreen;
  final List? postImgs;
  const PostItem({
    Key? key,
    required this.profileName,
    required this.profileID,
    required this.profileImg,
    required this.postImgs,
    required this.likes,
    required this.comments,
    required this.shares,
    this.isMainScreen = false,
    this.caption = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
//
//   @override
//   Widget build(BuildContext context) {
//     TextEditingController commentController = TextEditingController();
//     final screenWidth = MediaQuery.of(context).size.width;
//     return ScreenUtilInit(
//       minTextAdapt: true,
//       splitScreenMode: true,
//       builder: (ctx) => Container(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             ListTile(
//               leading: CircleAvatar(
//                 radius: ScreenUtil().setSp(27),
//                 backgroundColor: Colors.grey,
//                 child: CircleAvatar(
//                   radius: ScreenUtil().setSp(26),
//                   backgroundImage: NetworkImage("$profileImg"),
//                 ),
//               ),
//               title: Text(
//                 "$profileName",
//                 style: TextStyle(fontSize: ScreenUtil().setSp(16)),
//                 overflow: TextOverflow.ellipsis,
//               ),
//               subtitle: Text(
//                 "$profileID",
//                 style: TextStyle(fontSize: ScreenUtil().setSp(12)),
//                 overflow: TextOverflow.ellipsis,
//               ),
//               trailing: isMainScreen
//                   ? GestureDetector(
//                 onTap: () {},
//                 child: Icon(
//                   Icons.more_vert,
//                   size: ScreenUtil().setSp(12),
//                 ),
//               )
//                   : SizedBox(),
//             ),
//             SizedBox(height: ScreenUtil().setHeight(2)),
//             Container(
//               margin: EdgeInsets.only(
//                   left: ScreenUtil().setWidth(85),
//                   right: ScreenUtil().setWidth(20)),
//               child: Column(
//                 //this colum has a padding
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     "$caption",
//                     style: TextStyle(
//                       fontSize: ScreenUtil().setSp(9),
//                     ),
//                   ),
//                   SizedBox(height: ScreenUtil().setHeight(4)),
//                   postImgs != null
//                       ? postImgs!.length == 1
//                       ? singleImg(postImgs![0],
//                       ScreenUtil().setWidth(screenWidth - 151))
//                       : postImgs!.length == 2
//                       ? twoImgs(
//                       postImgs!,
//                       ScreenUtil()
//                           .setWidth((screenWidth - 151) / 2))
//                       : SizedBox() //<= if more than 2 imgs
//                       : SizedBox(),
//                   SizedBox(height: ScreenUtil().setHeight(4)),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       postButtons(Icons.favorite, likes),
//                       postButtons(Icons.pending_outlined, comments),
//                       postButtons(Icons.screen_share_outlined, shares),
//                       Icon(
//                         Icons.bookmark_border_rounded,
//                         size: ScreenUtil().setSp(20),
//                         color: primaryColor,
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: ScreenUtil().setHeight(4)),
//                   writeCommentWidget(commentController),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// singleImg(String url, double width) {
//   return ScreenUtilInit(
//     minTextAdapt: true,
//     splitScreenMode: true,
//     builder: (ctx) => ClipRRect(
//       borderRadius: BorderRadius.all(Radius.circular(ScreenUtil().setSp(20))),
//       child: Image.network(
//         url,
//         fit: BoxFit.fill,
//         height: ScreenUtil().setHeight(174),
//         width: width,
//       ),
//     ),
//   );
// }
//
// twoImgs(List imgs, double width) {
//   return Row(
//     children: [
//       singleImg(imgs[0], width),
//       SizedBox(width: 10),
//       singleImg(imgs[1], width),
//     ],
//   );
// }
//
// postButtons(icon, txt) {
//   return ScreenUtilInit(
//     minTextAdapt: true,
//     splitScreenMode: true,
//     builder: (ctx) => Row(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Icon(
//           icon,
//           size: ScreenUtil().setSp(20),
//           color: primaryColor,
//         ),
//         SizedBox(width: 10),
//         Text(
//           txt,
//           style: TextStyle(fontSize: ScreenUtil().setSp(7)),
//         ),
//       ],
//     ),
//   );
// }
//
// writeCommentWidget(commentController) {
//   return ScreenUtilInit(
//     minTextAdapt: true,
//     splitScreenMode: true,
//     builder: (ctx) => Container(
//       //  margin: EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(5)),
//       padding: EdgeInsets.only(left: ScreenUtil().setWidth(15)),
//       decoration: BoxDecoration(
//         color: lightBlackColor,
//         borderRadius: BorderRadius.all(Radius.circular(ScreenUtil().setSp(25))),
//       ),
//       child: Row(
//         children: [
//           Expanded(
//             child: SizedBox(
//               height: ScreenUtil().setHeight(25),
//               child: Center(
//                 child: TextField(
//                   style: TextStyle(
//                     fontSize: ScreenUtil().setSp(9),
//                     height: 0.2,
//                   ),
//                   // maxLines: 2,
//                   controller: commentController,
//                   decoration: InputDecoration(
//                     border: InputBorder.none,
//                     hintText: 'Write your comment',
//                     hintStyle: TextStyle(fontSize: ScreenUtil().setSp(9)),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
}
