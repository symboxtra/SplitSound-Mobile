# SplitSound-Mobile
We're  in the endgame now...

## Instructions-*read before yelling at me*
The first step is to either have Xcode installed or Android Studio, depending which one you want to work on. You do not need to edit code in these, you just need them for their emulators.

Then, install the react-native cli by running
```
npm install -g react-native-cli
```
Then, to run the application,
```
cd ./you/know/how/to/do/this/SplitSound-Mobile

react-native run-ios OR react-native run-android
```
When running either of these for the first time, it will take a long time.

*Note: the android emulator has to already be running for the run command to work for android. If you want, you can also connect your phone to your compooter to run it on that. I've yet to find a way to do that on iOS though.*

## Android Emulator ##
```./scripts/android-emulator``` can be used to start an Android emulator on any platform.
It assumes you already have a copy of the Android SDK installed on your computer and will guide you through setting the ```ANDROID_HOME``` environment variable to locate it if necessary.

An existing AVD (i.e. one created in Android Studio) can be used with the script by passing its name as the value for the ```-a``` flag.
```
./scripts/android-emulator -a PixelTest
```

The name can be retrieved from Android Studio or via ```avdmanager list avds```.
