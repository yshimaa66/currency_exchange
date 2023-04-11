import 'package:equatable/equatable.dart';

class RateTimeRateModel extends Equatable {
  final double? usd;
  final String? date;

  const RateTimeRateModel({this.usd, this.date});

  @override
  List<Object?> get props => [usd, date];
}
