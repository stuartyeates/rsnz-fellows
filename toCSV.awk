#!/bin/awk -f
BEGIN {
    print "'''Please do not promote this list to mainspace, it is an experimental data-driven list which lives primarily at https://github.com/stuartyeates/rsnz-fellows '''";
    print "'''TODO:''' sort people marked on the RSNZ website as no longer memebrs; find refs for everyone; double check gender";
    print ""; 
    print;
    print;
    print "{| class=\"wikitable sortable\"";
    print "|+ List of Fellows of the Royal Society of New Zealand";
    print "! scope=\"col\" | Name";
    print "! scope=\"col\" | Elected";
    print "! scope=\"col\" | Born";
    print "! scope=\"col\" | Died ";
    print "! scope=\"col\" | [[VIAF]] ";
    print "! scope=\"col\" | [[ORCID]] ";
    print "! scope=\"col\" | Gender ";
    print "! scope=\"col\" | Orientation ";
    print "! scope=\"col\" | Indigenous affilication ";
    print "! scope=\"col\" | search links ";
    print "! scope=\"col\" | [[RSNZ]] refs ";
    print "! scope=\"col\" | Other refs ";
    print "! scope=\"col\" | Wikipedia article";
    print "|-"
} 
{
    #  percent escaped full name for searching
    FULLESCAPED=$3 " " $2;
    gsub(" ","%%20",FULLESCAPED);

    # best wikilink for this person
    if ($15=="")
	WIKI=$3 " " $2;
    else
	WIKI=$15;

    # name and vital dates
    print "|-\n|[[" WIKI "|" $3,$2 "]]\n|" $1 "\n|" $4 "\n|" $5

    # viaf
    if ($6!="")
	printf "|[http://viaf.org/viaf/"$6 " " $6 "]\n";
    else
	printf "|\n"
   
    print "|" $7;

    print "|" $8;

    # orientation
    if ($9!="") 
	print "|"$9"<ref>"$10"</ref>"; 
    else 
	print "|";  

    # iwi
    if ($11!="") 
	print "|"$11"<ref>"$12"</ref>"; 
    else 
	print "|";  


    printf "| [https://scholar.google.co.nz/scholar?q=%%22" FULLESCAPED "%%22 1][http://rsnz.natlib.govt.nz/search/results.html?text=" FULLESCAPED " 2][https://www.google.co.nz/search?q=site%%3Aroyalsociety.org.nz+" FULLESCAPED " 3][http://authorities.loc.gov/cgi-bin/Pwebrecon.cgi?Search_Arg=" FULLESCAPED "&Search_Code=SHED%%40&CNT=100&HIST=1 4][http://viaf.org/viaf/search?query=local.names+all+%%22"FULLESCAPED"%%22 5][https://orcid.org/orcid-search/quick-search?searchQuery="FULLESCAPED" 6][https://www.google.co.nz/search?q=site%%3A.nz+" FULLESCAPED " 7][https://www.google.co.nz/search?q=FRNZ+" FULLESCAPED " 8]\n"

    
    # 
    if ($13!="")
	printf "|[" $13 " RSNZ obit]\n|";
    else
	printf "|\n|"
    
    if ($14!="")
	printf "[" $14 " obit]";
    
    if ($15!="")
	print "\n|[["$15"]]";
    else
	print "\n|";

}

END {
    print"|}";
}
