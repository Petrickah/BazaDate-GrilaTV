# GrilaTV

## Overview

Relational database design project for the Databases & DBMS (Database
Management Systems) university course, first built in 2020 and later
renormalized and redocumented across two semester iterations. The full
write-up (both modules) is in `Proiect Baze de date.docx`; current
documentation is Module 2.

## Setup

Three Docker containers, defined in `GrilaTV-docker/docker-compose.yml`:

- `GrilaTV-docker/php/` — Dockerfile for the PHP container.
- `GrilaTV-docker/mysql/` — Dockerfile for the MySQL container, plus two
  SQL exports:
  - `grilatv.sql` — the original semester-1 PhpMyAdmin export (used by
    chapter 4 of the documentation).
  - `grilatv-normalizata.sql` — the hand-written PhpMyAdmin export of the
    normalized database (chapter 5 of the documentation).
- `GrilaTV-docker/apache/` — Dockerfile plus `grilatv.apache.conf`. No
  virtual host is required; WAMP files can be moved aside temporarily so the
  project serves directly from `http://localhost`.

## Usage

`GrilaTV-docker/public_html/` holds the PHP entry points (`index.php`,
`persoane.php`, `posturi.php`, `emisiuni.php`, `oferta.php`, `abonat.php`,
`adauga/`) served at the Apache root.
