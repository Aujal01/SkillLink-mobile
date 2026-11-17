class ReviewModel {
  const ReviewModel({required this.bookingId, required this.rating, this.comment = ''});
  final String bookingId, comment;
  final int rating;
}
