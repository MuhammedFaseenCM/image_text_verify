import 'package:flutter/material.dart';
import 'package:image_text_verify/controller/fetch_data.dart';
import 'package:image_text_verify/model/image_model.dart';
import 'package:image_picker/image_picker.dart';

class ImageDataProvider extends ChangeNotifier {
  Verifyclass? verifyclass;
  TextEditingController imageResultController = TextEditingController();

  final picker = ImagePicker();

  XFile? pickedFile;

  Future<void> selectImage(context) async {
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
    pickedFile = await picker.pickImage(source: ImageSource.gallery);
    notifyListeners();
  }

  Future<void> assignToClass(context) async {
    if (pickedFile == null) {
      return;
    }
    verifyclass = await fethData(image: pickedFile!.path);
    notifyListeners();
    Navigator.of(context).pop();
  }

  void clearImage() {
    pickedFile = null;
    notifyListeners();
  }
}
