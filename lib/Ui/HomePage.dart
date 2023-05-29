import 'dart:ffi';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:digital_currency/Data/data_source/ResponseModel.dart';
import 'package:digital_currency/Provider/CryptoDataProvider.dart';
import 'package:digital_currency/Ui/Ui_helper/HomePageView.dart';
import 'package:digital_currency/Ui/Ui_helper/ThemeSwitcher.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../Data/CryptoModell/models/CryptoData.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController pageController = PageController();
  int DefultChoiceIndex = 0;

  final List<String> _ChoiceList = [
    "Top Market Caps",
    "Top Gainers",
    "Top Losers"
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final CryptoProvider =
        Provider.of<CryptoDataProvider>(context, listen: false);
    CryptoProvider.getTopMarketCapData();
  }

  @override
  Widget build(BuildContext context) {
    final heightScreen = MediaQuery.of(context).size.height;
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        actions: [
          ThemeSwitcher(),
        ],
        title: const Text("Flutter Course A"),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              // PageView
              Padding(
                padding: const EdgeInsets.only(top: 7.0, left: 5, right: 5),
                child: SizedBox(
                  height: 160,
                  width: double.infinity,
                  child: Stack(
                    children: [
                      HomePageView(controller: pageController),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 12.0),
                          child: SmoothPageIndicator(
                            controller: pageController,
                            count: 4,
                            effect: const ExpandingDotsEffect(
                                dotWidth: 10, dotHeight: 10),
                            onDotClicked: (index) =>
                                pageController.animateToPage(index,
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeInOut),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
                width: double.infinity,
                child: Marquee(
                  text: '🔊 this is place for news in application ',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.only(left: 5, right: 5),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          padding: EdgeInsets.all(20),
                          primary: Colors.green.shade700,
                        ),
                        onPressed: () {},
                        child: Text("Buy"),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          padding: EdgeInsets.all(20),
                          primary: Colors.red.shade700,
                        ),
                        onPressed: () {},
                        child: Text("Sell"),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30, top: 10),
                child: Row(
                  children: [
                    Wrap(
                      spacing: 12,
                      children: List.generate(
                        _ChoiceList.length,
                        (index) {
                          return ChoiceChip(
                            label: Text(_ChoiceList[index]),
                            selected: DefultChoiceIndex == index,
                            selectedColor: Colors.blue,
                            onSelected: (value) {
                              setState(() {
                                DefultChoiceIndex =
                                    value == true ? index : DefultChoiceIndex;
                              });
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 500,
                child: Consumer<CryptoDataProvider>(
                  builder: (context, cryptodataprovider, child) {
                    switch (cryptodataprovider.state.status) {
                      case Status.LOADING:
                        return SizedBox(
                          height: 80,
                          child: Shimmer.fromColors(
                            baseColor: Colors.grey.shade400,
                            highlightColor: Colors.white,
                            child: ListView.builder(
                              itemCount: 10,
                              itemBuilder: (context, index) {
                                return Row(
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(
                                          top: 8.0, bottom: 8, left: 8),
                                      child: CircleAvatar(
                                        backgroundColor: Colors.white,
                                        radius: 30,
                                        child: Icon(Icons.add),
                                      ),
                                    ),
                                    Flexible(
                                      fit: FlexFit.tight,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            right: 8.0, left: 8),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: 50,
                                              height: 15,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 8.0),
                                              child: SizedBox(
                                                width: 25,
                                                height: 15,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      fit: FlexFit.tight,
                                      child: SizedBox(
                                        width: 70,
                                        height: 40,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      fit: FlexFit.tight,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(right: 8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            SizedBox(
                                              width: 50,
                                              height: 15,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 8.0),
                                              child: SizedBox(
                                                width: 25,
                                                height: 15,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        );
                      case Status.COMPLETED:
                        List<CryptoData>? modell = cryptodataprovider
                            .dataFuture.data!.cryptoCurrencyList;
                        return ListView.separated(
                            itemBuilder: (context, index) {
                              int number = index + 1;
                              var tokenId = modell![index].id;
                              return SizedBox(
                                height: heightScreen * 0.075,
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Text(number.toString()),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10.0, right: 15),
                                      child: CachedNetworkImage(
                                          fadeInDuration:
                                              const Duration(milliseconds: 500),
                                          height: 32,
                                          width: 32,
                                          imageUrl:
                                              "https://s2.coinmarketcap.com/static/img/coins/32x32/$tokenId.png",
                                          placeholder: (context, url) =>
                                              const CircularProgressIndicator(),
                                          errorWidget: (context, url, error) {
                                            return Icon(Icons.error);
                                          }),
                                    ),
                                  ],
                                ),
                              );
                            },
                            separatorBuilder: (context, index) => Divider(),
                            itemCount: 2);
                      case Status.ERROR:
                        return Text(cryptodataprovider.state.message);
                      default:
                        return Container();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
