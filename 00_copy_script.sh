#!/bin/bash

rm -rf /app/testdatenvorbereitung
mkdir -p /app/testdatenvorbereitung
cp -r * /app/testdatenvorbereitung/
chown -R jenkins:jenkins /app/testdatenvorbereitung
chmod +x /app/testdatenvorbereitung/*.sh
