import 'package:flutter_daily_practice/features/design_patterns/creational/builder/user_model.dart' show User;

class UserBuilder {
  String? _name;
  String? _email;
  bool _isPremium = false;

  UserBuilder setName(String name) {
    _name = name;
    return this;
  }

  UserBuilder setEmail(String email) {
    _email = email;
    return this;
  }

  UserBuilder setPremium(bool value) {
    _isPremium = value;
    return this;
  }

  User build() {
    return User(
      name: _name,
      email: _email,
      isPremium: _isPremium,
    );
  }
}