import 'package:flutter/cupertino.dart';

import '../../presentation/app_localization.dart';

extension StringExtension on String {
  String toIntelliTrim(int size) {
    return length > size ? '${substring(0, size)}...' : this;
  }

  String? t(BuildContext context){
    return AppLocalization.of(context)?.translate(this);
  }
}
