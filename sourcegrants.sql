-- privileges und role grants, die im Quellschema vorhanden sein muessen
-- connect as sys
grant datapump_imp_full_database to testqs_core_zit;
grant datapump_exp_full_database to testqs_core_zit;
grant imp_full_database to testqs_core_zit;
grant exp_full_database to testqs_core_zit;

