
import 'package:currency_exchange/features/exchange_rate/data/models/time_series_response.dart';
import 'package:currency_exchange/features/exchange_rate/domain/repository/time_series_repo.dart';

class RateExchangeUseCase {
  RateExchangeUseCase(this._timeSeriesRepository);

  final TimeSeriesRepository _timeSeriesRepository;

  Future<TimeseriesResponse> call({
    String? startDate,
    String? endDate,
    String? fromCurrency,
    String? toCurrency,
  }) async {
    return await _timeSeriesRepository.getTimeSeries(
        startDate: startDate!, endDate: endDate! , fromCurrency: fromCurrency! , toCurrency: toCurrency!);
  }
}
