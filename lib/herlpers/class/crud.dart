import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flowers_store/data/model/florist/florist_register.dart';
import 'package:flowers_store/herlpers/function/checkinternet.dart';
import 'package:flowers_store/herlpers/service/serviece.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

//String _basicAuth = 'Basic ${base64Encode(utf8.encode('temsah13:16797346'))}';
AppServices appServices = Get.find();
String? token = appServices.sharedPreferences.getString("accessToken")!;

final Map<String, String> myheaders = {
  'Authorization': 'Bearer $token',
  'Content-Type': 'application/json',
};

const Map<String, String> autHeaders = {
  'Content-Type': 'application/json',
};

class Crud {
  Future<Map> getData({required String url, bool auth = false}) async {
    Map responsebody;
    try {
      if (await checkInternetConnection()) {
        var response =
            await http.get(Uri.parse(url), headers: auth ? autHeaders : myheaders);
        responsebody = jsonDecode(response.body);
        if (response.statusCode == 200 || response.statusCode == 201) {
          responsebody["status"] = "success";
        } else {
          responsebody["status"] = "failure";
        }
      } else {
        responsebody = {
          "status": "offline",
          "message": "internet not found",
        };
      }
    } catch (e) {
      responsebody = {
        "status": "failure",
        "message": "$e",
      };
    }
    log(responsebody.toString());
    return responsebody;
  }

  Future<Map> postData(
      {required String url, required Map data, bool auth = false}) async {
    Map responsebody;
    if (await checkInternetConnection()) {
      var response = await http.post(Uri.parse(url),
          body: jsonEncode(data), headers: auth ? autHeaders : myheaders);
      logRequest(response: response, data: data, type: "POST");
      responsebody = jsonDecode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        responsebody["status"] = "success";
        return responsebody;
      }
      responsebody["status"] = "failure";
      return responsebody;
    }

    responsebody = {
      "status": "failure",
      "message": "internet not found",
    };
    return responsebody;
  }

  Future<Map> patchData(
      {required String url, required Map data, bool auth = false}) async {
    Map responsebody;
    try {
      if (await checkInternetConnection()) {
        var response = await http.patch(Uri.parse(url),
            body: jsonEncode(data), headers: auth ? autHeaders : myheaders);
        logRequest(response: response, data: data, type: "PATCH");
        responsebody = jsonDecode(response.body);
        if (response.statusCode == 200 || response.statusCode == 201) {
          responsebody["status"] = "success";
          return responsebody;
        }
        responsebody["status"] = "failure";
        return responsebody;
      }

      responsebody = {
        "status": "failure",
        "message": "internet not found",
      };
      return responsebody;
    } catch (e) {
      responsebody = {
        "status": "failure",
        "message": "$e",
      };
      return responsebody;
    }
  }

  Future<Map> deleteData({required String url}) async {
    Map responsebody;
    try {
      if (await checkInternetConnection()) {
        var response = await http.delete(Uri.parse(url), headers: myheaders);
        logRequest(response: response, data: {}, type: "DELETE");
        responsebody = jsonDecode(response.body);
        if (response.statusCode == 200 || response.statusCode == 201) {
          responsebody["status"] = "success";
          return responsebody;
        }
        responsebody["status"] = "failure";
        return responsebody;
      }
      responsebody = {
        "status": "failure",
        "message": "internet not found",
      };
      return responsebody;
    } catch (e) {
      responsebody = {
        "status": "failure",
        "message": "$e",
      };
      return responsebody;
    }
  }

  postRequsetWithMultiFiles(
      {required String url,
      required FloristRegister data,
      required List<String> certificates,
      required File cvFile}) async {
    Map responsebody = {};
    if (await checkInternetConnection()) {
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.fields.addAll(
          data.toJson().map((key, value) => MapEntry(key, value.toString())));
      for (var index = 0; index < data.section!.length; index++) {
        request.fields['floristView[section][$index]'] = data.section![index]!;
      }
      for (var element in certificates) {
        log(element);
        request.files.add(await http.MultipartFile.fromPath('certificates', element,
            contentType: MediaType('application', 'pdf')));
      }
      request.files.add(await http.MultipartFile.fromPath(
        'cv',
        cvFile.path,
        contentType: MediaType('application', 'pdf'),
      ));
      try {
        var response = await request.send();
        var responseBody = await http.Response.fromStream(response);
        if (response.statusCode == 201) {
          // successful response
          responsebody = jsonDecode(responseBody.body);
          responsebody["status"] = "success";
        } else {
          // Error response
          log("Upload failed with status code: ${response.statusCode}");
          responsebody = jsonDecode(responseBody.body);
          responsebody["status"] = "failure";
        }
      } catch (error) {
        // Exception occurred
        log("Error: $error");
        responsebody = {"status": "failure", "message": "$error"};
      }
    } else {
      responsebody = {
        "status": "failure",
        "message": "internet not found",
      };
    }
    return responsebody;
  }

  patchFile({
    required String url,
    required File file,
    bool auth = true,
  }) async {
    Map responsebody = {};
    if (await checkInternetConnection()) {
      var request = http.MultipartRequest('PATCH', Uri.parse(url));
      request.headers.addAll(auth ? myheaders : autHeaders);
      request.files.add(await http.MultipartFile.fromPath(
        'images',
        file.path,
        contentType: MediaType('image', 'jpeg'),
      ));
      try {
        log('===================');
        var response = await request.send();
        var responsedata = await http.Response.fromStream(response);
        if (response.statusCode == 200) {
          log('Image uploaded successfully');
          responsebody = jsonDecode(responsedata.body);
        } else {
          log('Image upload failed with status: ${response.statusCode}');
          responsebody = jsonDecode(responsedata.body);
        }
      } catch (error) {
        log("Error: $error");
        responsebody = {"status": "failure", "message": "$error"};
      }
    } else {
      responsebody = {
        "status": "offline",
        "message": "internet not found",
      };
    }
    log("---------------------");
    log(responsebody.toString());
    return responsebody;
  }

  String formatJson(String jsonString) {
    try {
      var jsonObject = jsonDecode(jsonString);
      var encoder = const JsonEncoder.withIndent('  ');
      return encoder.convert(jsonObject);
    } catch (e) {
      return jsonString; // Return the original string if it's not valid JSON
    }
  }

  void logRequest(
      {required var response,
      required Map data,
      required String type,
      bool hide = false}) {
    if (!hide) {
      log('''
------------------------------ $type Request ------------------------------
Request:
  URL: ${response.request?.url}
  Headers: ${const JsonEncoder.withIndent("  ").convert(response.request?.headers)}
  Body: ${const JsonEncoder.withIndent("  ").convert(data)}

Response:
  Status Code: ${response.statusCode}
  Headers: ${const JsonEncoder.withIndent("  ").convert(response.headers)}
  Body: ${formatJson(response.body)}
------------------------------ $type Request ------------------------------
''');
    }
  }
}
