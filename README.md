# sqlitetut
A repo for tracking my working through https://www.sqlitetutorial.net/

Tag start:  $ sqlite3, optionally $ sqlite3 <filename>.db
> .open <filename.db>
> .tables
> .help
> .databases
  At this point in the tutorial, reality diverges from tutorial
> schema, .fullschema
>.output, .once
>>.read
>.mode
>.header

## Query Syntax summaries:

SELECT DISTINCT column_list
FROM table_list
  JOIN table ON join_condition
WHERE row_filter
ORDER BY column list     ( optional ASC or DESC after column name )     
LIMIT count OFFSET offset
GROUP BY column
HAVING group_filter;

## Miscellaneous notes
- Concise summary: https://sqlite.org/cli.html
- get command on launch: $ sqlite3 < <filename.sql>
- In apps, don't use wildcard * for column list, because the column order may change, breaking the app
- in sorting, NULL is smaller than anything; NULLS FIRST and NULLS LAST  overrides this.
## WHERE clause
  ALL AND ANY BETWEEN EXISTS IN LIKE NOT OR (LIKE wildcard = %) IN (...0
