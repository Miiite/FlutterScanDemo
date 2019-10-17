import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';

class BarcodeScanPage extends StatefulWidget {
  BarcodeScanPage({Key key}) : super(key: key);

  _BarcodeScanPageState createState() => _BarcodeScanPageState();
}

class _BarcodeScanPageState extends State<BarcodeScanPage> {
  String _barcode = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          appBar: AppBar(
            title: Text("barcode_scan example"),
          ),
          body: Container(
            color: Colors.red,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                MaterialButton(
                  child: Text("Start scanning"),
                  onPressed: () async {
                    var barcode = await BarcodeScanner.scan();

                    setState(() {
                      _barcode = _barcode;
                    });
                  },
                ),
                Text(_barcode)
              ],
            ),
          )),
    );
  }
}
