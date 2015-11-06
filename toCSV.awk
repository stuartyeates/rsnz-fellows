#!/bin/awk -f
BEGIN {
    print"'''Please do not promote this list to mainspace, it is an experimental data-driven list which lives primarily at https://github.com/stuartyeates/rsnz-fellows '''";
    print; 
    print;
    print;
    print "{| class=\"wikitable sortable\"";
    print "|+ List of Fellows of the Royal Society of New Zealand";
    print "|-! scope=\"col\" | Name";
    print "|-! scope=\"col\" | Elected";
    print "|-! scope=\"col\" | Born";
    print "|-! scope=\"col\" |Died ";
    print "|-! scope=\"col\" |[[VIAF]] ";
    print "|-! scope=\"col\" |Gender ";
    print "|-! scope=\"col\" |Orientation ";
    print "|-! scope=\"col\" |Indigenous affilication ";
    print "|-! scope=\"col\" ||[[RSNZ]] Obiturary ";
    print "|-! scope=\"col\" |Other Obit ";
    print "|-! scope=\"col\" |Wikipedia article";
    print "|-"
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
	printf "|[http://viaf.org/viaf/"$6" VIAF]\n";
    else
	printf "|[http://viaf.org/viaf/search?query=local.names+all+%%22"FULLESCAPED"%%22 VIAF search]\n"; 
   
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
	printf "|[" $12 " RSNZ obit]\n|";
    else
	printf "|[http://rsnz.natlib.govt.nz/search/results.html?text=" FULLESCAPED " Search 1] [http://www.royalsociety.org.nz/organisation/academy/fellowship/obituaries/ Search 2]\n|";
    
    if ($13!="")
	printf "[" $13 " obit]";
 
    printf "[https://scholar.google.co.nz/scholar?q=%%22" FULLESCAPED "%%22 Search 1] [https://www.google.co.nz/search?q=obiturary%%20%%22" FULLESCAPED "%%22 Search 2]";
    
    if ($14!="")
	print "\n|[["$14"]]";
    else
	print "\n|";

}

END {
    print"|}";
}
