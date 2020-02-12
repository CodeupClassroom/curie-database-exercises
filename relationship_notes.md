# Database Relationships and `JOIN`s

## Vocab

- **Foreign Key**: a column on a table that references a primary key on another table
- **Composite Key**: a table that has a primary key that is not a single column, but rather, a combination of multiple columns; common to see on join tables
- **INNER JOIN**: the default, only rows where there is a match
- **LEFT JOIN**: every row from the lhs, even if there isn't a match in the rhs
- **RIGHT JOIN**: every row from the rhs, even if there isn't a match in the lhs

## Relationship Types

### One To One

One table has one single corresponding entry on another table, and vice-versa.

Example: students to student profiles

### One To Many

Multiple rows on the many table can relate to the same row on the one table.

The many table will have a foreign key to the one table.

```sql
FROM table_a
JOIN table_b ON table_b.fk = table_a.pk
```

Example: cars -> manufacturers (the cars table has a `manufacturer_id` column that is a fk)

### Many To Many

One row on one table can relate to multiple rows on the other table, and
vice-versa.

Neither table will contain a foreign key to the other, rather, a **join
table** (or link table) will contain fks to both tables.

```sql
FROM table_a
JOIN link_table ON link_table.a_fk = table_a.pk
JOIN table_b ON link_table.b_fk = table_b.pk
```

Example: cars <-> owners
