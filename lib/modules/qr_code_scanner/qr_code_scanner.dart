import 'package:apply_to_work/modules/qr_code_scanner/qr_scanner_overlay.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart'; // Подключите ваш пакет для сканера QR

class ScannerPage extends StatefulWidget {
  const ScannerPage({super.key});

  @override
  State<ScannerPage> createState() => _ScannerPageState();
}

class _ScannerPageState extends State<ScannerPage> {
  MobileScannerController cameraController = MobileScannerController();
  bool _screenOpened = false;

  @override
  void initState() {
    super.initState();
    _screenWasClosed();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.5),
      body: Stack(
        children: [
          const Positioned(
            top: 20,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                "Поместите QR-код в рамку",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      MobileScanner(
                        controller: cameraController,
                        onDetect: _foundBarcode,
                      ),
                       Positioned.fill(
                        child: Align(
                          alignment: Alignment.center,
                          child: QRScannerOverlay(
                            overlayColour: Colors.black.withOpacity(0.5),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 40,
            right: 20,
            child: IconButton(
              icon: const Icon(
                Icons.close,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ],
      ),
    );
  }

  void _foundBarcode(BarcodeCapture capture) {
    if (!_screenOpened) {
      _screenOpened = true;
      final String code = capture.barcodes.first?.rawValue ?? "No QR data found";

      String displayText;
      if (code.startsWith('https')) {
        displayText = code;
      } else {
        displayText = 'No HTTPS URL found';
      }

      showModalBottomSheet(
        context: context,
        builder: (context) => Container(
          color: Colors.white,
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "QR Code Data:",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                displayText,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ).whenComplete(() {
        _screenWasClosed();
      });
    }
  }

  void _screenWasClosed() {
    _screenOpened = false;
  }
}
