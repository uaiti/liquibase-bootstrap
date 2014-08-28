#!/bin/bash
xml=$(cat <<'XML'
<?xml version="1.0" encoding="UTF-8"?> 
<databaseChangeLog
  xmlns="http://www.liquibase.org/xml/ns/dbchangelog" 
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
  xsi:schemaLocation="http://www.liquibase.org/xml/ns/dbchangelog
                      http://www.liquibase.org/xml/ns/dbchangelog/dbchangelog-3.1.xsd">

  <!-- below are the files to be included -->

XML
)

dir='changelogs'
files=`ls -v $dir`
added_files=""
for file in $files; do
	xml=$xml"\n  <include file=\"$dir/$file\" />";
	added_files=$added_files"* $file \n"
done;
xml=$xml"\n</databasechangelog>";

echo -e "$xml" > changelog.xml;

echo -e "Adding the following files to changelog.xml: \n"
echo -e "$added_files";

