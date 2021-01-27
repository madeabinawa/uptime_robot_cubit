class MonitorModel {
  final int id, status;
  final String alias, site;
  final String metaTitle;

  MonitorModel({this.id, this.alias, this.site, this.status, this.metaTitle});

  // *Note: Method factory fromJson to convert Map data type from api to MonitorModel instance
  /*factory MonitorModel.fromJson(Map<String, dynamic> monitor) {
    return MonitorModel(
      id: monitor['id'],
      alias: monitor['friendly_name'],
      site: monitor['url'],
      status: monitor['status'],
    );
  }
  */

  // *Note: Create method copyWith to update monitor props
  /*MonitorModel copyWith({String metaTitle}) => MonitorModel(
        id: this.id,
        status: this.status,
        alias: this.alias,
        site: this.site,
        metaTitle: metaTitle,
      );
      */
}
