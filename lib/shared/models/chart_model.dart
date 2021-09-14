class ChartModel {
  final int month;
  final int captured;

  ChartModel(this.month, this.captured);
}

class PieChartModel {
  final int month;
  final int captured;
  final dynamic color;

  PieChartModel(this.month, this.captured, this.color);
}
