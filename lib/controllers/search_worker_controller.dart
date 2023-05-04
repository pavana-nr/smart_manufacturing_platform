import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_manufacturing_platform/models/trace_order_response/trace_order_response_model.dart';
import 'package:smart_manufacturing_platform/models/workorder_full_details/work_order_full_details_model.dart';
import 'package:smart_manufacturing_platform/services/api_service.dart';
import 'package:smart_manufacturing_platform/utils/extensions.dart';

enum AvailableShifts { shift1, shift2, shift3 }
enum FilterTypes { today, dateRange }

class SearchWorkerController extends ChangeNotifier {
  AvailableShifts selectedShift = AvailableShifts.shift1;
  FilterTypes selectedOption = FilterTypes.today;
// text: 'N102BP000000031014'
  TextEditingController searchController = TextEditingController();
  List<TraceOrderResponseModelData> searchedData = [];
  List<TraceOrderResponseModelData> tempSearchedData = [];
  TraceOrderResponseModelData listSearchData = TraceOrderResponseModelData();
  WorkOrderFullDetailsModel workOrderFullDetails =
      WorkOrderFullDetailsModel(data: []);

  bool isLoading = false;

  SearchWorkerController() {
    searchWorkerData();
  }

  Future<void> workerFullDeatils(String workorderId) async {
    debugPrint("workorderId  " + workorderId);
    var workParams = {
      "conditions": [
        {
          r"$match": {
            "workorderId": workorderId,
            r"$or": [
              {
                "trace_workorder_data.createdAt": {
                  r"$gte": "2022-05-01 00:03:00",
                  r"$lte": "2022-05-18 10:04:00"
                }
              }
            ]
          }
        },
        {
          r"$unwind": {
            "path": r"$trace_workorder_data",
            "includeArrayIndex": "trace_workorder_data_index",
            "preserveNullAndEmptyArrays": true
          }
        },
        {
          r"$match": {
            "workorderId": workorderId,
            r"$or": [
              {
                "trace_workorder_data.createdAt": {
                  r"$gte": "2022-05-01 00:03:00",
                  r"$lte": "2022-05-18 10:04:00"
                }
              }
            ]
          }
        },
        {
          r"$match": {
            r"$or": [{}]
          }
        },
        {
          r"$replaceRoot": {"newRoot": r"$trace_workorder_data"}
        },
        {r"$skip": 0},
        {r"$limit": 40}
      ],
      "enableTotalCount": true
    };
    try {
      final prefs = await SharedPreferences.getInstance();
      final String action = prefs.getString('accesstoken') ?? "";
      var reponse = await RestClient.initWithToken(action)
          .workOrderFullDetails(json.encode(workParams));
      workOrderFullDetails = reponse;
      notifyListeners();
    } on DioError catch (e, stack) {
      debugPrint(e.message);
      debugPrint(stack.toString());
    } catch (e, stackTrace) {
      debugPrint(e.toString());
      debugPrint(stackTrace.toString());
    }
  }

  Future<void> searchWorkerData() async {
    var noSearchParams = {
      "conditions": [
        {
          r"$match": {
            r"$or": [
              {
                "trace_workorder_data.createdAt": {
                  r"$gte": "2022-05-12 00:00:00",
                  r"$lte": "2022-05-12 14:59:01"
                }
              }
            ]
          }
        },
        {
          r"$project": {"trace_workorder_data": 0}
        },
        {
          r"$lookup": {
            "from": "workorder_master",
            "localField": "workorderId",
            "foreignField": "workorder",
            "as": "wo_master"
          }
        },
        {
          r"$match": {
            r"$or": [
              {
                // "workorderId": {
                //   r"$regex": "N102BP000000031014",
                //   r"$options": "i"
                // }
              }
            ]
          }
        },
        {
          r"$unwind": {
            "path": r"$wo_master",
            "includeArrayIndex": "wo_master_index",
            "preserveNullAndEmptyArrays": true
          }
        },
        {
          r"$project": {
            "workorderId": 1,
            "workorderFailedQty": 1,
            "workorderPassedQty": 1,
            "workorderProcessedQty": 1,
            "workorderTotalQty": r"$wo_master.workOrderProductionQuantity",
            "createdAt": {
              r"$cond": [
                {
                  r"$ifNull": [r"$wo_master.createdAt", false]
                },
                r"$wo_master.createdAt",
                {
                  r"$dateToString": {
                    "format": "%Y-%m-%d %H:%M:%S",
                    "date": r"$wo_master._id",
                    "timezone": "Asia/Calcutta"
                  }
                }
              ]
            },
            "trace_workorder_data": 1,
            "userId": r"$wo_master.userId",
            "username": r"$wo_master.username"
          }
        },
        {r"$skip": 0},
        {r"$limit": 40}
      ],
      "enableTotalCount": true
    };

    try {
      isLoading = true;
      final prefs = await SharedPreferences.getInstance();
      final String action = prefs.getString('accesstoken') ?? "";
      var reponse = await RestClient.initWithToken(action)
          .searchData(json.encode(noSearchParams));
      searchedData = reponse.data!;

      tempSearchedData = reponse.data!;
      isLoading = false;
      notifyListeners();
      debugPrint(reponse.data![0].workorderTotalQty);
    } on DioError catch (e, stack) {
      isLoading = false;
      debugPrint(e.message);
      debugPrint(stack.toString());
    } catch (e, stackTrace) {
      isLoading = false;
      debugPrint(e.toString());
      debugPrint(stackTrace.toString());
    }
  }

