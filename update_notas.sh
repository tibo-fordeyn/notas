#!/bin/bash

NOTAS_DIR=~/school/notas
SEMESTER_DIR=~/school/tweede-bach/eerste-sem

find "$NOTAS_DIR" -name '*.pdf' -delete

mkdir -p "$NOTAS_DIR"

if [ ! -d "$SEMESTER_DIR" ]; then
    exit 1
fi

COUNT=1
find "$SEMESTER_DIR" -type f -path '*/nota/notas.pdf' | while read -r pdf; do
    DOELBESTAND="$NOTAS_DIR/${COUNT}.pdf"
    cp "$pdf" "$DOELBESTAND"
    COUNT=$((COUNT + 1))
done

cd "$NOTAS_DIR" || exit

git add .
git commit -m "notities bijgewerkt"
git push origin main
