import 'package:charts_flutter/flutter.dart' as charts;

class BarChartModel {
  String orders;
  int noOfOrders;
  final charts.Color color;
  BarChartModel({
    required this.orders,
    required this.noOfOrders,
    required this.color,
  });
}
