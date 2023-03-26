
class UserModel {
  final String name;
  final String email;
  final bool isAuthenticated;
  UserModel({
    required this.name,
    required this.email,
    required this.isAuthenticated,
  });


  UserModel copyWith({
    String? name,
    String? email,
    bool? isAuthenticated,
  }) {
    return UserModel(
      name: name ?? this.name,
      email: email ?? this.email,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'isAuthenticated': isAuthenticated,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] as String,
      email: map['email'] as String,
      isAuthenticated: map['isAuthenticated'] as bool,
    );
  }

  @override
  String toString() => 'UserModel(name: $name, email: $email, isAuthenticated: $isAuthenticated)';

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.email == email &&
      other.isAuthenticated == isAuthenticated;
  }

  @override
  int get hashCode => name.hashCode ^ email.hashCode ^ isAuthenticated.hashCode;
}
