import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_text_verify/controller/provider_data.dart';
import 'package:image_text_verify/view/widgets/appbar_widget.dart';
import 'package:image_text_verify/view/widgets/button_widget.dart';
import 'package:image_text_verify/view/widgets/const_colors.dart';
import 'package:image_text_verify/view/widgets/const_strings.dart';
import 'package:provider/provider.dart';

class ImageScreen extends StatelessWidget {
  const ImageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<ImageDataProvider>(context, listen: false);
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        dataProvider.clearImage();
        dataProvider.verifyclass = null;

        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(verifyNudityText),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          flexibleSpace: const AppBarContainer(),
        ),
        body: Consumer<ImageDataProvider>(builder: (context, value, _) {
          return SizedBox(
            height: size.height,
            width: size.width,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 20.0,
                  ),
                  ButtonWidget(
                    child: TextButton(
                        onPressed: () async {
                          await dataProvider.selectImage(context);
                          // ignore: use_build_context_synchronously
                          await dataProvider.assignToClass(context);
                        },
                        child: const Text(chooseText)),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  ButtonWidget(
                    height: 300.00,
                    width: 300.0,
                    child: dataProvider.pickedFile != null
                        ? Image.file(File(dataProvider.pickedFile!.path))
                        : const Center(
                            child: Text(
                              imageWillShowText,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16.0),
                            ),
                          ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  ButtonWidget(
                    width: size.width,
                    child: dataProvider.verifyclass != null
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              dataProvider.verifyclass!.unsafe == true
                                  ? const Icon(
                                      Icons.close,
                                      color: kRedColor,
                                      size: 30.0,
                                    )
                                  : const Icon(
                                      Icons.check,
                                      color: kGreenColor,
                                      size: 30.0,
                                    ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              Text(
                                dataProvider.verifyclass!.unsafe == false
                                    ? safeText
                                    : containtNudityText,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0),
                              ),
                            ],
                          )
                        : const Text(
                            resultWillShowText,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16.0),
                          ),
                  )
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
