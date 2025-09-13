enum FeedbackType {
  ratings,
  likert,
  nps,
  emojiSlider,
}

FeedbackType? getFeedbackTypeFromString(String value) {
  switch (value.toLowerCase()) {
    case 'ratings':
      return FeedbackType.ratings;
    case 'likert scale':
      return FeedbackType.likert;
    case 'nps score':
      return FeedbackType.nps;
    case 'emoji slider':
      return FeedbackType.emojiSlider;
    default:
      return null;
  }
}
