import 'package:flutter/material.dart';
import 'package:movieapp/utils/text.dart';

class Description3 extends StatelessWidget {
  final String name, bannerurl, posterurl, vote, launchon, description;

  const Description3({
    Key? key,
    required this.name,
    required this.bannerurl,
    required this.posterurl,
    required this.vote,
    required this.launchon,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: [
            Container(
              height: 250,
              child: Stack(
                children: [
                  Positioned(
                      height: 250,
                      width: MediaQuery.of(context).size.width,
                      child: Image.network(
                        bannerurl,
                        fit: BoxFit.cover,
                      )),
                  Positioned(
                      bottom: 10,
                      child: Mdifidtxt(
                          text: "Average Rating -" + vote,
                          color: const Color.fromARGB(255, 253, 252, 252),
                          size: 18)),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              padding: EdgeInsets.all(15),
              child: Mdifidtxt(
                  text: name != null ? name : 'loading',
                  color: Colors.white,
                  size: 18),
            ),
            Container(
              padding: EdgeInsets.all(15),
              child: Mdifidtxt(
                  text: "Releasing on" + launchon, color: Colors.red, size: 18),
            ),
            Row(
              children: [
                Container(
                  height: 200,
                  width: 100,
                  child: Image.network(posterurl),
                ),
                SizedBox(
                  width: 10,
                ),
                Flexible(
                  child: Container(
                    child: Mdifidtxt(
                        text: description, color: Colors.greenAccent, size: 16),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
