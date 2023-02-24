import '../../services/novel_services/models/user_gift_model.dart';

class GiftsHolderSingleton {
  List<String> gifts = [];
  bool _lock = false;
  static final _shared = GiftsHolderSingleton._sharedInstance();
  GiftsHolderSingleton._sharedInstance();
  factory GiftsHolderSingleton() => _shared;

  void addGift(UserGiftModel gift) {
    if (!gifts.contains(gift.giftId) && !_lock) {
      gifts.add(gift.giftId);
    }
  }

  void removeGift(UserGiftModel gift) {
    if (gifts.contains(gift.giftId) && !_lock) {
      gifts.remove(gift.giftId);
    }
  }

  bool notAdded(UserGiftModel gift) {
    if (gifts.contains(gift.giftId) && !_lock) return false;
    return true;
  }

  bool giftsListEmpty() {
    if (gifts.isEmpty) return true;
    return false;
  }

  void lockGifts() {
    _lock = true;
  }

  void resetGifts() {
    _lock = false;
    gifts = [];
  }
}
