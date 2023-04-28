import 'package:flutter/material.dart';
import 'package:image_nudity/controller/text_provider.dart';
import 'package:image_nudity/view/textscreen/widgets/textformfield_widget.dart';
import 'package:image_nudity/view/widgets/appbar_widget.dart';
import 'package:image_nudity/view/widgets/const_colors.dart';
import 'package:image_nudity/view/widgets/const_strings.dart';
import 'package:provider/provider.dart';

class TextScreen extends StatelessWidget {
  const TextScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textProvider = Provider.of<TextProvider>(context, listen: false);
    return WillPopScope(
      onWillPop: () async{
        textProvider.resultController.clear();
        textProvider.textController.clear();
        return true;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text(verifyProfanityText),
          centerTitle: true,
          backgroundColor: kTransparent,
          flexibleSpace: const AppBarContainer(),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 30.0),
                TextFormFieldWidget(
                    controller: textProvider.textController, readOnly: false),
                const SizedBox(
                  height: 40.0,
                ),
                TextFormFieldWidget(
                    controller: textProvider.resultController, readOnly: true)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
