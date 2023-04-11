extension ExtendList<T> on List<T> {
  void extend(int newLength, T defaultValue) {
    assert(newLength >= 0);

    final lengthDifference = newLength - this.length;
    if (lengthDifference <= 0) {
      return;
    }

    this.addAll(List.filled(lengthDifference, defaultValue));
  }
}
