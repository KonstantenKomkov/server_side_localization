# Localization on the server side

An implementation example based on the [easy localization](https://pub.dev/packages/easy_localization) library. First, the text from the cache or application is displayed, depending on the launch sequence number, then the text downloaded from the server is displayed.

# Getting Started

Install libraries
```bash
flutter pub get
```

Update the code generation files
```bash
dart run build_runner build
```

Generate keys for translations
```shell
sh easy_localization.sh
```

# Example
<table >
    <tr align="center">
        <td>The first launch</td>
        <td>Subsequent launches</td>
    </tr>
    <tr>
        <td width="50%"><img src="https://github.com/KonstantenKomkov/server_side_localization/blob/master/assets/first_start.gif"></td>
        <td width="50%"><img src="https://github.com/KonstantenKomkov/server_side_localization/blob/master/assets/second_start.gif"></td>
    </tr>
</table>