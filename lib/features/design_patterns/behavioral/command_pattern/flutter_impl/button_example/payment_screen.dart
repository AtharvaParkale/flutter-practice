import 'package:flutter/material.dart';
import 'package:flutter_daily_practice/features/design_patterns/behavioral/command_pattern/flutter_impl/button_example/command_pattern/pay_to_merchant_command.dart';
import 'package:flutter_daily_practice/features/design_patterns/behavioral/command_pattern/flutter_impl/button_example/command_pattern/pay_to_user_command.dart';
import 'package:flutter_daily_practice/features/design_patterns/behavioral/command_pattern/flutter_impl/button_example/command_pattern/payment_service.dart';

class PaymentScreen extends StatelessWidget {
  final PaymentService service = PaymentService();

  PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final merchantCommand = PayToMerchantCommand(
      service: service,
      merchantId: "MERCHANT_123",
      amount: 500,
    );

    final p2pCommand = PayToUserCommand(
      service: service,
      userId: "PETER_456",
      amount: 200,
    );

    return Scaffold(
      appBar: AppBar(title: Text("Payments")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          /// 🏪 Pay to Merchant
          ElevatedButton(
            onPressed: merchantCommand.execute,
            child: Text("Pay to Merchant"),
          ),

          SizedBox(height: 20),

          /// 👤 Pay to Peter (P2P)
          ElevatedButton(
            onPressed: p2pCommand.execute,
            child: Text("Pay to Peter"),
          ),
        ],
      ),
    );
  }
}
