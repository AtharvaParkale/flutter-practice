import 'package:flutter_daily_practice/features/design_patterns/behavioral/stratergy_design_pattern/code/pay_to_merchant_payment_strategy.dart';
import 'package:flutter_daily_practice/features/design_patterns/behavioral/stratergy_design_pattern/code/payment_context.dart';

void main() {
  final paymentMode = PaymentContext(PayToMerchantPaymentStrategy());

  paymentMode.processPayment();
}
