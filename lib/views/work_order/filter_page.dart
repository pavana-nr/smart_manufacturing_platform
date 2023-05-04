import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:smart_manufacturing_platform/controllers/search_worker_controller.dart';
import 'package:smart_manufacturing_platform/utils/extensions.dart';

class FilterPage extends StatelessWidget {
  const FilterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Filter"),
          centerTitle: true,
        ),
        body: Consumer<SearchWorkerController>(
          builder:
              (BuildContext context, SearchWorkerController provider, child) =>
                  SingleChildScrollView(
            child: Column(children: [
              FilterSelector(provider: provider),
              if (provider.selectedOption == FilterTypes.dateRange)
                _dateRangeSelector(context, provider)
              else
                ShiftSelector(provider: provider),
              ElevatedButton(
                  onPressed: () {
                    if (provider.selectedOption == FilterTypes.dateRange) {
                      provider.applyDateRange(context);
                    } else {
                      provider.applyShift(context);
                    }
                  },
                  child: const Text("Apply"))
            ]),
          ),
        ),
      ),
    );
  }

  Padding _dateRangeSelector(
      BuildContext context, SearchWorkerController provider) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {
                  DatePicker.showDateTimePicker(context,
                      showTitleActions: true,
                      minTime: DateTime(2022, 5, 5, 20, 50),
                      maxTime: DateTime(2022, 6, 7, 05, 09), onChanged: (date) {
                    debugPrint('change $date in time zone ' +
                        date.timeZoneOffset.inHours.toString());
                  }, onConfirm: (date) {
                    String fromDate =
                        DateFormat('yyyy-MM-dd kk:mm:ss').format(date);
                    debugPrint('confirm $fromDate');
                    provider.fromTime = fromDate.toString();
                  }, locale: LocaleType.en);
                },
                child: const Text(
                  'From Date & Time',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
              Text(provider.fromTime)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {
                  DatePicker.showDateTimePicker(context,
                      showTitleActions: true,
                      minTime: DateTime(2022, 5, 5, 20, 50),
                      maxTime: DateTime(2022, 6, 7, 05, 09), onChanged: (date) {
                    debugPrint('change $date in time zone ' +
                        date.timeZoneOffset.inHours.toString());
                  }, onConfirm: (date) {
                    debugPrint('confirm $date');
                    String toDate =
                        DateFormat('yyyy-MM-dd kk:mm:ss').format(date);
                    provider.toTime = toDate.toString();
                    debugPrint('confirm $toDate');
                  }, locale: LocaleType.en);
                },
                child: const Text(
                  'To Date & Time',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
              Text(provider.toTime)
            ],
          ),
        ],
      ),
    );
  }
}

class ShiftSelector extends StatelessWidget {
  final SearchWorkerController provider;
  const ShiftSelector({Key? key, required this.provider}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          leading: Radio<AvailableShifts>(
              value: AvailableShifts.shift1,
              groupValue: provider.selectedShift,
              onChanged: provider.onChangeShift),
          title: const Text('Shift 1'),
        ),
        ListTile(
          leading: Radio<AvailableShifts>(
              value: AvailableShifts.shift2,
              groupValue: provider.selectedShift,
              onChanged: provider.onChangeShift),
          title: const Text('Shift 2'),
        ),
        ListTile(
          leading: Radio<AvailableShifts>(
              value: AvailableShifts.shift3,
              groupValue: provider.selectedShift,
              onChanged: provider.onChangeShift),
          title: const Text('Shift 3'),
        ),
      ],
    );
  }
}

class FilterSelector extends StatelessWidget {
  final SearchWorkerController provider;
  const FilterSelector({Key? key, required this.provider}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: DropdownButton<FilterTypes>(
        value: provider.selectedOption,
        hint: const Text("Select option"),
        isExpanded: true,
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        items: FilterTypes.values.map((FilterTypes value) {
          return DropdownMenuItem<FilterTypes>(
            value: value,
            child: Text(
              value.fullName,
              style: const TextStyle(color: Colors.black),
            ),
          );
        }).toList(),
        onChanged: provider.onChangeFilter,
      ),
    );
  }
}
