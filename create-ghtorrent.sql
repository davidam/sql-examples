drop database ghtorrent;
create database if not exists ghtorrent;
use ghtorrent;

create table commits (
    ID int,
    sha varchar(255),
    author_id int,
    commiter_id int,
    created_at timestamp
);

create table commit_comments (
       id int,
       commit_id int,
       user_id int,
       body varchar(255),
       line int,
       position int,
       comment_id int,
       created_at timestamp
);

create table commit_parents (
       commit_id int,
       parent_id int
);	 

create table followers (
       user_id int,
       follower_id int,
       created_at timestamp
       );

create table issue_comments (
       issue_id int,
       user_id int,
       comment_id int,
       created_at timestamp
);

-- LOAD DATA INFILE 'mysql-2018-05-01/commits.csv' 
-- INTO TABLE commits
-- FIELDS TERMINATED BY ',' 
-- ENCLOSED BY '"'
-- LINES TERMINATED BY '\n'
-- IGNORE 1 ROWS
