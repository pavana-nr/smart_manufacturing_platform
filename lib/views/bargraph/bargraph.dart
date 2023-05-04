import 'package:flutter/material.dart';

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:smart_manufacturing_platform/models/bargraph_model/bargraph_model.dart';
import 'package:smart_manufacturing_platform/models/trace_order_response/trace_order_response_model.dart';

class BarGraph extends StatefulWidget {
  const BarGraph({Key? key, required this.searchedData}) : super(key: key);
  final TraceOrderResponseModelData searchedData;
  @override
  _BarGraphState createState() => _BarGraphState();
}

class _BarGraphState extends State<BarGraph> {
  late List<BarChartModel> _data;
  List<BarChartModel> getChartData() {
    final List<BarChartModel> data = [
      BarChartModel(
        orders: "Total",
        noOfOrders: 100,
        color: charts.ColorUtil.fromDartColor(Colors.blue),
      ),
      BarChartModel(
        orders: "Passed",
        noOfOrders: 300,
        color: charts.ColorUtil.fromDartColor(Colors.green),
      ),
      BarChartModel(
        orders: "Failed",
        noOfOrders: 61,
        color: charts.ColorUtil.fromDartColor(Colors.red),
      ),
      BarChartModel(
        orders: "Processed",
        noOfOrders: 500,
        color: charts.ColorUtil.fromDartColor(Colors.orange),
      ),
    ];
    return data;
  }

  @override
  void initState() {
    _data = getChartData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<charts.Series<BarChartModel, String>> series = [
      charts.Series(
        id: "financial",
        data: _data,
        domainFn: (BarChartModel series, _) => series.orders,
        measureFn: (BarChartModel series, _) => series.noOfOrders,
        colorFn: (BarChartModel series, _) => series.color,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.searchedData.workorderId.toString(),
          style: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                const Expanded(
                    child: Text("User Name",
                        style: TextStyle(fontWeight: FontWeight.bold))),
                Expanded(
                    child: widget.searchedData.username != null
                        ? Text(widget.searchedData.username.toString())
                        : const Text("-",
                            style: TextStyle(fontWeight: FontWeight.bold))),
              ],
            ),
            const Divider(),
            Row(
              children: [
                const Expanded(
                    child: Text("Worker Id",
                        style: TextStyle(fontWeight: FontWeight.bold))),
                Expanded(
                    child: Text(widget.searchedData.workorderId.toString()))
              ],
            ),
            const Divider(),
            Row(
              children: [
                const Expanded(
                    child: Text(
                  "Created At",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
                Expanded(child: Text(widget.searchedData.createdAt.toString()))
              ],
            ),
            Center(
              child: SizedBox(
                height: 500,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  margin: const EdgeInsets.all(20),
                  elevation: 20,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: charts.BarChart(
                      series,
                      animate: true,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
