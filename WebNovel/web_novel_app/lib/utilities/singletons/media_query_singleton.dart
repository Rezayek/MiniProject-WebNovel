class MediaQuerySingleton {
  static final _shared = MediaQuerySingleton._sharedInstance();
  MediaQuerySingleton._sharedInstance();
  factory MediaQuerySingleton() => _shared;

  double generateTextHeight(
      String content, double unitSize, double width, double defaultHeight) {
    final contentLength = content.length;
    if (contentLength * unitSize * 2 <= width) return defaultHeight / 3;
    bool isReached = false;
    int i = 1;
    while (i < contentLength && !isReached) {
      if ((i * unitSize) <= width) i++;
      if ((i * unitSize) > width) isReached = true;
    }
    final size = (contentLength / i).ceil() * unitSize;
    if (size <= defaultHeight / 3) {
      return defaultHeight / 3;
    }else{
      return size;
    }
    
  }
}
