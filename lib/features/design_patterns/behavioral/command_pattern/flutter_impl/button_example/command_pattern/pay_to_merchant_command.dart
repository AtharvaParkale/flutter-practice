import 'package:flutter_daily_practice/features/design_patterns/behavioral/command_pattern/code/command_interface.dart';
import 'package:flutter_daily_practice/features/design_patterns/behavioral/command_pattern/flutter_impl/button_example/command_pattern/payment_service.dart';

class PayToMerchantCommand implements Command {
  final PaymentService service;
  final String merchantId;
  final double amount;

  PayToMerchantCommand({
    required this.service,
    required this.merchantId,
    required this.amount,
  });

  @override
  void execute() {
    service.payToMerchant(merchantId, amount);
  }
}
