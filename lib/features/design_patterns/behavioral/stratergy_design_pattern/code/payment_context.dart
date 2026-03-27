import 'package:flutter_daily_practice/features/design_patterns/behavioral/stratergy_design_pattern/code/payment_strategy.dart';

class PaymentContext {
  PaymentStrategy strategy;

  PaymentContext(this.strategy);

  void processPayment() {
    strategy.initiatePayment();
  }
}
