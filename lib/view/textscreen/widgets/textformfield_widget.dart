import 'package:flutter/material.dart';
import 'package:image_text_verify/controller/debounce/debounce.dart';
import 'package:image_text_verify/controller/fetch_profanity.dart';
import 'package:image_text_verify/controller/text_provider.dart';
import 'package:image_text_verify/view/widgets/const_strings.dart';
import 'package:provider/provider.dart';

final debouncer = Debouncer(milliseconds: 1 * 1000);

class TextFormFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final bool readOnly;
  const TextFormFieldWidget(
      {super.key, required this.controller, required this.readOnly});

  @override
  Widget build(BuildContext context) {
    final textProvider = Provider.of<TextProvider>(context, listen: false);
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText:
              readOnly ? censoredTextShows : enterText),
      readOnly: readOnly,
      onChanged: readOnly
          ? null
          : (value) {
              if (value.isEmpty) {
                textProvider.resultController.clear();
                return;
              }
              debouncer.run(() {
                fetchProfanity(
                    text: textProvider.textController.text, context: context);
              });
            },
    );
  }
}
