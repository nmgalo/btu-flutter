class Expense {
  late String id;
  final String title;
  final String date;
  final double amount;

  Expense({required this.title, required this.date, required this.amount});

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'date': date,
      'amount': amount,
    };
  }

  factory Expense.fromJson(Map<String, Object?> json) => Expense(
        title: json['title'] as String,
        date: json['date'] as String,
        amount: json['amount'] as double,
      );
}
