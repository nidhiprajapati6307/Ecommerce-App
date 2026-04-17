class Validators {
  static String? email(String value) {
    if (value.trim().isEmpty) {
      return "Email is required";
    }
    if (!RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$')
        .hasMatch(value.trim())) {
      return "Enter a valid email";
    }
    return null;
  }

  static String? password(String value) {
    if (value.isEmpty) {
      return "Password is required";
    }
    if (value.length < 6) {
      return "Password must be at least 6 characters";
    }
    return null;
  }
}
