# Jacoco - Code Coverage Analysis

## Opis
Jacoco je alat za merenje pokrivenosti koda (code coverage) u Java/Kotlin aplikacijama. Omogućava analizu koliki deo koda je pokriven testovima.

## Instalacija
Jacoco je već konfigurisan u Gradle build sistemu:
- Plugin: `id 'jacoco'`
- Verzija: `0.8.8`
- Konfiguracija u `app/build.gradle`

## Korišćenje

### Windows
```bash
# Unit testovi (default)
.\run_jacoco.bat

# Android testovi (zahtevaju uređaj/emulator)
.\run_jacoco.bat --android

# Kombinovani testovi (unit + Android)
.\run_jacoco.bat --combined

# Pomoć
.\run_jacoco.bat --help
```

### Linux/Mac
```bash
# Unit testovi (default)
chmod +x run_jacoco.sh
./run_jacoco.sh

# Android testovi (zahtevaju uređaj/emulator)
./run_jacoco.sh --android

# Kombinovani testovi (unit + Android)
./run_jacoco.sh --combined

# Pomoć
./run_jacoco.sh --help
```

### Manualno pokretanje
```bash
cd 2022_Bluetooth-Chat-and-Remainder-app

# Unit testovi
./gradlew clean testDebugUnitTest jacocoTestReport --no-daemon

# Android testovi
./gradlew clean connectedDebugAndroidTest jacocoAndroidTestReport --no-daemon

# Kombinovani testovi
./gradlew clean testDebugUnitTest connectedDebugAndroidTest jacocoCombinedTestReport --no-daemon
```

## Rezultati
Nakon pokretanja, izveštaji se generišu u:

### Unit testovi
- **HTML izveštaj**: `app/build/reports/jacoco/jacocoTestReport/html/index.html`
- **XML izveštaj**: `app/build/reports/jacoco/jacocoTestReport/jacocoTestReport.xml`

### Android testovi
- **HTML izveštaj**: `app/build/reports/jacoco/jacocoAndroidTestReport/html/index.html`
- **XML izveštaj**: `app/build/reports/jacoco/jacocoAndroidTestReport/jacocoAndroidTestReport.xml`

### Kombinovani testovi
- **HTML izveštaj**: `app/build/reports/jacoco/jacocoCombinedTestReport/html/index.html`
- **XML izveštaj**: `app/build/reports/jacoco/jacocoCombinedTestReport/jacocoCombinedTestReport.xml`

## Konfiguracija
Jacoco je konfigurisan u `app/build.gradle`:

```gradle
jacoco {
    toolVersion = "0.8.8"
}

task jacocoTestReport(type: JacocoReport, dependsOn: 'testDebugUnitTest') {
    reports {
        xml.required = true
        html.required = true
        csv.required = false
    }
    
    // Exclude generated classes
    def fileFilter = [
        '**/R.class',
        '**/R$*.class',
        '**/BuildConfig.*',
        '**/Manifest*.*',
        '**/*Test*.*',
        'android/**/*.*'
    ]
    
    def debugTree = fileTree(dir: "${buildDir}/intermediates/javac/debug", excludes: fileFilter)
    def mainSrc = "${project.projectDir}/src/main/java"
    
    sourceDirectories.setFrom(files([mainSrc]))
    classDirectories.setFrom(files([debugTree]))
    executionData.setFrom(fileTree(dir: buildDir, includes: [
        'jacoco/testDebugUnitTest.exec',
        'outputs/code-coverage/connected/*coverage.ec'
    ]))
}
```

## Metrije
Jacoco meri sledeće tipove pokrivenosti:
- **Line Coverage**: Koliki deo linija koda je izvršen
- **Branch Coverage**: Koliki deo grana (if/else) je testiran
- **Method Coverage**: Koliki deo metoda je pozvan
- **Class Coverage**: Koliki deo klasa je testiran

## Troubleshooting
- Ako testovi ne prolaze, proverite da li su svi testovi ispravni
- Ako nema pokrivenosti, proverite da li su testovi pokrenuti
- Ako izveštaj nije generisan, proverite da li je `jacocoTestReport` task uspešno završen

## Dodatne informacije
- [Jacoco dokumentacija](https://www.jacoco.org/jacoco/)
- [Gradle Jacoco plugin](https://docs.gradle.org/current/userguide/jacoco_plugin.html)
