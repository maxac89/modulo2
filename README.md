# 📒 Projecte JAVA + MySQL - Sistema Academico

## Curs e Programació Orientada a Objectes amb Java 2026

### Arnau  y Max


🎯 Descripció

Aplicació realitzada y desenvolupada en JAVA, MYSQL WORKBENCH que permet visualitzar 

Inclou funcionalitats de visualització de dades dinàmiques per pantalla:


🧠 Objectiu del projecte

Aquest projecte té un enfocament informatiu:


Treballant conceptes com:


## 🗂️ Estructura del projecte


---

## ⚙️ Instal·lació

### 1. Configurar entorn


---

### 2. Crear base de dades

Pots fer-ho de l'única forma:

### Opció  — Manual

Crear una base de dades anomenada:

```text
sistema_academico
```

Crear base de dades y taules necessàries important (veure arxiu `empty_script.sql`)
Omplir les taules important (veure arxiu `dummy_script.sql`)

---

## 🔄 Flux de l'aplicació

```text
Filtres → Llistar → Mapa
```

---

## 🧩 Conceptes treballats

* Apache NetBeans v31 (JAVA)
* JPA
* SQL (SELECT, INSERT, UPDATE)
* POO

---


## 🧠 Enfocament pedagògic

Aquest projecte està pensat per a:

```text
entendre com es crea un mapa interactiu i es posa les seves dades en pantalla
```

Utilitza framework:

* Separació estructurada de les dades o fluxos segons llenguatges.
* Reutilització de codi
* Capacitació de manejar moltes dades en BBDD relacionals.
* Javascript UI, per visualitació dinamica de dades

---

# 🧭 Mapa visual del fluxe de l'aplicació

## 🔄 Flux principal

```text
index.php
    ↓
main.php (amb o sense recerca per dia de calendari)
    ↓
[ LLISTAR DADES DE OBJECTES ]
    ↓                    ↓
 Targetes               Map
    ↓                    ↓   
 └──────────────────────────┘
                     ↓
                 prue.js
```

## 🔨 Arxius

* Api.php: Arxiu llançadora que ve donada l'informació des de el arxiu prue.js, per carregar-hi les dades de la BBDD i passar-les a un array temporal, on van a parar tots el resultats dels filtres.
* index.php: Index d'inicialització de la web, es dirigeix al main que executa la web principal.
* main.php: Pàgina principal, on estan definides el meu estil i el de LEAFLET, i tanmateix el contenidor dels resultats i els scripts meu i LEAFLET.
* prue.js: Aquí estan detallades les funcions de toda la lògica de la web, excepte l'API.
* estilos.css: Els pocs estils que he usat.

## 🧠 Qué esdevé a cada pas

### 🔨 Inici

* Carregar la BBDD desde el main.php al prue.js i alla a la funció asíncrona conectarDatosTrastos que agafa les dades de la api.php de la base de dades.
* Les dades a la api es fa amb una consulta `(SELECT)` recorrent les 3 taules.
* Funcionalitat futura: convertir la base de dades a un JSON, per si la base de dades no es pogués recarregar utilitzar l'arxiu JSON o no hi hagués cap backup anterior.

---

### 📋 Filtres i Llistat

* Es mostren totes les dades en pantalla en format de targetes lineals, segons el filtre seleccionat les dades es modifiquen, si els select d'opcions es a TOT i es posa una data d'un dia específic llistarà les dades d'aquell dia picant el boto buscar, si possem altres filtres sense o amb aquest filtre ens donarà l'informació filtrada.
* Si  hi ha dades es mostraran en targetes filtrades, i si cliquem el boto mapa les ubicacions de les dades filtrades
* El mapa interactiu, es veura cada dia amb el seu color, cada ubicació amb les dades de la targeta, horari de recollida i web de Barcelona amb el import del que costa de recollida en un dia no correcte.

---

## 🗂️ Com encaixa l'estructura

```text
/css
    → estils

/js
    → prue.js (Aquí es fa quasi tot)

/data
    → trastos.sql (Base de dades a importar)

Arrel
    → api.sql (conexió a la BD des de el JS)

```

---

## 🧠 Idea clau

```text
Tot es fa directament des de on vull jo
```

---
