/*
 Script to create w3resource_sql database
 */

IF NOT EXISTS(SELECT name FROM sys.databases WHERE name = 'w3resource_sql')
   BEGIN
       CREATE DATABASE w3resource_sql
   END

