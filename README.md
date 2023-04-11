# native_auth

With this pack you can use the biometrics systems of Android and IOS devices.

<br>
It will ask for the user which the biometric authentication method  of his device, this can be FaceID or TouchID on IPhone or  FingerPrint on Android phone



## How to use

```dart
import 'package:native_auth/native_auth.dart';
final response = await Auth.isAuthenticate();
print(response.isAuthenticated); // true or false
```

`response` is an enum `AuthResult` containing the statuses:
#### `error`, `auth` and `noAuth`

`auth` means the user is authenticated.<br>
`noAuth` means the user is no authenticated.<br>
`error` means that it was not possible to request any biometrics.

## 📱Screenshots

<h3 align="center">🤖 Android</h3>
<p align="center">
    <img src="https://gitlab.com/welitonsousa/images/-/raw/main/android-waiting.png" width="270" height="500"/>
    <img src="https://gitlab.com/welitonsousa/images/-/raw/main/android-success.png" width="270" height="500"/>
</p>

<h3 align="center">🍎 IOS</h3>
<p align="center">
    <img src="https://gitlab.com/welitonsousa/images/-/raw/main/ios-waiting.png" width="270" height="500"/>
    <img src="https://gitlab.com/welitonsousa/images/-/raw/main/ios-success.png" width="270" height="500"/>
</p>

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
  <uses-permission android:name="android.permission.USE_BIOMETRIC"/>
<manifest>
```

Update your MainActivity.kt:

```java
import io.flutter.embedding.android.FlutterFragmentActivity

class MainActivity: FlutterFragmentActivity() {
    // ...
}
```

OR

Update your MainActivity.java:

```java
import io.flutter.embedding.android.FlutterFragmentActivity;

public class MainActivity extends FlutterFragmentActivity {
    // ...
}
```
to inherit `FlutterActivity` from `FlutterFragmentActivity`

<br>

<p align="center">
   Feito com ❤️ by <a target="_blank" href="https://welitonsousa.github.io"><b>Weliton Sousa</b></a>
</p>
