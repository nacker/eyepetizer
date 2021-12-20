package com.devlei.eyepetizer.eyepetizer;

import io.flutter.embedding.android.FlutterActivity;

import org.devio.flutter.splashscreen.SplashScreen;

public class MainActivity extends FlutterActivity {

    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        SplashScreen.show(this, true);
        super.onCreate(savedInstanceState);
    }

}
