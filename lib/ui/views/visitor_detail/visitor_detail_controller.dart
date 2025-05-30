import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';


import '../../../core/res/colors.dart';
import '../../../core/res/spacing.dart';
import '../../../locator.dart';
import '../select_visitor/select_visitor_screen.dart';

class VisitorDetailController extends GetxController {
  final formKey = GlobalKey<FormState>();

  final TextEditingController genderController = TextEditingController();
  final FocusNode genderFocusNode = FocusNode();

  final TextEditingController nameController = TextEditingController();
  final FocusNode nameFocusNode = FocusNode();

  final TextEditingController designationController = TextEditingController();
  final FocusNode designationFocusNode = FocusNode();

  final TextEditingController phoneNumberController = TextEditingController();
  final FocusNode phoneNumberFocusNode = FocusNode();

  final TextEditingController emailController = TextEditingController();
  final FocusNode emailFocusNode = FocusNode();

  final TextEditingController idTypeController = TextEditingController();
  final FocusNode idTypeFocusNode = FocusNode();

  final TextEditingController idNumberController = TextEditingController();
  final FocusNode idNumberFocusNode = FocusNode();

  // These might be file pickers, not text inputs, but if you use TextFields for filenames or paths:
  final TextEditingController businessCardController = TextEditingController();
  final FocusNode businessCardFocusNode = FocusNode();

  final TextEditingController passportPhotoController = TextEditingController();
  final FocusNode passportPhotoFocusNode = FocusNode();

  final TextEditingController idProofController = TextEditingController();
  final FocusNode idProofFocusNode = FocusNode();

// File paths
  String? businessFilePath;
  String? passportPhotoPath;
  String? idProofPath;

// Reactive file names
  final RxString businessFileName = ''.obs;
  final RxString passportPhotoName = ''.obs;
  final RxString idProofName = ''.obs;

// Error name
  var businessError = ''.obs;
  var passportPhotoError = ''.obs;
  var idProofError = ''.obs;


  Future<void> saveVisitor() async {
    // First, validate form fields (TextFormFields)
    if (formKey.currentState?.validate() != true) {
      print('Form is invalid. Please correct the errors.');
      return;
    }

    // Then, validate all uploaded documents
    final isValid = validateAllDocuments();
    if (!isValid) {
      Get.snackbar(
        'Missing Information',
        'Please upload all required documents',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    // Proceed if everything is valid
    Get.to(() => SelectVisitorScreen());
  }


  void cameraOrGallery(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          color: Color(0xffFCF4CB),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20,top: 5),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(8)
                  ),
                  height: 4,
                  width: 45,
                ),
                SizedBox(height: 20,),
                Text(
                  "Upload Your Document",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    // Use Expanded here
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                     //     pickImage(ImageSource.gallery);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColor.secondary
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.image, color: AppColor.primary,size: 40,),
                                SizedBox(height: 10,),
                                const Text(
                                  "From Gallery",
                                  style: TextStyle(fontSize: 17),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                          // pickImage(ImageSource.camera);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: AppColor.secondary
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.camera, color: AppColor.primary,size: 40),
                                SizedBox(height: 10,),
                                const Text(
                                  "From Camera",
                                  style: TextStyle(fontSize: 17),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

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
        case 'business':
          businessFileName.value = fileName;
          businessFilePath = filePath;
          businessError.value = '';
          break;
        case 'passport':
          passportPhotoName.value = fileName;
          passportPhotoPath = filePath;
          passportPhotoError.value = '';
          break;
        case 'idProof':
          idProofName.value = fileName;
          idProofPath = filePath;
          idProofError.value = '';
          break;
      }
    } else {
      print("No file selected.");
    }
  }

  // Validation methods
  bool validateBusinessCard() {
    if (businessFileName.value.isEmpty) {
      businessError.value = 'Please upload your Business Card';
      return false;
    }
    businessError.value = '';
    return true;
  }

  bool validatePassportPhoto() {
    if (passportPhotoName.value.isEmpty) {
      passportPhotoError.value = 'Please upload your Passport Photo';
      return false;
    }
    passportPhotoError.value = '';
    return true;
  }

  bool validateIdProof() {
    if (idProofName.value.isEmpty) {
      idProofError.value = 'Please upload your ID Proof';
      return false;
    }
    idProofError.value = '';
    return true;
  }

  bool validateAllDocuments() {
    final bcValid = validateBusinessCard();
    final ppValid = validatePassportPhoto();
    final idValid = validateIdProof();
    return bcValid && ppValid && idValid;
  }


}
