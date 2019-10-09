file=times.txt

printf "" > ${file}
for i in {1..100} 
do
	(time ./$1) 2>&1 | head -2 | sed -rn "s/real\s[0-9]*m([0-9]*,[0-9]*)s/\1/p" >> ${file}
done

count=0;
total=0;

for i in $( awk '{ print $1; }' ${file} )
   do	
     total=$(python3 -c "print(float($total) + float(\"$i\".replace(',', '.')))")
     ((count++))
   done
printf "0"
echo "scale=3; $total / $count" | bc

