import 'package:currency_exchange/features/exchange_rate/presentation/bloc/exchange_rate_bloc.dart';
import 'package:currency_exchange/features/exchange_rate/presentation/bloc/exchange_rate_state.dart';
import 'package:currency_exchange/features/exchange_rate/presentation/widgets/pagin_arrows_widget.dart';
import 'package:currency_exchange/features/exchange_rate/presentation/widgets/time_filter_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExchangeRatePage extends StatelessWidget {
  const ExchangeRatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Exchange Rate'),
      ),
      body: BlocConsumer<ExchangeRateBloc, ExchangeRateState>(
        listener: (context, state) {},
        builder: (context, state) {
          return state.isLoading!
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      TimeFilterHeader(),
                      const Divider(
                        height: 20.0,
                        color: Colors.transparent,
                      ),
                      DataTable(
                        sortColumnIndex: 1,
                        columnSpacing: 30,
                        showCheckboxColumn: false,
                        border: TableBorder.all(width: 1.0),
                        headingRowColor: MaterialStateColor.resolveWith(
                            (states) => Colors.blue),
                        columns: const [
                          DataColumn(
                              label: Center(
                            child: Text('Date'),
                          )),
                          DataColumn(label: Text('From')),
                          DataColumn(label: Text('To')),
                          DataColumn(label: Text('Price')),
                        ],
                        rows: state.listExchangeRate!
                            .map(
                              (e) => DataRow(
                                cells: [
                                  DataCell(Text(
                                    e.date!,
                                    textAlign: TextAlign.center,
                                  )),
                                  DataCell(
                                    SizedBox(
                                      width: 30,
                                      child: Text(state.base!),
                                    ),
                                  ),
                                  DataCell(SizedBox(
                                      width: 30,
                                      child: state.base == 'EGP'
                                          ? const Text('USD')
                                          : const Text('EGP'))),
                                  DataCell(Text(e.usd.toString())),
                                ],
                              ),
                            )
                            .toList(),
                      ),
                      const PaginArrowsWidget(),
                      const Divider(
                        height: 20.0,
                        color: Colors.transparent,
                      ),
                    ],
                  ),
                );
        },
      ),
    ));
  }
}
