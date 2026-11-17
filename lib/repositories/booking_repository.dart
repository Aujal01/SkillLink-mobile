import '../core/network/api_client.dart';
import '../models/booking_model.dart';
import '../models/review_model.dart';

class BookingRepository {
  BookingRepository(this.client);
  final ApiClient client;
  final List<BookingModel> _bookings = [const BookingModel(id: 'b1', gigTitle: 'Logo & brand identity design', provider: 'Aarav Shrestha', date: 'Nov 20, 2026', status: BookingStatus.inProgress)];
  Future<List<BookingModel>> getBookings() async => List.unmodifiable(_bookings);
  Future<void> submitReview(ReviewModel review) async {}
  Future<void> advance(String id) async {
    final i = _bookings.indexWhere((b) => b.id == id); if (i < 0) return;
    final b = _bookings[i]; final next = b.status == BookingStatus.pending ? BookingStatus.inProgress : BookingStatus.completed;
    _bookings[i] = BookingModel(id: b.id, gigTitle: b.gigTitle, provider: b.provider, date: b.date, status: next);
  }
}
