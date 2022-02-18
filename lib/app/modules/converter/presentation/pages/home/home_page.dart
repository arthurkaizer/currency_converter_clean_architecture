import 'controllers/home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../home/widgets/currency_input_widget.dart';

import '../../widgets/converter_app_bar_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage,HomeController> {
  final currenciesControllers = Modular.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ConverteAppBarWidget(
        title: 'title_converter',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 38.0, vertical: 50.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              //Text('title_converter'.i18n()),
              Image.asset(
                'assets/images/dollar_sign.png',
              ),
              const SizedBox(
                height: 50,
              ),
              CurrencyInputWidget(
                label: 'BRL',
                prefix: 'R\$ ',
                controller: currenciesControllers.realController,
                onChanged: currenciesControllers.onRealChanged,
              ),
              const SizedBox(
                height: 35,
              ),
              CurrencyInputWidget(
                label: 'USD',
                prefix: 'US\$ ',
                controller: currenciesControllers.dolarController,
                onChanged: currenciesControllers.onDolarChanged,
              ),
              const SizedBox(
                height: 35,
              ),
              CurrencyInputWidget(
                label: 'EUR',
                prefix: '€ ',
                controller: currenciesControllers.euroController,
                onChanged: currenciesControllers.onEuroChanged,
              ),
              ValueListenableBuilder<bool>(
                valueListenable: controller.homeStore,
                builder: (context, value, widget){
                  if(widget == null) return Container();
                  return Visibility(visible: value, child: widget);
                },
                child: const Center(
                  child: CircularProgressIndicator(
                    color: Colors.pink,
                  )
                ),
                
              ),  
            ],
          ),
        ),
      ),
    );
  }
}
