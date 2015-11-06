#!/bin/awk -f
BEGIN {
    print"'''Please do not promote this list to mainspace, it is an experimental data-driven list which lives primarily at https://github.com/stuartyeates/rsnz-fellows '''\n\n\n{| class=\"wikitable sortable\"\n|+ List of Fellows of the Royal Society of New Zealand \n|-\n! scope=\"col\" | Name\n! scope=\"col\" | Elected\n! scope=\"col\" | Born\n! scope=\"col\" | Died\n|-\n";
} 
{
    #  percent escaped full name for searching
    FULLESCAPED=$3 " " $2;
    gsub(" ","%%20",FULLESCAPED);

    # best wikilink for this person
    if ($14=="")
	WIKI=$3 " " $2;
    else
	WIKI=$14;

    # name and vital dates
    print "|-\n|[[" WIKI "|" $3,$2 "]]\n|" $1 "\n|" $4 "\n|" $5

    # viaf
    if ($6!="")
	print "|[http://viaf.org/viaf/"$6" VIAF]";
    else
	print "|[http://viaf.org/viaf/search?query=local.names+all+%22"FULLESCAPED"%22 VIAF search]\n|"$7""; 
   
    print "|" $7;

    # orientation
    if ($8!="") 
	print "|"$8"<ref>"$9"</ref>"; 
    else 
	print "|";  

    # iwi
    if ($10!="") 
	print "|"$10"<ref>"$11"</ref>"; 
    else 
	print "|";  
    
    # 
    if ($12!="")
	printf "|[" $12 " RSNZ obit]";
    else
	printf "|[http://rsnz.natlib.govt.nz/search/results.html?text=" FULLESCAPED " Search 1] [http://www.royalsociety.org.nz/organisation/academy/fellowship/obituaries/ Search 2]\n";

    if ($13!="")
	printf "|" $12 "\n";
    else
	printf "|[https://scholar.google.co.nz/scholar?q=%22" FULLESCAPED "%22 Search 1] [https://www.google.co.nz/search?q=obiturary%20%22" FULLESCAPED "%22 Search 2]";


    print "\n|[["$14"]]";


}

END {
    print"|}";
}
