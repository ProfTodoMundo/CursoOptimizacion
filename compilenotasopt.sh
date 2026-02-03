#!/usr/bin/env bash

pdflatex  NotasCursoOptimizacion.tex
bibtex NotasCursoOptimizacion
pdflatex  NotasCursoOptimizacion.tex
pdflatex  NotasCursoOptimizacion.tex

open -a TexShop  NotasCursoOptimizacion.pdf







