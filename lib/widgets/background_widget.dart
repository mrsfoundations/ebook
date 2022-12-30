import 'package:flutter/material.dart';

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            bottom: 200,
            left: 100,
            child: Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(68, 19, 110, 196),
                  borderRadius: BorderRadius.circular(150)),
            )),
        Positioned(
            bottom: 30,
            right: 20,
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  backgroundBlendMode: BlendMode.softLight,
                  color: const Color.fromARGB(29, 85, 88, 245),
                  borderRadius: BorderRadius.circular(100)),
            )),
        Positioned(
            bottom: 100,
            left: 100,
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(20, 230, 175, 24),
                  borderRadius: BorderRadius.circular(50)),
            )),
        Container(
          decoration: const BoxDecoration(
            backgroundBlendMode: BlendMode.softLight,
            color: Color.fromARGB(109, 5, 76, 206),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.elliptical(300, 300),
            ),
          ),
          height: 300,
        )
      ],
    );
  }
}
