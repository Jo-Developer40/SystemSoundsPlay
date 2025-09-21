# SystemSoundsPlayer

# EN
## Overview

The SystemSoundsPlayer app is a SwiftUI application that allows users to play, manage, and add favorites to system sounds on an iOS device. The app provides a user-friendly interface to test sounds between IDs 1000 and 2000, save favorites, and play them directly.

---

## Main Features

### 1. **Play System Sounds**
- The app plays system sounds based on a sound ID.
- Users can start and stop playback.
- The current sound ID is displayed and can be adjusted.

### 2. **Manage Favorites**
- Users can add up to 5 favorites.
- Favorites can be played or removed.
- The favorites list is stored in `UserDefaults` and loaded when the app is launched.

### 3. **User interface**
- **Start/Stop buttons**: Control sound playback.
- **Favorites buttons**: Add and manage favorites.
- **Sound ID input field**: Set custom sound ID.
- **Warning messages**: Feedback for invalid entries.

---

## Screenshots

![MainView]([Resources/img_1131.png](https://github.com/Jo-Developer40/SystemSoundsPlay/tree/main/Resources#:~:text=img_1131.PNG))


---


# DE
## Übersicht

Die SystemSoundsPlayer-App ist eine SwiftUI-Anwendung, die es Benutzern ermöglicht, Systemtöne auf einem iOS-Gerät abzuspielen, zu verwalten und Favoriten hinzuzufügen. Die App bietet eine benutzerfreundliche Oberfläche, um Töne zwischen den IDs 1000 und 2000 zu testen, Favoriten zu speichern und diese direkt abzuspielen.

---

## Hauptfunktionen

### 1. **Systemtöne abspielen**
- Die App spielt Systemtöne basierend auf einer Sound-ID ab.
- Benutzer können die Wiedergabe starten und stoppen.
- Die aktuelle Sound-ID wird angezeigt und kann angepasst werden.

### 2. **Favoriten verwalten**
- Benutzer können bis zu 5 Favoriten hinzufügen.
- Favoriten können abgespielt oder entfernt werden.
- Die Favoritenliste wird in den `UserDefaults` gespeichert und beim Start der App geladen.

### 3. **Benutzeroberfläche**
- **Start/Stop-Buttons**: Steuerung der Soundwiedergabe.
- **Favoriten-Buttons**: Hinzufügen und Verwalten von Favoriten.
- **Eingabefeld für Sound-ID**: Benutzerdefinierte Sound-ID setzen.
- **Warnmeldungen**: Feedback bei ungültigen Eingaben.

---

## Screenshots

### Hauptansicht
![Hauptansicht](../Resources/img_1131.png)

<img src="../Resources/img_1131.png" alt="Hauptansicht" width="300" height="200">

---

## Anforderungen

- **Plattform**: iOS 16.0 oder höher
- **Frameworks**: SwiftUI, AudioToolbox, Combine
- **Xcode-Version**: 14.0 oder höher

---



## Lizenz

Dieses Projekt steht unter der Apache License. Weitere Informationen findest du in der Datei `LICENSE`.
