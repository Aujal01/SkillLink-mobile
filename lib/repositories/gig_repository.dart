import '../core/network/api_client.dart';
import '../models/gig_model.dart';

class GigRepository {
  GigRepository(this.client);
  final ApiClient client;
  static const mockGigs = <GigModel>[
    GigModel(id: 'g1', title: 'Logo & brand identity design', category: 'Design', provider: 'Aarav Shrestha', priceNpr: 2500, rating: 4.9, location: 'Thamel, Kathmandu', description: 'A polished logo package for your growing business.', emoji: '🎨'),
    GigModel(id: 'g2', title: 'Home electrical repair', category: 'Home Services', provider: 'Suman Tamang', priceNpr: 1200, rating: 4.8, location: 'Lalitpur', description: 'Safe, reliable wiring and fixture repairs.', emoji: '🔧'),
    GigModel(id: 'g3', title: 'Math tutoring for SEE', category: 'Tutoring', provider: 'Nisha Karki', priceNpr: 800, rating: 5.0, location: 'Bhaktapur', description: 'Friendly one-to-one lessons with practice problems.', emoji: '📚'),
    GigModel(id: 'g4', title: 'Wedding & event photography', category: 'Photography', provider: 'Prakash Gurung', priceNpr: 7000, rating: 4.7, location: 'Pokhara', description: 'Natural moments captured beautifully.', emoji: '📷'),
    GigModel(id: 'g5', title: 'Nepali to English translation', category: 'Writing', provider: 'Rojina Shahi', priceNpr: 1500, rating: 4.9, location: 'Kathmandu', description: 'Clear translation and proofreading for documents.', emoji: '✍️'),
  ];
  Future<List<GigModel>> getGigs() async {
    try { final response = await client.dio.get('/gigs'); final list = response.data as List; return list.map((e) => _fromJson(e as Map<String, dynamic>)).toList(); }
    catch (_) { return mockGigs; }
  }
  GigModel _fromJson(Map<String, dynamic> j) => GigModel(id: '${j['id']}', title: j['title'], category: j['category'], provider: j['provider'], priceNpr: j['priceNpr'], rating: (j['rating'] as num).toDouble(), location: j['location'], description: j['description']);
}
