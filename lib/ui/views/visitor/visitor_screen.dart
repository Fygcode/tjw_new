import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tjw_ue/ui/views/visitor/visitor_controller.dart';


import '../../../common_widget/common_button.dart';
import '../../../common_widget/common_dialog.dart';
import '../../../core/res/colors.dart';
import '../visitor_detail/visitor_detail_screen.dart';

class VisitorScreen extends StatefulWidget {
  const VisitorScreen({super.key});

  @override
  State<VisitorScreen> createState() => _VisitorScreenState();
}

class _VisitorScreenState extends State<VisitorScreen> {
  final VisitorController controller = Get.put(VisitorController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Visitor",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 16),
              ListView.separated(
                itemCount: controller.selected.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                        color: Color(0xffFCF4CB),
                        borderRadius: BorderRadius.circular(6)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: CachedNetworkImage(
                                  height: 100,
                                  width: 100,
                                  imageUrl:
                                      "https://media.istockphoto.com/id/1682296067/photo/happy-studio-portrait-or-professional-man-real-estate-agent-or-asian-businessman-smile-for.jpg?s=612x612&w=0&k=20&c=9zbG2-9fl741fbTWw5fNgcEEe4ll-JegrGlQQ6m54rg=",
                                  fit: BoxFit.cover,
                                  placeholder:
                                      (context, url) => const Center(
                                        child: CircularProgressIndicator(),
                                      ),
                                  errorWidget:
                                      (context, url, error) => Image.asset(
                                        'assets/updateBanner.png',
                                        fit: BoxFit.cover,
                                      ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Parthasarathy",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                "GJ23-TV1234",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                "9499956224",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          Column(
                            children: [
                              SizedBox(
                                width: 100,
                                child: CommonButton(
                                  text: "Remove",
                                  onPressed: () {
                                    CommonDialog.showConfirmDialog(
                                      title: "Confirm Remove",
                                      content: "Are you sure you want to remove ?",
                                      confirmText: "Yes",
                                      cancelText: "No",
                                      onConfirm: () {
                                        print("Item removed");
                                        Get.back();
                                      },
                                      onCancel: () {
                                        Get.back(); // Just close the dialog
                                      },
                                    );
                                  },
                                  fillColor: AppColor.white,
                                  textColor: Colors.black,
                                ),
                              ),
                              SizedBox(height: 8),
                              SizedBox(
                                width: 100,
                                child: CommonButton(
                                  text: "Edit",
                                  onPressed: () {
                                    Get.to(() => VisitorDetailScreen());
                                  },
                                  fillColor: AppColor.secondary,
                                  textColor: AppColor.black,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(height: 15);
                },
              ),
              SizedBox(height: 20),
              CommonButton(
                text: "+ Add Visitor",
                onPressed: () {
                  Get.to(() => VisitorDetailScreen());
                },
                fillColor: AppColor.secondary,
                textColor: AppColor.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
