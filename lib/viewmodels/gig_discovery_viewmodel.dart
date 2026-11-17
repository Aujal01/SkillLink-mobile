import 'package:flutter/foundation.dart';
import '../models/gig_model.dart';
import '../repositories/gig_repository.dart';

class GigDiscoveryViewModel extends ChangeNotifier {
  GigDiscoveryViewModel(this.repository);
  final GigRepository repository;
  List<GigModel> gigs = []; bool isLoading = false; String? error;
  String query = '', category = 'All'; int? maxPrice; double minRating = 0;
  List<String> get categories => ['All', ...{for (final g in gigs) g.category}];
  List<GigModel> get filteredGigs => gigs.where((g) => (category == 'All' || g.category == category) && (query.isEmpty || '${g.title} ${g.provider} ${g.location}'.toLowerCase().contains(query.toLowerCase())) && (maxPrice == null || g.priceNpr <= maxPrice!) && g.rating >= minRating).toList();
  Future<void> loadGigs() async { isLoading = true; error = null; notifyListeners(); try { gigs = await repository.getGigs(); } catch (e) { error = e.toString(); } finally { isLoading = false; notifyListeners(); } }
  void setQuery(String value) { query = value; notifyListeners(); }
  void setCategory(String value) { category = value; notifyListeners(); }
  void setMaxPrice(int? value) { maxPrice = value; notifyListeners(); }
  void setMinRating(double value) { minRating = value; notifyListeners(); }
}
