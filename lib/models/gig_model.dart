class GigModel {
  const GigModel({required this.id, required this.title, required this.category, required this.provider, required this.priceNpr, required this.rating, required this.location, required this.description, this.emoji = '✨'});
  final String id, title, category, provider, location, description, emoji;
  final int priceNpr;
  final double rating;
}
