import 'package:flutter/material.dart';
import 'package:gorevue/utils/constants.dart';
import 'package:gorevue/widgets/qr_scanner_widget.dart';

class QRScannerPage extends StatefulWidget {
  const QRScannerPage({Key? key}) : super(key: key);

  @override
  State<QRScannerPage> createState() => _QRScannerPageState();
}

class _QRScannerPageState extends State<QRScannerPage> {
  String? result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Scanner',
            style: TextStyle(color: AppColors.primaryText)),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: AppColors.primaryText),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Expanded(
                child: QRScannerWidget(
                  onScan: (code) {
                    setState(() {
                      result = code;
                    });
                  },
                ),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: (result != null)
                    ? Text('Scan result: $result',
                        style: AppTextStyles.bodyText1)
                    : const Text('Scan a code', style: AppTextStyles.bodyText1),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
