import 'package:http/http.dart' as http;
import 'package:image_nudity/controller/text_provider.dart';
import 'package:image_nudity/model/text_model.dart';
import 'package:image_nudity/model/api.dart';
import 'package:provider/provider.dart';

Future<void> fetchProfanity({required text, required context}) async {
  final textProvider = Provider.of<TextProvider>(context, listen: false);
  var url = Uri.parse('https://community-purgomalum.p.rapidapi.com/json');
  var headers = {
    'content-type': 'application/octet-stream',
    'X-RapidAPI-Key': rapidApi,
    'X-RapidAPI-Host': 'community-purgomalum.p.rapidapi.com'
  };
  var params = {'text': '$text'};

  try {
    var response =
        await http.get(url.replace(queryParameters: params), headers: headers);
    print(response.body);
    var verifyText = verifyTextFromJson(response.body);
    if (verifyText.result == null) {
      return;
    }
    textProvider.resultController.text = verifyText.result!;
  } catch (error) {
    print(error);
  }
}
