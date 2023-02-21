import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/product_detail.dart';
import 'package:get/get.dart';
import '../controller/halaman_utama_controller.dart';

class HalamanUtama extends StatefulWidget {
  const HalamanUtama({Key? key}) : super(key: key);

  Widget build(context, HalamanUtamaController controller) {
    controller.view = this;
    return GetMaterialApp(
      theme: ThemeData.light().copyWith(
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
          ),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.sort,
              size: 24,
            ),
          ),
          title: const Text("Denver, CO 80205, USA"),
          actions: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Icon(Icons.search),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Fast & Delicious \nFood",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 40.0,
                  child: ListView.builder(
                    itemCount: controller.categories.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      var item = controller.categories[index];
                      bool isSelected =
                          controller.SelectedCategoryIndex == index;

                      return InkWell(
                        onTap: () => controller.updateIndex(index),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 400),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(12),
                            ),
                            color:
                                isSelected ? Colors.yellow : Colors.transparent,
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 21),
                          margin: const EdgeInsets.only(right: 12),
                          child: Row(
                            children: [
                              if (item["icon"] != null)
                                Image.network(
                                  item["icon"],
                                  width: 30,
                                ),
                              SizedBox(width: 6),
                              Text(
                                item["label"],
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  "Popular",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 220.0,
                  child: ListView.builder(
                      itemCount: 10,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () => Get.to(ProductDetail()),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 140,
                                width: MediaQuery.of(context).size.width * 0.7,
                                margin: EdgeInsets.only(right: 12.0),
                                decoration: BoxDecoration(
                                    image: const DecorationImage(
                                      image: NetworkImage(
                                          "https://images.unsplash.com/photo-1645696329525-8ec3bee460a9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1329&q=80"),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.circular(15)),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                "Sego Goreng",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(right: 5),
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.grey,
                                        width: 2,
                                      ),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8)),
                                    ),
                                    child: const Text(
                                      "\$5",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(right: 5),
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.grey,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8))),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.more_time_sharp,
                                          size: 17,
                                        ),
                                        Text(
                                          "20-30 min",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(right: 5),
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.grey,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8))),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.star_rounded,
                                          size: 17,
                                        ),
                                        Text(
                                          "4.65",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        );
                      }),
                ),
                SizedBox(
                  height: 40,
                ),
                Text(
                  "Restaurant View",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 350,
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                                "https://plus.unsplash.com/premium_photo-1676309300288-3718ca88f003?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80"),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      height: 120,
                      transform: Matrix4.translationValues(0.0, -40, 0),
                      decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "View Depan Restaurant Lokotre",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Restaurant ini memiliki view depan yang sangat bagus buat nongkrong, dan asik buat berkumpul yang bertema italia italio utilio ",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  State<HalamanUtama> createState() => HalamanUtamaController();
}
