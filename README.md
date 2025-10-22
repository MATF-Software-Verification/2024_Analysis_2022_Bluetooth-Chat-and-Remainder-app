# 2024 Analiza - 2022 Bluetooth Chat and Reminder App

Bluetooth chat and reminder app je Android aplikacija razvijena u okviru studentskog projekta na kursu Programske paradigme, na Matematičkom fakultetu, Univerziteta u Beogradu.  
Aplikacija je namenjena za dopisivanje korišćenjem Bluetootha, a pored toga korisnici imaju
mogućnost da dodaju i podsetnike za svoje dnevne aktivnosti. Za razvoj je korišćen programski jezik Kotlin u okviru okruženja Android Studio.  
Cilj analize ovog projekta je da se primenom različitih alata za verifikaciju i testiranje utvrde slabosti sistema, potencijalni bagovi i mogućnosti za unapređenje. Fokus je na proveri stabilnosti i pouzdanosti koda kroz statičku i dinamičku analizu, čime se dobija uvid u ponašanje aplikacije u različitim uslovima.

Autor: Marija Marković 1011/2023

## Alati i Analiza

### 1. ktlint - Provera stila koda
- **Svrha**: Primenjuje Kotlin standarde formatiranja koda
- **Konfiguracija**: `ktlint/ktlint.yml` i `.editorconfig`
- **Korišćenje**: 
  `./ktlint/run_ktlint.sh --check` ili `./ktlint/run_ktlint.sh --format`
- **Dokumentacija**: [ktlint/README.md](ktlint/README.md)

### 2. detekt - Statička analiza Koda
- **Svrha**: Identifikuje probleme sa kvalitetom
koda, kompleksnošću, čitljivošću.
- **Konfiguracija**: `config/detekt/detekt.yml`
- **Korišćenje**: 
   `./detekt/run_detekt.sh` ili `cd 2022_Bluetooth-Chat-and-Remainder-app && ./gradlew detekt`
- **Dokumentacija**: [detekt/README.md](detekt/README.md)

### 3. Jacoco - Pokrivenost Koda
- **Svrha**: Meri pokrivenost koda za unit i Android testove
- **Konfiguracija**: `app/build.gradle`
- **Korišćenje**: 
  `./jacoco/run_jacoco.sh --unit` ili `./jacoco/run_jacoco.sh --android`
- **Dokumentacija**: [jacoco/README.md](jacoco/README.md)

### 4. Testiranje
**Važna napomena**: Struktura projekta onemogućava kvalitetno testiranje. U dokumentu Analysis_summary.pdf navedeni su problemi kao i sugestije kako se oni mogu otkloniti kako bi se poboljšao kvalitet projekta, a uz to i njegova testabilnost.

## Pokretanje alata

### Preduslovi
- Android Studio
- Gradle
- Android SDK
- Java 8+

### Pokretanje Alata za Analizu

#### Opcija 1: Direktno korišćenje Gradle-a
1. **Provera Stilova Koda**:
   ```bash
   cd 2022_Bluetooth-Chat-and-Remainder-app
   ./gradlew ktlintCheck
   ```

2. **Statička Analiza**:
   ```bash
   cd 2022_Bluetooth-Chat-and-Remainder-app
   ./gradlew detekt
   ```

3. **Pokrivenost Koda**:
   ```bash
   cd 2022_Bluetooth-Chat-and-Remainder-app
   ./gradlew jacocoAndroidTestReport
   ```

4. **Pokretanje Testova**:
   ```bash
   cd 2022_Bluetooth-Chat-and-Remainder-app
   ./gradlew connectedDebugAndroidTest
   ```

## Rezultati Analize

Detaljni rezultati analize se nalaze u odgovarajućim direktorijumima:
- **ktlint**: `ktlint/reports/` - Izveštaji o stilovima koda
- **detekt**: `detekt/build/reports/detekt/` 
- Izveštaji o problemima u kodu:  
Detaljniji rezultati analize mogu se naći u [Analysis_summary](Analysis_summary.pdf)


## Zaključak

Analiza projekta je pokazala da aplikacija ima značajne nedostatke u arhitekturi, kvalitetu koda i rukovanju resursima. Nedostatak centralizovane logike, loša separacija slojeva, nepotpuna validacija unosa, problemi sa curenjem memorije i nedostatak lokalnog čuvanja
podataka ukazuju na potencijalne rizike po stabilnost i pouzdanost aplikacije.  
Poseban problem predstavlja testiranje: zbog čvrste povezanosti logike sa Android framework-om, neadekvatnog integrisanja autentikacije i direktnog korišćenja Bluetooth funkcionalnosti,
praktično je nemoguće automatizovano testirati ključne delove aplikacije.  
Da bi testiranje postalo izvodljivo, potrebno je uvesti jasnu arhitekturu, dependency injection, interfejse za testabilne komponente i mehanizme za izolaciju resursa.  
Na osnovu svega navedenog zaključujemo da trenutna implementacija ozbiljno otežava održavanje, proširivanje i proveru ispravnosti aplikacije, te zahteva značajne izmene kako bi se omogućilo stabilno i pouzdano korišćenje, kao i efikasno testiranje.
