import 'package:flutter/material.dart';
import 'package:movieapp/utils/text.dart';

class Description extends StatelessWidget {
  final String name, decription, bannerurl, posterurl, vote, launch_on;

  const Description({
    Key? key,
    required this.name,
    required this.bannerurl,
    required this.posterurl,
    required this.vote,
    required this.launch_on,
    required this.decription,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: ListView(
          children: [
            Container(
              height: 250,
              child: Stack(
                children: [
                  Positioned(
                      child: Container(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(
                      bannerurl,
                      fit: BoxFit.cover,
                    ),
                  )),
                  Positioned(
                      bottom: 10,
                      child: Mdifidtxt(
                          text: "Average Rating -" + vote,
                          color: Color.fromARGB(255, 252, 251, 251),
                          size: 18))
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Mdifidtxt(
                  text: name != null ? name : "not reload",
                  color: const Color.fromARGB(255, 251, 4, 4),
                  size: 15),
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              child: Mdifidtxt(
                  text: "Releasing On-" + launch_on,
                  color: Color.fromARGB(255, 250, 248, 248),
                  size: 15),
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.all(5),
                  height: 200,
                  width: 100,
                  child: Image.network(posterurl),
                ),
                Flexible(
                  child: Container(
                    child: Mdifidtxt(
                        text: decription, color: Colors.green, size: 18),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
