class Visualizer {
  final List<int> items;
  final Set<double>? indexActiveColor;

  const Visualizer({
    required this.items,
    this.indexActiveColor,
  });

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Visualizer &&
        other.items == items &&
        other.indexActiveColor == indexActiveColor;
  }

  @override
  int get hashCode => Object.hashAll([items, indexActiveColor]);
}
