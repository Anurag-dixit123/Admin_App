import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationApi {
  static const String baseUrl = 'https://vivek.provisioningtech.com';

  static Map<String, String> getHeaders() {
    return {
      'Client-Service': 'frontend-client',
      'Auth-Key': 'simplerestapi',
    };
  }

  static Future<http.Response> loginUser(String userId, String password) async {
    final String loginUrl = '$baseUrl/get_ajax/login';

    var headers = getHeaders();
    var body = {'user_id': userId, 'password': password};

    try {
      var response = await http.post(Uri.parse(loginUrl), headers: headers, body: body);

      if (response.statusCode == 200) {
        return response;
      } else {
        throw Exception('Failed to connect to the server. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}

class AuthenticationService {
  final BuildContext context;

  AuthenticationService(this.context);

  Future<void> login(String userId, String password) async {
    try {
      var httpResponse = await AuthenticationApi.loginUser(userId, password);
      int statusCode = httpResponse.statusCode;
      var response = json.decode(httpResponse.body);

      print('Status Code: $statusCode');
      print('Response Message: ${response['message']}');

      if (statusCode == 200) {
        bool? authenticationSuccess = response['authentication_success'];

        if (statusCode == 200 && response['message'] == 'ok') {
          print('Login successful');
          print(jsonEncode(response));

          // Extract 'ci_session' cookie from the response headers
          String? ciSessionCookie = httpResponse.headers['set-cookie'];

// Save id, token, and 'ci_session' cookie to SharedPreferences
          saveToSharedPreferences(response, ciSessionCookie);

          Navigator.pushNamed(context, 'HomeScreen');
          showLoginSnackbar(response['message']);
        } else {
          print('Login failed: ${response['message']}');
          showLoginErrorSnackbar(response['message']);
        }
      } else {
        print('Failed to connect to the server. Status code: $statusCode');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  void showLoginErrorSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        content: Center(child: Text(' $message', style: TextStyle(color: Colors.white, fontSize: 15),)),
        duration: Duration(seconds: 3), // Adjust the duration as needed
      ),
    );
  }

  void showLoginSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        content: Center(child: Text('Login Successfully', style: TextStyle(color: Colors.white, fontSize: 20),)),
        duration: Duration(seconds: 2), // Adjust the duration as needed
      ),
    );
  }

  void saveToSharedPreferences(Map<String, dynamic> response, String? ciSessionCookie) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('id', response['id']);
    prefs.setString('token', response['token']);
    if (ciSessionCookie != null) {
      // Extract 'ci_session' value from the cookie string
      String ciSessionValue = ciSessionCookie.split(';').first;
      prefs.setString('ci_session_cookie', ciSessionValue.trim());
      print('Saved ci_session Cookie: $ciSessionValue');
    } else {
      print('ci_session Cookie not found in the response headers');
    }
    print("Saved ID is : ${response['id']}");
    print('Saved Token Is : ${response['token']}');
  }
}


//2nd Api Add_Slider_images_Api
class AddSliderImagesApiClass {
  static const String baseUrl = 'https://vivek.provisioningtech.com';

  static Future<Map<String, String>> getHeaders() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userId = prefs.getString('id') ?? '';
    String token = prefs.getString('token') ?? '';
    String ciSessionCookie = prefs.getString('ci_session_cookie') ?? '';


    Map<String, String> headers = {
      'Client-Service': 'frontend-client',
      'Auth-Key': 'simplerestapi',
      'User-ID': userId,
      'Authorization': token,
      'type': '1',
      'Cookie': 'ci_session=$ciSessionCookie',
    };

    print('Headers: $headers'); // Add this line for debugging

    return headers;
  }

  static Future<void> makeApiRequest(String imagePath) async {
    var headers = await getHeaders();

    // Add debugging output
    print('Request Headers: $headers');

    try {
      var request = http.MultipartRequest(
          'POST', Uri.parse('$baseUrl/post_ajax/add_slider_details'));

      request.fields.addAll({
        'slider_title': '02',
        'desc1': '1desc',
      });

      // Add the selected image file to the request
      request.files.add(await http.MultipartFile.fromPath(
          'slider_image', imagePath)); // Pass dynamic image path here
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        String responseBody = await response.stream.bytesToString();
        print('Response JSON: $responseBody');
        // If you need to work with the JSON data as a Dart object, you can parse it
        Map<String, dynamic> responseData = json.decode(responseBody);
        // Now you can work with the parsed JSON data as needed
        print('Parsed JSON: $responseData');
      } else {
        print('Request failed. Status code: ${response.statusCode}');
        print('Reason: ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Error during API request: $e');
      // Handle other errors (show an error message, etc.)
    }
  }
}

