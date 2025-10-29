class Urls {
  static const String _baseUrl = "https://foodsflow.netlify.app/api";

  static get registerUrl => Uri.parse("$_baseUrl/auth/register");

  static get loginUrl => Uri.parse("$_baseUrl/auth/login");
  
  static get productUrl => Uri.parse("https://dummyjson.com/products");
}
