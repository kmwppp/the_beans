import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app.dart';

void main() {
  // 앱 시작 시 상태바 스타일 고정
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light, // 안드로이드용
      statusBarBrightness: Brightness.dark, // iOS용
    ),
  );
  runApp(const ProviderScope(child: App()));
}
