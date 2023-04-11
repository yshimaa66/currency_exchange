import 'package:currency_exchange/features/exchange_rate/data/models/motd.dart';
import 'package:currency_exchange/features/exchange_rate/data/models/rate.dart';

class TimeseriesResponse {
  TimeseriesResponse({
    this.motd,
    this.success,
    this.timeseries,
    this.base,
    this.startDate,
    this.endDate,
    this.rates,
  });

  final Motd? motd;
  final bool? success;
  final bool? timeseries;
  final String? base;
  final DateTime? startDate;
  final DateTime? endDate;
  final Map<String, Rate>? rates;

  factory TimeseriesResponse.fromJson(Map<String, dynamic> json) =>
      TimeseriesResponse(
        motd: json["motd"] == null ? null : Motd.fromJson(json["motd"]),
        success: json["success"],
        timeseries: json["timeseries"],
        base: json["base"],
        startDate: json["start_date"] == null
            ? null
            : DateTime.parse(json["start_date"]),
        endDate:
            json["end_date"] == null ? null : DateTime.parse(json["end_date"]),
        rates: Map.from(json["rates"]!)
            .map((k, v) => MapEntry<String, Rate>(k, Rate.fromJson(v))),
      );

  Map<String, dynamic> toJson() => {
        "motd": motd?.toJson(),
        "success": success,
        "timeseries": timeseries,
        "base": base,
        "start_date":
            "${startDate!.year.toString().padLeft(4, '0')}-${startDate!.month.toString().padLeft(2, '0')}-${startDate!.day.toString().padLeft(2, '0')}",
        "end_date":
            "${endDate!.year.toString().padLeft(4, '0')}-${endDate!.month.toString().padLeft(2, '0')}-${endDate!.day.toString().padLeft(2, '0')}",
        "rates": Map.from(rates!)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
      };
}
