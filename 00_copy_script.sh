#!/bin/bash

ssh oracle@10.1.116.20 'rm -rf /app/testdatenvorbereitung; mkdir -p /app/testdatenvorbereitung;'

scp -r * oracle@10.1.116.20:/app/testdatenvorbereitung/

ssh oracle@10.1.116.20 'chown -R oracle:oinstall /app/testdatenvorbereitung; chmod +x /app/testdatenvorbereitung/*.sh;'
