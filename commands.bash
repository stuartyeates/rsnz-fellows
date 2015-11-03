head RSNZFellows-working.csv | sed 's/"//g' | awk -F, '{print "|-\n|[["$3,$2"]]\n|"$1"\n|"$4"\n|"$5"\n|[http://viaf.org/viaf/"$6" VIAF], [http://viaf.org/viaf/search?query=local.names+all+%22"$2",%20"$3"%22 VIAF search]\n|"$7""; if ($8!="") print "|"$8"<ref>"$9"</ref>"; else print "|";  if ($10!="") print "|"$10"<ref>"$11"</ref>"; else print "|";  "|"$12"\n|"$13"\n|[["$14"]]"}'

