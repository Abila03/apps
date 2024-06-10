class RegistrationData {
  final String email;
  final String fullName;
  final String password;
  final String confirmPassword;
  final String jenjang;
  final String schoolName; // Added for school information

  RegistrationData({
    required this.email,
    required this.fullName,
    required this.password,
    required this.confirmPassword,
    required this.jenjang,
    this.schoolName = '', // Optional school name
  });

  RegistrationData copyWith({
    String? email,
    String? fullName,
    String? password,
    String? confirmPassword,
    String? jenjang,
    String? schoolName,
  }) {
    return RegistrationData(
      email: email ?? this.email,
      fullName: fullName ?? this.fullName,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      jenjang: jenjang ?? this.jenjang,
      schoolName: schoolName ?? this.schoolName,
    );
  }
}
