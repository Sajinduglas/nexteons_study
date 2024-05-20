import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import '../../utils/text_styles.dart';

void main() {
  runApp(MaterialApp(
    home: ResultScreen(),
  ));
}

class ResultScreen extends StatelessWidget {
  ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: double.infinity,
              width: 350,
              color: ColorTheme.lightBlue,
              padding: const EdgeInsets.only(top: 74, right: 54, left: 54),
              child: Align(
                  alignment: Alignment.topCenter,
                  child: Image.asset("assets/images/nexteon_image.png")),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 120, top: 72),
              child: SizedBox(
                height: double.infinity,
                width: size.width * .5,
                child: Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "New students",
                        style: GlTextStyles.interStyl(
                            size: 35, weight: FontWeight.w700),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30),
                        child: Flexible(
                          child: GridView.builder(
                            itemCount: 8,
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 4,
                                    childAspectRatio: .8,
                                    // mainAxisExtent: 115,
                                    mainAxisSpacing: 10,
                                    crossAxisSpacing: 10),
                            itemBuilder: (
                              BuildContext context,
                              int index,
                            ) {
                              return Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: ColorTheme.grey,
                                    border: Border.all(
                                        width: 1, color: ColorTheme.darkGrey)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 30),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("nameeeee"),
                                      Text("nameeeee"),
                                      Text("nameeeee"),
                                      Text("nameeeee"),
                                      Text("nameeeee"),
                                      Text("nameeeee"),
                                      Text("nameeeee"),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
