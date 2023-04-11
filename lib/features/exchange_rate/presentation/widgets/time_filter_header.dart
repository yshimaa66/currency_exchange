import 'package:currency_exchange/core/widgets/date_picker_select_widget.dart';
import 'package:currency_exchange/features/exchange_rate/presentation/bloc/exchange_rate_bloc.dart';
import 'package:currency_exchange/features/exchange_rate/presentation/bloc/exchange_rate_event.dart';
import 'package:currency_exchange/features/exchange_rate/presentation/bloc/exchange_rate_state.dart';import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TimeFilterHeader extends StatelessWidget {
  TimeFilterHeader({Key? key}) : super(key: key);
  String? startDate, endDate, fromCurrency, toCurrency;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ExchangeRateBloc, ExchangeRateState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Row(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: DatePickerSelectWidget(
                            label: state.startDate ?? 'Start date',
                            onPressed: (String date) {
                              startDate = date;
                            },
                          ),
                        ),
                        Expanded(
                            flex: 1,
                            child: DatePickerSelectWidget(
                              label: state.endDate ?? 'End date',
                              onPressed: (String date) {
                                endDate = date;
                              },
                            )),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.0),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: TextField(
                              // controller: _passwordController,
                              decoration: InputDecoration(
                                labelText:
                                    state.fromCurrency ?? 'From Currency',
                              ),
                              onSubmitted: (value) {
                                fromCurrency = value;
                              },
                              onChanged: (value) {
                                fromCurrency = value;
                              },
                            ),
                          ),
                          Container(
                            width: 10.0,
                          ),
                          Expanded(
                            flex: 1,
                            child: TextField(
                              // controller: _passwordController,
                              decoration: InputDecoration(
                                labelText: state.toCurrency ?? 'TO Currency',
                              ),
                              onSubmitted: (value) {
                                toCurrency = value;
                              },
                              onChanged: (value) {
                                toCurrency = value;
                              },
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              MaterialButton(
                  child: Container(
                    padding: EdgeInsets.all(12.0),
                    color: Colors.teal,
                    child: const Text('Submit'),
                  ),
                  onPressed: () {
                    BlocProvider.of<ExchangeRateBloc>(context)
                        .add(GetRateExchangEvent(
                      startDate: startDate,
                      endtDate: endDate,
                      startRange: 0,
                      endRange: 10,
                      fromCurrency: fromCurrency,
                      toCurrency: toCurrency,
                    ));
                  }),
            ],
          );
        });
  }
}
