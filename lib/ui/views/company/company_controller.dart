import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CompanyController extends GetxController {
  final TextEditingController companyGstController = TextEditingController();
  final FocusNode companyGstFocusNode = FocusNode();

  final TextEditingController companyTypeController = TextEditingController();
  final FocusNode companyTypeFocusNode = FocusNode();

  final TextEditingController companyNameController = TextEditingController();
  final FocusNode companyNameFocusNode = FocusNode();

  final TextEditingController communicationAddressController =
      TextEditingController();
  final FocusNode communicationAddressFocusNode = FocusNode();

  final TextEditingController cityController = TextEditingController();
  final FocusNode cityFocusNode = FocusNode();

  final TextEditingController stateController = TextEditingController();
  final FocusNode stateFocusNode = FocusNode();

  final TextEditingController pincodeController = TextEditingController();
  final FocusNode pincodeFocusNode = FocusNode();

  final TextEditingController landlineController = TextEditingController();
  final FocusNode landlineFocusNode = FocusNode();

  final TextEditingController uploadGstController = TextEditingController();
  final FocusNode uploadGstFocusNode = FocusNode();

  final formKeyCompany = GlobalKey<FormState>();

  // File paths
  String? gstCopyFilePath;

  // Reactive file names
  final RxString gstCopyFileName = ''.obs;

  // Error name
  var gstCopyError = ''.obs;

  Future<void> pickFile(String type) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'pdf', 'doc'],
      allowMultiple: false,
    );

    if (result != null && result.files.single.path != null) {
      String fileName = result.files.single.name;
      String? filePath = result.files.single.path;

      switch (type) {
        case 'gstCopy':
          gstCopyFileName.value = fileName;
          gstCopyFilePath = filePath;
          gstCopyError.value = '';
          break;
      }
    } else {
      print("No file selected.");
    }
  }

  Future<void> saveCompany() async {
    // ✅ Validate form fields first
    if (formKeyCompany.currentState?.validate() != true) {
      print('Form is invalid. Please correct the errors.');
      return;
    }

    // ✅ Validate GST copy upload
    if (gstCopyFileName.value.isEmpty) {
      gstCopyError.value = 'Please upload your GST Copy';
      return;
    } else {
      gstCopyError.value = ''; // Clear error if file is uploaded
    }

    // ✅ Proceed with saving or navigating
    print('Company form and GST Copy are valid.');
    // Example: navigate to next screen or call API
    // Get.to(() => SelectVisitorScreen());
  }

}
