import 'package:currency_exchange/features/exchange_rate/presentation/bloc/exchange_rate_bloc.dart';
import 'package:currency_exchange/features/exchange_rate/presentation/bloc/exchange_rate_event.dart';
import 'package:currency_exchange/features/exchange_rate/presentation/bloc/exchange_rate_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaginArrowsWidget extends StatelessWidget {
  const PaginArrowsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ExchangeRateBloc, ExchangeRateState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                BlocProvider.of<ExchangeRateBloc>(context).add(
                    GetRateExchangEvent(
                        startRange: state.startRange! - 10,
                        endRange: state.endRange! - 10,
                        startDate: state.startDate,
                        endtDate: state.endDate));
              },
              icon: const Icon(
                Icons.arrow_back_sharp,
                size: 53.0,
              ),
            ),
            IconButton(
              onPressed: () {
                BlocProvider.of<ExchangeRateBloc>(context).add(
                    GetRateExchangEvent(
                        startRange: state.startRange! + 10,
                        endRange: state.endRange! + 10,
                        startDate: state.startDate,
                        endtDate: state.endDate));
              },
              icon: const Icon(
                Icons.navigate_next,
                size: 53.0,
              ),
            ),
          ],
        );
      },
    );
  }
}
