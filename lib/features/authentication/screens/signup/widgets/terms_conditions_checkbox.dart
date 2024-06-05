import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:naturally/features/authentication/controllers/signup/signup_controller.dart';
import 'package:naturally/utils/constants/colors.dart';
import 'package:naturally/utils/constants/sizes.dart';
import 'package:naturally/utils/constants/text_strings.dart';
import 'package:naturally/utils/helpers/helpers_functions.dart';

class TTermsAndConditionCheckbox extends StatelessWidget {
  const TTermsAndConditionCheckbox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = SignupController.instance;
    final dark = THelperFunctions.isDarkMode(context);
    return Row(
                          children: [
                            SizedBox(
                              width:24, 
                              height: 24, 
                              child: Obx(
                                () => Checkbox(
                                  value: controller.privacyPolicy.value, 
                                  onChanged: (value) => controller.privacyPolicy.value = !controller.privacyPolicy.value),
                                ),
                              ),
                            const SizedBox(width: TSizes.spaceBtwItems),
                            Text.rich(
                              TextSpan(children:[
                                TextSpan(text: '${TTexts.iAgreeTo} ', style: Theme.of(context).textTheme.bodySmall),
                                TextSpan(text: '${TTexts.privacyPolicy} ', style: Theme.of(context).textTheme.bodySmall!.apply(
                                  color: dark ? TColors.white : TColors.primary,
                                  decoration: TextDecoration.underline,
                                  decorationColor: dark ? TColors.white : TColors.primary,
                                )),
                                TextSpan(text: '${TTexts.and}', style: Theme.of(context).textTheme.bodySmall),
                                TextSpan(text: TTexts.termOfUse, style: Theme.of(context).textTheme.bodyMedium!.apply(
                                  color: dark ? TColors.white : TColors.primary,
                                  decoration: TextDecoration.underline,
                                  decorationColor: dark ? TColors.white : TColors.primary,
                                )),
                              ]),
                            ),
                          ],
                        );
  }
}