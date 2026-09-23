import 'utils/constants.dart';

class AppValidators {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return AppConstants.emailRequired;
    }
    final regex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    if (!regex.hasMatch(value)) {
      return AppConstants.emailInvalid;
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return AppConstants.passwordRequired;
    }
    if (value.length < 6) {
      return AppConstants.passwordTooShort;
    }
    return null;
  }

  static String? validateConfirmPassword(String? value, String password) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }
    if (value != password) {
      return 'Passwords do not match';
    }
    return null;
  }

  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return AppConstants.nameRequired;
    }
    if (value.length < 2) {
      return 'Name must be at least 2 characters';
    }
    return null;
  }

  static String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return AppConstants.phoneRequired;
    }
    final regex = RegExp(r'^(\+880|0)[1-9]\d{8}$');
    if (!regex.hasMatch(value)) {
      return 'Please enter a valid Bangladeshi phone number';
    }
    return null;
  }

  static String? validateNID(String? value) {
    if (value == null || value.isEmpty) {
      return AppConstants.nidRequired;
    }
    if (value.length != 13) {
      return 'NID must be 13 digits';
    }
    if (int.tryParse(value) == null) {
      return 'NID must contain only numbers';
    }
    return null;
  }

  static String? validateField(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return '$fieldName ${AppConstants.fieldRequired}';
    }
    return null;
  }

  static String? validatePrice(String? value) {
    if (value == null || value.isEmpty) {
      return 'Price is required';
    }
    if (double.tryParse(value) == null) {
      return 'Please enter a valid price';
    }
    if (double.parse(value) <= 0) {
      return 'Price must be greater than 0';
    }
    return null;
  }

  static String? validateRating(String? value) {
    if (value == null || value.isEmpty) {
      return 'Rating is required';
    }
    if (double.tryParse(value) == null) {
      return 'Please enter a valid rating';
    }
    final rating = double.parse(value);
    if (rating < 1 || rating > 5) {
      return 'Rating must be between 1 and 5';
    }
    return null;
  }

  static String? validateUrl(String? value) {
    if (value == null || value.isEmpty) {
      return 'URL is required';
    }
    try {
      Uri.parse(value);
      return null;
    } catch (e) {
      return 'Please enter a valid URL';
    }
  }
}
