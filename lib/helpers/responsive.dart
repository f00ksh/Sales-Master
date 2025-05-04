import 'package:flutter/material.dart';
import 'package:sales_master/helpers/enums.dart';

class ResponsiveUIHelper {
  // supported max window width sizes
  static const int mobileMaxWidth = 375;
  static const int tableMaxWidth = 768;
  static const int desktopMaxWidth = 1024;

  // get device type from media query
  static DeviceType getDeviceType(BuildContext context) {
    final deviseSize = MediaQuery.of(context).size;
    final deviseWidth = deviseSize.width;
    if (deviseWidth > ResponsiveUIHelper.desktopMaxWidth) {
      return DeviceType.desktop;
    }
    if (deviseWidth > ResponsiveUIHelper.tableMaxWidth) {
      return DeviceType.tablet;
    }
    return DeviceType.mobile;
  }
}
