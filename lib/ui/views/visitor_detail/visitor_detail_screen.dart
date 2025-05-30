import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tjw_ue/ui/views/visitor_detail/visitor_detail_controller.dart';


import '../../../common_widget/common_button.dart';
import '../../../common_widget/common_dropdown.dart';
import '../../../common_widget/common_text_field.dart';
import '../../../common_widget/tap_outside_unfocus.dart';
import '../../../core/enum/view_state.dart';
import '../../../core/res/colors.dart';

class VisitorDetailScreen extends StatefulWidget {
  const VisitorDetailScreen({super.key});

  @override
  State<VisitorDetailScreen> createState() => _VisitorDetailScreenState();
}

class _VisitorDetailScreenState extends State<VisitorDetailScreen> {
  final VisitorDetailController controller = Get.put(VisitorDetailController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      extendBodyBehindAppBar: false,
      // appBar: AppBar(
      //   elevation: 0,
      //   backgroundColor: Colors.transparent,
      //   leadingWidth: 80,
      //   leading: Image.asset('assets/logo.png', height: 60, width: 60),
      //   flexibleSpace: Container(
      //     decoration: const BoxDecoration(
      //       image: DecorationImage(
      //         image: AssetImage('assets/splash_background.png'),
      //         fit: BoxFit.cover,
      //       ),
      //     ),
      //   ),
      // ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Image.asset('assets/logo.png', height: 45),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/splash_background.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: TapOutsideUnFocus(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: controller.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Visitor Details",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 20),

                    // Company GSTIN
                    Text(
                      "Gender",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    CommonDropdown<String>(
                      items:
                          Gender.values
                              .map(
                                (e) =>
                                    e.name[0].toUpperCase() +
                                    e.name.substring(1),
                              )
                              .toList(),
                      hintText: 'Gender',
                      //  isRequired: true,
                      selectedItem:
                          controller.genderController.text.isNotEmpty
                              ? controller.genderController.text.capitalizeFirst
                              : null,
                      onChanged: (value) {
                        Gender? selectedStatus = Gender.values.firstWhere(
                          (e) => e.name.toLowerCase() == value?.toLowerCase(),
                          orElse: () => Gender.male,
                        );
                        controller.genderController.text = selectedStatus.name;
                        print("Selected: $selectedStatus");
                        print("Selected: ${controller.genderController.text}");
                      },
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return 'Please select gender';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10),

                    // Company Type
                    Text(
                      "Name",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    CommonTextField(
                      controller: controller.nameController,
                      focusNode: controller.nameFocusNode,
                      hintText: 'Enter Name*',
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return 'Please enter name ';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10),

                    // Company Name
                    Text(
                      "Designation",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    CommonTextField(
                      controller: controller.designationController,
                      focusNode: controller.designationFocusNode,
                      hintText: 'Enter Designation*',
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return 'Please enter Designation ';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10),

                    // Communication Address
                    // Phone Number
                    Text(
                      "Phone Number",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    CommonTextField(
                      controller: controller.phoneNumberController,
                      focusNode: controller.phoneNumberFocusNode,
                      hintText: 'Enter Phone Number*',
                      keyboardType: TextInputType.phone,
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return 'Please enter your phone number';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10),

                    // City
                    Text(
                      "E-mail ID",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    CommonTextField(
                      controller: controller.emailController,
                      focusNode: controller.emailFocusNode,
                      hintText: 'Enter Email*',
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return 'Please enter Email';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10),

                    // State
                    Text(
                      "ID type ",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    // CommonTextField(
                    //   controller: controller.idTypeController,
                    //   focusNode: controller.idTypeFocusNode,
                    //   hintText: 'Enter ID type *',
                    //   suffixIcon: const Icon(
                    //     Icons.keyboard_arrow_down_outlined,
                    //   ),
                    //   validator: (val) {
                    //     if (val == null || val.isEmpty) {
                    //       return 'Please enter ID type ';
                    //     }
                    //     return null;
                    //   },
                    // ),
                    CommonDropdown<String>(
                      items:
                          IDType.values
                              .map(
                                (e) =>
                                    e.name[0].toUpperCase() +
                                    e.name.substring(1),
                              )
                              .toList(),
                      hintText: 'ID-Type',
                      //  isRequired: true,
                      selectedItem:
                          controller.idTypeController.text.isNotEmpty
                              ? controller.idTypeController.text.capitalizeFirst
                              : null,
                      onChanged: (value) {
                        Gender? selectedStatus = Gender.values.firstWhere(
                          (e) => e.name.toLowerCase() == value?.toLowerCase(),
                          orElse: () => Gender.male,
                        );
                        controller.idTypeController.text = selectedStatus.name;
                        print("Selected: $selectedStatus");
                        print("Selected: ${controller.idTypeController.text}");
                      },
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return 'Please select ID-Type';
                        }
                        return null;
                      },
                    ),

                    SizedBox(height: 10),

                    // Pincode
                    Text(
                      "ID number",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    CommonTextField(
                      controller: controller.idNumberController,
                      focusNode: controller.idNumberFocusNode,
                      hintText: 'Enter ID number*',
                      keyboardType: TextInputType.number,
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return 'Please enter ID number';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10),


                    Text(
                      "Business Card",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    GestureDetector(
                      onTap: () {
                        controller.pickFile('business');
                      },
                      child: DottedBorder(
                        options: RectDottedBorderOptions(
                          strokeWidth: 1,
                          color: AppColor.grey.withOpacity(0.6),
                          dashPattern: [3, 6],
                          strokeCap: StrokeCap.square,
                        ),
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(vertical: 30),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(color: AppColor.white),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset("assets/uploadIcon.png", scale: 3),
                              SizedBox(width: 20),
                              Text(
                                "Upload Business Card",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 2),
                    Obx(() {
                      final name = controller.businessFileName.value;
                      return name.isNotEmpty
                          ? Row(
                            children: [
                              Text(name, style: TextStyle(fontSize: 14)),
                              SizedBox(width: 6),
                              Image.asset(
                                'assets/tick.png',
                                scale: 2,
                                color: Colors.green,
                              ),
                            ],
                          )
                          : SizedBox.shrink(); // Returns an empty widget if name is empty
                    }),
                    Obx(() {
                      final error = controller.businessError.value;
                      return error.isNotEmpty
                          ? Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(
                          error,
                          style: TextStyle(color: Colors.red, fontSize: 12),
                        ),
                      )
                          : SizedBox.shrink();
                    }),
                    SizedBox(height: 10),

                    Text(
                      "Passport Photo",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    GestureDetector(
                      onTap: () {
                        controller.pickFile('passport');
                      },
                      child: DottedBorder(
                        options: RectDottedBorderOptions(
                          strokeWidth: 1,
                          color: AppColor.grey.withOpacity(0.6),
                          dashPattern: [3, 6],
                          strokeCap: StrokeCap.square,
                        ),
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(vertical: 30),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(color: AppColor.white),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset("assets/uploadIcon.png", scale: 3),
                              SizedBox(width: 20),
                              Text(
                                "Upload Passport Photo",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 2),
                    Obx(() {
                      final name = controller.passportPhotoName.value;
                      return name.isNotEmpty
                          ? Row(
                            children: [
                              Text(name, style: TextStyle(fontSize: 14)),
                              SizedBox(width: 6),
                              Image.asset(
                                'assets/tick.png',
                                scale: 2,
                                color: Colors.green,
                              ),
                            ],
                          )
                          : SizedBox.shrink(); // Returns an empty widget if name is empty
                    }),
                    Obx(() {
                      final error = controller.passportPhotoError.value;
                      return error.isNotEmpty
                          ? Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(
                          error,
                          style: TextStyle(color: Colors.red, fontSize: 12),
                        ),
                      )
                          : SizedBox.shrink();
                    }),
                    SizedBox(height: 10),

                    Text(
                      "ID Proof",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    GestureDetector(
                      onTap: () {
                        controller.pickFile('idProof');
                      },
                      child: DottedBorder(
                        options: RectDottedBorderOptions(
                          strokeWidth: 1,
                          color: AppColor.grey.withOpacity(0.6),
                          dashPattern: [3, 6],
                          strokeCap: StrokeCap.square,
                        ),
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(vertical: 30),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(color: AppColor.white),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset("assets/uploadIcon.png", scale: 3),
                              SizedBox(width: 20),
                              Text(
                                "Upload ID-Proof",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 2),
                    Obx(() {
                      final name = controller.idProofName.value;
                      return name.isNotEmpty
                          ? Row(
                            children: [
                              Text(name, style: TextStyle(fontSize: 14)),
                              SizedBox(width: 6),
                              Image.asset(
                                'assets/tick.png',
                                scale: 2,
                                color: Colors.green,
                              ),
                            ],
                          )
                          : SizedBox.shrink();
                    }),
                    Obx(() {
                      final error = controller.idProofError.value;
                      return error.isNotEmpty
                          ? Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: Text(
                              error,
                              style: TextStyle(color: Colors.red, fontSize: 12),
                            ),
                          )
                          : SizedBox.shrink();
                    }),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: CommonButton(
          text: "Save",
          onPressed: () {
            controller.saveVisitor();
          },
        ),
      ),
    );
  }
}
