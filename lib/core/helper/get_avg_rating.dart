import 'package:fruit_hub/core/models/review_model.dart';

num getAvgRating(List<ReviewModel> reviews) {
  if (reviews.isEmpty) return 0;

  double sum = 0;
  for (var review in reviews) {
    sum += review.rating.toDouble();
  }

  return sum / reviews.length;
}
