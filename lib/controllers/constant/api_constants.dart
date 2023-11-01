class ApiConstants {

  //  auth base url
  static const String authBaseUrl = 'https://cyber-mind-deploy.onrender.com/api/auths';
  static String registerUserEndpoint() => '$authBaseUrl/create';
  static String loginUserEndpoint() => '$authBaseUrl/login';
}


