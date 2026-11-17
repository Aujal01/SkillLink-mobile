enum BookingStatus { pending, inProgress, completed }

class BookingModel {
  const BookingModel({required this.id, required this.gigTitle, required this.provider, required this.date, required this.status});
  final String id, gigTitle, provider, date;
  final BookingStatus status;
}
