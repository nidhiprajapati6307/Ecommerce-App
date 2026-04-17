import 'dart:convert';

class BasicAuth {
  static final String userName = "UPBA_getById";
  static final String password = "7hfn894f4jUPBP";

  static String createBasicAuth() {
    String credentials = '$userName:$password';
    String encoded = base64Encode(utf8.encode(credentials));
    return 'Basic $encoded';
  }
}
