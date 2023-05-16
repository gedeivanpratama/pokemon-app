import 'package:flutter_technical_test/core/utility/static.dart';

extension UrlToImage on String {
  String toImageUrl() {
    String id = substring(0, length - 1).split("/").last;
    return "$imageUrl/$id.png";
  }
}
