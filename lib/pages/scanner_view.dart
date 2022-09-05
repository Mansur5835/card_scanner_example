import 'package:flutter/material.dart';
import 'package:fractal_card_scanner/fractal_card_scanner.dart';

import '../assets_menager/assets_menager.dart';
import '../widgets/app_scaffold.dart';

class CardScannerView extends StatefulWidget {
  const CardScannerView({Key? key}) : super(key: key);

  @override
  State<CardScannerView> createState() => _CardScannerViewState();
}

class _CardScannerViewState extends State<CardScannerView> {
  FractalCardModel? fractalCardModel;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: "Fractal Scanner Card",
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (fractalCardModel != null) ...{
              Row(
                children: [
                  const SizedBox(
                    width: 70,
                  ),
                  const Text(
                    "Card Number:  ",
                  ),
                  Text(
                    fractalCardModel!.cardNumber,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 70,
                  ),
                  const Text(
                    "Card Date:  ",
                  ),
                  Text(
                    fractalCardModel!.cardDate,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 70,
                  ),
                  const Text(
                    "Card Name:  ",
                  ),
                  Text(
                    (fractalCardModel!.cardName ?? "null"),
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 70,
                  ),
                  const Text(
                    "Bank Name:  ",
                  ),
                  Text(
                    (fractalCardModel!.bankName ?? "null"),
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            },
            MaterialButton(
              onPressed: () async {
                fractalCardModel = await FractalScannerCard.startScan(
                  context,
                  primaryColor: AppColors.primaryColor,
                  cardImage: Image.asset(
                    "assets/images/banners/card-back.jpg",
                    fit: BoxFit.cover,
                  ),
                  confirmationIcon: Container(
                    width: 60,
                    height: 60,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(1212212)),
                    child: Image.asset(
                      "assets/images/icons/tick.png",
                      color: AppColors.primaryColor,
                      fit: BoxFit.cover,
                    ),
                  ),
                  scannerIcon: Container(
                    width: 60,
                    height: 60,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(1212212)),
                    child: Image.asset(
                      "assets/images/icons/scanner.png",
                      color: Colors.white,
                      fit: BoxFit.cover,
                      width: 30,
                      height: 30,
                    ),
                  ),
                );

                setState(() {});
              },
              color: AppColors.red,
              child: const Text(
                "Start Scanner",
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
