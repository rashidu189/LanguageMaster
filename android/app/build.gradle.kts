plugins {
    id("com.android.application")
    id("kotlin-android")
    // Flutter Gradle Plugin should be applied last
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.example.languagemaster"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        applicationId = "com.example.languagemaster"
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

flutter {
    source = "../.."
}

// IMPORTANT: Apply google-services plugin at the bottom
apply plugin: 'com.google.gms.google-services'
