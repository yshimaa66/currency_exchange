import 'package:currency_exchange/features/exchange_rate/data/models/rate.dart';
import 'package:currency_exchange/features/exchange_rate/domain/entities/rate_time_rate_entity.dart';
import 'package:equatable/equatable.dart';

class ExchangeRateState extends Equatable {
  final bool? isLoading;
  final Map<String, Rate>? rates;
  final List<RateTimeRateModel>? listExchangeRate;
  final String? startDate;
  final String? endDate;
  final int? startRange;
  final int? endRange;
  final String? fromCurrency;
  final String? toCurrency;
  final String? base;

  const ExchangeRateState({
    this.isLoading,
    this.rates,
    this.listExchangeRate,
    this.startDate,
    this.endDate,
    this.startRange,
    this.endRange,
    this.toCurrency,
    this.fromCurrency,
    this.base,
  });

  ExchangeRateState copyWith({
    bool? isLoading,
    Map<String, Rate>? rates,
    List<RateTimeRateModel>? listExchangeRate,
    String? startDate,
    String? endDate,
    int? startRange,
    int? endRange,
    String? fromCurrency,
    String? toCurrency,
    String? base,
  }) {
    return ExchangeRateState(
      isLoading: isLoading ?? this.isLoading,
      rates: rates ?? rates,
      listExchangeRate: listExchangeRate ?? listExchangeRate,
      startDate: startDate ?? startDate,
      endDate: endDate ?? endDate,
      startRange: startRange ?? startRange,
      endRange: endRange ?? endRange,
      fromCurrency: fromCurrency ?? fromCurrency,
      toCurrency: toCurrency ?? toCurrency,
      base: base ?? base,
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        rates,
        listExchangeRate,
        startDate,
        endDate,
        startRange,
        endRange,
        fromCurrency,
        toCurrency,
        base,
      ];
}

class ExchangeRateIntial extends ExchangeRateState {
  ExchangeRateIntial()
      : super(
            isLoading: true,
            rates: {},
            listExchangeRate: [],
            startDate: '',
            endDate: '',
            startRange: 0,
            endRange: 10);
}
