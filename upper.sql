--- You can make queries to github database from https://bigquery.cloud.google.com/table/ghtorrent-bq:ght.issues?pli=1

select upper(name) from [ghtorrent-bq:ght.projects] limit 3;
