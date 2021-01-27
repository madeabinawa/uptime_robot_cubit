part of 'apis.dart';

class MonitorServices {
  // Menggunakan static method agar method dapat langsung diakses
  // tanpa membuat object
  static Future<List<MonitorModel>> getMonitors() async {
    List<MonitorModel> monitor = [];
    // Menghubungkan ke api
    final response = await http.post(getMonitorsURL, body: {'api_key': apiKey});
    if (response.statusCode == 200) {
      // Decode response json dan cast kedalam bentuk key-value pair
      // Mengambil data list dari value monitors
      dynamic result =
          json.decode(response.body)['monitors'].cast<Map<String, dynamic>>();

      // Untuk setiap element didalam monitors
      for (var monitorItem in result) {
        // Mengambil metaTitle url
        var data = await extract(monitorItem["url"]);
        String metaTitle = data.title.toString();

        monitor.add(MonitorModel(
            id: monitorItem["id"],
            alias: monitorItem["friendly_name"],
            site: monitorItem["url"],
            metaTitle: metaTitle,
            status: monitorItem["status"]));
      }

      // * Create MonitorModel Object from result with factory and map
      /* monitor = result
           .map<MonitorModel>((monitor) => MonitorModel.fromJson(monitor))
           .toList();
      */
    }
    return monitor;
  }
}
