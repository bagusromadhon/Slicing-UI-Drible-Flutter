import 'package:carousel_slider/carousel_slider.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/product_detail.dart';
import 'package:get/get.dart';
class ProductDetailController extends State<ProductDetail>{
  
static late ProductDetailController instance;
late ProductDetail view;


  @override
  void initState(){
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override 
  Widget build(BuildContext context) => widget.build(context,this);
     int currentIndex = 0;
    final CarouselController Carousel = CarouselController();
  
}