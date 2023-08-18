import 'package:flutter/material.dart';
import 'package:prototip/model/payment.dart';

import '../constant/constant.dart';
import '../view/assets.dart';

class PaymentMethodModel extends StatefulWidget {
  const PaymentMethodModel({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _PaymentMethodModelState createState() => _PaymentMethodModelState();
}

class _PaymentMethodModelState extends State<PaymentMethodModel> {
  PaymentType selectedMethod = PaymentType.masterCard;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Payment Method",
            style: Constant.ptSansBold,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          decoration: Constant.default1,
          child: Column(
            children: PaymentType.values.map((method) {
              return RadioListTile(
                title: Row(
                  children: [
                    Image.asset(_getImagePath(method)),
                    const SizedBox(width: 10),
                    Text(
                      _getPaymentMethodName(method),
                      style: Constant.shipping.copyWith(fontSize: 17.5),
                    ),
                  ],
                ),
                activeColor: Constant.lightPurple,
                value: method,
                groupValue: selectedMethod,
                onChanged: (newValue) {
                  setState(() {
                    selectedMethod = newValue as PaymentType;
                  });
                },
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  String _getImagePath(PaymentType method) {
    switch (method) {
      case PaymentType.masterCard:
        return Assets.images.master;
      case PaymentType.visa:
        return Assets.images.visa;
      case PaymentType.bankCard:
        return Assets.images.bank;
    }
  }

  String _getPaymentMethodName(PaymentType method) {
    switch (method) {
      case PaymentType.masterCard:
        return "**** **** **** 1234";
      case PaymentType.visa:
        return "**** **** **** 1234";
      case PaymentType.bankCard:
        return "**** **** **** 1234";
    }
  }
}
