import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class FlutterBarcodeScannerPage extends StatefulWidget {
  FlutterBarcodeScannerPage({Key key}) : super(key: key);

  _FlutterBarcodeScannerPageState createState() =>
      _FlutterBarcodeScannerPageState();
}

class _FlutterBarcodeScannerPageState extends State<FlutterBarcodeScannerPage> {
  String _barcode = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("flutter_barcode_scanner"),
        ),
        body: Container(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              color: Colors.orange,
              child: MaterialButton(
                child: Text("Start scanning"),
                onPressed: () async {
                  FlutterBarcodeScanner.getBarcodeStreamReceiver(
                          "#ff6666", "Cancel", false, ScanMode.DEFAULT)
                      .listen((barcode) {
                    setState(() {
                      print("Scanned " + barcode);
                      _barcode += barcode + ";";
                    });
                  });

                  // var barcode = await FlutterBarcodeScanner.scanBarcode(
                  //     "#ff6666", "cancel", true, ScanMode.BARCODE);

                  // setState(() {
                  //   _barcode = barcode;
                  // });
                },
              ),
            ),
            Text(_barcode)
          ],
        )));
  }
}
