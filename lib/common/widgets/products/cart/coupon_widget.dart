import 'package:flutter/material.dart';
import 'package:naturally/utils/constants/colors.dart';
import 'package:naturally/utils/constants/sizes.dart';
import 'package:naturally/utils/helpers/helpers_functions.dart';
import 'package:naturally/utils/validators/rounded_container.dart';

class TCouponCode extends StatelessWidget {
  const TCouponCode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return TRoundedContainer(
                showBorder: true,
                backgroundColor: dark ? TColors.dark : TColors.white,
                padding: const EdgeInsets.only(top: TSizes.sm, bottom: TSizes.sm, right: TSizes.sm, left: TSizes.md),
                child: Row(
                  children: [
                    // TextFField
                    Flexible(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Have a promo code ? Enter here',
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                        ),
                      ),
                    ),

                    // Button
                    SizedBox(
                      width: 80, 
                      child: ElevatedButton(
                        onPressed: () {}, 
                        style: ElevatedButton.styleFrom(
                          foregroundColor: dark ? TColors.white.withOpacity(0.5) : TColors.dark.withOpacity(0.5),
                          backgroundColor: Colors.grey.withOpacity(0.2),
                          side: BorderSide(color: Colors.grey.withOpacity(0.1)),
                        ),
                        child: const Text('Apply'),
                      )
                    )
                  ],
                ),
              );
  }
}