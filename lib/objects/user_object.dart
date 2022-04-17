class UserObject {
  final String name;
  final String email;
  final String phone;

  UserObject({
    required this.name,
    required this.email,
    required this.phone,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserObject &&
        other.name == name &&
        other.email == email &&
        other.phone == phone;
  }

  @override
  int get hashCode => name.hashCode ^ email.hashCode ^ phone.hashCode;

  @override
  String toString() => 'UserObject(name: $name, email: $email, phone: $phone)';

  UserObject copyWith({
    String? name,
    String? email,
    String? phone,
  }) {
    return UserObject(
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
    );
  }
}
