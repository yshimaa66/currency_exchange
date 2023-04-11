import 'package:currency_exchange/features/exchange_rate/data/models/time_series_response.dart';
import 'package:currency_exchange/features/exchange_rate/domain/entities/rate_time_rate_entity.dart';
import 'package:currency_exchange/features/exchange_rate/domain/usecase/rate_exchange_usecase.dart';
import 'package:currency_exchange/features/exchange_rate/presentation/bloc/exchange_rate_event.dart';
import 'package:currency_exchange/features/exchange_rate/presentation/bloc/exchange_rate_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExchangeRateBloc extends Bloc<ExchangeRateEvent, ExchangeRateState> {
  final RateExchangeUseCase _rateExchangeUseCase;

  ExchangeRateBloc(this._rateExchangeUseCase) : super(ExchangeRateIntial()) {
    on<ExchangeRateEvent>((event, emit) async {
      if (event is GetRateExchangEvent) {
        emit(state.copyWith(isLoading: true));
        TimeseriesResponse timeseriesResponse = await _rateExchangeUseCase.call(
            startDate: event.startDate ?? '2023-01-01',
            endDate: event.endtDate ?? '2023-04-01',
            fromCurrency: event.fromCurrency ?? 'EGP',
            toCurrency: event.toCurrency ?? "USD");

        List<RateTimeRateModel> list = [];
        timeseriesResponse.rates!.forEach((key, value) =>
            list.add(RateTimeRateModel(usd: value.currencyValue, date: key)));
        emit(
          state.copyWith(
            isLoading: false,
            listExchangeRate:
                list.getRange(event.startRange!, event.endRange!).toList(),
            startRange: event.startRange,
            endRange: event.endRange,
            endDate: event.endtDate,
            startDate: event.startDate,
            fromCurrency: event.fromCurrency,
            toCurrency: event.toCurrency,
            base: timeseriesResponse.base
          ),
        );
      }
      if (event is SelectStartRateExchangEvent) {
        state.copyWith(startDate: event.startDate);
      }
      if (event is SelectEndDateRateExchangEvent) {
        state.copyWith(startDate: event.endtDate);
      }
      if (event is FilterRateExchangEvent) {
        add(GetRateExchangEvent(
            startDate: state.startDate, endtDate: state.endDate));
      }
    });
  }
}
