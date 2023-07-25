mostrar_reporte(){
    a=($1)
    cd ..
    cd ..
    cd 'Informe y Presentacion'
    pdf="Informe-Daniel-Amaranto-Mares-Garcia-C121.pdf"
    if [ -f "$pdf" ]; then
     if [ $# -gt 0 ] 
    then
    $a 'Informe-Daniel-Amaranto-Mares-Garcia-C121'.pdf
    else
    start 'Informe-Daniel-Amaranto-Mares-Garcia-C121'.pdf
    fi
    
else
    echo "File $pdf does not exit, make sure you create pdf first"
fi
   } 

   while true 
do
echo "Do you want to use the default viewer? [y/n]"
read b
if [[ $b = "" ]]
then
echo -e "Try again"
elif [ $b = "y" ] 
then 
mostrar_reporte
break
elif [ $b = "n" ]
then
while true
do
echo -e "Type the command to open the file wiewer that you want (without the filename)"
read c
if [[ $c = "" ]]
then
echo -e "Try again"
else
mostrar_reporte $c
break
fi
done
break
else 
echo -e "You did not select a valid token"
fi
done