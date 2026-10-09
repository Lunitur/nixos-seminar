---
layout: default
title: Deklarativni operacijski sustavi
permalink: /
---

# Deklarativni operacijski sustavi

[Prezentacija]({{ '/prezentacija.pdf' | relative_url }}) · [Izvori](#izvori) · [Dodatak](#dodatak)

*Da ne dupliciram prezentaciju, ova je stranica napisana kao suplementarni kratki esej koji istražuje društvenu stranu deklarativnih operacijskih sustava.*

Deklarativni operacijski sustavi dugo su vremena bili niša, no u posljednjih nekoliko godina događa se nagli prevrat, pri čemu polako, ali sigurno prodiru u *mainstream*. Koncept iza deklarativnih operacijskih sustava sam po sebi je jednostavan — zapiši kako želiš da stvari izgledaju i predaj sustavu da ti to materijalizira. [1](https://nixos.org/~eelco/pubs/nixos-jfp-final.pdf) Iako jednostavan, taj je koncept u softverskoj zajednici dosta polarizirajući. Većina se ljudi ili kune da je revolucionaran po pitanju arhitekture operacijskih sustava i distribucije softvera ili vidi smor u tome.

Ono što je greška jest ići raditi analizu same tehnologije i onda pokušati zaključiti njezinu vrijednost. U tu zamku vrlo često upadaju prirodoslovci jer im često fali ono malo poznavanja društvenih znanosti. Gornje mogu i vrlo jednostavno opravdati kratkim povijesnim primjerom: preteča parnog stroja bila je poznata još u antici, no naravno nije izazvala nikakvu industrijsku revoluciju. [2](https://collection.sciencemuseumgroup.org.uk/objects/co50879/working-model-of-heros-aeolipile) Vidim dva bitna razloga zašto se to nije dogodilo i oba su sociološke prirode. Prvi je da je ekonomija bila orijentirana oko robovlasništva, pa sam stroj koji nešto automatizira nije bio od nekakve posebne društvene važnosti. Drugi je da sam koncept napretka — da se svijet može mijenjati ili, još bolje, napredovati — nije oduvijek bio nešto što se podrazumijevalo.

Taj isti uzorak možemo vidjeti i ovdje. Kako se moderno računarstvo razvilo velikim dijelom pod utjecajem tržišne ekonomije, možemo vidjeti velik odraz toga u njemu. *Enshittification* je upravo jedan od tih efekata čiji se naziv popularizirao u novije vrijeme, no to je samo nastavak jako dugog trenda koji je već bio prisutan. [4](https://pluralistic.net/2023/01/21/potemkin-ai/) Naime, još u drugoj polovici 20. stoljeća možemo vidjeti fragmentaciju i stvaranje „walled garden” ekosustava, primjerice kroz međusobno nekompatibilne varijante UNIX-a. [3](https://www.unix.org/unix_history.html) Kako kaže R. Stallman: [5](https://www.gnu.org/gnu/manifesto.en.html)

> “Software sellers want to divide the users and conquer them, making each user agree not to share with others.”

Ako uzmemo još u obzir očitu činjenicu da su sustavi zatvorenog koda imali motiv optimizirati distribuciju softvera zatvorenog koda, sam dizajn npr. Windows OS-a i njegova nedavna degeneracija postaju vrlo smisleni. Iako su Windowsi očit primjer, postoji još jedan manje očit i daleko noviji primjer — Android. Dapače, za Android se čak može tvrditi da je djelomično otvorenog koda zahvaljujući AOSP-u, [6](https://source.android.com/docs/setup/about) no ako ga se pogleda pod mikroskopom, može se vidjeti planirano zatvaranje OS-a u korist stvaranja Googleova „walled garden” ekosustava. Dva su glavna indikatora upravo otežavanje instalacije softvera izvan Google Playa te stvaranje zasebnog sloja usluga kroz Google Play services koji nije dio AOSP-a. Njegovi su API-ji javno dokumentirani, ali se oslanjaju na Googleovu komponentu. [7](https://developers.google.com/android/guides/overview) [8](https://developer.android.com/developer-verification)

Kakve to veze ima s deklarativnim operacijskim sustavima? To da deklarativni operacijski sustavi pogađaju upravo one točke koje tehnološki divovi žele najviše izbjeći. Prvo, omogućavaju radikalnu promjenu softvera na korisnikovu uređaju po njegovoj volji, uz mogućnost povratka na prethodnu konfiguraciju. [1](https://nixos.org/~eelco/pubs/nixos-jfp-final.pdf) Drugo, omogućavaju radikalno veću suradnju i dijeljenje: npr. cijela jedna zajednička konfiguracija sustava može se svesti na jednu liniju uvoza u korisnikovoj konfiguraciji. [9](https://nixos.org/manual/nixos/stable/#sec-configuration-syntax) Da je Windows deklarativan i dopuštao takvu promjenu, ljudi bi mogli isključiti cijeli Copilot ekosustav jednom linijom! Prednosti su ogromne već na stolnim računalima, no na mobilnim uređajima bile bi drastično veće jer su mobilne platforme daleko više zatvorene.

To sam potvrdio ovog ljeta pokušajem pokretanja NixOS-a na svojem starom mobilnom uređaju. Da sam uspio popraviti *uplink* u pozivima, vjerojatno bih ga koristio kao glavni uređaj, no i bez toga prednosti deklarativnog OS-a bile su očite već i u procesu samog prebacivanja (engl. *porting*). Najznačajnija je opaska bila da je prvo trebalo razviti UEFI pokretač (engl. *bootloader*) da bi projekt uopće imao smisla. Zašto je to bilo potrebno? Jer je proizvođačev pokretač na tom uređaju bio zatvorenog koda i znatno ograničen po pitanju toga što želi pokrenuti, pa imati nešto poput GRUB-a nije bilo moguće bez dodatnog rada na lancu pokretanja. Androidova dokumentacija opisuje upravo takvu ulogu proizvođačeva pokretača: učitavanje jezgre i provjeru slika sustava. [10](https://source.android.com/docs/core/architecture/bootloader)

Da se vratimo na prvobitnu tvrdnju — socijalni faktori itekako utječu na mnoge stvari, uključujući i OS te način na koji pakiramo i distribuiramo softver. U svijetu koji postaje sve hostilniji prema krajnjem korisniku — deklarativni sustavi time postaju više od zabavnog trika, postaju društvena potreba.

## Izvori

1. [Eelco Dolstra, Andres Löh i Nicolas Pierron — *NixOS: A Purely Functional Linux Distribution* (2010.)](https://nixos.org/~eelco/pubs/nixos-jfp-final.pdf). Rad o modelu konfiguriranja, izgradnji i nadogradnji NixOS-a.
2. [Science Museum Group — *Working model of Hero’s Aeolipile*](https://collection.sciencemuseumgroup.org.uk/objects/co50879/working-model-of-heros-aeolipile). Povijesni kontekst Heronova uređaja pogonjenog parom.
3. [The Open Group — *History of UNIX*](https://www.unix.org/unix_history.html). Odjeljci *A Fragmented Landscape* i *The UNIX Wars* opisuju fragmentaciju i suparništvo proizvođača.
4. [Cory Doctorow — *Tiktok’s enshittification* (2023.)](https://pluralistic.net/2023/01/21/potemkin-ai/). Izvor autorova opisa postupnog pogoršavanja platformi i vezivanja korisnika uz njih.
5. [Richard Stallman — *The GNU Manifesto* (1985.)](https://www.gnu.org/gnu/manifesto.en.html). Izvor citata, iz odjeljka *Why I Must Write GNU*, i kritike ograničavanja dijeljenja softvera.
6. [Android Open Source Project — *AOSP overview*](https://source.android.com/docs/setup/about). Opis otvorene osnove Androida.
7. [Google — *Overview of Google Play services*](https://developers.google.com/android/guides/overview). Opis zasebnih usluga i API-ja koje aplikacije koriste.
8. [Google — *Android developer verification*](https://developer.android.com/developer-verification) i [*Balancing openness and choice with safety* (2026.)](https://android-developers.googleblog.com/2026/03/android-developer-verification.html). Opseg, raspored i dodatni postupak instalacije aplikacija neprovjerenih autora.
9. [NixOS — *NixOS Manual*, sintaksa konfiguracije](https://nixos.org/manual/nixos/stable/#sec-configuration-syntax). Primjeri deklarativnih postavki i sastavljanja konfiguracije iz modula.
10. [Android Open Source Project — *Bootloader overview*](https://source.android.com/docs/core/architecture/bootloader). Uloge pokretača u Androidovu lancu pokretanja.

## Dodatak

Korisne poveznice za učenje, podešavanje sustava i razvojna okruženja:

- [Home Manager](https://nix-community.github.io/home-manager/) — deklarativno upravljanje korisničkim okruženjem: paketima, postavkama programa i konfiguracijskim datotekama. Može se koristiti uz NixOS ili zasebno uz Nix.
- [NixOS & Flakes Book](https://nixos-and-flakes.thiscute.world/) — vodič zajednice za konfiguriranje NixOS-a, korištenje datoteka `flake.nix` i `flake.lock` te povezivanje s Home Managerom. Za službeno objašnjenje koncepta pogledaj [nix.dev: Flakes](https://nix.dev/concepts/flakes).
- [nix.dev — vodiči za Nix](https://nix.dev/tutorials/) — službeni materijali za prve korake, osnove jezika Nix, razvojna okruženja i pakiranje softvera.
- [Pretraživanje paketa u Nixpkgsu](https://search.nixos.org/packages) — tražilica paketa s opisima, verzijama i nazivima atributa za korištenje u konfiguraciji.
- [Pretraživanje opcija NixOS-a](https://search.nixos.org/options) — tražilica postavki sustava s opisima, tipovima, zadanim vrijednostima i primjerima.
- [Nixpkgs Multiverse](https://nixmultiverse.com/) — pretraživanje povijesnih verzija paketa i pristup njima kroz jedan flake ulaz. [Repozitorij projekta](https://github.com/fzakaria/nixpkgs-multiverse) objašnjava korištenje i ograničenja dostupnosti starih paketa.
- [Nixpkgs](https://github.com/NixOS/nixpkgs) — repozitorij definicija paketa i modula NixOS-a; koristan za pregled načina na koji su paketi izgrađeni te za vlastite izmjene i doprinose.
- [Predlošci razvojnih okruženja](https://github.com/the-nix-way/dev-templates) — zbirka predložaka `flake.nix` za Rust, Python, Node.js i druge jezike. Za klasični `shell.nix` pogledaj [vodič na nix.dev](https://nix.dev/tutorials/first-steps/declarative-shell.html).
- [NixOS priručnik](https://nixos.org/manual/nixos/stable/) — službene upute za instalaciju, konfiguraciju, nadogradnje i povratak na prethodnu konfiguraciju sustava.
- [Vimjoyer na YouTubeu](https://www.youtube.com/@vimjoyer) — videovodiči s praktičnim primjerima, savjetima i trikovima za Nix, NixOS i Home Manager.
