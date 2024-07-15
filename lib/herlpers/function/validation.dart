import 'package:get/get.dart';

class FormValidator {
  static String? name(String? val) {
    if (val == null || val.isEmpty) {
      return "Name can't be empty";
    } else if (!GetUtils.isUsername(val)) {
      return "Not a valid username";
    } else if (val.length < 2) {
      return "Name can't be less than 2 characters";
    } else if (val.length > 10) {
      return "Name can't be longer than 10 characters";
    }
    return null;
  }

  static String? email(String? val) {
    if (val == null || val.isEmpty) {
      return "Email can't be empty";
    } else if (!GetUtils.isEmail(val)) {
      return "Not a valid email";
    } else if (val.length < 10) {
      return "Email can't be less than 10 characters";
    } else if (val.length > 60) {
      return "Email can't be longer than 30 characters";
    }
    return null;
  }

  static String? phone(String? val) {
    if (val == null || val.isEmpty) {
      return "Phone number can't be empty";
    } else if (!GetUtils.isPhoneNumber(val)) {
      return "Not a valid phone number";
    } else if (val.length != 11) {
      return "Phone number must be 11 characters long";
    }
    return null;
  }

  static String? password(String? val) {
    if (val == null || val.isEmpty) {
      return "Password can't be empty";
    } else if (val.length < 5) {
      return "Password can't be less than 5 characters";
    } else if (val.length > 15) {
      return "Password can't be longer than 15 characters";
    }
    return null;
  }

  static String? confirmPassword(String? val, String? password) {
    if (val == null || val.isEmpty) {
      return "Password can't be empty";
    } else if (val.length < 5) {
      return "Password can't be less than 5 characters";
    } else if (val != password) {
      return "No matched password";
    } else if (val.length > 15) {
      return "Password can't be longer than 15 characters";
    }
    return null;
  }

  static String? national(String? val) {
    if (val == null || val.isEmpty) {
      return "National ID can't be empty";
    } else if (val.length < 14) {
      return "National ID can't be less than 14 characters";
    } else if (val.length > 14) {
      return "National ID can't be longer than 14 characters";
    }
    return null;
  }

  static String? url(String? val) {
    if (val == null || val.isEmpty) {
      return "URL can't be empty";
    } else if (!GetUtils.isURL(val)) {
      return "Not a valid URL";
    }
    return null;
  }

  static String? section(String? val) {
    if (val == null || val.isEmpty) {
      return "section can't be empty";
    } else if (!GetUtils.isUsername(val)) {
      return "value a invalid section";
    }
    return null;
  }

  static String? cardNumber(String? val) {
    if (val == null || val.isEmpty) {
      return "Card number can't be empty";
    } else if (!RegExp(r'^[0-9]{16}$').hasMatch(val)) {
      return "Not a valid card number";
    }
    return null;
  }

  static String? cardExpiry(String? val) {
    if (val == null || val.isEmpty) {
      return "Expiry date can't be empty";
    } else if (!RegExp(r'^(0[1-9]|1[0-2])\/?([0-9]{2})$').hasMatch(val)) {
      return "Please enter in MM/YY format";
    }
    return null;
  }

  static String? cvv(String? val) {
    if (val == null || val.isEmpty) {
      return "CVV can't be empty";
    } else if (!RegExp(r'^[0-9]{3,4}$').hasMatch(val)) {
      return "Not a valid CVV";
    }
    return null;
  }
}
