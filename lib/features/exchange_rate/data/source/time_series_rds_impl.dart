import 'package:currency_exchange/features/exchange_rate/data/models/time_series_response.dart';
import 'package:currency_exchange/features/exchange_rate/data/source/time_series_rds.dart';
import 'package:dio/dio.dart';

class TimeSeriesRdsImpl implements TimeSeriesRds {
  final client = Dio();

  @override
  Future<TimeseriesResponse> getTimeSeries(
    String? startDate,
    String? endDate,
    String? fromCurrency,
    String? toCurrency,
  ) async {
    final response = await client.get(
      "https://api.exchangerate.host/timeseries",
      queryParameters: {
        'start_date': startDate ,
        'end_date': endDate,
        'base': fromCurrency ?? "EGP",
        'symbols': toCurrency ?? "USD",
      },
    );
    print('response :-');
    print(response.realUri);
    print(response);
    if (response.statusCode == 200) {
      // If server returns an OK response, parse the JSON
      return TimeseriesResponse.fromJson(response.data);
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Request Failed');
    }
  }
}
