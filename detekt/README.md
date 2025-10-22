# Detekt - Statička analiza koda

## Opis
Detekt je statički analizator koda za Kotlin programski jezik. Pronalazi probleme u kodu, code smell-ove i preporučuje poboljšanja stilova kodiranja.

## Instalacija
Detekt je već konfigurisan u Gradle build sistemu.

## Korišćenje

### Opcija 1: Korišćenje priložene skripte (preporučeno)
```bash
# Iz korena projekta
./detekt/run_detekt.sh

# Ili iz detekt direktorijuma
cd detekt && bash run_detekt.sh
```

### Opcija 2: Direktno korišćenje Gradle-a
#### Windows
```bash
cd 2022_Bluetooth-Chat-and-Remainder-app
.\gradlew.bat detekt --no-daemon
```

#### Linux/Mac
```bash
cd 2022_Bluetooth-Chat-and-Remainder-app
./gradlew detekt --no-daemon
```

## Rezultati
Nakon izvršavanja, izveštaji se generišu u:
- **HTML izveštaj**: `detekt/build/reports/detekt/detekt.html`
- Konzolni izlaz sa detaljnim opisima problema

Konfiguracija se nalazi u `config/detekt/detekt.yml`.

## Konfiguraciona Pravila
Detekt koristi sledeća pravila:
- **potential-bugs**: Potencijalne greške u kodu
- **naming**: Konvencije imenovanja
- **style**: Stilovi pisanja koda
- **complexity**: Kompleksnost koda
- **performance**: Problemi sa performansama

## Dodatne Informacije
- [Detekt dokumentacija](https://detekt.github.io/detekt/)
- [Detekt GitHub](https://github.com/detekt/detekt)