import 'dart:convert';

import 'ramadan_data_provider.dart';
import 'ramadan_time.dart';

class RamadanRepository {
  final RamadanDataProvider ramadanDataProvider;

  RamadanRepository({required this.ramadanDataProvider});

  Future<List<RamadanTime>> getRamadanSchedule() async {
    try {
      final List<RamadanTime> ramadanSchedule = [];
      final res = await ramadanDataProvider.getCurrentSchedule();
      final data = await json.decode(res);

      for (var item in data['items']) {
        final RamadanTime ramadanTime = RamadanTime.fromMap(item);
        ramadanSchedule.add(ramadanTime);
      }

      return ramadanSchedule;
    } on Exception catch (e) {
      throw e.toString();
    }
  }
}
