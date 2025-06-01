import 'package:flutter/material.dart';

class MyWalletScreen extends StatelessWidget {
  const MyWalletScreen({super.key});

  get darkBlackColor => null;

  get lightBlackColor => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: darkBlackColor,
        appBar: AppBar(
          title: Text("Wallet"),
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
        body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Remaining Balance',
                style: TextStyle(fontSize: 23),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text('100',
                      style:
                          TextStyle(fontSize: 45, fontWeight: FontWeight.bold)),
                  Text(' LE', style: TextStyle(fontSize: 23))
                ],
              )
            ],
          ),
        ));
  }
}
