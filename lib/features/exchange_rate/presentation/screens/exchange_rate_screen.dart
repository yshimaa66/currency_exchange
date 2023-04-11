import 'package:currency_exchange/features/exchange_rate/data/repository/time_series_repo_impl.dart';
import 'package:currency_exchange/features/exchange_rate/data/source/time_series_rds_impl.dart';
import 'package:currency_exchange/features/exchange_rate/domain/usecase/rate_exchange_usecase.dart';
import 'package:currency_exchange/features/exchange_rate/presentation/bloc/exchange_rate_bloc.dart';
import 'package:currency_exchange/features/exchange_rate/presentation/bloc/exchange_rate_event.dart';
import 'package:currency_exchange/features/exchange_rate/presentation/pages/exchange_rate_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExchangeRateScreen extends StatelessWidget {
  const ExchangeRateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<ExchangeRateBloc>(
        create: (context) => ExchangeRateBloc(
          RateExchangeUseCase(
            TimeSeriesRepoImpl(
              TimeSeriesRdsImpl(),
            ),
          ),
        )..add(GetRateExchangEvent(startRange: 0, endRange: 10)),
        child: const ExchangeRatePage(),
      ),
    );
  }
}
