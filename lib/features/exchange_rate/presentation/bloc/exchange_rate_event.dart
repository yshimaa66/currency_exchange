import 'package:equatable/equatable.dart';

abstract class ExchangeRateEvent extends Equatable {}

class GetRateExchangEvent extends ExchangeRateEvent {
  final String? startDate;
  final String? endtDate;
  final int? startRange;
  final int? endRange;
  final String? fromCurrency;
  final  String? toCurrency;

  GetRateExchangEvent({
    this.startDate,
    this.endtDate,
    this.startRange,
    this.endRange,
    this.fromCurrency,
    this.toCurrency,
  });

  @override
  List<Object> get props => const [];
}

class SelectStartRateExchangEvent extends ExchangeRateEvent {
  final String startDate;

  SelectStartRateExchangEvent(this.startDate);

  @override
  List<Object> get props => const [];
}

class SelectEndDateRateExchangEvent extends ExchangeRateEvent {
  final String endtDate;

  SelectEndDateRateExchangEvent(this.endtDate);

  @override
  List<Object> get props => const [];
}

class FilterRateExchangEvent extends ExchangeRateEvent {
  FilterRateExchangEvent();

  @override
  List<Object> get props => const [];
}
