# native_auth

With this pack you can use the biometrics systems of Android and IOS devices.

<br>
will ask the user for the biometric authentication method of their device, which can be FaceID or TouchID on Iphone or FingerPrint on Android phones

## Usage in Dart

Import the relevant file:

```dart
import 'package:native_auth/native_auth.dart';
```

## How to use

```dart
final response = await Auth.isAuthenticate();
```

`response` it's an enum `authResponse` containing the statuses:
#### `error`, `success` and `noAuth`

`success` means the user is authenticated.
`noAuth` means the user is no authenticated.
`error` means that it was not possible to request any biometrics.


## IOS Integration

Update your project's `Info.plist` file to include the
`FaceID` permissions:


```xml
<key>NSFaceIDUsageDescription</key>
<string>Why is my app authenticating using face id?</string>
```

## Android Integration

Update your project's `AndroidManifest.xml` file to include the
`USE_FINGERPRINT` permissions:

```xml
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
 package="com.example.app">
  <uses-permission android:name="android.permission.USE_FINGERPRINT"/>
<manifest>
```

Update your MainActivity.kt:

```kotlin
import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity: FlutterFragmentActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine)
    }
}
```

OR

Update your MainActivity.java:

```java
import android.os.Bundle;
import io.flutter.app.FlutterFragmentActivity;
import io.flutter.plugins.flutter_plugin_android_lifecycle.FlutterAndroidLifecyclePlugin;
import io.flutter.plugins.localauth.LocalAuthPlugin;

public class MainActivity extends FlutterFragmentActivity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        FlutterAndroidLifecyclePlugin.registerWith(
                registrarFor(
                        "io.flutter.plugins.flutter_plugin_android_lifecycle.FlutterAndroidLifecyclePlugin"));
        LocalAuthPlugin.registerWith(registrarFor("io.flutter.plugins.localauth.LocalAuthPlugin"));
    }
}
```
