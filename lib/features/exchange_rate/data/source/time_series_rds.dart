
import 'package:currency_exchange/features/exchange_rate/data/models/time_series_response.dart';

abstract class TimeSeriesRds {
  Future<TimeseriesResponse> getTimeSeries(
    String startDate,
    String endDate,
    String? fromCurrency,
    String? toCurrency,
  );
}
