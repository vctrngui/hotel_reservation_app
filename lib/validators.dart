String? validateName(String? value) {
  final name = value?.trim() ?? '';
  if (name.isEmpty) return 'Please enter your name';
  if (name.length < 3) return 'Name must have at least 3 characters';
  return null;
}

String? validateEmail(String? value) {
  final email = value?.trim() ?? '';
  if (email.isEmpty) return 'Please enter your email';
  if (!RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(email)) {
    return 'Enter a valid email address';
  }
  return null;
}

String? validatePhone(String? value) {
  final phone = value?.trim() ?? '';
  if (phone.isEmpty) return 'Please enter your phone number';
  if (!RegExp(r'^\d{10,11}$').hasMatch(phone)) {
    return 'Use 10 or 11 digits, numbers only';
  }
  return null;
}

String? validateCheckIn(DateTime? value) {
  if (value == null) return 'Choose a check-in date';
  return null;
}

String? validateAgreement(bool accepted) {
  if (!accepted) return 'Please accept the hotel policy';
  return null;
}