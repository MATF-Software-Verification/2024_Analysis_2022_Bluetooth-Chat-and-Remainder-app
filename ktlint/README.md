# ktlint - Provera Stila Kotlin Koda

## Šta je ktlint?

ktlint je Kotlin linter i formater koji primenjuje Kotlin standarde kodiranja. Pomaže u održavanju konzistentnog stila koda kroz ceo projekat.

## Fajlovi u ovom direktorijumu

- `ktlint.yml` - ktlint konfiguracioni fajl
- `.editorconfig` - Konfiguracija editora za konzistentno formatiranje koda
- `run_ktlint.sh` - Shell skripta za pokretanje ktlint-a (Linux/Mac)
- `run_ktlint.bat` - Batch skripta za pokretanje ktlint-a (Windows)

## Korišćenje

### Korišćenje skripti (preporučeno)

Priložene skripte koriste Gradle wrapper interno, tako da ne morate da instalirate ktlint odvojeno.

#### Linux/Mac
```bash
# Provera stila koda
./ktlint/run_ktlint.sh --check

# Automatsko ispravljanje stila koda
./ktlint/run_ktlint.sh --format
```

#### Windows
```cmd
# Provera stila koda
ktlint\run_ktlint.bat --check

# Automatsko ispravljanje stila koda
ktlint\run_ktlint.bat --format
```

### Korišćenje Gradle-a

Projekat je konfigurisan da koristi ktlint kao Gradle plugin. Možete pokrenuti:

```bash
# Provera stila koda
./gradlew ktlintCheck

# Automatsko ispravljanje problema sa stilom koda
./gradlew ktlintFormat
```

## IDE Integracija

### IntelliJ IDEA / Android Studio

1. Instalirajte ktlint plugin iz marketplace-a
2. Konfigurišite plugin da koristi ktlint konfiguraciju projekta
3. Omogućite "Reformat code on save" za automatsko formatiranje

### VS Code

1. Instalirajte ktlint ekstenziju
2. Konfigurišite je da koristi ktlint konfiguracioni fajl projekta

## Dodatne Informacije

- [ktlint GitHub](https://github.com/pinterest/ktlint)
- [ktlint Gradle Plugin](https://github.com/JLLeitschuh/ktlint-gradle)