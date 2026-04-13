import 'package:flutter_daily_practice/features/design_patterns/behavioral/command_pattern/code/command_interface.dart';
import 'package:flutter_daily_practice/features/design_patterns/behavioral/command_pattern/flutter_impl/button_example/command_pattern/payment_service.dart';

class PayToUserCommand implements Command {
  final PaymentService service;
  final String userId;
  final double amount;

  PayToUserCommand({
    required this.service,
    required this.userId,
    required this.amount,
  });

  @override
  void execute() {
    service.payToUser(userId, amount);
  }
}
