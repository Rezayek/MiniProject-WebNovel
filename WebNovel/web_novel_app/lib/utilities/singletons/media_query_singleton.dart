class MediaQuerySingleton {
  static final _shared = MediaQuerySingleton._sharedInstance();
  MediaQuerySingleton._sharedInstance();
  factory MediaQuerySingleton() => _shared;

  double generateTextHeight(String content, double unitSize, double width) {
    final contentLength = content.length;
    if (contentLength * unitSize <= width) return unitSize *2;
    bool isReached = false;
    int i = 1;
    while (i < contentLength && !isReached) {
      if ((i * unitSize) <= width) i++;
      if ((i * unitSize) > width) isReached = true;
    }
    return (contentLength / i).ceil() * unitSize ;
  }
}
