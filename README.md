# Dog Keyboard App
Senior Design Spring Semester 2017
Reese Aitken, Leo Chen, Joon Choi, Sanny Chun, Hyunsu Park

# Project Description
We are designing a Dog Keyboard for our client Joelle Alcaidinho.
This repository is for version-controlling our iOS app.

The app will act as a remote controller to the physical keyboard. The user will be able to set sounds, quiet-hours, and read statistical data. 

# Release Notes
Current ver. is 1.0
- SSID and PW are saved as .txt file
- SSH connection status checking updated
- Button selection on Customize Keys updated

# Install Guide
<b>Please follow along this guideline to run the app successfully.</b>

<b>Pre-Requisite</b>
- Must be a Mac user
- Must own an iOS device, such as iPhone/iPad
- Device must run at least iOS 8

<b>Dependent Libraries/Programs</b>
- Will need to have XCode installed on Mac (get the latest version. Current ver. is 8.3.2)
- Mac must be able to run/compile Swift 3.1
- Will need to have CocoaPods & NMSSH installed prior to running the build

# Download Instructions

<b>* Source Code:</b>

  Pull https://github.com/Diodorm/SeniorDesign.git using Git, or download the .zip file from    https://github.com/Diodorm/SeniorDesign to your desired Folder on your Mac.

<b>* Xcode:</b>
1. Run AppStore
2. Search XCode
3. Download and install, following the instructions given.

<b>* CocoaPods & NMSSH (https://guides.cocoapods.org/using/getting-started.html)</b>
1. Open terminal, and type: <i>sudo gem install cocoapods</i>
2. Pull the NMSSH git from: https://github.com/NMSSH/NMSSH and save it on a location on your Mac
2. In terminal, cd to Project Folder, and type: <i>pod init</i>
3. A Podfile file should have been created in the project folder. Open it using any text editor
4. Inside Podfile, include this line: <i>pod ’NMSSH’ after # Pods for DogKeyboardApp, and save the file once you're done</i>
5. Go back to terminal, and type: <i>pod install</i>

<b>* Viewing the Source Code on XCode</b>
1. Launch XCode
2. Select <i>Open another project</i>
3. Locate the source code folder, and make sure to select the .xcworkspace file (the newly created CocoaPods file) and click <i>Open</i>.

# Running the App
1. Connect iOS device to Mac
2. Launch XCode
3. Choose "My Device" in the device simulator menu (located at the top-left corner of XCode)
4. Run Build (Command + Run)

App will launch on device. An icon will be created. 
In case of an update, the user should reconnect the device to the Mac and repeat the <i>Running the App</i> section.

# Troubleshooting
In the case of malfunction/erroneous launch, please check whether your devices match these criteria:

1. Make sure your iPhone/iPad runs at least iOS8.
2. Make sure that your device is registered by your Mac prior to running the source code (device connection can be checked using iTunes)
3. Make sure XCode is up-to-date, and that your Mac is able to compile/run Swift 3.1
4. For safety measures, make sure the source code folder & its path names are composed of ONLY Alphabets (e.g. Users/username/Documents/SeniorDesign)

For any other inquiries, please e-mail: shc1991@gatech.edu
