import 'package:flutter/foundation.dart';
import 'package:flutter_daily_practice/features/design_patterns/behavioral/stratergy_design_pattern/code/payment_strategy.dart';

class PeerToPeerPaymentStrategy implements PaymentStrategy {
  @override
  Future<void> initiatePayment() async {
    debugPrint("Peer to peer ...");
  }
}
