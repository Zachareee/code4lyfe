# PillPrompter

This application targets medication mismanagement amongst the elderly. We engage not only the elderly, but also their loved ones such as their children. In doing so, we aim to create a system of accountability for the elderly to adhere to their prescribed treatment plan.

## Getting Started
Follow these instructions to get a copy of the project up and running on your local machine.

## Prerequisites
Make sure you have the following installed:

1. Node.js (which includes npm) – This project requires Node.js to run. You can check if you have it installed by running `node -v` and `npm -v` in your terminal.
2. Git – Git is needed to clone the repository.
3. React Native CLI – Required to run the application on a React Native simulator. Install it using the following command:

```sh
npm install -g react-native-cli
```
   
## Cloning the Repository
1. Open your terminal or command prompt.
2. Navigate to the directory where you want to clone the repository.
3. Run the following command to clone the repository:

```sh
git clone https://github.com/Zachareee/coder4lyfe.git
```

## Installing Dependencies
1. In the project directory, run the following command to install the necessary dependencies:

```sh
npm install
```
This will install all the packages listed in the `package.json` file.

## Running the Project
After installing the dependencies, start the development server by running:

```sh
npm start
```

This will start the React development server and open the application in your default web browser. If it does not open automatically, you can visit `http://localhost:3000` in your browser.

## Running on a React Native Simulator
To set up and run the application on a React Native simulator, follow these steps:
1. Install React Native CLI: If you haven't already installed React Native CLI, you can install it globally using the following command:

```sh
npm install -g react-native-cli
```
2. Start the Simulator:
- For iOS: Make sure you have Xcode installed on your Mac. Open Xcode, go to Preferences > Locations, and select the latest version of Xcode's command line tools. Then, run the following command in your terminal to start the iOS simulator:

```sh
npx react-native run-ios
```
- For Android: Make sure you have Android Studio installed. Open Android Studio, go to Configure > AVD Manager, and create a new virtual device if you don't have one. Then, run the following command in your terminal to start the Android simulator:

```sh
npx react-native run-android
```
3. Run the App: Once the simulator is running, execute the following command to launch the app on the simulator:

```sh
react-native run-android
```
or
```sh
react-native run-ios
```

The app should now be running on your simulator.


## Building for Production
To create an optimized build of the application for production, run:

```sh
npm run build
```

This will create a `build` directory with a production build of the app.

## Running Tests
To run the project's tests, use:

```sh
npm test
```

This will run the test suite defined in the project.

## Contact
For any questions or issues, please reach out to danielw.2023@scis.smu.edu.sg.
