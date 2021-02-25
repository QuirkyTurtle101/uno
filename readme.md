# Beskrivelse af kortspillet 
Kortspillets skal kunne virker på nogenlunde den samme måde some uno fungere, man skal kunne spiller og trække kort. Vi skal have de forskellige slags kort med i spillet som uno gør brug af, som f.eks. +2 og wildcard.

# Krav
Man skal kunne trække og lægge kort efter uno reglerne(rød kan kun lægges på rød osv.) 
Man skal kunne vælge antal spiller
En pop up besked til at skifte til næste spiller
Pop up pause menu når man er “in game” 
Pop up besked når man har vundet "winner!"

# Designspecifikationer
Desværre var vi forhindrede i at implementere grafik til spillet grundet tekniske og tidsmessige problemer, men vi har dog mockups til vores design.
## Forside
![Start screen](https://github.com/QuirkyTurtle101/uno/blob/main/asset/The_real_start_screec.png)
Her er hvordan forsiden på spillet skulle se ud. Hvert kort er en knap man kan trykke på. Det burde være ret tydeligt at se hvad knap der gør hvad.

## Indstillinger
![Settings](https://github.com/QuirkyTurtle101/uno/blob/main/asset/No_both.png)
Her er hvordan settings menuen er. Lige nu er der kun musik og FX sounds indstillinger men man kunne forestille sig at tilføje flere settings hvis nødvendigt

## Vælg antal spillere
![Player select](https://github.com/QuirkyTurtle101/uno/blob/main/asset/Player_slecet.png)
Det her hvor man vælger hvor mange spillere der skal være med. Hvert kort er igen en knap man kan trykke på

## Spillefladen
![Gameplay](https://github.com/QuirkyTurtle101/uno/blob/main/asset/2_player_game.png)
Dette er vores prototype på hvordan spillefladen skulle se ud. I bunden er der de kort du kan spille og i midten er der de kort der er blevet spillet og de kort du kan trække. I venstre øverste hjørne er der en pause knap og i højre øverste hjørne kan man se hvis tur det er. 

## Pausemenuen
![Pause menu](https://github.com/QuirkyTurtle101/uno/blob/main/asset/2_player_game_with_menu_1.png)
Her er pause menuen. Her kan vi se en knap til at gå ud af spillet, en knap til at fortsætte spillet og en knap til at se indstillingerne for spillet. 

# Tekniske specifikationer
## Klassediagram
![Class diagram](https://github.com/QuirkyTurtle101/uno/blob/main/asset/2_player_game_with_menu_1.png)
