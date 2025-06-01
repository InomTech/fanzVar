import 'dart:math' as math;

import 'package:easy_localization/easy_localization.dart';
import 'package:fanzhashem/modules/payment/payment_screen.dart';
import 'package:fanzhashem/translations/locale_keys.g.dart';
import 'package:fanzhashem/utilities/colors.dart';
import 'package:fanzhashem/widgets/shared_widget.dart';
import 'package:flutter/material.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  // late String selectedLang;
  // late bool isENSelected;
  // late bool isARSelected;

  @override
  void initState() {
    super.initState();
    // isENSelected = false;
    // isARSelected = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.settings_screen_settings.tr()),
        centerTitle: true,
        backgroundColor: lightBlackColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        leading: IconButton(
          icon: Transform.rotate(
            angle: context.locale == Locale('en')
                ? 180 * math.pi
                : 180 * math.pi / 180,
            child: Icon(Icons.arrow_back_ios_new_rounded),
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              /// ==================== Payment ========================
              InkWell(
                onTap: () {
                  navigateTo(context, PaymentScreen());
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        width: 1,
                        color: Colors.grey.shade800,
                      ),
                      bottom: BorderSide(
                        width: 1,
                        color: Colors.grey.shade800,
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          LocaleKeys.settings_screen_payment.tr(),
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              /// ================= change language ===================
              InkWell(
                onTap: () {
                  showLangAlert(context);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: 1,
                        color: Colors.grey.shade800,
                      ),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        LocaleKeys.settings_screen_language.tr(),
                        style: TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 5),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                          context.locale == Locale('en')
                              ? LocaleKeys.settings_screen_English.tr()
                              : LocaleKeys.settings_screen_Arabic.tr(),
                          style: TextStyle(color: primaryColor, fontSize: 15),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ///================== show change lang Alert ==================
  showLangAlert(context) => showDialog(
        context: context,
        builder: (BuildContext context) {
          return CustomLangDialog();
        },
      );
}

class CustomLangDialog extends StatefulWidget {
  const CustomLangDialog({super.key});

  @override
  State<CustomLangDialog> createState() => _CustomLangDialogState();
}

class _CustomLangDialogState extends State<CustomLangDialog> {
  late bool isENSelected;
  late bool isARSelected;

  @override
  Widget build(BuildContext context) {
    isENSelected = context.locale == Locale('en') ? true : false;
    isARSelected = context.locale == Locale('ar') ? true : false;
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      contentPadding: EdgeInsets.only(top: 15.0),
      title: Text(
        LocaleKeys.settings_screen_change_lang.tr(),
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: primaryColor,
        ),
      ),
      content: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          LocaleKeys.settings_screen_English.tr(),
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFFe6dfd8),
                          ),
                        ),
                        const SizedBox(width: 8),
                        RoundCheckBox(
                          size: 26,
                          isChecked: isENSelected,
                          borderColor: Colors.grey,
                          checkedColor: primaryColor,
                          checkedWidget: Center(
                            child: Icon(
                              Icons.check,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                          onTap: (value) async {
                            isENSelected = value!;

                            if (isARSelected == true && value == true) {
                              isARSelected = false;
                            }

                            await context.setLocale(Locale('en'));

                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 18),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          LocaleKeys.settings_screen_Arabic.tr(),
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFFe6dfd8),
                          ),
                        ),
                        const SizedBox(width: 8),
                        RoundCheckBox(
                          size: 26,
                          isChecked: isARSelected,
                          borderColor: Colors.grey,
                          checkedColor: primaryColor,
                          checkedWidget: Center(
                            child: Icon(
                              Icons.check,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                          onTap: (value) async {
                            isARSelected = value!;

                            if (isENSelected == true && value == true) {
                              isENSelected = false;
                            }

                            await context.setLocale(Locale('ar'));
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
