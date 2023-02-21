import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/product_detailController.dart';
import 'package:get/get.dart';

class ProductDetail extends StatefulWidget {
  ProductDetail({Key? key}) : super(key: key);

  @override
  Widget build(context, ProductDetailController controller) {
    controller.view = this;

    rowLabel({
      required String label,
      required String value,
      bool bold = false,
    }) {
      FontWeight fontWeight = FontWeight.normal;
      // BoxBorder boxBorder = Border(
      //     top: BorderSide(
      //   // color: Colors.grey[300]!,
      //   color: Colors.transparent,
      // ));
      if (bold) {
        fontWeight = FontWeight.bold;
      }
      // if (border) {
      //   boxBorder = boxBorder = Border(
      //       top: BorderSide(
      //     color: Colors.grey[300]!,
      //   ));
      // }
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            Expanded(
              child: Text(
                "$label",
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: fontWeight,
                ),
              ),
            ),
            Text(
              "$value",
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: fontWeight,
              ),
            )
          ],
        ),
      );
    }

    return Theme(
      data: ThemeData.light().copyWith(
          appBarTheme: const AppBarTheme(
              backgroundColor: Colors.white,
              elevation: 0.0,
              centerTitle: true,
              iconTheme: IconThemeData(
                color: Colors.black,
              ),
              titleTextStyle: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ))),
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          actions: [],
          leading: Padding(
            padding: EdgeInsets.all(5),
            child: CircleAvatar(
              backgroundColor: Colors.black.withOpacity(0.5),
              child: BackButton(color: Colors.white),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.black,
          child: const Icon(
            Icons.shopping_bag_outlined,
            size: 30.0,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Builder(
                builder: (context) {
                  List images = [
                    "https://images.unsplash.com/photo-1555939594-58d7cb561ad1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
                    "https://images.unsplash.com/photo-1540189549336-e6e99c3679fe?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
                    "https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=781&q=80",
                    "https://images.unsplash.com/photo-1565958011703-44f9829ba187?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=765&q=80",
                    "https://images.unsplash.com/photo-1482049016688-2d3e1b311543?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=710&q=80",
                  ];

                  return Stack(
                    children: [
                      CarouselSlider(
                        carouselController: controller.Carousel,
                        options: CarouselOptions(
                          height: Get.height * 0.5,
                          autoPlay: true,
                          enlargeCenterPage: false,
                          viewportFraction: 1.1,
                          onPageChanged: (index, reason) {
                            controller.currentIndex = index;
                            controller.setState(() {});
                          },
                        ),
                        items: images.map((imageUrl) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Container(
                                width: MediaQuery.of(context).size.width,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 5.0),
                                decoration: BoxDecoration(
                                  color: Colors.amber,
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      imageUrl,
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            },
                          );
                        }).toList(),
                      ),
                      Positioned(
                        bottom: 50,
                        right: 0,
                        left: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: images.asMap().entries.map(
                            (entry) {
                              bool isSelected =
                                  controller.currentIndex == entry.key;
                              return GestureDetector(
                                onTap: () => controller.Carousel.animateToPage(
                                    entry.key),
                                child: Container(
                                  width: 12,
                                  height: 12.0,
                                  margin: const EdgeInsets.only(
                                    right: 6.0,
                                    top: 12.0,
                                  ),
                                  decoration: BoxDecoration(
                                      color: isSelected
                                          ? Colors.white
                                          : Colors.transparent,
                                      borderRadius: BorderRadius.circular(50),
                                      border: Border.all(
                                          width: 1.5,
                                          color: Color.fromARGB(
                                              255, 219, 216, 216))),
                                ),
                              );
                            },
                          ).toList(),
                        ),
                      ),
                    ],
                  );
                },
              ),
              Container(
                padding: EdgeInsets.all(40),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Colors.white),
                width: MediaQuery.of(context).size.width,
                transform: Matrix4.translationValues(0.0, -40, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Blueberry Bagel",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                                style: TextStyle(
                                    fontSize: 13, color: Colors.grey[600]),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.yellow,
                          child: Icon(
                            Icons.add,
                            color: Colors.black,
                          ),
                          radius: 22,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text(
                          "\$1.49  -  ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        Text(
                          "290 Cal",
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.grey[300]!,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    rowLabel(
                      label: "Calories",
                      value: "290 Cal",
                      bold: true,
                    ),
                    rowLabel(
                      label: "Calories from Fat",
                      value: "10 Cal",
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.grey[300]!,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    rowLabel(
                      label: "Fat",
                      value: "10 Cal",
                      bold: true,
                    ),
                    rowLabel(
                      label: "Saturated Fat",
                      value: "0 g",
                    ),
                    rowLabel(
                      label: "Trans Fatty Acid",
                      value: "0 g",
                    ),
                     Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.grey[300]!,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    rowLabel(
                      label: "Cholesterol",
                      value: " 160 mg",
                      bold: true,
                    ),
                    
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<ProductDetail> createState() => ProductDetailController();
}
