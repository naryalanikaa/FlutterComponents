
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllCategoriesView extends StatefulWidget {
  const AllCategoriesView({super.key});

  @override
  State<AllCategoriesView> createState() => _AllCategoriesViewState();
}

class _AllCategoriesViewState extends State<AllCategoriesView> {
  final MarketPlaceController marketPlaceController = Get.put(
    MarketPlaceController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppDimensions.screenHeight * 0.10),
        child: CustomAppBar(
          isBackPress: true,
          labelText: 'categories'.tr,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.fromLTRB(14.0, 20, 14.0, 0.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  height10SizedBox,
                  CustomInputField(
                    enableBorderColor: AppColors.black,
                    isBorderOutline: true,
                    borderRadius: 20,
                    borderColor: AppColors.textExtraLightColor,
                    fillColor: AppColors.white,
                    prefixIcon: Image.asset(
                      AppAssets.searchIcon,
                      scale: 3.8,
                    ),
                    hintText: 'search_categories'.tr,
                    hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontSize: 14,
                          color: AppColors.textExtraLightColor,
                        ),
                  ),
                  height10SizedBox,
                  SizedBox(
                    child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                        childAspectRatio: AppDimensions.screenWidth /
                            AppDimensions.screenHeight *
                            2.11,
                      ),
                      itemCount: marketPlaceController.categoryList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return _allCategories(
                          marketPlaceController.categoryList[index],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

// Deals of the day GridView
  Widget _allCategories(String model) {
    return InkWell(
      onTap: () {
        _modalBottomSheetMenu(model);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.primaryLight, width: 0.7),
          color: AppColors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: AppDimensions.screenHeight * 0.10,
              width: AppDimensions.screenWidth * 0.45,
              decoration: const BoxDecoration(
                color: AppColors.primaryExtraLight,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(12),
                  topLeft: Radius.circular(12),
                ),
              ),
              child: Image.asset(AppAssets.bgImageIcon, scale: 4.2),
            ),
            height4SizedBox,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      model,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontSize: 12,
                            color: AppColors.primary,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ),
                  width4SizedBox,
                  Image.asset(AppAssets.expandMore, scale: 2.2),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _modalBottomSheetMenu(String title) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (builder) {
        return Container(
          height: AppDimensions.screenHeight * 0.8,
          color: Colors.transparent,
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
              ),
            ),
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontSize: 14,
                            color: AppColors.primary,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    InkWell(
                      onTap: Get.back,
                      child: Image.asset(AppAssets.closeDark, scale: 4.0),
                    ),
                  ],
                ),
                height8SizedBox,
                CustomInputField(
                  enableBorderColor: AppColors.white,
                  isBorderOutline: true,
                  borderRadius: 20,
                  borderColor: AppColors.white,
                  fillColor: AppColors.searchBgColor,
                  prefixIcon: Image.asset(
                    AppAssets.searchIcon,
                    scale: 3.8,
                  ),
                  hintText: 'search_categories'.tr,
                  hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: 14,
                        color: AppColors.textExtraLightColor,
                      ),
                ),
                height10SizedBox,
                _relatedItems(),
              ],
            ),
          ),
        );
      },
    );
  }

  //Categories Items Horizontal List
  Widget _relatedItems() {
    return ListView.separated(
      separatorBuilder: (BuildContext context, int index) {
        return const Divider();
      },
      itemCount: marketPlaceController.categoryList.take(4).length,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () {
            Get.back();
            Get.toNamed(Routes.storeHomeView);
          },
          child: Row(
            children: <Widget>[
              Image.asset(
                AppAssets.bgImageIcon,
                scale: 4.8,
              ),
              width4SizedBox,
              Text(
                marketPlaceController.categoryList[index],
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 12,
                      color: AppColors.primary,
                    ),
              ),
            ],
          ),
        );
      },
    );
  }
}
