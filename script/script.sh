#!/bin/bash

# Función que muestra el menú de opciones
mostrar_menu() {
    echo "Menú de opciones:"
    echo "1. Run"
    echo "2. Report"
    echo "3. Slide"
    echo "4. Show report"
    echo "5. Show slide"
    echo "6. Clean"
    echo "7. Exit"
}

# Función que realiza la acción de la opción seleccionada
ejecutar_opcion() {
    case $1 in
        1)
            run
            ;;
        2)
            reporte
            ;;
        3)
            presentacion
            ;;
        4) cd 'Opciones'; bash mostrar_reporte.sh; cd ..
             ;;
            5)
               cd 'Opciones'; bash mostrar_slide.sh; cd ..
               ;;
            6) 
            clean ; echo "Files were deleted" ;;
            7) exit 0;;
        *)
            echo "Opción inválida. Inténtalo de nuevo."
            ;;
    esac
} 
reporte(){
    cd ..
    cd 'Informe y Presentacion'
    pdflatex 'Informe-Daniel-Amaranto-Mares-Garcia-C121'.tex
}
presentacion(){
    cd ..
    cd 'Informe y Presentacion'
    pdflatex 'Presentacion Moogle'.tex
}

clean(){
    cd ..
    cd 'Informe y Presentacion'
    rm -f *.aux *.lot *.lof *.log *.toc *.dvi *.ps *.bbl *.out *.synctex.gz *.fls *.fdb_latexmk *.pdf
    rm -f *.nav *.snm *.vrb
}
run(){
    cd ..
    cd 'moogle-main'
    cd 'MoogleServer'
    dotnet watch run  Program.cs
}
# Bucle para mostrar el menú y leer la opción seleccionada
while true; do
    mostrar_menu
    read -p "Ingresa el número de la opción deseada: " opcion
    ejecutar_opcion $opcion
    echo "Presiona Enter para continuar..."
    read
done
