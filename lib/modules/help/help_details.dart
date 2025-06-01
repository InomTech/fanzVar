import 'dart:io';

import 'package:fanzhashem/modules/payment/payment_screen.dart';
import 'package:fanzhashem/utilities/colors.dart';
import 'package:fanzhashem/widgets/shared_widget.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HelpDetailsScreen extends StatefulWidget {
  const HelpDetailsScreen({super.key});

  @override
  State<HelpDetailsScreen> createState() => _HelpDetailsScreenState();
}

class _HelpDetailsScreenState extends State<HelpDetailsScreen> {
  var messageController = TextEditingController();
  List<File> imagesFile = [];
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text("How can i help ?"),
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
        child: InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
          },
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  /////////////////////////////////////////
                  SizedBox(height: height / 10),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.center,
                    // color: lightBlackColor,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        maxLines: 10,
                        controller: messageController,
                        maxLength: 500,
                        textInputAction: TextInputAction.send,
                        // onSubmitted: (value) {
                        //   if (messageController.text.trim().isNotEmpty) {
                        //     showSuccessAlert(
                        //         context, "Your message has been sent.");
                        //   } else {
                        //     showToast(msg: "Message is empty");
                        //   }
                        // },
                        decoration: InputDecoration(
                          //labelText: labelText,
                          hintText: "Type your issue ...",

                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: lightBlackColor, width: 2.0),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: lightBlackColor, width: 2.0),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.red, width: 2.0),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.red, width: 2.0),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  _imagesWidget(width, height),
                  SizedBox(height: height / 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: const ShapeDecoration(
                          shape: StadiumBorder(),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            stops: [0.0, 0.21],
                            colors: [
                              Color(0xD9F9F9F9),
                              Color(0xffCDA250),
                            ],
                          ),
                        ),
                        child: TextButton(
                          style: ButtonStyle(
                            shape:
                                WidgetStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                          onPressed: () {
                            if (messageController.text.trim().isNotEmpty) {
                              showSuccessAlert(
                                  context, "Your message is sent successfully");
                            } else {
                              showToast(msg: "Message is empty");
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 0.0, horizontal: 25),
                            child: Text(
                              " Submit ",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  /////////////////////////////////////////////////
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _imagesWidget(width, height) {
    return Wrap(
      direction: Axis.horizontal,
      alignment: WrapAlignment.spaceAround,
      runAlignment: WrapAlignment.spaceEvenly,
      crossAxisAlignment: WrapCrossAlignment.center,
      clipBehavior: Clip.antiAlias,
      spacing: 10,
      runSpacing: 20,
      children: [
        Visibility(
            visible: imagesFile.length < 5,
            child: Container(
                alignment: Alignment.center,
                child: GestureDetector(
                    onTap: () async {
                      showPicker(context);
                    },
                    child: Icon(
                      Icons.camera_alt,
                      color: Colors.grey,
                      size: 40,
                    )))),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Wrap(
            direction: Axis.horizontal,
            alignment: WrapAlignment.spaceAround,
            runAlignment: WrapAlignment.spaceEvenly,
            crossAxisAlignment: WrapCrossAlignment.center,
            clipBehavior: Clip.antiAlias,
            spacing: 10,
            runSpacing: 20,
            children: _generateImageChildren(imagesFile, width, height),
          ),
        )
      ],
    );
  }

  ///////////////////////////////////////////////////
  void showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: Wrap(
                children: <Widget>[
                  ListTile(
                      leading: Icon(Icons.photo_library),
                      title: Text('Gallery'),
                      onTap: () {
                        pickImage(0);
                        Navigator.of(context).pop();
                      }),
                  ListTile(
                    leading: Icon(Icons.photo_camera),
                    title: Text('Camera'),
                    onTap: () {
                      pickImage(1);
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  ////////////////////////////////////////////////////////
  Future<void> pickImage(int option) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(
      source: option == 0 ? ImageSource.gallery : ImageSource.camera,
      imageQuality: 50,
    );

    if (pickedFile != null) {
      File image = File(pickedFile.path);
      print(image.path);
      setState(() {
        imagesFile.add(image);
      });
    } else {
      print("");
    }
  }

  //////////////////////////////////////////////////////
//imagesFile.add(image);  image.path
  List<Widget> _generateImageChildren(List<File> imagesFiles, width, height) {
    List<Widget> items = [];

    for (File imageFile in imagesFiles) {
      items.add(_generateImageItem(width, height, imageFile));
    }

    return items;
  }

  Widget _generateImageItem(double width, double height, File imageFile) {
    return Stack(
      children: [
        Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            image:
                DecorationImage(image: FileImage(imageFile), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
        IconButton(
            onPressed: () {
              removeImage(imageFile, context);
            },
            icon: Icon(
              Icons.cancel,
              color: Colors.grey,
              size: 30,
            ))
      ],
    );
  }

  removeImage(File imageFile, context) {
    setState(() {
      imagesFile.remove(imageFile);
    });
    showToast(msg: "Image removed");
  }
}
