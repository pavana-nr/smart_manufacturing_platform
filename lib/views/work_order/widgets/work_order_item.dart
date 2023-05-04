import 'package:flutter/material.dart';
import 'package:smart_manufacturing_platform/models/trace_order_response/trace_order_response_model.dart';
import 'package:smart_manufacturing_platform/views/bargraph/bargraph.dart';

import '../work_order_full_details.dart';

enum WorkOrderStatus {
  passed,
  failed,
  processed,
}

class WorkOrderItem extends StatelessWidget {
  final TraceOrderResponseModelData searchedData;

  const WorkOrderItem({
    Key? key,
    required this.searchedData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    WorkOrderFullDetails(searchedData: searchedData)));
      },
      child: Card(
        child: Stack(alignment: Alignment.center, children: [
          Positioned(
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10))),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2),
                child: Text(
                  searchedData.id!,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              height: 26,
            ),
            top: 0,
          ),
          Positioned(
            child: IconButton(
              icon: const Icon(Icons.graphic_eq),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            BarGraph(searchedData: searchedData)));
              },
            ),
            right: -15,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const SizedBox(height: 10),
                Text(searchedData.createdAt.toString(),
                    textAlign: TextAlign.right),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    // Text("User ID"),
                    Text("Username"),
                    Text("Total Qty"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Text(searchedData.userId ?? ""),
                    Text(searchedData.username ?? ""),
                    Text(searchedData.workorderTotalQty!),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () => _showModalBottomSheet(
                            context, WorkOrderStatus.failed),
                        child: const Text(
                          "Failed",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () => _showModalBottomSheet(
                            context, WorkOrderStatus.passed),
                        child: const Text(
                          "Passed",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () => _showModalBottomSheet(
                            context, WorkOrderStatus.processed),
                        child: const Text(
                          "Processed",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.amber,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }

  void _showModalBottomSheet(BuildContext context, WorkOrderStatus status) {
    debugPrint("status" + status.toString());
    var list = status == WorkOrderStatus.failed
        ? searchedData.workorderFailedQty
        : status == WorkOrderStatus.passed
            ? searchedData.workorderPassedQty
            : searchedData.workorderProcessedQty;
    showModalBottomSheet(
      elevation: 10,
      context: context,
      isDismissible: true,
      enableDrag: true,
      builder: (context) {
        List<Map<String, dynamic>> listResultData = list!.entries
            .map((entry) =>
                <String, dynamic>{"key": entry.key, "value": entry.value})
            .toList();
        return SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: Container(
                  color: Colors.black,
                  child: Column(
                    children: [
                      Container(
                        color: Colors.lightBlueAccent,
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Expanded(
                                child: Text("Parameter",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20))),
                            Expanded(
                                child: Text("Values",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20)))
                          ],
                        ),
                      ),
                      ListView.builder(
                          itemCount: listResultData.length,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext ctx, int index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                      child: Text(
                                    listResultData[index]['key'].toString(),
                                    style: const TextStyle(color: Colors.white),
                                  )),
                                  Expanded(
                                      child: Text(
                                    listResultData[index]['value'].toString(),
                                    style: const TextStyle(color: Colors.white),
                                  ))
                                ],
                              ),
                            );
                          })
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
