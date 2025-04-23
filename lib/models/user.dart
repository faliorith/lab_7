class User {
  final String email;
  final String password;
  final String name;
  final String surname;
  final String phone;
  final String address;

  User({
    required this.email,
    required this.password,
    required this.name,
    required this.surname,
    required this.phone,
    required this.address,
  });

  User copyWith({
    String? email,
    String? password,
    String? name,
    String? surname,
    String? phone,
    String? address,
  }) {
    return User(
      email: email ?? this.email,
      password: password ?? this.password,
      name: name ?? this.name,
      surname: surname ?? this.surname,
      phone: phone ?? this.phone,
      address: address ?? this.address,
    );
  }
}