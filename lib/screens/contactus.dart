import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class contactus extends StatelessWidget {
  // const contactus({Key? key}) : super(key: key);
  List<String> images = [
    'https://cms.eichertrucksandbuses.com/uploads/truck/sub-category/a933e5958e4a354cfb8d22665bd244fd.png',
    'https://cdn5.vectorstock.com/i/1000x1000/43/69/bus-character-cartoon-vector-6724369.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(height: 400.0, autoPlay: true),
            items: images.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(color: Colors.greenAccent),
                      child: Image(image: NetworkImage('$i')));
                },
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
