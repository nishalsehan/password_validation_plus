# password_validation_plus

A Flutter plugin that offers a password validation widget to ensure strong password requirements in your Flutter applications. The widget enforces 5 crucial rules for password strength, accompanied by a visual progress indicator to guide users in creating secure passwords.

![password_validation_plus_screenshot_1](https://github.com/nishalsehan/password_validation_plus/assets/44578204/3076bde8-94af-4afa-a22b-74e983db23b0)

## Features

- **Password Strength Rules**: The widget enforces 5 crucial rules for strong passwords:
  1. Minimum Length
  2. Uppercase Letters
  3. Lowercase Letters
  4. Special Characters
  5. Numbers (Digits)
  
- **Real-time Feedback**: Provides real-time feedback to users as they type their password, indicating their progress in meeting the specified requirements.

- **Password Strength Indicator**: Visual progress indicator that visually represents the strength of the entered password.

- **Customization**: Easily customize the password validation rules and the appearance of the widget to match your application's requirements.

![Password Validation Widget Demo](https://github.com/nishalsehan/password_validation_plus/assets/44578204/69cc3675-98c5-46fd-9517-d6fd8e1f4827)

## Installation

Add the following dependency to your `pubspec.yaml` file:

```yaml
dependencies:
  password_validation_plus: ^0.0.1
```

Run `flutter pub` get to install the package.

</br>

## Usage

Import the package in your Dart code:

```dart
import 'package:password_validation_plus/password_validation_plus.dart';
```
<br>
Use the PasswordValidationPlus widget in your widget tree:

```dart
PasswordValidationPlus(
  textController: controller,//TextEditingController
)
```
</br>

## Customization

You can customize the password validation widget by providing different parameters to the `PasswordValidationPlus` constructor:

```dart
PasswordValidationPlus(
  textController: controller,
  maxLength: 12,
  minLength: 8,
  successIcon: Iconsax.tick_circle,
  unSuccessIcon: Iconsax.close_circle,
  successWidget: SvgPicture.asset(
    "assets/icons/tick.svg",
    height: 24,
  ),
  unSuccessWidget: SvgPicture.asset(
    "assets/icons/close.svg",
    height: 24,
  ),
  textSize: 16,
  hideRules: true,
),
```

- `textController`: Set the TextEditingController of your password text field here.
- `minLength`: Set the minimum required length for the password.
- `maxLength`: Set the maximum allowed length for the password.
- `hideRules`: Set to true to hide the password validation rules.
- `successIcon`: Customize the icon displayed for a successful validation rule.
- `unSuccessIcon`: Customize the icon displayed for an unsuccessful validation rule.
- `successWidget`: Customize the widget displayed for a successful validation rule.
- `unSuccessWidget`: Customize the widget displayed for an unsuccessful validation rule.
- `textSize`: Adjust the text size of the validation rule and icon.
<br>

## Example

For a complete example of how to use this plugin, check out the [example](https://github.com/nishalsehan/password_validation_plus/tree/main/example) folder in this repository.
</br>

## Issues and Feedback

If you encounter any issues or have suggestions for improvement, please open an issue on our [GitHub repository](https://github.com/nishalsehan/password_validation_plus/issues). We welcome your feedback!
</br>

## License

This project is licensed under the MIT License - see the [LICENSE](https://github.com/nishalsehan/password_validation_plus/blob/main/LICENSE) file for details.
