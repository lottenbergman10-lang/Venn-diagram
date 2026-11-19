# Venn-diagram

En Mac-app för att skapa svartvita Venn-diagram med tre överlappande cirklar och egen text i sju områden.

Appen byggs med Swift och SwiftUI. Fyll i områdena A–F och K och klicka på **Visa diagram**. Diagrammet ritas med svarta konturer och svart text på vit bakgrund. När diagrammet visas slår ändringar i textfälten igenom direkt.

## Områden

Bokstäverna följer placeringen i det ursprungliga personexemplet.

| Område | Placering | Förifylld text |
| --- | --- | --- |
| A | Enbart vänstra cirkeln | gåta |
| B | Enbart högra cirkeln | let-tråd |
| C | Enbart nedre cirkeln | läktaren |
| D | Vänstra och högra, ovanför mitten | blåsippa |
| E | Vänstra och nedre, till vänster om mitten | Skebokvarnsvägen |
| F | Högra och nedre, till höger om mitten | Dan Brown |
| K | Gemensamt för alla tre cirklarna | Schubert |

Bokstäverna används som fältnamn i sidopanelen. I diagrammet visas områdenas texter. Egna ändringar gäller i det aktuella fönstret och återgår till de förifyllda värdena vid nästa appstart.

## Kör appen

1. Öppna `VennDiagram.xcodeproj` i Xcode.
2. Välj schemat **VennDiagram** och destinationen **My Mac**.
3. Klicka på körknappen eller tryck på **⌘R**.
4. Ändra texten i önskade områden och klicka på **Visa diagram**.

Appen kräver macOS 14 eller senare. Varje område rymmer upp till tre rader i diagrammet. Långa texter får mindre textstorlek och kan kortas visuellt om hela innehållet inte ryms.

Projektet använder lokal ad hoc-signering för provkörning på den egna datorn.
