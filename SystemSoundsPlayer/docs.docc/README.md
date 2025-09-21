# SystemSoundsPlayer

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

## Code-Architektur

### **1. SystemSoundPlayer (ViewModel)**
Die Klasse `SystemSoundPlayer` ist ein `ObservableObject`, das die Hauptlogik der App enthält.

#### Eigenschaften:
- `currentSoundID`: Die aktuell abgespielte Sound-ID.
- `isPlaying`: Gibt an, ob ein Ton abgespielt wird.
- `favoriteSounds`: Eine Liste der Favoriten (max. 5).
- `selectedSoundID`: Die aktuell ausgewählte Sound-ID.

#### Methoden:
- `startPlaying()`: Startet die Wiedergabe der Töne.
- `stopPlaying()`: Stoppt die Wiedergabe.
- `addFavoriteSound()`: Fügt die aktuelle Sound-ID zu den Favoriten hinzu.
- `toggleFavoriteSound(soundID: Int)`: Fügt einen Favoriten hinzu oder entfernt ihn.
- `playFavoriteSound(soundID: Int)`: Spielt einen Favoriten ab.
- `saveFavorites()` und `loadFavorites()`: Speichern und Laden der Favoriten in den `UserDefaults`.

---

### **2. SystemSoundView (View)**
Die SwiftUI-Ansicht `SystemSoundView` stellt die Benutzeroberfläche bereit.

#### Hauptkomponenten:
- **Soundsteuerung**:
- Buttons zum Starten und Stoppen der Wiedergabe.
- Anzeige der aktuellen Sound-ID.
- **Favoritenverwaltung**:
- Liste der Favoriten mit Optionen zum Abspielen oder Entfernen.
- **Eingabefeld für Sound-ID**:
- Benutzerdefinierte Eingabe einer Sound-ID mit Validierung.
- Warnmeldungen bei ungültigen Eingaben.

---

## Screenshots

### Hauptansicht
![Hauptansicht](Resources/img_1131.png)

<img src="Resources/img_1131.png" alt="Hauptansicht" width="300" height="200">

---

## Anforderungen

- **Plattform**: iOS 16.0 oder höher
- **Frameworks**: SwiftUI, AudioToolbox, Combine
- **Xcode-Version**: 14.0 oder höher

---



## Lizenz

Dieses Projekt steht unter der Apache License. Weitere Informationen findest du in der Datei `LICENSE`.
