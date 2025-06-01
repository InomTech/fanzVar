import 'package:fanzhashem/utilities/colors.dart';
import 'package:fanzhashem/widgets/buttons_widget.dart';
import 'package:fanzhashem/widgets/shared_widget.dart';
import 'package:flutter/material.dart';

class CreateNewProjectScreen extends StatefulWidget {
  const CreateNewProjectScreen({super.key});

  @override
  _CreateNewProjectScreenState createState() => _CreateNewProjectScreenState();
}

class _CreateNewProjectScreenState extends State<CreateNewProjectScreen> {
  var projectNameController = TextEditingController();
  var projectCategoryController = TextEditingController();
  var suggestedByController = TextEditingController();
  var projectDescController = TextEditingController();
  final createProjectFormKey = GlobalKey<FormState>();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text("Create Project"),
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () {
              FocusScopeNode currentFocus = FocusScope.of(context);
              if (!currentFocus.hasPrimaryFocus) {
                currentFocus.unfocus();
              }
            },
            child: Container(
              child: Form(
                  key: createProjectFormKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height: height / 15,
                        width: width / 1.2,
                        decoration: BoxDecoration(
                          color: lightBlackColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(24.0),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 0, bottom: 0),
                          child: TextFormField(
                            controller: projectNameController,
                            decoration: InputDecoration(
                              hintText: "Project Name",
                              hintStyle: TextStyle(
                                fontSize: 14.0,
                                color: Colors.white,
                              ),
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              contentPadding: const EdgeInsets.all(14),
                              // prefixIcon: Icon(Icons.title, color: primaryColor),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        height: height / 15,
                        width: width / 1.2,
                        decoration: BoxDecoration(
                          color: lightBlackColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(24.0),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 0, bottom: 0),
                          child: TextFormField(
                            controller: suggestedByController,
                            decoration: InputDecoration(
                              hintText: "Suggested by",
                              hintStyle: TextStyle(
                                fontSize: 14.0,
                                color: Colors.white,
                              ),
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              contentPadding: const EdgeInsets.all(14),
                              // prefixIcon: Icon(Icons.title, color: primaryColor),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        height: height / 15,
                        width: width / 1.2,
                        decoration: BoxDecoration(
                          color: lightBlackColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(24.0),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 0, bottom: 0),
                          child: TextFormField(
                            // maxLines: 1,
                            controller: projectCategoryController,
                            decoration: InputDecoration(
                              hintText: "Project Category",
                              hintStyle: TextStyle(
                                fontSize: 14.0,
                                color: Colors.white,
                              ),
                              // prefixIcon: Icon(Icons.),
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              contentPadding: const EdgeInsets.all(14),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        height: height / 8,
                        width: width / 1.2,
                        decoration: BoxDecoration(
                          color: lightBlackColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(24.0),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 0, bottom: 0),
                          child: TextFormField(
                            maxLines: 3,
                            controller: projectDescController,
                            decoration: InputDecoration(
                              hintText: "Project Description",
                              hintStyle: TextStyle(
                                fontSize: 14.0,
                                color: Colors.white,
                              ),
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              contentPadding: const EdgeInsets.all(14),
                              // prefixIcon: Icon(Icons.title, color: primaryColor),
                            ),
                          ),
                        ),
                      ),

                      ///////////////////////////////////////////////////
                      // Container(
                      //   margin: EdgeInsets.only(top: 15.0, right: 10, left: 10),
                      //   child: TxtField(
                      //     controller: projectNameController,
                      //     hintText: "Project Name",
                      //     validator: (value) {
                      //       if (value.toString().isEmpty || value == null) {
                      //         return 'Please enter Project Name!';
                      //       }
                      //     },
                      //     prefixIcon: Icons.title,
                      //     colorPrefixIcon: primaryColor,
                      //     keyboardType: TextInputType.text,
                      //     onChanged: (String str) {},
                      //   ),
                      // ),
                      // Container(
                      //   margin: EdgeInsets.only(top: 15.0, right: 10, left: 10),
                      //   child: TxtField(
                      //     controller: projectCategoryController,
                      //     hintText: "Project Category",
                      //     validator: (value) {
                      //       if (value.toString().isEmpty || value == null) {
                      //         return 'Please enter Project Category!';
                      //       }
                      //     },
                      //     prefixIcon: Icons.category,
                      //     colorPrefixIcon: primaryColor,
                      //     keyboardType: TextInputType.text,
                      //     onChanged: (String str) {},
                      //   ),
                      // ),
                      // Container(
                      //   margin: EdgeInsets.only(top: 15.0, right: 10, left: 10),
                      //   child: TxtField(
                      //     controller: projectDescController,
                      //     hintText: "Project Description",
                      //     // maxLines: 4,
                      //     validator: (value) {
                      //       if (value.toString().isEmpty || value == null) {
                      //         return 'Please enter Project Category!';
                      //       }
                      //     },
                      //     prefixIcon: Icons.description_outlined,
                      //     colorPrefixIcon: primaryColor,
                      //     keyboardType: TextInputType.text,
                      //     onChanged: (String str) {},
                      //   ),
                      // ),

                      SizedBox(height: 20),

                      /// ================== Submit BTN ============================

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TxtButton(
                            color: primaryColor,
                            text: "Submit",
                            horizontalPadding: 35,
                            verticalPadding: 10,
                            txtSize: 16,
                            onPressed: () {
                              showToast(msg: 'Created project Successfully');
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      ),
                    ],
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
