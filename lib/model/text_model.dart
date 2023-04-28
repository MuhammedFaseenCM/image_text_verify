import 'dart:convert';

VerifyText verifyTextFromJson(String str) => VerifyText.fromJson(json.decode(str));


class VerifyText {
    final String? result;

    VerifyText({
        this.result,
    });

    factory VerifyText.fromJson(Map<String, dynamic> json) => VerifyText(
        result: json["result"],
    );

    Map<String, dynamic> toJson() => {
        "result": result,
    };
}
