import 'package:flutter/material.dart';
import 'package:flutter_rx_architecture/blocs/application_bloc.dart';
import 'package:flutter_rx_architecture/blocs/bloc_provider.dart';
import 'package:flutter_rx_architecture/blocs/product_bloc.dart';
import 'package:flutter_rx_architecture/views/list_view.dart';

void main() => runApp(
    BlocProvider<ApplicationBloc>(
      bloc: ApplicationBloc(),
      child: MyApp(),
    )
);


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appBloc = BlocProvider.of<ApplicationBloc>(context); // get bloc
    return new Scaffold(
      appBar: new AppBar(
        title: Text("Hello"),
        actions: <Widget>[
          StreamBuilder<String>(
//              stream: appBloc.moneyCommand,
              stream: appBloc.getTotalMoneyCommand,
              builder: (BuildContext context, AsyncSnapshot<String> numberClick) {
                return FloatingActionButton(
                  mini: true,
                  child: Text(numberClick.data??""),
                  backgroundColor: Colors.red,
                  onPressed: null, // display only
                );
              }
          ),
        ],
      ),
      body: BlocProvider<ProductBloc>(
          bloc: ProductBloc(),
          child: ProductListView()
      ),
    );
  }
}


//BlocProvider.of<ApplicationBloc>(context).getClickNumberCommand