--- You can make queries to github database from https://bigquery.cloud.google.com/table/ghtorrent-bq:ght.issues?pli=1

select count(*) from [ghtorrent-bq:ght.users] where login like 'david%'

select count(*) from [ghtorrent-bq:ght.users] where login like '_avid%'
