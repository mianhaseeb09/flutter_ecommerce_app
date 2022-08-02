import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/color/colors.dart';
import 'package:flutter_ecommerce_app/model/data.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: getBody(),
    );
  }

  getBody() {
    return ListView(
      children: [
        Column(
            children: List.generate(cartList.length, (index) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: Row(
                  children: [
                    Container(
                      width: 140,
                      height: 180,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: NetworkImage(cartList[index]['img']),
                              fit: BoxFit.cover)),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(cartList[index]['name'],
                            style: const TextStyle(fontSize: 22)),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "ref " + cartList[index]['ref'],
                          style: TextStyle(
                              fontSize: 13, color: black.withOpacity(0.7)),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          cartList[index]['size'],
                          style: const TextStyle(
                            fontSize: 22,
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              cartList[index]['price'],
                              style: const TextStyle(fontSize: 22),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 25,
                                  height: 25,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: black.withOpacity(0.1)),
                                  child: Center(
                                    child: Icon(
                                      FontAwesomeIcons.minus,
                                      size: 10,
                                      color: black.withOpacity(0.5),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text(
                                  '1',
                                  style: TextStyle(fontSize: 15),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  width: 25,
                                  height: 25,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: black.withOpacity(0.1)),
                                  child: Center(
                                    child: Icon(
                                      FontAwesomeIcons.plus,
                                      size: 10,
                                      color: black.withOpacity(0.5),
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          );
        })),
        Divider(
          color: grey.withOpacity(0.8),
        ),
        const SizedBox(
          height: 10,
        ),
        const Padding(
          padding: EdgeInsets.only(left: 30, right: 30),
          child: Text(
            'Do You Have A Promotion Code?',
            style: TextStyle(fontSize: 16),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Divider(
          color: grey.withOpacity(0.8),
        ),
        const SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Delivery',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                'Standard--Free',
                style: TextStyle(fontSize: 16),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Container(
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
              color: black,
              borderRadius: BorderRadius.circular(50 / 2),
            ),
            child: Center(
                child: Text(
              'Buy for \$50'.toUpperCase(),
              style: const TextStyle(color: white, fontWeight: FontWeight.bold),
            )),
          ),
        )
      ],
    );
  }
}
