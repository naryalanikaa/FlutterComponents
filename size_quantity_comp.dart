
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SizeQuantity extends StatelessWidget {
  const SizeQuantity({required this.title, super.key});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppDimensions.screenHeight * 0.8,
      color: Colors.transparent,
      child: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 14,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontSize: 16,
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
                ),
                const Divider(),
                Expanded(
                  flex: 5,
                  child: ListView.separated(
                    separatorBuilder: (BuildContext context, int index) {
                      return const Divider();
                    },
                    padding: const EdgeInsets.only(bottom: 50),
                    itemCount: marketPlaceController.sizes.length,
                    itemBuilder: (context, index) {
                      final String category =
                          marketPlaceController.sizes.keys.elementAt(index);
                      final List<SizeItem> items =
                          marketPlaceController.sizes.values.elementAt(index);
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12.0,
                              vertical: 8,
                            ),
                            child: Text(
                              category,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    fontSize: 16,
                                    color: AppColors.primaryLight,
                                    fontWeight: FontWeight.w400,
                                  ),
                            ),
                          ),
                          const Divider(),
                          SizedBox(
                            child: ListView.separated(
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return const Divider();
                              },
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: items.length,
                              itemBuilder: (context, idx) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0,
                                    vertical: 4,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(items[idx].name),
                                      Obx(
                                        () => Theme(
                                          data: Theme.of(context).copyWith(
                                            dividerTheme:
                                                const DividerThemeData(
                                              color: AppColors.primaryLight,
                                            ),
                                          ),
                                          child: PopupMenuButton(
                                            padding: const EdgeInsets.all(20),
                                            elevation: 0,
                                            surfaceTintColor: AppColors.white,
                                            constraints: const BoxConstraints(
                                              minWidth: 65,
                                              maxWidth: 65,
                                            ),
                                            onSelected: (value) {
                                              items[idx].quantity.value =
                                                  value.toString();
                                            },
                                            offset: const Offset(0.0, 35),
                                            shape: RoundedRectangleBorder(
                                              side: const BorderSide(
                                                color: AppColors.primaryLight,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            color: AppColors.white,
                                            itemBuilder: _buildPopupMenuItem,
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 8,
                                              ),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  12,
                                                ),
                                                border: Border.all(
                                                  color: AppColors.primaryLight,
                                                ),
                                              ),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    items[idx].quantity.value,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyMedium
                                                        ?.copyWith(
                                                          fontSize: 14,
                                                          color:
                                                              AppColors.primary,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                  ),
                                                  width10SizedBox,
                                                  Image.asset(
                                                    AppAssets.expandMore,
                                                    scale: 1.8,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      );
                    },
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
                      onTap: Get.back,
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
                      onTap: () {
                        Get.back();
                      },
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

  List<PopupMenuEntry<int>> _buildPopupMenuItem(context) => [
        const PopupMenuItem<int>(
          height: 10,
          value: 1,
          child: Center(child: Text('1')),
        ),
        const PopupMenuDivider(),
        const PopupMenuItem<int>(
          height: 10,
          value: 2,
          child: Center(child: Text('2')),
        ),
        const PopupMenuDivider(),
        const PopupMenuItem<int>(
          height: 10,
          value: 3,
          child: Center(child: Text('3')),
        ),
      ];
}
