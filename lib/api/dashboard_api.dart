part of 'apis.dart';

class DashboardServices {
  static Future<DashboardModel> getDashboard() async {
    DashboardModel dashboard;
    // Initialize API connection
    final response = await http.post(getAccountURL, body: {'api_key': apiKey});

    if (response.statusCode == 200) {
      // Decode response json dan cast kedalam bentuk key-value pair
      dynamic result = json.decode(response.body)['account'];

      dashboard = DashboardModel.fromJson(result);
    }
    return dashboard;
  }
}
