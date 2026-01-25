class AppConstants {
  // App info
  static const String appName = 'SajibVai';
  static const String appVersion = '1.0.0';

  // API endpoints (mock)
  static const String baseUrl = 'https://api.example.com';

  // Cities
  static const List<String> cities = [
    'Dhaka',
    'Chittagong',
    'Khulna',
    'Rajshahi',
    'Sylhet',
    'Barisal',
    'Rangpur',
  ];

  // User roles
  static const String roleStudent = 'student';
  static const String roleHouseOwner = 'houseowner';
  static const String roleServiceProvider = 'serviceprovider';

  // Service categories
  static const List<String> serviceCategories = [
    'cleaning',
    'repair',
    'moving',
    'plumbing',
    'electrical',
    'carpentry',
  ];

  // Tuition levels
  static const List<String> tuitionLevels = [
    'primary',
    'secondary',
    'hsc',
    'university',
  ];

  // Booking statuses
  static const String bookingPending = 'pending';
  static const String bookingConfirmed = 'confirmed';
  static const String bookingCompleted = 'completed';
  static const String bookingCancelled = 'cancelled';

  // Validation messages
  static const String emailRequired = 'Email is required';
  static const String emailInvalid = 'Please enter a valid email';
  static const String passwordRequired = 'Password is required';
  static const String passwordTooShort = 'Password must be at least 6 characters';
  static const String nameRequired = 'Name is required';
  static const String phoneRequired = 'Phone number is required';
  static const String nidRequired = 'NID is required';
  static const String fieldRequired = 'This field is required';

  // Timeouts
  static const Duration apiTimeout = Duration(seconds: 30);
  static const Duration debounceDelay = Duration(milliseconds: 500);

  // Pagination
  static const int pageSize = 20;
}
