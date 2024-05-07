import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import "package:google_maps_webservice/geocoding.dart";

class Utility {
// SNACKBAR
  static void showMessage(String title, String message) {
    Get.snackbar(title, message,
        margin: const EdgeInsets.only(bottom: 20, left: 15, right: 15),
        duration: const Duration(seconds: 1),
        snackPosition: SnackPosition.TOP,
        colorText: Colors.white,
        backgroundColor: Colors.blue);
  }

// TOP TOAST
  static void showToast(dynamic message) {
    Fluttertoast.showToast(
        msg: message.toString(),
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP,
        backgroundColor: Colors.blue,
        textColor: Colors.white,
        fontSize: 14.0);
  }

// CENTER TOAST
  static void showToast(dynamic message) {
    Fluttertoast.showToast(
        msg: message.toString(),
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.blue,
        textColor: Colors.white,
        fontSize: 14.0);
  }

// ALERT CONFIRMATION DAILOGUE
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
              SizedBox(height: 10),
              Center(
                child: Image.asset(
                  ImageConstants.alert48,
                  color: AppColors.red,
                ),
              ),
              SizedBox(height: 15),
              Text(
                title,
                style: const TextStyle(
                    color: AppColors.black,
                    fontSize: 16,
                    height: 1.6,
                    fontWeight: FontWeight.w400),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      cancelTap ?? Get.back();
                    },
                    child: Container(
                      height: WidgetConstants.screenHeight * 0.08,
                      width: WidgetConstants.screenWidth * 0.28,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        border: Border.all(color: AppColors.primary),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Center(
                        child: Text(
                          cancelText ?? StringConstants.cancelText,
                          style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16.0,
                              color: AppColors.primary),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      okayTap!() ?? Get.back();
                    },
                    child: Container(
                      height: WidgetConstants.screenHeight * 0.08,
                      width: WidgetConstants.screenWidth * 0.28,
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Center(
                        child: Text(
                          okay ?? StringConstants.okayText,
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

// DATE TIME FUNCTION
  static String parseDateTime(DateTime timestamp,
      {String format = 'MMM d, h:mm a', required String secFormat}) {
    final dateTime = timestamp.toLocal();
    return DateFormat(format).format(dateTime).toString();
  }

// DATE TIME FUNCTION
  static String formatDateTime(String timestamp,
      {String firstFormat = 'MMM d, h:mm a',
      secFormat = 'yyyy-MM-dd hh:mm:ss'}) {
    DateTime parseDate = DateFormat(firstFormat).parse(timestamp.toString());
    var inputDate = DateTime.parse(parseDate.toString());
    var outputFormat = DateFormat(secFormat);
    var outputDate = outputFormat.format(inputDate);
    return outputDate;
  }

// FETCH CURRENT LOCATION
  static Future<Position> fetchCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition();
  }

  static Future<void> showSelectionMediaDialog(BuildContext context,
      {void Function()? onGalleryClick, void Function()? onCameraClick}) {
    return showDialog(
        context: context,
        builder: (BuildContext contextt) {
          return AlertDialog(
              icon: Align(
                alignment: Alignment.topRight,
                child: InkWell(
                  onTap: () {
                    Get.back();
                    // Navigator.pop(contextt);
                  },
                  child: const Icon(
                    Icons.clear,
                    color: AppColors.primary,
                    size: 24.0,
                  ),
                ),
              ),
              title: Text(
                StringConstants.fromWherePhotoText,
                style: const TextStyle(
                    color: AppColors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    InkWell(
                      child: Row(
                        children: [
                          const Icon(
                            Icons.image_sharp,
                            color: AppColors.primary,
                            size: 24.0,
                          ),
                          width10SizedBox,
                          Text(StringConstants.galleryText,
                              style: const TextStyle(
                                  color: AppColors.primary, fontSize: 16)),
                        ],
                      ),
                      onTap: () async {
                        Get.back();
                        // Navigator.pop(contextt);
                        onGalleryClick!();
                      },
                    ),
                    const Padding(padding: EdgeInsets.all(8.0)),
                    InkWell(
                      child: Row(
                        children: [
                          const Icon(
                            Icons.camera_alt,
                            color: AppColors.primary,
                            size: 24.0,
                          ),
                          width10SizedBox,
                          Text(StringConstants.cameraText,
                              style: const TextStyle(
                                  color: AppColors.primary, fontSize: 16)),
                        ],
                      ),
                      onTap: () async {
                        Get.back();
                        // Navigator.pop(contextt);
                        onCameraClick!();
                      },
                    )
                  ],
                ),
              ));
        });
  }

// GET LOCALITY FUNCTION
  static String extractLocality(GeocodingResult result, String typeData,
      {bool isShortName = false}) {
    for (final component in result.addressComponents) {
      for (final type in component.types) {
        if (type == typeData) {
          if (isShortName) {
            return component.shortName;
          } else {
            return component.longName;
          }
        }
      }
    }
    return '';
  }
}

extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');
}
