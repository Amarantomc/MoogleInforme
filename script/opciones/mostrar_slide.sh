mostrar_slide(){
    a=($1)
    cd ..
    cd ..
    cd 'Informe y Presentacion'
    pdf="Presentacion_Moogle.pdf"
    if [ -f "$pdf" ]; then
     if [ $# -gt 0 ] 
    then
    $a 'Presentacion_Moogle'.pdf
    else
    start 'Presentacion_Moogle'.pdf
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
mostrar_slide
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
mostrar_slide $c
break
fi
done
break
else 
echo -e "You did not select a valid token"
fi
done