sealed class ListUtils {
  static bool checkEquality<T>(List<T> list1, List<T> list2) {
    if (list1.length != list2.length) {
      return false;
    }

    final set1 = Set<T>.from(list1);
    final set2 = Set<T>.from(list2);

    return set1.length == set2.length && set1.containsAll(set2);
  }
}
