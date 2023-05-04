import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_manufacturing_platform/controllers/search_worker_controller.dart';
import 'package:smart_manufacturing_platform/models/trace_order_response/trace_order_response_model.dart';

class WorkOrderFullDetails extends StatefulWidget {
  const WorkOrderFullDetails({Key? key, required this.searchedData})
      : super(key: key);
  final TraceOrderResponseModelData searchedData;
  @override
  State<WorkOrderFullDetails> createState() => _WorkOrderFullDetailsState();
}

class _WorkOrderFullDetailsState extends State<WorkOrderFullDetails> {
  @override
  void initState() {
    super.initState();
    final fullDeatils =
        Provider.of<SearchWorkerController>(context, listen: false);
    fullDeatils.workerFullDeatils(widget.searchedData.workorderId!);
  }

  @override
  Widget build(BuildContext context) {
    final provider =
        Provider.of<SearchWorkerController>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Work Order Details"),
        ),
        body: provider.workOrderFullDetails.data.isNotEmpty
            ? SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Table(
                        children: const [
                          TableRow(children: [
                            TableCell(
                                child: Text("Serial No",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20))),
                            TableCell(
                                child: Text("Test Result",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20))),
                            TableCell(
                                child: Text("Station Id",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20))),
                          ]),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 540,
                      child: Consumer<SearchWorkerController>(
                        builder: (context, searchWorkerProvider, child) =>
                            searchWorkerProvider
                                    .workOrderFullDetails.data.isEmpty
                                ? const Text("No details found!")
                                : ListView.builder(
                                    itemCount: searchWorkerProvider
                                        .workOrderFullDetails.data.length,
                                    itemBuilder: (context, i) {
                                      return Column(
                                        children: [
                                          Table(
                                            children: [
                                              TableRow(children: [
                                                if (searchWorkerProvider
                                                        .workOrderFullDetails
                                                        .data[i]
                                                        .rr !=
                                                    null)
                                                  TableCell(
                                                      child: Text(
                                                    searchWorkerProvider
                                                        .workOrderFullDetails
                                                        .data[i]
                                                        .rr!,
                                                    textAlign: TextAlign.center,
                                                  )),
                                                if (searchWorkerProvider
                                                        .workOrderFullDetails
                                                        .data[i]
                                                        .lr !=
                                                    null)
                                                  TableCell(
                                                      child: Text(
                                                    searchWorkerProvider
                                                        .workOrderFullDetails
                                                        .data[i]
                                                        .lr!,
                                                    textAlign: TextAlign.center,
                                                  )),
                                                if (searchWorkerProvider
                                                        .workOrderFullDetails
                                                        .data[i]
                                                        .br !=
                                                    null)
                                                  TableCell(
                                                      child: Text(
                                                    searchWorkerProvider
                                                        .workOrderFullDetails
                                                        .data[i]
                                                        .br!,
                                                    textAlign: TextAlign.center,
                                                  )),
                                                if (searchWorkerProvider
                                                        .workOrderFullDetails
                                                        .data[i]
                                                        .tr !=
                                                    null)
                                                  TableCell(
                                                      child: Text(
                                                    searchWorkerProvider
                                                        .workOrderFullDetails
                                                        .data[i]
                                                        .tr!,
                                                    textAlign: TextAlign.center,
                                                  )),
                                                if (searchWorkerProvider
                                                        .workOrderFullDetails
                                                        .data[i]
                                                        .sn !=
                                                    null)
                                                  TableCell(
                                                      child: Text(
                                                    searchWorkerProvider
                                                        .workOrderFullDetails
                                                        .data[i]
                                                        .sn!,
                                                    textAlign: TextAlign.center,
                                                  )),
                                                TableCell(
                                                    child: Text(
                                                        searchWorkerProvider
                                                            .workOrderFullDetails
                                                            .data[i]
                                                            .testResult
                                                            .toString(),
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: searchWorkerProvider
                                                                    .workOrderFullDetails
                                                                    .data[i]
                                                                    .testResult
                                                                    .toString() ==
                                                                'PASS'
                                                            ? const TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .green)
                                                            : searchWorkerProvider
                                                                        .workOrderFullDetails
                                                                        .data[i]
                                                                        .testResult
                                                                        .toString() ==
                                                                    'FAIL'
                                                                ? const TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: Colors
                                                                        .red)
                                                                : const TextStyle(fontWeight: FontWeight.bold, color: Colors.amber))),
                                                TableCell(
                                                    child: Text(
                                                  searchWorkerProvider
                                                      .workOrderFullDetails
                                                      .data[i]
                                                      .stationId
                                                      .toString(),
                                                  textAlign: TextAlign.center,
                                                )),
                                              ]),
                                            ],
                                          ),
                                          const Divider(),
                                        ],
                                      );
                                    },
                                  ),
                      ),
                    ),
                  ],
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text("No data found"),
                ],
              ),
      ),
    );
  }
}
