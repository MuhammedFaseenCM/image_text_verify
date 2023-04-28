import 'package:flutter/material.dart';
import 'package:image_text_verify/view/image/image_screen.dart';
import 'package:image_text_verify/view/textscreen/text_screen.dart';
import 'package:image_text_verify/view/widgets/appbar_widget.dart';
import 'package:image_text_verify/view/widgets/button_widget.dart';
import 'package:image_text_verify/view/widgets/const_colors.dart';
import 'package:image_text_verify/view/widgets/const_strings.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:kTransparent,
        flexibleSpace: const AppBarContainer(),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            welcomeText,
            style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 3.0,
                color: kblackColor.withRed(60)),
          ),
          const SizedBox(
            height: 50.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ButtonWidget(
                child: TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ImageScreen(),
                      ));
                    },
                    child: const Text(checkImageText)),
              ),
              ButtonWidget(
                child: TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const TextScreen(),
                      ));
                    },
                    child: const Text(checkText)),
              )
            ],
          )
        ],
      ),
    );
  }
}
