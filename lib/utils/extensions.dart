import 'package:intl/intl.dart';
import 'package:smart_manufacturing_platform/controllers/search_worker_controller.dart';

extension AvailableShiftExtension on AvailableShifts {
  String get fullName {
    switch (this) {
      case AvailableShifts.shift1:
        return 'Shift 1';
      case AvailableShifts.shift2:
        return 'Shift 2';
      case AvailableShifts.shift3:
        return 'Shift 3';
      default:
        return "Shift 1";
    }
  }
}

extension FilterTypesExtension on FilterTypes {
  String get fullName {
    switch (this) {
      case FilterTypes.today:
        return 'Today';
      case FilterTypes.dateRange:
        return 'Date Range';
      default:
        return "Today";
    }
  }
}

extension DateFormatter on DateTime {
  String get toyyyyMMdd {
    return DateFormat('yyyy-MM-dd').format(this);
  }
}
