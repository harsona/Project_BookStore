CREATE TABLE IF NOT EXISTS bookDB(
	b_bookId VARCHAR(14) NOT NULL,
	b_bName VARCHAR(20),
	b_bPrice  INTEGER,
	b_author VARCHAR(20),
	b_description TEXT,
	b_publisher VARCHAR(20),
   	b_category VARCHAR(20),
	b_bInStock LONG,
	b_releaseDate VARCHAR(10),
	b_bType VARCHAR(20),
	b_fileName  VARCHAR(20),
	PRIMARY KEY (b_bookId)
)default CHARSET=utf8;