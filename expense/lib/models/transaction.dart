class Transaction {
  final String title;
  final String id;
  final double amt;
  final DateTime date;

  Transaction(
      {required this.title,
      required this.amt,
      required this.date,
      required this.id});
}
