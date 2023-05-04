import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_manufacturing_platform/controllers/search_worker_controller.dart';
import 'package:smart_manufacturing_platform/views/work_order/widgets/work_order_item.dart';

import 'filter_page.dart';

class WorkOrderPage extends StatefulWidget {
  const WorkOrderPage({Key? key}) : super(key: key);

  @override
  State<WorkOrderPage> createState() => _WorkOrderPageState();
}

class _WorkOrderPageState extends State<WorkOrderPage> {
  @override
  void initState() {
    super.initState();
    final gatherEvents =
        Provider.of<SearchWorkerController>(context, listen: false);
    gatherEvents.searchWorkerData();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SearchWorkerController>(context, listen: true);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Work Order"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const FilterPage()));
              },
              child: const Text(
                'Filter',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 300,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: TextField(
                      controller: provider.searchController,
                      onChanged: provider.searchData,
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                              icon: const Icon(Icons.close),
                              onPressed: () => provider.isEmptyList()),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          filled: true,
                          hintStyle: TextStyle(color: Colors.grey[800]),
                          hintText: "Type in your text",
                          fillColor: Colors.white70),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    provider.searchData(provider.searchController.text);
                  },
                  child: const Text("Search"),
                ),
              ],
            ),
            Expanded(
              child: Consumer<SearchWorkerController>(
                builder: (context, searchWorkerProvider, child) =>
                    provider.isLoading == true
                        ? const Center(child: CircularProgressIndicator())
                        : searchWorkerProvider.tempSearchedData.isNotEmpty
                            ? ListView.builder(
                                itemCount: searchWorkerProvider
                                    .tempSearchedData.length,
                                itemBuilder: (context, i) {
                                  return WorkOrderItem(
                                      searchedData: searchWorkerProvider
                                          .tempSearchedData[i]);
                                },
                              )
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text("No data found"),
                                ],
                              ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
