#!/bin/bash

echo "Generating example images from the compiled PDFs for the README..."
mkdir -p images/report-example images/beamer-example

echo "Clean output image directories"
rm images/report-example/report-example*
rm images/beamer-example/beamer-example*
echo ""

echo "Generating png single images..."
gs -dNOPAUSE -sDEVICE=png16m -r50 -sOutputFile=images/report-example/report-example-%d.png ../report-example.pdf -c quit
gs -dNOPAUSE -sDEVICE=png16m -r100 -sOutputFile=images/beamer-example/beamer-example-%d.png ../beamer-example.pdf -c quit
echo "Done."
echo ""

echo "Generating matrix image with borders..."
montage images/report-example/report-example-[0-9].png -tile 2x -border 3 -geometry +10+10 images/report-example/report-example.png
montage images/beamer-example/beamer-example-[0-9].png -tile 2x -border 3 -geometry +10+10 images/beamer-example/beamer-example.png
echo "Done."
echo ""

echo "Clean temporary images..."
rm images/report-example/report-example-*
rm images/beamer-example/beamer-example-*
echo ""

echo "DONE. Example images generated."
