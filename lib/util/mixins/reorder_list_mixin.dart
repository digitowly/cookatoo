class ReorderListMixin {
  void reorder({List list, int oldIndex, int newIndex}) {
    if (newIndex > list.length) newIndex = list.length;
    if (oldIndex < newIndex) newIndex--;

    var temp = list[oldIndex];
    list.remove(temp);
    list.insert(newIndex, temp);
  }
}
