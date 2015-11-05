#!/bin/awk -f
BEGIN {
    print"'''Please do not promote this list to mainspace, it is an experimental data-driven list which lives primarily at https://github.com/stuartyeates/rsnz-fellows '''\n\n\n{| class=\"wikitable sortable\"\n|+ List of Fellows of the Royal Society of New Zealand \n|-\n! scope=\"col\" | Name\n! scope=\"col\" | Elected\n! scope=\"col\" | Born\n! scope=\"col\" | Died\n|-\n";
} 
{
    #  percent escaped full name for searching
    FULLESCAPED=$3 " " $2;
    gsub(" ","%%22",FULLESCAPED);

    # best wikilink for this person

    print "|-\n|[["$3,$2"]]\n|"$1"\n|"$4"\n|"$5"\n|[http://viaf.org/viaf/"$6" VIAF], [http://viaf.org/viaf/search?query=local.names+all+%22"FULLESCAPED"%22 VIAF search]\n|"$7""; 
    
if ($8!="") 
	print "|"$8"<ref>"$9"</ref>"; 
    else 
	print "|";  

    if ($10!="") 
	print "|"$10"<ref>"$11"</ref>"; 
    else 
	print "|";  

    if ($11!="")
	


    print "\n|"$13"\n|[["$14"]]";


}

END {
    print"|}";
}
