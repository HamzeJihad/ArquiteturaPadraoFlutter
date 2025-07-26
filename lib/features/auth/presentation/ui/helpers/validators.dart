String? emailValidator(String ? email) {
  if (email == null || email.isEmpty) {
    return 'Please enter your email';
  }
  if (!email.contains('@')) {
    return 'Please enter a valid email';
  }
  return null;
}

String ? passwordValidator(String ? password) {
  if (password == null || password.isEmpty) {
    return 'Please enter your password';
  }
  if (password.length < 6) {
    return 'Password must be at least 6 characters';
  }
  return null;
}

String ? nameValidator(String ? name){
  if (name == null || name.isEmpty) {
    return 'Please enter your name';
  }
  if (name.length < 3) {
    return 'Name must be at least 3 characters';
  }
  return null;
}

String ? phoneValidator(String ? phone) {
  if (phone == null || phone.isEmpty) {
    return 'Please enter your phone number';
  }
  if (phone.length < 10) {
    return 'Phone number must be at least 10 characters';
  }
  return null;
}

String? confirmPasswordValidator(String? confirmPassword, String? originalPassword) {
  if (confirmPassword == null || confirmPassword.isEmpty) {
    return 'Please confirm your password';
  }
  if (originalPassword == null || confirmPassword != originalPassword) {
    return 'Passwords do not match';
  }
  return null;
}