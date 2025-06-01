import 'package:fanzhashem/modules/stores/cubit/cubit.dart';
import 'package:fanzhashem/modules/stores/cubit/states.dart';
import 'package:fanzhashem/modules/stores/store_widget.dart';
import 'package:fanzhashem/modules/stores/tabs/branches.dart';
import 'package:fanzhashem/modules/stores/tabs/products.dart';
import 'package:fanzhashem/modules/stores/tabs/reviews.dart';
import 'package:fanzhashem/utilities/colors.dart';
import 'package:fanzhashem/widgets/shared_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Stores extends StatefulWidget {
  final bool isNavigationFromVoucher;
  const Stores({this.isNavigationFromVoucher = false, super.key});
  @override
  _StoresState createState() => _StoresState();
}

class _StoresState extends State<Stores> with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  late TabController _tabController;

  late int selectedIndex;

  @override
  void initState() {
    // TODO: implement initState
    _tabController = TabController(
        length: 3,
        vsync: this,
        initialIndex: widget.isNavigationFromVoucher == true ? 1 : 0);
    selectedIndex = widget.isNavigationFromVoucher == true ? 1 : 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return BlocProvider<StoresCubit>(
        create: (context) => StoresCubit()..getStores(),
        child: BlocConsumer<StoresCubit, StoresStates>(
            listener: (context, state) async {},
            builder: (context, state) {
              StoresCubit storesCubit = BlocProvider.of<StoresCubit>(context);

              return Scaffold(
                key: _scaffoldKey,
                resizeToAvoidBottomInset: false,
                appBar: appBar(
                    _scaffoldKey,
                    widget.isNavigationFromVoucher == true
                        ? "Voucher"
                        : "Stores",
                    context),
                backgroundColor: lightBlackColor,
                body: Container(
                  child: storesCubit.isLoading
                      ? ShowLoading()
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: height / 7,
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: storesCubit.stores.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  bool isSelected = selectedIndex == index;

                                  return Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            selectedIndex = index;
                                          });
                                        },
                                        child: StoreWidget(
                                          storeName:
                                              storesCubit.stores[index].name ??
                                                  "",
                                          storeImage:
                                              storesCubit.stores[index].image ??
                                                  "",
                                          storeRating: double.parse(storesCubit
                                              .stores[index].reviews![0].review
                                              .toString()),
                                          isSelected: isSelected,
                                          numOfBranches: storesCubit
                                              .stores[index].branches!.length,
                                          numOfProducts: storesCubit
                                              .stores[index].products!.length,
                                          numOfReviews: storesCubit
                                              .stores[index].reviews!.length,
                                        ),
                                      ));
                                },
                              ),
                            ),
                            TabBar(
                              unselectedLabelColor: Colors.white,
                              labelColor: primaryColor,
                              indicatorColor: primaryColor,
                              unselectedLabelStyle: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                              labelStyle: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                              tabs: [
                                Tab(
                                  text: "Branches",
                                ),
                                Tab(
                                  text: "Products",
                                ),
                                Tab(
                                  text: "Reviews",
                                ),
                              ],
                              controller: _tabController,
                              indicatorSize: TabBarIndicatorSize.tab,
                            ),
                            Expanded(
                              child: TabBarView(
                                controller: _tabController,
                                children: [
                                  Branches(
                                    branches: storesCubit
                                            .stores[selectedIndex].branches ??
                                        [],
                                  ),
                                  Products(
                                    products: storesCubit
                                            .stores[selectedIndex].products ??
                                        [],
                                  ),
                                  Reviews(
                                    reviews: storesCubit
                                            .stores[selectedIndex].reviews ??
                                        [],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                ),
              );
            }));
  }
}
