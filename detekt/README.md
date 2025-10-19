# Detekt - Static Code Analysis for Kotlin

## Opis
Detekt je statički analizator koda za Kotlin jezik. Pronalazi probleme u kodu, code smells, i preporučuje poboljšanja stilova pisanja koda.

## Instalacija
Detekt je već konfigurisan u Gradle build sistemu:
- Plugin: `id 'io.gitlab.arturbosch.detekt'`
- Verzija: `1.23.8`
- Konfiguracija u `app/build.gradle`

## Korišćenje

### Windows
```bash
cd 2022_Bluetooth-Chat-and-Remainder-app
.\gradlew.bat detekt --no-daemon
```

### Linux/Mac
```bash
cd 2022_Bluetooth-Chat-and-Remainder-app
./gradlew detekt --no-daemon
```

## Rezultati
Nakon pokretanja, izveštaji se generišu u:
- **HTML izveštaj**: `detekt/build/reports/detekt/detekt.html`
- Konzolni izlaz sa detaljnim opisom problema

## Konfiguracija
Detekt je konfigurisan u `app/build.gradle`:

```gradle
detekt {
    toolVersion = "1.23.8"
    config = files("$rootDir/config/detekt/detekt.yml")
    buildUponDefaultConfig = true
    reports {
        html.required.set(true)
        html.outputLocation.set(file("$rootDir/detekt/build/reports/detekt/detekt.html"))
        xml.required.set(false)
        txt.required.set(false)
    }
}
```

Konfiguracija se nalazi u `config/detekt/detekt.yml`.

## Kategorije problema
Detekt pronalazi probleme u sledećim kategorijama:

### 1. Naming Issues (8 problema)
- Nepravilno imenovanje varijabli
- Varijable koje ne prate camelCase konvenciju

### 2. Lateinit Usage (25 problema)
- Previše korišćenja `lateinit` varijabli
- Može dovesti do runtime grešaka

### 3. Code Style (87 problema)
- Duge linije koda (>120 karaktera)
- Magic numbers (hardkodovane vrednosti)
- Nedostaju zagrade u if/else blokovima
- Nekorišćeni importi
- TODO komentari
- Wildcard importi
- Nedostaje newline na kraju fajla

## Primeri problema

### Variable Naming
```kotlin
// ❌ Loše
val mChatService = ...

// ✅ Dobro
val chatService = ...
```

### Lateinit Usage
```kotlin
// ❌ Loše
lateinit var mAdapter: BluetoothAdapter

// ✅ Dobro
private val adapter: BluetoothAdapter by lazy {
    BluetoothAdapter.getDefaultAdapter()
}
```

### Magic Numbers
```kotlin
// ❌ Loše
if (value > 100) { ... }

// ✅ Dobro
private companion object {
    const val MAX_VALUE = 100
}
if (value > MAX_VALUE) { ... }
```

## Pravila konfiguracije
Detekt koristi sledeća pravila:
- **potential-bugs**: Potencijalne greške u kodu
- **naming**: Pravila za imenovanje
- **style**: Stilovi pisanja koda
- **complexity**: Složenost koda
- **performance**: Performanse

## Dodatne informacije
- [Detekt dokumentacija](https://detekt.github.io/detekt/)
- [Detekt GitHub](https://github.com/detekt/detekt)
- [Detekt pravila](https://detekt.github.io/detekt/rules.html)

