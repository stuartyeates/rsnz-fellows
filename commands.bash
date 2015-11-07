#!/bin/bash

cat RSNZFellows-working.csv | sed 's/"//g' | awk -F, -f ./toCSV.awk

