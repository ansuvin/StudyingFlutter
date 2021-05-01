package com.example.flutter_app;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.andorid.FlutterFragmentActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterFragmentActivity {
    @Override
    public void configureFlutterEngine(FlutterEngine foutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine);
    }
}
