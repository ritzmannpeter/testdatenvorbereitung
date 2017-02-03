#!/bin/bash
#
sqlplus $1 @sql/tabelleloeschen $2.lkv_historie
sqlplus $1 @sql/tabelleloeschen $2.lkv_s_abrechenbarkeit
sqlplus $1 @sql/tabelleloeschen $2.ktv_variable
sqlplus $1 @sql/tabelleloeschen $2.ktv_kopf
sqlplus $1 @sql/tabelleloeschen $2.ktv_wert
sqlplus $1 @sql/tabelleloeschen $2.lkv_abrechenbarkeit
sqlplus $1 @sql/tabelleloeschen $2.lkv_art
sqlplus $1 @sql/tabelleloeschen $2.lkv_bonuswert
sqlplus $1 @sql/tabelleloeschen $2.lkv_leistung
sqlplus $1 @sql/tabelleloeschen $2.lkv_katalog
sqlplus $1 @sql/tabelleloeschen $2.lkv_kopf
sqlplus $1 @sql/tabelleloeschen $2.lkv_s_berechnungstyp
sqlplus $1 @sql/tabelleloeschen $2.lkv_s_bonusstufe
sqlplus $1 @sql/tabelleloeschen $2.lkv_s_ze_teilabrechnung
sqlplus $1 @sql/tabelleloeschen $2.lkv_zuweisung
sqlplus $1 @sql/tabelleloeschen $2.kts_kostentraeger
sqlplus $1 @sql/tabelleloeschen $2.kts_kostentraeger_art
sqlplus $1 @sql/tabelleloeschen $2.kts_kostentraeger_block
sqlplus $1 @sql/tabelleloeschen $2.kts_kostentraeger_details
sqlplus $1 @sql/tabelleloeschen $2.kts_kostentraeger_gruppe
sqlplus $1 @sql/tabelleloeschen $2.kts_kostentraeger_typ
sqlplus $1 @sql/tabelleloeschen $2.kts_kostentraeger_umlenkung
sqlplus $1 @sql/tabelleloeschen $2.kts_kostentraeger_versand
sqlplus $1 @sql/tabelleloeschen $2.kts_kostentraeger_versand_lb
# poor mans union: sonst sind lkv_leistung und lkv_art nicht komplett gelöscht
sqlplus $1 @sql/tabelleloeschen $2.lkv_art
sqlplus $1 @sql/tabelleloeschen $2.lkv_leistung
sqlplus $1 @sql/tabelleloeschen $2.lkv_art
sqlplus $1 @sql/tabelleloeschen $2.lkv_leistung

