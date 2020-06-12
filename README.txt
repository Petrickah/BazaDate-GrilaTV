Proiect realizat de Petre Tiberiu pentru cursul de Baze de date si Sisteme de Gestiune a Bazelor de Date.
Documentație: fișierul Word "Proiect Baze de date.docx"
- Acest fișier word conține două module:
    - Primul Modul este documentația proiectului de pe semestrul întâi
    - Al doilea Modul este documentația proiectului de pe semestrul al doilea
- Documentația curentă se găseste în word la Modulul al doilea

docker-compose.yml: fișier yml ce descrie modul de construire a trei containere Docker
public_html: fișierele PHP ce trebuiesc mutate în root pe serverul apache (din wamp)
php: folder ce conține un Dockerfile ce descrie construcția unui container php Docker
mysql: conține trei fișiere
- Dockerfile: descrie modul de construire a unui container mysql Docker
- export-original.sql: exportul original PhpMyAdmin al bazei de date de pe semestrul 1
    - subiectul 4 (cap 4) din documentație se folosește de acea bază de date (cea de pe sem 1)
- grilatv.sql: exportul (scris de mână) pentru PhpMyAdmin al bazei de date normalizate (sub./cap. 5 din documentație)
apache: conține două fișiere ce împreună descriu modul de realizare a unui container Docker.
- nu este necesară realizarea a unui host virtual (folosirea fișierului de configurație grilatv.apache.conf)
- pot fi salvate fisierele wamp în altă parte (temporar) și mutate fișierele proiectului în root.
- este necesar ca aceste fișiere să pot fi accesate direct prin adresa web http://localhost
