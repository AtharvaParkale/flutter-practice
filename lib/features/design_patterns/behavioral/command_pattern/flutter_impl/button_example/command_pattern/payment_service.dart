// This is receiver (Actual payment logic)
class PaymentService {

  // User might opt this (Pay to merchant)
  void payToMerchant(String merchantId, double amount) {
    print("Paid ₹$amount to merchant: $merchantId");
  }

  // User might opt this (Pay to User)
  void payToUser(String userId, double amount) {
    print("Paid ₹$amount to user: $userId");
  }
}