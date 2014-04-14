--CREATE DATABASE '/Users/villu/Documents/YLIKOOL/ANDMEBAASID/ryhmat66/eecomp.db' LOG ON 'eecomp.log' COLLATION 'UTF8BIN' NCHAR COLLATION 'UTF8BIN' JCONNECT OFF SYSTEM PROCEDURE AS DEFINER ON;
-- "UID=DBA;PWD=sql;Server=eecomp;START=eecomp;DBN=eecomp;DBF=/Users/villu/Documents/YLIKOOL/ANDMEBAASID/ryhmat66/eecomp.db"
--loon tabelite nimed mitmuses
create table if not exists komponendid(
  id integer not null default autoincrement primary key,
  nimi varchar(100) not null unique,
  pikkus integer,
  laius integer,
  korgus integer
);

create table if not exists asukohad(
  id integer not null default autoincrement primary key,
  nimi varchar(100) not null unique,
  url varchar(5000),
  telefon varchar(100),
  aadress varchar(5000),
  min_tarne_hind decimal(10,2),
  tarne_hind decimal(10,2)
);


--teha võimatuks lisada samale asukohale samale komponendile ridu
create table if not exists saadavused(
  id integer not null default autoincrement primary key,
  asukoha_id integer not null unique,
  komponendi_id integer not null unique,
  laoseis integer not null unique,
  laoseisu_fikseerimise_aeg datetime not null default current timestamp, 
  hindx1 decimal(10,2),
  hindx10 decimal(10,2),
  hindx100 decimal(10,2),
  hindx1000 decimal(10,2)
);

create table if not exists projektid(
  id integer not null default autoincrement primary key,
  nimi varchar(100) not null unique,
  alguse_aeg datetime not null,
  lopu_aeg datetime not null,
  ajakulu integer,
  eelarve decimal(10,2)
);


create table if not exists komponentide_kuuluvused_projektidesse(
  id integer not null default autoincrement primary key,
  komponendi_id integer not null,
  projekti_id integer not null,
  tootab bit not null default 1
);


create table if not exists projektide_nouded_komponentidele(
  id integer not null default autoincrement primary key,
  komponendi_id integer not null,
  projekti_id integer not null,
  kogus integer
);


alter table projektide_nouded_komponentidele add constraint fk_projektide_nouded_komponentidele_2_komponendid foreign key(komponendi_id) references komponendid(id) on delete restrict on update cascade;
alter table projektide_nouded_komponentidele add constraint fk_projektide_nouded_komponentidele_2_projektid foreign key(projekti_id) references projektid(id) on delete restrict on update cascade;

alter table komponentide_kuuluvused_projektidesse add constraint fk_komponentide_kuuluvused_projektidesse_2_komponendid foreign key(komponendi_id) references komponendid(id) on delete restrict on update cascade;
alter table komponentide_kuuluvused_projektidesse add constraint fk_komponentide_kuuluvused_projektidesse_2_projektid foreign key(projekti_id) references projektid(id) on delete restrict on update cascade;


alter table saadavused add constraint fk_saadavused_2_komponendid foreign key(komponendi_id) references komponendid(id) on delete restrict on update cascade;
alter table saadavused add constraint fk_saadavused_2_asukohad foreign key(asukoha_id) references asukohad(id) on delete restrict on update cascade;


INSERT INTO komponendid(nimi) VALUES ('R 100'); 
INSERT INTO komponendid(nimi) VALUES ('R 330'); 
INSERT INTO komponendid(nimi) VALUES ('R 560'); 
INSERT INTO komponendid(nimi) VALUES ('R 1k'); 
INSERT INTO komponendid(nimi) VALUES ('R 3.3k'); 
INSERT INTO komponendid(nimi) VALUES ('R 5.6k'); 
INSERT INTO komponendid(nimi) VALUES ('R 10k'); 
INSERT INTO komponendid(nimi) VALUES ('R 33k'); 
INSERT INTO komponendid(nimi) VALUES ('R 56k'); 
INSERT INTO komponendid(nimi) VALUES ('R 100k'); 
INSERT INTO komponendid(nimi) VALUES ('R 330k'); 
INSERT INTO komponendid(nimi) VALUES ('R 560k'); 
INSERT INTO komponendid(nimi) VALUES ('R 1M'); 
INSERT INTO komponendid(nimi) VALUES ('R 3.3M'); 
INSERT INTO komponendid(nimi) VALUES ('R 5.6M'); 
INSERT INTO komponendid(nimi) VALUES ('R 10M'); 
INSERT INTO komponendid(nimi) VALUES ('R 33M'); 
INSERT INTO komponendid(nimi) VALUES ('R 56M'); 
INSERT INTO komponendid(nimi) VALUES ('R 100M'); 
INSERT INTO komponendid(nimi) VALUES ('C 1uF'); 
INSERT INTO komponendid(nimi) VALUES ('C 10uF'); 
INSERT INTO komponendid(nimi) VALUES ('C 100uF'); 
INSERT INTO komponendid(nimi) VALUES ('C 1000uF'); 
INSERT INTO komponendid(nimi) VALUES ('C 100nF'); 
INSERT INTO komponendid(nimi) VALUES ('C 22pF'); 
INSERT INTO komponendid(nimi) VALUES ('LED kollane'); 
INSERT INTO komponendid(nimi) VALUES ('LED punane'); 
INSERT INTO komponendid(nimi) VALUES ('LED sinine'); 
INSERT INTO komponendid(nimi) VALUES ('LED roheline'); 
INSERT INTO komponendid(nimi) VALUES ('LED valge'); 
INSERT INTO komponendid(nimi) VALUES ('IC NE555'); 
INSERT INTO komponendid(nimi) VALUES ('IC LM324'); 
INSERT INTO komponendid(nimi) VALUES ('IC LM393'); 
INSERT INTO komponendid(nimi) VALUES ('PIC16F876A'); 
INSERT INTO komponendid(nimi) VALUES ('Atmega324P'); 
INSERT INTO komponendid(nimi) VALUES ('Lüliti'); 
INSERT INTO komponendid(nimi) VALUES ('Galvaanielement 3V'); 
INSERT INTO komponendid(nimi) VALUES ('Galvaanielement 1.5V'); 
INSERT INTO komponendid(nimi) VALUES ('CAT5e juhe 1meeter'); 


INSERT INTO asukohad(nimi) VALUES ('Farnell'); 
INSERT INTO asukohad(nimi) VALUES ('Texas Instruments'); 
INSERT INTO asukohad(nimi) VALUES ('Microchip'); 
INSERT INTO asukohad(nimi) VALUES ('Oomipood'); 
INSERT INTO asukohad(nimi) VALUES ('Sahtel kodus'); 

--select id from komponendid where nimi = 'R 100'

INSERT INTO saadavused(asukoha_id,komponendi_id,laoseis) VALUES ((select id from asukohad where nimi = 'Farnell'),(select id from komponendid where nimi = 'R 100'),10); 


