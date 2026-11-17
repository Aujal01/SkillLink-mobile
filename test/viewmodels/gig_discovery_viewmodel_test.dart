import 'package:flutter_test/flutter_test.dart';
import 'package:skill_link/core/network/api_client.dart';
import 'package:skill_link/repositories/gig_repository.dart';
import 'package:skill_link/viewmodels/gig_discovery_viewmodel.dart';

void main() {
  late GigDiscoveryViewModel viewModel;
  setUp(() => viewModel = GigDiscoveryViewModel(GigRepository(ApiClient(baseUrl: 'http://127.0.0.1:1/api'))));

  test('loads Nepalese mock gigs when API is unavailable', () async {
    await viewModel.loadGigs();
    expect(viewModel.gigs, isNotEmpty);
    expect(viewModel.gigs.first.priceNpr, greaterThan(0));
    expect(viewModel.isLoading, isFalse);
  });

  test('filters gigs by search, category, price, and rating', () async {
    await viewModel.loadGigs();
    viewModel.setQuery('tutor');
    expect(viewModel.filteredGigs, hasLength(1));
    viewModel.setQuery('');
    viewModel.setCategory('Design');
    expect(viewModel.filteredGigs, hasLength(1));
    viewModel.setCategory('All');
    viewModel.setMaxPrice(1000);
    expect(viewModel.filteredGigs.every((g) => g.priceNpr <= 1000), isTrue);
    viewModel.setMaxPrice(null);
    viewModel.setMinRating(4.9);
    expect(viewModel.filteredGigs.every((g) => g.rating >= 4.9), isTrue);
  });
}
