import 'package:flutter/foundation.dart';
import '../models/booking_model.dart';
import '../models/review_model.dart';
import '../repositories/booking_repository.dart';

class BookingViewModel extends ChangeNotifier {
  BookingViewModel(this.repository);
  final BookingRepository repository;
  List<BookingModel> bookings = []; bool isLoading = false; String? error;
  Future<void> loadBookings() async { isLoading = true; error = null; notifyListeners(); try { bookings = await repository.getBookings(); } catch (e) { error = e.toString(); } finally { isLoading = false; notifyListeners(); } }
  Future<void> advance(String id) async { await repository.advance(id); await loadBookings(); }
  Future<void> review(ReviewModel review) async { await repository.submitReview(review); }
}
