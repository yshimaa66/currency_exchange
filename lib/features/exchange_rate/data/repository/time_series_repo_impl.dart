
import 'package:currency_exchange/features/exchange_rate/data/models/time_series_response.dart';
import 'package:currency_exchange/features/exchange_rate/data/source/time_series_rds.dart';
import 'package:currency_exchange/features/exchange_rate/domain/repository/time_series_repo.dart';

class TimeSeriesRepoImpl implements TimeSeriesRepository {
  final TimeSeriesRds _timeSeriesRds;

  TimeSeriesRepoImpl(this._timeSeriesRds);

  @override
  Future<TimeseriesResponse> getTimeSeries({
    String? startDate,
    String? endDate,
    String? fromCurrency,
    String? toCurrency,
  }) async {
    try {
      return await _timeSeriesRds.getTimeSeries(
          startDate!, endDate!, fromCurrency!, toCurrency!);
      // } on TimeseriesException {
      //   rethrow;
    } catch (e) {
      throw 'something_went_wrong';
    }
  }
}