  isEmptyList() {
    searchController.text = "";
    tempSearchedData.clear();
    tempSearchedData.addAll(searchedData);
    notifyListeners();
  }

  searchData(String searchText) {
    try {
      if (searchText.isEmpty) {
        isEmptyList();
        return;
      }
      TextSelection previousSelection = searchController.selection;
      searchController.text = searchText;
      searchController.selection = previousSelection;
      tempSearchedData = searchedData
          .where((element) => element.workorderId!.contains(searchText))
          .toList();
      notifyListeners();
    } catch (e, statck) {
      debugPrint(e.toString());
      debugPrint(statck.toString());
    }
  }

  void onChangeFilter(FilterTypes? selectedVal) {
    if (selectedVal == null) return;
    selectedOption = selectedVal == FilterTypes.today
        ? FilterTypes.today
        : FilterTypes.dateRange;
    notifyListeners();
  }

  void onChangeShift(AvailableShifts? shift) {
    if (shift == null) return;
    selectedShift = shift;
    notifyListeners();
  }

  DateTime now = DateTime.now();
  String fromTime = '';
  String toTime = '';

  void applyDateRange(context) {
    debugPrint("date range function");
    Navigator.pop(context);
    filterByDate(fromTime, toTime);
    // optionsBasedSearch(fromTime, toTime);
  }

  void applyShift(BuildContext context) {
    String formattedDate =
        now.toyyyyMMdd; //DateFormat('yyyy-MM-dd').format(now);
    if (selectedShift == AvailableShifts.shift1) {
      fromTime = formattedDate + ' 06:00:00';
      toTime = formattedDate + ' 14:30:00';
    } else if (selectedShift == AvailableShifts.shift2) {
      fromTime = formattedDate + ' 14:30:00';
      toTime = formattedDate + ' 22:30:00';
    } else {
      var date = DateTime(now.year, now.month, now.day);
      var nextDate = DateTime(date.year, date.month, date.day + 1);
      String nextDayDate = nextDate.toyyyyMMdd;
      fromTime = formattedDate + ' 22:30:00';
      toTime = nextDayDate + ' 06:00:00';
    }
    debugPrint("fromTime" + fromTime);
    debugPrint("toTime" + toTime);
    filterByDate(fromTime, toTime);
    Navigator.pop(context);
  }

  void filterByDate(String fromTime, String toTime) {
    DateTime fromDateFormat = DateFormat("yyyy-MM-dd hh:mm:ss").parse(fromTime);
    DateTime toDateFormat = DateFormat("yyyy-MM-dd hh:mm:ss").parse(toTime);

    var result = searchedData
        .where((element) =>
            DateFormat("yyyy-MM-dd hh:mm:ss")
                .parse(element.createdAt!)
                .isAfter(fromDateFormat) &&
            DateFormat("yyyy-MM-dd hh:mm:ss")
                .parse(element.createdAt!)
                .isBefore(toDateFormat))
        .toList();
    tempSearchedData.clear();
    tempSearchedData.addAll(result);
    notifyListeners();
  }
}
