import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:image_text_verify/model/api.dart';
import 'package:image_text_verify/model/image_model.dart';

Future<Verifyclass> fethData({required image}) async {
  var request = http.MultipartRequest(
      'POST',
      Uri.parse(
          'https://nsfw-images-detection-and-classification.p.rapidapi.com/adult-content-file'));

  request.files.add(await http.MultipartFile.fromPath('image', image));

  request.headers.addAll({
    'X-RapidAPI-Key': rapidApi,
    'X-RapidAPI-Host':
        'nsfw-images-detection-and-classification.p.rapidapi.com',
    ...request.headers,
  });

  var response = await request.send();
  if (response.statusCode == 200) {
    var responseString = await response.stream.transform(utf8.decoder).join();
    print(responseString);
    var json = jsonDecode(responseString);
    return Verifyclass.fromJson(json);
  } else {
    print(response.statusCode);
    return Verifyclass(unsafe: true, objects: []);
  }

  // final response = await http.post(url, headers: headers, body: body);
  // print(response.statusCode);
  // print(response.body);
}
