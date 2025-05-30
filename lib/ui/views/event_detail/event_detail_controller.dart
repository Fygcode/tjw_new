import 'package:get/get.dart';

class EventDetailController extends GetxController{

  final List<String> bannerImages = [
    "https://img.tradeindia.com/new_website1/tradeshowslandingpage/thejewelleryshow/new-banner.jpg", // Light decor
    "https://shivamjewelsandart.com/public/frontend/assets/images/inner-banner/exhibition-banner.png", // Jewelry flatlay
    "https://www.jewellermagazine.com/dbimages/156000/156442/156442-950px.png?m=133655721260000000", // Light workspace
  ];

  RxInt currentImageIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

}