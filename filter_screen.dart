
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilterSortScreen extends StatefulWidget {
  const FilterSortScreen({super.key});

  @override
  State<FilterSortScreen> createState() => _FilterSortScreenState();
}

class _FilterSortScreenState extends State<FilterSortScreen> {
  final MarketPlaceController marketPlaceController = Get.put(
    MarketPlaceController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppDimensions.screenHeight * 0.08),
        child: CustomAppBar(
          isBackPress: true,
          backPress: AppAssets.closeIcon,
          labelText: 'filter_Sort'.tr,
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.fromLTRB(14.0, 20, 14.0, 0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      height4SizedBox,
                      Text(
                        "Sort by",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontSize: 16,
                              color: AppColors.primary,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      height10SizedBox,
                      _buildRadioList(),
                      height10SizedBox,
                      _buildExpansionTile("Age"),
                      height10SizedBox,
                      _buildExpansionTile("Gender"),
                      height10SizedBox,
                      _buildExpansionTile("Brands", type: 1),
                      height10SizedBox,
                      _buildExpansionTile("Categories"),
                      height10SizedBox,
                      _buildExpansionTile("Colors", type: 2),
                      height10SizedBox,
                      _buildExpansionTile("Categories"),
                      height10SizedBox,
                      _buildExpansionTile("Sub-categories", type: 2),
                      height10SizedBox,
                      _buildExpansionTile("Departments", type: 4),
                      height10SizedBox,
                      _buildExpansionTile("Material", type: 4),
                      height10SizedBox,
                      _buildExpansionTile("Price Range", type: 5),
                      height10SizedBox,
                      _buildExpansionTile("Sellers", type: 6),
                      height10SizedBox,
                      _buildExpansionTile("Sizes", type: 7),
                      height50SizedBox,
                      height50SizedBox,
                      height40SizedBox,
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.fromLTRB(14.0, 20, 14.0, 14.0),
              decoration: BoxDecoration(
                color: AppColors.bgColor,
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 145, 143, 143)
                        .withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
                // borderRadius: BorderRadius.circular(12)
              ),
              child: Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      margin: const EdgeInsets.symmetric(
                        vertical: 4,
                        horizontal: 8,
                      ),
                      text: 'discard'.tr,
                      color: AppColors.bgColor,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontSize: 16,
                            color: AppColors.primary,
                            fontWeight: FontWeight.normal,
                          ),
                      border: Border.all(
                        color: AppColors.primary,
                        width: 2.0,
                      ),
                      borderRadius: 12,
                      onTap: () {},
                    ),
                  ),
                  Expanded(
                    child: CustomButton(
                      margin: const EdgeInsets.symmetric(
                        vertical: 4,
                        horizontal: 8,
                      ),
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontSize: 16,
                            color: AppColors.white,
                            fontWeight: FontWeight.normal,
                          ),
                      borderRadius: 12,
                      text: 'apply'.tr,
                      onTap: () {},
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  final int selectedId = 1;

  Widget _buildChildren(int id) {
    switch (id) {
      case 1:
        return _buildCheckList();
      case 2:
        return _buildColorBox();
      case 3:
        return _buildColorBox();
      case 4:
        return _buildGrid3View();
      case 5:
        return _buildRangeBar();
      case 6:
        return _buildCheckList();
      case 7:
        return _buildCheckList();
      default:
        return _buildRadioList();
    }
  }

  ClipRRect _buildExpansionTile(String title, {int type = 0}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: ExpansionTile(
        collapsedBackgroundColor: AppColors.white,
        backgroundColor: AppColors.white,
        title: Text(title),
        children: <Widget>[
          _buildChildren(type),
        ],
      ),
    );
  }

  String selectedOption = '';

  //Sub Categories Items Horizontal List
  Widget _buildRadioList() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
      ),

      // height: AppDimensions.screenHeight * 0.18,
      width: AppDimensions.screenWidth,
      child: ListView.separated(
        separatorBuilder: (BuildContext context, int index) {
          return const Divider();
        },
        itemCount: marketPlaceController.subCategoryList.take(3).length,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  marketPlaceController.subCategoryList[index],
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: 14,
                        color: AppColors.primary,
                      ),
                ),
                Visibility(
                  replacement: Image.asset(
                    AppAssets.radioChecked,
                    scale: 3.5,
                  ),
                  child: Image.asset(
                    AppAssets.radioChecked,
                    scale: 3.5,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildCheckList() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
      ),

      // height: AppDimensions.screenHeight * 0.18,
      width: AppDimensions.screenWidth,
      child: ListView.separated(
        separatorBuilder: (BuildContext context, int index) {
          return const Divider();
        },
        itemCount: marketPlaceController.subCategoryList.take(3).length,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  marketPlaceController.subCategoryList[index],
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: 14,
                        color: AppColors.primary,
                      ),
                ),
                Visibility(
                  replacement: Image.asset(
                    AppAssets.unChecked,
                    scale: 3.5,
                  ),
                  child: Image.asset(
                    AppAssets.checked,
                    scale: 3.5,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildColorBox() {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
      ),

      // height: AppDimensions.screenHeight * 0.18,
      width: AppDimensions.screenWidth,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio:
              AppDimensions.screenWidth / AppDimensions.screenHeight * 2.2,
        ),
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: AppColors.white,
                width: 2.0,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(5),
              ),
              margin: const EdgeInsets.all(4.0),
            ),
          );
        },
      ),
    );
  }

  Widget _buildRangeBar() {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
      ),

      // height: AppDimensions.screenHeight * 0.18,
      width: AppDimensions.screenWidth,
      child: Obx(
        () => SliderTheme(
          data: const SliderThemeData(
            rangeThumbShape: RoundRangeSliderThumbShape(),
            overlayColor: AppColors.white,
            inactiveTrackColor: AppColors.primaryLight,
            activeTrackColor: AppColors.primary,
            valueIndicatorColor: AppColors.white,
            valueIndicatorTextStyle: TextStyle(
              color: AppColors.primary,
            ),

            // rangeValueIndicatorShape: PaddleRangeSliderValueIndicatorShape(),
            showValueIndicator: ShowValueIndicator.always,
          ),
          child: RangeSlider(
            divisions: 5,
            activeColor: AppColors.primary,
            inactiveColor: AppColors.primaryLight,
            max: 100,
            values: marketPlaceController.rangeValues.value,
            labels: RangeLabels(
              marketPlaceController.startLabel.value,
              marketPlaceController.endLabel.value,
            ),
            onChanged: (value) {
              marketPlaceController.startLabel.value = value.start.toString();
              marketPlaceController.endLabel.value = value.end.toString();
              marketPlaceController.rangeValues.value = value;
            },
          ),
        ),
      ),
    );
  }

  Widget _buildGrid3View() {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
      ),

      // height: AppDimensions.screenHeight * 0.18,
      width: AppDimensions.screenWidth,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 4,
          mainAxisSpacing: 5,
          childAspectRatio:
              AppDimensions.screenWidth / AppDimensions.screenHeight * 4.2,
        ),
        itemCount: marketPlaceController.material.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(5),
            ),
            margin: const EdgeInsets.all(4.0),
            child: Center(
              child: Text(
                marketPlaceController.material[index],
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 14,
                      color: AppColors.white,
                    ),
              ),
            ),
          );
        },
      ),
    );
  }
}
