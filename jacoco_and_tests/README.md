# Jacoco - Analiza Pokrivenosti Koda

## Opis
Jacoco je alat za merenje pokrivenosti koda u Java/Kotlin aplikacijama. Omogućava analizu koliko je koda pokriveno testovima.

## Instalacija
Jacoco je već konfigurisan u Gradle build sistemu

## Korišćenje

### Windows
```bash
# Unit testovi (podrazumevano)
.\run_jacoco.bat

# Android testovi (zahteva uređaj/emulator)
.\run_jacoco.bat --android

# Pomoć
.\run_jacoco.bat --help
```

### Linux/Mac
```bash
# Unit testovi (podrazumevano)
chmod +x run_jacoco.sh
./run_jacoco.sh

# Android testovi (zahteva uređaj/emulator)
./run_jacoco.sh --android

# Pomoć
./run_jacoco.sh --help
```

### Ručno izvršavanje
```bash
cd 2022_Bluetooth-Chat-and-Remainder-app

# Android testovi
./gradlew clean connectedDebugAndroidTest jacocoAndroidTestReport --no-daemon
```

## Rezultati
Nakon izvršavanja, izveštaji se generišu u:

- **HTML izveštaj**: `app/build/reports/jacoco/jacocoAndroidTestReport/html/index.html`
- **XML izveštaj**: `app/build/reports/jacoco/jacocoAndroidTestReport/jacocoAndroidTestReport.xml`

## Metrike
Jacoco meri sledeće tipove pokrivenosti:
- **Pokrivenost linija**: Koliko linija koda je izvršeno
- **Pokrivenost grana**: Koliko grana (if/else) je testirano
- **Pokrivenost metoda**: Koliko metoda je pozvano
- **Pokrivenost klasa**: Koliko klasa je testirano

## Dodatne Informacije
- [Jacoco dokumentacija](https://www.jacoco.org/jacoco/)
- [Gradle Jacoco plugin](https://docs.gradle.org/current/userguide/jacoco_plugin.html)