--- You can make queries to github database from https://bigquery.cloud.google.com/table/ghtorrent-bq:ght.issues?pli=1
--- Give me projects and commits of python projects 

    SELECT	
        project_id,
        COUNT(*) AS commits
      FROM
        [ghtorrent-bq:ght.commits]
      WHERE
        project_id IN (
        SELECT
          id
        FROM
          [ghtorrent-bq:ght.projects]
        WHERE
          language="Python"
          AND deleted=FALSE
          AND forked_from IS NULL )
      GROUP BY
        project_id
      ORDER BY
        commits DESC
      LIMIT
        1000000

--- Give me the users with more commits in Python between 2016-06-01 and 2016-07-01

select u.login as login, u.location as location, count(c.id) as num_commits
from [ghtorrent-bq.ght.project_commits] pc join
     (SELECT id, author_id FROM [ghtorrent-bq.ght.commits] WHERE
     date(created_at) between date('2016-06-01')
                          and date('2016-07-01') )c on pc.commit_id = c.id join
     (SELECT id
     FROM [ghtorrent-bq.ght.projects] WHERE language = 'Python') p on p.id = pc.project_id join
     (SELECT login, location, id
     FROM [ghtorrent-bq.ght.users]
     WHERE country_code = 'es') u on c.author_id = u.id,
group by login, location
order by num_commits desc;

--- Give me my commits

select count(*)
from [ghtorrent-bq.ght.commits] where
     committer_id in (select id from [ghtorrent-bq.ght.users] where login='davidam')
