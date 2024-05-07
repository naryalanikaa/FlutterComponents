import 'package:balleracademy/core/common/appbar/custom_appbar.dart';
import 'package:balleracademy/core/common/buttons/custom_button.dart';
import 'package:balleracademy/core/global_utils/app_assets.dart';
import 'package:balleracademy/core/global_utils/app_colors.dart';
import 'package:balleracademy/core/global_utils/app_dimensions.dart';
import 'package:balleracademy/core/global_utils/app_sizebox.dart';
import 'package:balleracademy/presentation/marketplace/controller/marketplace_controller.dart';
import 'package:balleracademy/presentation/marketplace/view/marketplace_home/components/size_quantity_comp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final MarketPlaceController marketPlaceController = Get.put(
    MarketPlaceController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppDimensions.screenHeight * 0.08),
        child: CustomAppBar(
          isBackPress: true,
          labelText: 'shopping_cart'.tr,
        ),
      ),
      backgroundColor: AppColors.bgColor,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Expanded(
              child: Column(
                children: <Widget>[
                  ListView.separated(
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        height: 10,
                      );
                    },
                    padding: const EdgeInsets.fromLTRB(14.0, 12, 14.0, 14.0),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 3,
                    itemBuilder: (context, idx) {
                      return _buildCartCard(context);
                    },
                  ),
                  Container(
                    color: AppColors.white,
                    padding: const EdgeInsets.fromLTRB(14.0, 12, 14.0, 14.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Order Price Details",
                          overflow: TextOverflow.visible,
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    fontSize: 16,
                                    color: AppColors.primary,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                        height10SizedBox,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Order Amounts",
                              overflow: TextOverflow.visible,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    fontSize: 14,
                                    color: AppColors.primary,
                                    fontWeight: FontWeight.w400,
                                  ),
                            ),
                            Text(
                              r"$147.00",
                              overflow: TextOverflow.visible,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    fontSize: 16,
                                    color: AppColors.primary,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ],
                        ),
                        height10SizedBox,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Taxes and Fees",
                                  overflow: TextOverflow.visible,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                        fontSize: 14,
                                        color: AppColors.primary,
                                        fontWeight: FontWeight.w400,
                                      ),
                                ),
                                width4SizedBox,
                                Text(
                                  "Know More",
                                  overflow: TextOverflow.visible,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                        decoration: TextDecoration.underline,
                                        fontSize: 10,
                                        color: AppColors.primary,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ],
                            ),
                            Text(
                              r"$147.00",
                              overflow: TextOverflow.visible,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    fontSize: 16,
                                    color: AppColors.primary,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ],
                        ),
                        height10SizedBox,
                        const Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Total Amounts",
                              overflow: TextOverflow.visible,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    fontSize: 14,
                                    color: AppColors.primary,
                                    fontWeight: FontWeight.w400,
                                  ),
                            ),
                            Column(
                              children: [
                                Text(
                                  r"$147.00",
                                  overflow: TextOverflow.visible,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                        fontSize: 16,
                                        color: AppColors.primary,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                                Text(
                                  "+ Shipping Fee",
                                  overflow: TextOverflow.visible,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                        fontSize: 10,
                                        color: AppColors.primary,
                                        fontWeight: FontWeight.w400,
                                      ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // _buildAddCartOrBuyWidget(context),
        ],
      ),
    );
  }

  Widget _buildCartCard(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (v) {},
      child: Container(
        padding: const EdgeInsets.fromLTRB(14.0, 12, 14.0, 12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(
                  14.0,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.primaryLight,
                ),
                child: Image.asset(
                  AppAssets.bgImageIcon,
                  scale: 3.40,
                ),
              ),
            ),
            width6SizedBox,
            Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Los Angeles Elementary School",
                    overflow: TextOverflow.visible,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontSize: 10,
                          color: AppColors.primaryLight,
                          fontWeight: FontWeight.w400,
                        ),
                  ),
                  Text(
                    "Soccer Uniform - Los Angeles Elementary School x SCORE Sports",
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontSize: 12,
                          color: AppColors.primary,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  Text(
                    "Size YM  |  Qty: 2",
                    overflow: TextOverflow.visible,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontSize: 10,
                          color: AppColors.primaryLight,
                          fontWeight: FontWeight.w400,
                        ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        r"$20.00",
                        overflow: TextOverflow.visible,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontSize: 14,
                              color: AppColors.primaryLight,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: AppColors.primaryLight.withOpacity(0.2),
                        ),
                        child: Row(
                          children: [
                            Text(
                              "-",
                              overflow: TextOverflow.visible,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    fontSize: 14,
                                    color: AppColors.primary,
                                    fontWeight: FontWeight.w400,
                                  ),
                            ),
                            width8SizedBox,
                            Text(
                              "1",
                              overflow: TextOverflow.visible,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    fontSize: 14,
                                    color: AppColors.primary,
                                    fontWeight: FontWeight.w400,
                                  ),
                            ),
                            width8SizedBox,
                            Text(
                              "+",
                              overflow: TextOverflow.visible,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    fontSize: 14,
                                    color: AppColors.primary,
                                    fontWeight: FontWeight.w400,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Align _buildAddCartOrBuyWidget(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.bgColor,
            boxShadow: [
              BoxShadow(
                color:
                    const Color.fromARGB(255, 145, 143, 143).withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(14.0, 8, 14.0, 0.0),
                child: _buildSizeQuantity(context),
              ),
              ListView.separated(
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider();
                },
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: marketPlaceController.sizes.length,
                itemBuilder: (context, idx) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(14.0, 2, 14.0, 2.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(
                            "${"size".tr}:",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  fontSize: 14,
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.w400,
                                ),
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "price".tr,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      fontSize: 14,
                                      color: AppColors.primary,
                                      fontWeight: FontWeight.w400,
                                    ),
                              ),
                              Text(
                                r"$30.00",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      fontSize: 14,
                                      color: AppColors.primary,
                                      fontWeight: FontWeight.w400,
                                    ),
                              ),
                              Image.asset(
                                AppAssets.deleteIcon,
                                scale: 2.8,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.fromLTRB(14.0, 0, 14.0, 12.0),
                child: Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        margin: const EdgeInsets.symmetric(
                          vertical: 4,
                          horizontal: 8,
                        ),
                        text: 'add_to_cart'.tr,
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
                        text: 'buy_now'.tr,
                        onTap: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row _buildSizeQuantity(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            _modalBottomSheetMenu("Select Size and Quantity");
          },
          child: Row(
            children: [
              Text(
                "size_quantity".tr,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 12,
                      color: AppColors.primary.withOpacity(0.8),
                      fontWeight: FontWeight.w500,
                    ),
              ),
              Image.asset(
                AppAssets.expandMore,
                scale: 1.8,
              ),
            ],
          ),
        ),
        Row(
          children: [
            Text(
              "total_rice".tr,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 14,
                    color: AppColors.primary,
                    fontWeight: FontWeight.w400,
                  ),
            ),
            width4SizedBox,
            Text(
              "12.00",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 14,
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
      ],
    );
  }

  void _modalBottomSheetMenu(String title) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (builder) {
        return SizeQuantity(
          title: title,
        );
      },
    );
  }


}
