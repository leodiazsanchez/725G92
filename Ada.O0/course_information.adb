with Ada.Text_IO;			use Ada.Text_IO;

procedure Course_Information is
   
begin
  Put_Line("Placera ett X inuti den/de ""[ ]"" som motsvarar rätt alternativ");
  Put_Line("om inte annat anges.");
  New_Line;
  
  Put_Line("Vad är de tre huvudsyftena med kursen?");
  Put_Line("  [ ] Programmering, programspråket Ada, problemlösning");
  Put_Line("  [X] Problemlösning, programmering, genomtänkt programkod");
  Put_Line("  [ ] Programspråket Ada, minimera program, smarta lösningar");
  Put_Line("  [ ] Problemlösning, smarta lösningar, programspråket Ada");
  Put_Line("  [ ] Programmering, smarta lösningar, minimera lösningar");
  New_Line;
  
  Put_Line("Vilka av dessa verktyg använder studenterna inom kursens ramar?");
  Put_Line("  [X] Emacs");
  Put_Line("  [X] gnatmake");
  Put_Line("  [X] Ada");
  Put_Line("  [X] SC");
  Put_Line("  [X] ThinLinc");
  Put_Line("  [X] Zoom");
  Put_Line("  [ ] Teams");
  Put_Line("  [X] Mail");
  Put_Line("  [ ] Lisam");
  Put_Line("  [X] Terminal");
  Put_Line("  [X] Kurshemsidor");
  New_Line;
  
  Put_Line("Var hittar jag information om vilka uppgifter som ingår i kursen?");
  Put_Line("  [ ] I Lisam via Studieinfo");
  Put_Line("  [X] På kurshemsidan via Kurskartan");
  Put_Line("  [ ] I mail från assistenten");
  Put_Line("  [ ] På kurshemsidan via Kursens Zoom-rum");
  New_Line;
  
  Put_Line("Vem skall jag kontakta om jag har problem med ThinLinc och Zoom?");
  Put_Line("  [ ] Examinator");
  Put_Line("  [ ] Assistenten jag har tilldelad");
  Put_Line("  [X] Helpdesk");
  Put_Line("  [ ] Kursadministratören");
  Put_Line("Information om detta finns under ""Kontakter"" på hemsidan.");
  New_Line;
  
  Put_Line("Vem skall jag kontakta om jag har problem med SC generellt sett?");
  Put_Line("  [ ] Examinator eller kursledaren");
  Put_Line("  [X] Assistenten jag har tilldelad");
  Put_Line("  [ ] Helpdesk");
  Put_Line("  [ ] Kursadministratören");
  New_Line;
  
  Put_Line("Vem skall jag kontakta om jag har problem med SC under en P-dugga?");
  Put_Line("  [X] Examinator eller kursledaren");
  Put_Line("  [ ] Assistenten jag har tilldelad");
  Put_Line("  [ ] Helpdesk");
  Put_Line("  [ ] Kursadministratören");
  New_Line;
  
  Put_Line("Vem skall jag kontakta om jag har problem med programmeringen?");
  Put_Line("  [ ] Examinator");
  Put_Line("  [X] Assistenten jag har tilldelad");
  Put_Line("  [ ] Alla assistenter");
  Put_Line("  [ ] Helpdesk");
  Put_Line("  [ ] Kursadministratören");
  New_Line;
  
  Put_Line("Vilka LADOK-moment måste jag klara av för att få kursen godkänd?");
  Put_Line("  [ ] Det räcker med tentan");
  Put_Line("  [ ] Det räcker med ""labserien""");
  Put_Line("  [X] Alla!");
  New_Line;
  
  Put_Line("Hur blir man klar med ""labserien""?");
  Put_Line("  [X] Man gör ALLA obligatoriska O-uppgifterna");
  Put_Line("  [ ] Man behöver bara göra en del av O-uppgifterna");
  Put_Line("  [ ] Man måste göra ALLA O- och P-uppgifter");
  Put_Line("  [ ] Det räcker att göra P-uppgifterna");
  Put_Line("  [ ] Det räcker att hitta ""en smart väg"" i kurskartan som leder");
  Put_Line("      till LAB i LADOK och endast få godkänt på dessa");
  New_Line;
  
  Put_Line("Kan jag ÖVA på vilken uppgift som helst när som helst?");
  Put_Line("  [X] Ja");
  Put_Line("  [ ] Nej");
  New_Line;
  
  Put_Line("Kan jag SKICKA IN vilken uppgift som helst när som helst?");
  Put_Line("  [ ] Ja");
  Put_Line("  [X] Nej");
  New_Line;
  
  Put_Line("Hur vet jag vilken/vilka uppgifter som går att ""skicka in"" för");
  Put_Line("""bedömning"" just nu?");
  Put_Line("  [X] Man ser på färgen på uppgifterna i kurskartan");
  Put_Line("  [ ] Det står att just denna uppgift är ""upplåst""");
  Put_Line("  [ ] Det finns ingen sådan information");
  New_Line;
  
  Put_Line("Vilken färg representerar vad i kurskartan?");
  Put_Line("De färger som finns i kurskarta är:");
  Put_Line("  0 - Svart");
  Put_Line("  1 - Mörkgrå");
  Put_Line("  2 - Ljusgrå");
  Put_Line("  3 - Mörkgrön");
  Put_Line("  4 - Ljusgrön");
  Put_Line("  5 - Mörkorange");
  Put_Line("  6 - Ljusorange");
  Put_Line("  7 - Gul");
  Put_Line("  8 - Ljusblå");
  Put_Line("  9 - Vit");
  Put_Line("Markera med ""siffran"" i ""[ ]"" för respektive alternativ.");
  Put_Line("  [7] ""Upplåst"" ej inskickad uppgift");
  Put_Line("  [2] ""Upplåst"" för övning och tillgång till automaträttning,");
  Put_Line("      men inte med tillgång till assistenträttning");
  Put_Line("  [6] Inskickad uppgift som inte var helt ok i automaträttningen");
  Put_Line("  [8] Inskickad uppgift som blivit övningsgodkänd av automat-");
  Put_Line("      rättningen, men som inte kommer att rättas av assistent");
  Put_Line("  [4] Inskickad uppgift som blivit godkänd av automaträttningen,");
  Put_Line("  [5] Rättad uppgift (av assistent) som behöver kompletteras");
  Put_Line("  [3] Rättad uppgift (av assistent) som är godkänd");
  Put_Line("  [1] Ännu inte ""upplåst"" uppgift");
  Put_Line("  [9] Information som inte är en specifik uppgift");
  Put_Line("  [0] Special som kan bero på innehållet i just den ""rutan""");
  New_Line;
  
  Put_Line("Hur arbetar jag hemifrån?");
  Put_Line("  [X] Via ThinLinc");
  Put_Line("  [X] Via SSH (som reservalternativ)");
  New_Line;
  
  Put_Line("Hur skickar jag in mina uppgifter?");
  Put_Line("  [X] Via SC ""inuti"" ThinLinc (hemifrån)");
  Put_Line("  [X] Via SC ""via"" SSH (hemifrån)");
  Put_Line("  [X] Via SC ""via"" en vanlig terminal i våra ""labsalar""");
  New_Line;
  
  Put_Line("Hur får jag respons från automaträttning och assistenträttning?");
  Put_Line("  [X] Via Mail");
  Put_Line("  [X] Du ser att färger ändras i kurskartan");
  Put_Line("  [ ] Assistenten ringer upp dig och talar om resultatet");
  New_Line;
  
  Put_Line("Vad händer om jag inte får godkänt på en inskickad O-uppgift?");
  Put_Line("  [X] Inte mer än att du får tips om hur du skall titta vidare på");
  Put_Line("      uppgiften för att sen skicka in den igen");
  Put_Line("  [X] Det är inget konstigt att få komplettering. Det är ett sätt");
  Put_Line("      för oss att kunna ge dig respons och för att du skall kunna");
  Put_Line("      få en chans att lära dig mer om det som ingår i uppgifterna");
  Put_Line("  [ ] Du blir underkänd på kursen direkt");
  New_Line;
  
  Put_Line("Vad händer om jag inte får godkänt på en inskickad P-uppgift?");
  Put_Line("  [ ] Samma som för O-uppgifterna");
  Put_Line("  [X] Samma som för O-uppgifterna, men om tiden för P-passet tagit");
  Put_Line("      slut får man komma tillbaka på nästa P-pass och göra en ny");
  Put_Line("      uppgift (detta är examination och ger betyg på ""tentan"")");
  Put_Line("  [ ] Du blir underkänd på kursen direkt");
  New_Line;
  
  Put_Line("Denna uppgift är den första att skicka in för automaträttning.");
  Put_Line("För att du ""garanterat"" skall få se ett mail som ger dig ett");
  Put_Line("""kompletteringsmeddelande"" behöver du därför skriva in det");
  Put_Line("hemliga lösenordet (som du ju inte vet just nu och därför blir");
  Put_Line("det ju ""fel"" första gången.)");
  Put_Line("Skriv in det hemliga lösenordet här: [Programmering är KUL]");
end Course_Information;
