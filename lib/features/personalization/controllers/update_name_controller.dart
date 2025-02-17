import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:naturally/data/repositories/user/user_repository.dart';
import 'package:naturally/features/personalization/controllers/user_controller.dart';
import 'package:naturally/features/personalization/screens/profile/profile.dart';
import 'package:naturally/utils/constants/image_strings.dart';
import 'package:naturally/utils/helpers/network_manager.dart';
import 'package:naturally/utils/popups/full_screen_loader.dart';
import 'package:naturally/utils/popups/loaders.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  // init user data when Home Screen appears
  @override
  void onInit() {
    initilizeNames();
    super.onInit();
  }

  // Fetch user record
  Future<void> initilizeNames() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  Future<void> updateUserName() async {
    try {
      // Start Loading
      TFullScreenLoader.openLoadingDialog('We are updating your information..', TImages.docerAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }    

      // Form Validation
      if(!updateUserNameFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Update users first & last name in the Firebase firestore
      Map<String, dynamic> name = {'FirstName': firstName.text.trim(), 'lastName': lastName.text.trim()};
      await userRepository.updateSingleField(name);

      // Update the Rx User value
      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();

      // Remove Loader
      TFullScreenLoader.stopLoading();

      // Show Success Message
      TLoaders.successSnackBar(title: 'Congratulations', message: 'Your name has been updated.');

      //Move to previous screen
      Get.off(() => const ProfileScreen());
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
