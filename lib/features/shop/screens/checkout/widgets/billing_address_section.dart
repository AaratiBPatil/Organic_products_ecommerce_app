import 'package:flutter/material.dart';
import 'package:naturally/common/widgets/texts/section_heading.dart';
import 'package:naturally/features/personalization/controllers/address_controller.dart';
import 'package:naturally/utils/constants/sizes.dart';

class TBillingAddressSection extends StatelessWidget {
  const TBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    final addressController = AddressController.instance;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TSectionHeading(title: 'Shipping Address', buttonTitle: 'Change', onPressed: () => addressController.selectNewAddressPopup(context)),
        addressController.selectedAddress.value.id.isNotEmpty ?
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('swifau wolfsuw hisl', style: Theme.of(context).textTheme.bodyLarge),
            const SizedBox(height: TSizes.spaceBtwItems / 2),
            Row(
              children: [
                const Icon(Icons.phone, color: Colors.grey, size: 16),
                const SizedBox(width: TSizes.spaceBtwItems),
                Text('+91 789678564747', style: Theme.of(context).textTheme.bodyMedium),
              ],
            ),
            const SizedBox(height: TSizes.spaceBtwItems / 2),
            Row(
              children: [
                const Icon(Icons.location_history, color: Colors.grey, size: 16),
                const SizedBox(width: TSizes.spaceBtwItems),
                Text('AP Talsande, Kolhapur', style: Theme.of(context).textTheme.bodyMedium, softWrap: true),
              ],
            ),
              ],
        ) : Text('Select Address', style: Theme.of(context).textTheme.bodyMedium),
        
      ],
    );
  }
}