import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/color/colors.dart';

class CustomCarouselHomePage extends StatefulWidget {
  final List<String> items;

  const CustomCarouselHomePage({Key? key, required this.items})
      : super(key: key);

  @override
  _CustomCarouselHomePageState createState() => _CustomCarouselHomePageState();
}

class _CustomCarouselHomePageState extends State<CustomCarouselHomePage> {
  int activeIndex = 0;

  setActiveDot(index) {
    setState(() {
      activeIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: <Widget>[
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: CarouselSlider(
            items: widget.items.map((item) {
              return Builder(
                builder: (BuildContext context) {
                  return Stack(
                    children: <Widget>[
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Image(
                          image: NetworkImage(item),
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        color: Colors.black.withOpacity(0.2),
                      ),
                    ],
                  );
                },
              );
            }).toList(),
            options: CarouselOptions(
              onPageChanged: (index,reason) {
                setActiveDot(index);
              },
              autoPlayCurve: Curves.fastLinearToSlowEaseIn,
              autoPlayAnimationDuration: const Duration(seconds: 2),
              viewportFraction: 1.0,
            ),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 10,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: List.generate(widget.items.length, (idx) {
                return activeIndex == idx ? const ActiveDot() : const InactiveDot();
              })),
        )
      ],
    );
  }
}

class ActiveDot extends StatelessWidget {
  const ActiveDot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
        width: 25,
        height: 8,
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}

class InactiveDot extends StatelessWidget {
  const InactiveDot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
        width: 8,
        height: 8,
        decoration: BoxDecoration(
          color: grey,
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}
