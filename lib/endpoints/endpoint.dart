class Endpoint {
  static const String baseURL =
      "https://66038e2c2393662c31cf2e7d.mockapi.io/api/v1";
  static const String news = "$baseURL/news";
  static const String categories = "$baseURL/categories";

  static const String baseURLLive = "https://simobile.singapoly.com";
  static const String datas = "$baseURLLive/api/datas";

  // UTS PUNYA
  static const String baseURLuts = 'https://simobile.singapoly.com';
  static const String datasuts = "$baseURLuts/api/customer-service";
  static const String dataNIM = "$datasuts/2215091047";

  //balance
  static const String balance = "$baseURLLive/api/balance/2215091047";
  static const String spending = "$baseURLLive/api/spending/2215091047";

  // auth
  static const String login = "$baseURLLive/api/auth/login";
  static const String logout = "$baseURLLive/api/auth/logout";

  // UAS
  static const String host = "10.0.2.2";
  // static const String host = ""; IP public

  static const String baseUAS = "http://$host:5000";
  static const String loginUAS = "$baseUAS/api/v1/auth/login";

  static const String ruanganRead = "$baseUAS/api/v1/ruangan/read";
}
