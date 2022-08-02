import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/color/colors.dart';
import 'package:flutter_ecommerce_app/model/data.dart';
import 'package:flutter_ecommerce_app/widget/custom_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: getBody(),
    );
  }

  getBody() {
    var size = MediaQuery.of(context).size;

    return ListView(children: [
      Stack(
        children: [
          Container(
            width: size.width,
            height: 500,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(homeImg), fit: BoxFit.cover)),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Icon(
                  Icons.favorite,
                  color: white,
                  size: 28,
                ),
                SizedBox(
                  width: 15,
                ),
                Icon(
                  Icons.search,
                  color: white,
                  size: 25,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Winter Collection',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: white,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: const [
                      Text(
                        'Discover',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: white,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: white,
                        size: 18,
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      const SizedBox(
        height: 40,
      ),
      Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Categories',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Row(
              children: const [
                Text(
                  'All',
                  style: TextStyle(
                      color: grey, fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 5,
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: grey,
                )
              ],
            )
          ],
        ),
      ),
      const SizedBox(
        height: 20,
      ),
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(categories.length, (index) {
            return Padding(
              padding: const EdgeInsets.only(left: 15),
              child: SizedBox(
                width: 180,
                height: 220,
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(categories[index]['imgUrl']),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(5)),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: black.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(5)),
                    ),
                    Positioned(
                      bottom: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          categories[index]['title'],
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: white),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
        ),
      ),
      const SizedBox(
        height: 40,
      ),
      Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Recommended for you',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Row(
              children: const [
                Text(
                  'All',
                  style: TextStyle(
                      color: grey, fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 5,
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: grey,
                )
              ],
            )
          ],
        ),
      ),
      const SizedBox(
        height: 20,
      ),
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(recommends.length, (index) {
            return Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 140,
                    height: 180,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(recommends[index]['imgUrl']),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(5)),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    width: 140,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          recommends[index]['title'],
                          style: const TextStyle(
                              color: black,
                              fontWeight: FontWeight.bold,
                              height: 1.5),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "\$ " + recommends[index]['price'],
                          style: const TextStyle(
                              color: grey,
                              fontWeight: FontWeight.bold,
                              height: 1.5),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          }),
        ),
      ),
      const SizedBox(
        height: 40,
      ),
      const CustomCarouselHomePage(items: slider),
      const SizedBox(
        height: 30,
      ),
      Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Recently Viewed',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Row(
              children: const [
                Text(
                  'All',
                  style: TextStyle(
                      color: grey, fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 5,
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: grey,
                )
              ],
            )
          ],
        ),
      ),
      const SizedBox(
        height: 20,
      ),
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(recently.length, (index) {
            return Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 140,
                    height: 180,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(recently[index]['imgUrl']),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(5)),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    width: 140,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          recently[index]['title'],
                          style: const TextStyle(
                              color: black,
                              fontWeight: FontWeight.bold,
                              height: 1.5),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "\$ " + recommends[index]['price'],
                          style: const TextStyle(
                              color: grey,
                              fontWeight: FontWeight.bold,
                              height: 1.5),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          }),
        ),
      ),
    ]);
  }
}
