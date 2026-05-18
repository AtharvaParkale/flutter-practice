class User {
  final String? name;
  final String? email;
  final bool isPremium;

  User({
    this.name,
    this.email,
    required this.isPremium,
  });
}