//3rd Api Add_Category_Api
class AddCategoryApiClass {

  static const String baseUrl = 'https://vivek.provisioningtech.com';

  static Future<Map<String, String>> getHeaders() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userId = prefs.getString('id') ??
        ''; // Get user ID from shared preferences
    String token = prefs.getString('token') ??
        ''; // Get token from shared preferences
    String ciSessionCookie = prefs.getString('ci_session_cookie') ?? '';

    Map<String, String> headers = {
      'Client-Service': 'frontend-client',
      'Auth-Key': 'simplerestapi',
      'User-ID': userId,
      'Authorization': token,
      'type': '1',
      'Cookie': 'ci_session=$ciSessionCookie',
    };

    print('Headers: $headers'); // Add this line for debugging

    return headers;
  }


  static Future<void> makeApiRequest(String imagePath) async {
    var headers = await getHeaders();
    var request = http.MultipartRequest(
        'POST', Uri.parse('$baseUrl/post_ajax/add_category'));

    request.fields.addAll({
      'name': 'abhi',
    });
    // Add the selected image file to the request
    request.files.add(await http.MultipartFile.fromPath('slider_image', imagePath));
    request.headers.addAll(headers);
    try {
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        String responseBody = await response.stream.bytesToString();
        print('Response JSON: $responseBody');

        // If you need to work with the JSON data as a Dart object, you can parse it
        Map<String, dynamic> responseData = json.decode(responseBody);
        // Now you can work with the parsed JSON data as needed
        print('Parsed JSON: $responseData');
      } else {
        print('Request failed. Status code: ${response.statusCode}');
        print('Reason: ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Error during API request: $e');
      // Handle other errors (show an error message, etc.)
    }
  }
}


//4th Api Add_Product_Api code
class AddProductApiClass {
  static const String baseUrl = 'https://vivek.provisioningtech.com';

  static Future<Map<String, String>> getHeaders() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userId = prefs.getString('id') ?? '';
    String token = prefs.getString('token') ?? '';
    String ciSessionCookie = prefs.getString('ci_session_cookie') ?? '';

    Map<String, String> headers = {
      'Client-Service': 'frontend-client',
      'Auth-Key': 'simplerestapi',
      'User-ID': userId,
      'Authorization': token,
      'type': '1',
      'Cookie': 'ci_session=$ciSessionCookie',
    };

    print('Headers: $headers');

    return headers;
  }

  static Future<void> makeApiRequest(String imagePath) async {
    var headers = await getHeaders();
    var request = http.MultipartRequest(
        'POST', Uri.parse('$baseUrl/post_ajax/add_product'));

    request.fields.addAll({
      'name': 'abhi',
      'price': '100',
      'offer_price': '200',
      'product_size': '20',
      'category': '1',
    });
    // Add the selected image file to the request
    request.files.add(await http.MultipartFile.fromPath('slider_image', imagePath));
    request.headers.addAll(headers);


    try {
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        String responseBody = await response.stream.bytesToString();
        print('Response JSON: $responseBody');
      } else {
        print('Request failed. Status code: ${response.statusCode}');
        print('Reason: ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Error during API request: $e');
      // Handle other errors (show an error message, etc.)
    }
  }
}



