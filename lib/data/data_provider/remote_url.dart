class RemoteUrls {
  static const String rootUrl = "https://carbaz.mamunuiux.com/";
  static const String baseUrl = '${rootUrl}api/';
  static const String login = '${baseUrl}store-login';
  static const String websiteSetup = '${baseUrl}website-setup';
  static const String logout = '${baseUrl}user-logout';
  static const String homeUrl = baseUrl;
  static String contactMessage = '${baseUrl}store-contact-message';

  static String carDetails(String id) => '${baseUrl}listing/$id';

  static String dealerDetails(userName) => '${baseUrl}dealer/$userName';

  static String contactDealer(carId) =>
      '${baseUrl}send-message-to-dealer/$carId';

  static imageUrl(String imageUrl) => rootUrl + imageUrl;
}
