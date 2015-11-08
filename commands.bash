#!/bin/bash
# invoke the ask script to convert the CSV file to wiki formatting

cat RSNZFellows-working.csv | sed 's/"//g' | awk -F, -f ./toCSV.awk

