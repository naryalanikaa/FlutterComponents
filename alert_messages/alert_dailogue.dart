
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AlertDailogue {

//ALERT DAILOGUE
  static void showConfirmAlertMessage(title,
      {String description = "",
      String? cancelText,
      String? okay,
      Function()? okayTap,
      Function()? cancelTap}) {
    showDialog(
      context: Get.context!,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        content: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              height10SizedBox,
              Center(
                  child: Icon(
                Icons.album_sharp,
                color: AppColors.red,
                size: 20,
              )),
              height15SizedBox,
              Text(
                title,
                style: const TextStyle(
                    color: AppColors.black,
                    fontSize: 16,
                    height: 1.6,
                    fontWeight: FontWeight.w400),
                textAlign: TextAlign.center,
              ),
              height25SizedBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      cancelTap ?? Get.back();
                    },
                    child: Container(
                      height: AppDimensions.screenHeight * 0.08,
                      width: AppDimensions.screenHeight * 0.28,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        border: Border.all(color: AppColors.primary),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Center(
                        child: Text(
                          cancelText ?? AppStringConstants.cancelText,
                          style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16.0,
                              color: AppColors.primary),
                        ),
                      ),
                    ),
                  ),
                  width8SizedBox,
                  InkWell(
                    onTap: () {
                      okayTap!() ?? Get.back();
                    },
                    child: Container(
                      height: AppDimensions.screenHeight * 0.08,
                      width: AppDimensions.screenWidth * 0.28,
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Center(
                        child: Text(
                          okay ?? AppStringConstants.okayText,
                          style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16.0,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        actions: const <Widget>[],
      ),
    );
  }

//ALERT MESSAGE
  static void showAlertMessage(
    description, {
    String? title,
    String? cancelText,
    String? okay,
    Color? color,
    void Function()? okayTap,
    void Function()? cancelTap,
  }) {
    showDialog(
      context: Get.context!,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            height10SizedBox,
            Icon(
              Icons.album_sharp,
              color: AppColors.red,
              size: 20,
            ),
            height12SizedBox,
            Visibility(
              visible: title != null,
              child: Text(
                title ?? "",
                style: const TextStyle(
                    color: AppColors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
                textAlign: TextAlign.start,
              ),
            ),
            title != null ? height15SizedBox : height0SizedBox,
            Text(
              description ?? "",
              style: TextStyle(
                  color: AppColors.black,
                  fontSize: 16,
                  height: 1.6,
                  fontWeight: FontWeight.w400),
              textAlign: TextAlign.center,
            ),
            height25SizedBox,
            InkWell(
              onTap: () {
                okayTap ?? Get.back();
                // isLoadingValue ? true : false;
              },
              child: Container(
                height: 50.0,
                width: AppDimensions.screenWidth * 0.3,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Center(
                  child: Text(
                    okay ?? AppStringConstants.okayText,
                    style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14.0,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
        actions: const <Widget>[],
      ),
    );
  }

//ALERT
  static showAlert(
    String title,
    String message,
    String buttonText,
  ) async {
    return await Get.dialog(AlertDialog(
      title: Text(
        AppStringConstants.alertText,
        style: const TextStyle(color: AppColors.primary, fontSize: 20),
      ),
      content: Text(
        message,
        style: const TextStyle(
          color: AppColors.black,
          fontSize: 18,
        ),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  textStyle: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.bold)),
              child: Text(buttonText),
              onPressed: () => Get.back(result: true),
              // ** result: returns this value up the call stack **
            ),
          ],
        ),
      ],
    ));
  }

//ALERT MESSAGE
  static alertDialog(context,
      {String title = "",
      String description = "",
      String ok = "",
      String cancel = "",
      Function()? onOk,
      void Function()? onCancel}) async {
    return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            title,
            style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: AppColors.black,
                fontSize: 20),
          ),
          content: Text(description,
              style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  color: AppColors.black,
                  fontSize: 20)),
          actions: <Widget>[
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                ),
                onPressed: () {
                  onOk ?? Get.back();
                },
                child: Text(ok)),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
              ),
              onPressed: () {
                onCancel ?? Get.back();
              },
              child: Text(cancel),
            ),
          ],
        );
      },
    );
  }
}
