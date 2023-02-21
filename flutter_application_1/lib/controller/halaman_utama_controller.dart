import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/halaman_utama.dart';
import 'package:get/get.dart';
class HalamanUtamaController extends State<HalamanUtama>{
  
static late HalamanUtamaController instance;
late HalamanUtama view;

  @override
  void initState(){
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context,this);

  int SelectedCategoryIndex = 0 ;
  updateIndex(newIndex){
    SelectedCategoryIndex = newIndex;
    setState(() {
      
    });
  }
  List<Map> categories = [
    {
      "label":"All",
    },
    {
      "label":"Pizza",
      "icon":"https://cdn-icons-png.flaticon.com/512/2982/2982880.png",
    },
    {
      "label":"Burgers",
      "icon":"https://cdn-icons-png.flaticon.com/512/1159/1159173.png",
    },
    {
      "label":"Grill",
      "icon":"https://cdn-icons-png.flaticon.com/512/908/908044.png",
    },
    {
      "label":"Coffe",
      "icon":"https://cdn-icons-png.flaticon.com/512/3054/3054889.png",
    },
  ];
}