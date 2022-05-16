class ApiConfig {
  static const baseUrl = 'http://localhost/api/';
  static const roomsUrl = 'rooms/';
  static const itemsUrl = 'items/';
  static const companiesUrl = 'company/';

  static roomUrl(String id) => 'room/$id/';

  static itemUrl(String id) => 'item/$id/';

  static companyUrl(String id) => 'company/$id/';
}
