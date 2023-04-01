CREATE TABLE `show` (
    id_show SMALLINT NOT NULL AUTO_INCREMENT,
    title VARCHAR(255),
    release_year SMALLINT,
    duration SMALLINT,
    description TEXT,
    date_added DATETIME,
    PRIMARY KEY (id_show)
);

CREATE TABLE `actor` (
    id_actor SMALLINT NOT NULL AUTO_INCREMENT,
    name VARCHAR(100),
    PRIMARY KEY (id_actor)
);

CREATE TABLE `type` (
    id_type SMALLINT NOT NULL AUTO_INCREMENT,
    name VARCHAR(20),
    PRIMARY KEY (id_type)
);

CREATE TABLE `platform` (
    id_platform SMALLINT NOT NULL AUTO_INCREMENT,
    name VARCHAR(20),
    PRIMARY KEY (id_platform)
);

CREATE TABLE `show_actor` (
    id_show SMALLINT NOT NULL,
    id_actor SMALLINT NOT NULL,
    PRIMARY KEY (id_show, id_actor),
	FOREIGN KEY (id_show) REFERENCES `show`(id_show),
    FOREIGN KEY (id_actor) REFERENCES `actor`(id_actor)
);

CREATE TABLE `show_type` (
    id_show SMALLINT NOT NULL,
    id_type SMALLINT NOT NULL,
    PRIMARY KEY (id_show, id_type),
	FOREIGN KEY (id_show) REFERENCES `show`(id_show),
    FOREIGN KEY (id_type) REFERENCES `type`(id_type)
);

CREATE TABLE `show_platform` (
    id_show SMALLINT NOT NULL,
    id_platform SMALLINT NOT NULL,
    PRIMARY KEY (id_show, id_platform),
	FOREIGN KEY (id_show) REFERENCES `show`(id_show),
    FOREIGN KEY (id_platform) REFERENCES `platform`(id_platform)
);