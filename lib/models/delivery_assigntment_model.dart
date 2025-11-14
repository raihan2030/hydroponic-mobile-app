import 'package:hydroponics_app/models/transaction_model.dart';

class DeliveryAssigntmentModel {
  final String customerName;
  final String address;
  final String date;
  final String time;
  final List<TransactionModel> transaction;
  final bool isDone;

  const DeliveryAssigntmentModel({
    required this.customerName,
    required this.address,
    required this.date,
    required this.time,
    required this.transaction,
    this.isDone = false
  });
}