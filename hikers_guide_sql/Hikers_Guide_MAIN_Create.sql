-- MySQL Script generated by MySQL Workbench
-- Fri Dec  8 22:43:23 2017
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema hikers_guide_to_the_galaxy
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `hikers_guide_to_the_galaxy` ;

-- -----------------------------------------------------
-- Schema hikers_guide_to_the_galaxy
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `hikers_guide_to_the_galaxy` DEFAULT CHARACTER SET utf8 ;
USE `hikers_guide_to_the_galaxy` ;

-- -----------------------------------------------------
-- Table `hikers_guide_to_the_galaxy`.`parks`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hikers_guide_to_the_galaxy`.`parks` ;

CREATE TABLE IF NOT EXISTS `hikers_guide_to_the_galaxy`.`parks` (
  `park_id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`park_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `hikers_guide_to_the_galaxy`.`trail_types`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hikers_guide_to_the_galaxy`.`trail_types` ;

CREATE TABLE IF NOT EXISTS `hikers_guide_to_the_galaxy`.`trail_types` (
  `type_id` INT(11) NOT NULL AUTO_INCREMENT,
  `type` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`type_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 13
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `hikers_guide_to_the_galaxy`.`trails`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hikers_guide_to_the_galaxy`.`trails` ;

CREATE TABLE IF NOT EXISTS `hikers_guide_to_the_galaxy`.`trails` (
  `trail_id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `difficulty` INT(11) NOT NULL,
  `length` INT(11) NOT NULL,
  `type_id` INT(11) NOT NULL,
  `park_id` INT(11) NOT NULL,
  PRIMARY KEY (`trail_id`),
  INDEX `fk_trails_trail_types1_idx` (`type_id` ASC),
  INDEX `fk_trails_parks1_idx` (`park_id` ASC),
  CONSTRAINT `fk_trails_parks1`
    FOREIGN KEY (`park_id`)
    REFERENCES `hikers_guide_to_the_galaxy`.`parks` (`park_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_trails_trail_types1`
    FOREIGN KEY (`type_id`)
    REFERENCES `hikers_guide_to_the_galaxy`.`trail_types` (`type_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `hikers_guide_to_the_galaxy`.`gps_coords`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hikers_guide_to_the_galaxy`.`gps_coords` ;

CREATE TABLE IF NOT EXISTS `hikers_guide_to_the_galaxy`.`gps_coords` (
  `gps_id` INT(11) NOT NULL AUTO_INCREMENT,
  `point` POINT NOT NULL,
  `trail_id` INT(11) NOT NULL,
  PRIMARY KEY (`gps_id`),
  INDEX `fk_gps_coords_trails1_idx` (`trail_id` ASC),
  CONSTRAINT `fk_gps_coords_trails1`
    FOREIGN KEY (`trail_id`)
    REFERENCES `hikers_guide_to_the_galaxy`.`trails` (`trail_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 13
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `hikers_guide_to_the_galaxy`.`activities`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hikers_guide_to_the_galaxy`.`activities` ;

CREATE TABLE IF NOT EXISTS `hikers_guide_to_the_galaxy`.`activities` (
  `activity_id` INT(11) NOT NULL AUTO_INCREMENT,
  `gps_id` INT(11) NOT NULL,
  `desc` TEXT NOT NULL,
  PRIMARY KEY (`activity_id`),
  INDEX `fk_activities_gps_coords1_idx` (`gps_id` ASC),
  CONSTRAINT `fk_activities_gps_coords1`
    FOREIGN KEY (`gps_id`)
    REFERENCES `hikers_guide_to_the_galaxy`.`gps_coords` (`gps_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `hikers_guide_to_the_galaxy`.`trail_reviews`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hikers_guide_to_the_galaxy`.`trail_reviews` ;

CREATE TABLE IF NOT EXISTS `hikers_guide_to_the_galaxy`.`trail_reviews` (
  `review_id` INT(11) NOT NULL AUTO_INCREMENT,
  `text` TEXT NULL DEFAULT NULL,
  `rating` INT(11) NOT NULL,
  PRIMARY KEY (`review_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `hikers_guide_to_the_galaxy`.`users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hikers_guide_to_the_galaxy`.`users` ;

CREATE TABLE IF NOT EXISTS `hikers_guide_to_the_galaxy`.`users` (
  `user_id` INT(11) NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `loc` POINT NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `hikers_guide_to_the_galaxy`.`completed_trails`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hikers_guide_to_the_galaxy`.`completed_trails` ;

CREATE TABLE IF NOT EXISTS `hikers_guide_to_the_galaxy`.`completed_trails` (
  `trail_id` INT(11) NOT NULL,
  `review_id` INT(11) NULL DEFAULT NULL,
  `user_id` INT(11) NOT NULL,
  PRIMARY KEY (`trail_id`, `user_id`),
  INDEX `fk_completed_trails_trails1_idx` (`trail_id` ASC),
  INDEX `fk_completed_trails_users1_idx` (`user_id` ASC),
  INDEX `fk_completed_trails_reviews1_idx` (`review_id` ASC),
  CONSTRAINT `fk_completed_trails_reviews1`
    FOREIGN KEY (`review_id`)
    REFERENCES `hikers_guide_to_the_galaxy`.`trail_reviews` (`review_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_completed_trails_trails1`
    FOREIGN KEY (`trail_id`)
    REFERENCES `hikers_guide_to_the_galaxy`.`trails` (`trail_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_completed_trails_users1`
    FOREIGN KEY (`user_id`)
    REFERENCES `hikers_guide_to_the_galaxy`.`users` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `hikers_guide_to_the_galaxy`.`geocaches`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hikers_guide_to_the_galaxy`.`geocaches` ;

CREATE TABLE IF NOT EXISTS `hikers_guide_to_the_galaxy`.`geocaches` (
  `geocaches_id` INT(11) NOT NULL AUTO_INCREMENT,
  `gps_id` INT(11) NOT NULL,
  `user_id` INT(11) NOT NULL,
  `desc` TEXT NOT NULL,
  PRIMARY KEY (`geocaches_id`),
  INDEX `fk_geocaches_gps_coords1_idx` (`gps_id` ASC),
  INDEX `fk_geocaches_users1_idx` (`user_id` ASC),
  CONSTRAINT `fk_geocaches_gps_coords1`
    FOREIGN KEY (`gps_id`)
    REFERENCES `hikers_guide_to_the_galaxy`.`gps_coords` (`gps_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_geocaches_users1`
    FOREIGN KEY (`user_id`)
    REFERENCES `hikers_guide_to_the_galaxy`.`users` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `hikers_guide_to_the_galaxy`.`pictures`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hikers_guide_to_the_galaxy`.`pictures` ;

CREATE TABLE IF NOT EXISTS `hikers_guide_to_the_galaxy`.`pictures` (
  `pic_id` INT(11) NOT NULL AUTO_INCREMENT,
  `pic` VARCHAR(255) NOT NULL,
  `user_id` INT(11) NOT NULL,
  `gps_id` INT(11) NOT NULL,
  PRIMARY KEY (`pic_id`),
  INDEX `fk_pictures_users1_idx` (`user_id` ASC),
  INDEX `fk_pictures_gps_coords1_idx` (`gps_id` ASC),
  CONSTRAINT `fk_pictures_gps_coords1`
    FOREIGN KEY (`gps_id`)
    REFERENCES `hikers_guide_to_the_galaxy`.`gps_coords` (`gps_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_pictures_users1`
    FOREIGN KEY (`user_id`)
    REFERENCES `hikers_guide_to_the_galaxy`.`users` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `hikers_guide_to_the_galaxy`.`trail_heads`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hikers_guide_to_the_galaxy`.`trail_heads` ;

CREATE TABLE IF NOT EXISTS `hikers_guide_to_the_galaxy`.`trail_heads` (
  `trail_id` INT(11) NOT NULL,
  `gps_id` INT(11) NOT NULL,
  PRIMARY KEY (`trail_id`, `gps_id`),
  INDEX `fk_trail_heads_trails_idx` (`trail_id` ASC),
  INDEX `fk_trail_heads_gps_coords1_idx` (`gps_id` ASC),
  CONSTRAINT `fk_trail_heads_gps_coords1`
    FOREIGN KEY (`gps_id`)
    REFERENCES `hikers_guide_to_the_galaxy`.`gps_coords` (`gps_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_trail_heads_trails`
    FOREIGN KEY (`trail_id`)
    REFERENCES `hikers_guide_to_the_galaxy`.`trails` (`trail_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

USE `hikers_guide_to_the_galaxy` ;

-- -----------------------------------------------------
-- procedure add_activities
-- -----------------------------------------------------

USE `hikers_guide_to_the_galaxy`;
DROP procedure IF EXISTS `hikers_guide_to_the_galaxy`.`add_activities`;

DELIMITER $$
USE `hikers_guide_to_the_galaxy`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_activities`(IN givenTrail_id int, IN givenText text, IN Longitude float, IN Latitude float)
BEGIN

	-- If the given GPS doesnt exist create a new instance of it
    if (select count(*) 
		from gps_coords
        where gps_coords.point = point(Longitude, Latitude))
        = 0 then
        
    -- create a new gps ID
    insert into gps_coords(point, trail_id)
    values (point(Longitude, Latitude), givenTrail_id);
    
    set @gps_id = (
    select max(gps_id)
    from gps_coords);
    
    else 
    
	-- Find Existing gps if not create new
	set @gps_id = (
    select gps_id
    from gps_coords
    where gps_coords.point = point(Longitude, Latitude));
    
    end if; 

	insert into activities(gps_id, activities.desc)
    values(@gps_id, givenText);

END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure add_completed_trail
-- -----------------------------------------------------

USE `hikers_guide_to_the_galaxy`;
DROP procedure IF EXISTS `hikers_guide_to_the_galaxy`.`add_completed_trail`;

DELIMITER $$
USE `hikers_guide_to_the_galaxy`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_completed_trail`(IN givenUsername varchar(45), IN givenTrail_id int)
BEGIN
    
    set @user_id = (
    select user_id
    from users
    where username = givenUsername);

	insert into completed_trails(trail_id, review_id, user_id)
    values (givenTrail_id, null, @user_id);

END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure add_geocache
-- -----------------------------------------------------

USE `hikers_guide_to_the_galaxy`;
DROP procedure IF EXISTS `hikers_guide_to_the_galaxy`.`add_geocache`;

DELIMITER $$
USE `hikers_guide_to_the_galaxy`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_geocache`(IN username varchar(45), IN givenDesc text, IN Longitude float, IN Latitude float, IN givenTrail_id int)
BEGIN

    -- Finding user_id from a name
    set @user_id = (
    select user_id
    from users
    where users.username = username);

	-- If the given GPS doesnt exist create a new instance of it
    if (select count(*) 
		from gps_coords
        where gps_coords.point = point(Longitude, Latitude))
        = 0 then
        
    -- create a new gps ID
    insert into gps_coords(point, trail_id)
    values (point(Longitude, Latitude), givenTrail_id);
    
    set @gps_id = (
    select max(gps_id)
    from gps_coords);
    
    else 
    
	-- Find Existing gps if not create new
	set @gps_id = (
    select gps_id
    from gps_coords
    where gps_coords.point = point(Longitude, Latitude));
    
    end if;    

    -- Creating geocache and inserting it
    insert into geocaches(gps_id, user_id, geocaches.desc)
    values (@gps_id, @user_id, givenDesc);
    


END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure add_picture
-- -----------------------------------------------------

USE `hikers_guide_to_the_galaxy`;
DROP procedure IF EXISTS `hikers_guide_to_the_galaxy`.`add_picture`;

DELIMITER $$
USE `hikers_guide_to_the_galaxy`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_picture`(IN username varchar(45), IN givenTrail_ID int, IN Longitude float, IN Latitude float, IN givenPic varchar(255))
BEGIN

    -- Finding user_id from a name
    set @user_id = (
    select user_id
    from users
    where users.username = username);

	-- If the given GPS doesnt exist create a new instance of it
    if (select count(*) 
		from gps_coords
        where gps_coords.point = point(Longitude, Latitude))
        = 0 then
        
    -- create a new gps ID
    insert into gps_coords(point, trail_id)
    values (point(Longitude, Latitude), givenTrail_ID);
    
    set @gps_id = (
    select max(gps_id)
    from gps_coords);
    
    else 
    
	-- Find Existing gps if not create new
	set @gps_id = (
    select gps_id
    from gps_coords
    where gps_coords.point = point(Longitude, Latitude));
    
    end if;    

    -- Creating geocache and inserting it
    insert into pictures(pic, user_id, gps_id)
    values (givenPic, @user_id, @gps_id);
    


END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure add_review
-- -----------------------------------------------------

USE `hikers_guide_to_the_galaxy`;
DROP procedure IF EXISTS `hikers_guide_to_the_galaxy`.`add_review`;

DELIMITER $$
USE `hikers_guide_to_the_galaxy`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_review`(IN givenUsername varchar(45), IN givenTrail_id int, IN givenRating int, IN givenReview TEXT)
BEGIN

    
    -- Creating a new review
    insert into trail_reviews(text, rating)
    values (givenReview, givenRating);
    
    set @review_id = (
    select MAX(review_id)
    from trail_reviews);
    
    set @user_id = (
    select user_id
    from users
    where username = givenUsername);
    
    -- If the user has already reviewed the trail then signal error
    
    if (select review_id
    from completed_trails
    where trail_id = givenTrail_id and @user_id = user_id) is not null then
    
    signal sqlstate'10000'
    set message_text = 'Cannot add a review to the same trail';
    
    end if;

    
    
    -- Check if the user has completed the trail, if the user has not states the trail has been created, it will create a row saying
    -- that the user has completed the trail, else update complted_trail.review_id to the button. 
    if (select count(*)
    from completed_trails
    where review_id = @review_id) = 0 then
    
    -- Create a new completed_trail with all of its parameters
    insert into completed_trails(trail_id, review_id, user_id)
    values (givenTrail_id, @review_id, @user_id);
    
    else 
    
	-- Updating completed trails
    update completed_trails
    set review_id = @review_id
    where completed_trails.trail_id = givenTrail_id AND completed_trails.user_id = @user_id;
    
    end if;

END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure add_trail_head
-- -----------------------------------------------------

USE `hikers_guide_to_the_galaxy`;
DROP procedure IF EXISTS `hikers_guide_to_the_galaxy`.`add_trail_head`;

DELIMITER $$
USE `hikers_guide_to_the_galaxy`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_trail_head`(IN givenTrail_id int, IN Longitude float, IN Latitude float)
BEGIN
    
-- If the given GPS doesnt exist create a new instance of it
    if (select count(*) 
		from gps_coords
        where gps_coords.point = point(Longitude, Latitude))
        = 0 then
        
    -- create a new gps ID
    insert into gps_coords(point, trail_id)
    values (point(Longitude, Latitude), givenTrail_id);
    
    set @gps_id = (
    select max(gps_id)
    from gps_coords);
    
    else 
    
	-- Find Existing gps if not create new
	set @gps_id = (
    select gps_id
    from gps_coords
    where gps_coords.point = point(Longitude, Latitude));
    
    end if;

	-- Inserting a new instance of a trail head
	insert into trail_heads(trail_id, gps_id)
    values (givenTrail_id, @gps_id);


END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure add_trails
-- -----------------------------------------------------

USE `hikers_guide_to_the_galaxy`;
DROP procedure IF EXISTS `hikers_guide_to_the_galaxy`.`add_trails`;

DELIMITER $$
USE `hikers_guide_to_the_galaxy`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_trails`(IN givenName varchar(255), IN givenDifficulty int, IN givenLength int, IN givenType_id int, IN parkName varchar(45))
BEGIN

	set @park_id = (
    select park_id
    from parks
    where parks.name = parkName);
    
    
    if @park_id is null then
    -- Create a new Park
    insert into parks(name)
    values(parkName);
    
    set @park_id = (
    select max(park_id)
    from parks);
    
    end if;
    

	insert into trails(name, difficulty, length, type_id, park_id)
    values (givenName, givenDifficulty, givenLength, givenType_id, @park_id);

END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure add_user
-- -----------------------------------------------------

USE `hikers_guide_to_the_galaxy`;
DROP procedure IF EXISTS `hikers_guide_to_the_galaxy`.`add_user`;

DELIMITER $$
USE `hikers_guide_to_the_galaxy`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_user`(IN username varchar(45), 
IN pass varchar(45), 
IN email varchar(100), 
IN Longitude float, 
IN Latitude float)
BEGIN

	insert into users(username, password, email, loc)
    values(username, pass, email, point(Longitude, Latitude));

END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure get_activities
-- -----------------------------------------------------

USE `hikers_guide_to_the_galaxy`;
DROP procedure IF EXISTS `hikers_guide_to_the_galaxy`.`get_activities`;

DELIMITER $$
USE `hikers_guide_to_the_galaxy`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_activities`(
	givenTrail_id int
)
BEGIN
    
	select ST_X(point) as Lon, ST_Y(point) as Lat, activities.desc
    from gps_coords join activities using (gps_id)
    where trail_id = givenTrail_id;
        
END$$

DELIMITER ;

-- -----------------------------------------------------
-- function get_completed_trails
-- -----------------------------------------------------

USE `hikers_guide_to_the_galaxy`;
DROP function IF EXISTS `hikers_guide_to_the_galaxy`.`get_completed_trails`;

DELIMITER $$
USE `hikers_guide_to_the_galaxy`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `get_completed_trails`(givenUsername varchar(45)) RETURNS int(11)
BEGIN

	set @user_id = (
    select user_id
    from users
    where username = givenUsername);
    
    set @result = (
    select count(*)
    from completed_trails
    where user_id = @user_id);
    
    return @result;
    
END$$

DELIMITER ;

-- -----------------------------------------------------
-- function get_distance
-- -----------------------------------------------------

USE `hikers_guide_to_the_galaxy`;
DROP function IF EXISTS `hikers_guide_to_the_galaxy`.`get_distance`;

DELIMITER $$
USE `hikers_guide_to_the_galaxy`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `get_distance`(
	pointA point,
    pointB point
) RETURNS float
BEGIN

	set @lat1 = ST_Y(pointA);
    set @lng1 = ST_X(pointA);
    
    set @lat2 = ST_Y(pointB);
    set @lng2 = ST_X(pointB);
    
    
    RETURN 6371 * 2 * ASIN(SQRT(
            POWER(SIN((@lat1 - abs(@lat2)) * pi()/180 / 2),
            2) + COS(@lat1 * pi()/180 ) * COS(abs(@lat2) *
            pi()/180) * POWER(SIN((@lng1 - @lng2) *
            pi()/180 / 2), 2) ));
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure get_geocaches
-- -----------------------------------------------------

USE `hikers_guide_to_the_galaxy`;
DROP procedure IF EXISTS `hikers_guide_to_the_galaxy`.`get_geocaches`;

DELIMITER $$
USE `hikers_guide_to_the_galaxy`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_geocaches`(
	givenTrail_id int
)
BEGIN
    
	select username, geocaches.desc, ST_X(gps_coords.point) as Lon, ST_Y(gps_coords.point) as Lat
	from gps_coords join geocaches using (gps_id) join users using (user_id)
	where trail_id = givenTrail_id;
        
        
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure get_geocaches_by_gps
-- -----------------------------------------------------

USE `hikers_guide_to_the_galaxy`;
DROP procedure IF EXISTS `hikers_guide_to_the_galaxy`.`get_geocaches_by_gps`;

DELIMITER $$
USE `hikers_guide_to_the_galaxy`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_geocaches_by_gps`(in givenLong float, in givenLat float, in givenRange int)
BEGIN
        
	-- Finding the trail_id from name
    set @trail_id = (
    select trail_id
    from trails
    where givenTrailName = trails.name);
    
    select username, geocaches.desc
	from geocaches join gps_coords using (gps_id) join users using (user_id)
	where get_distance(point, point(givenLong, givenLat)) < givenRange;
        
END$$

DELIMITER ;

-- -----------------------------------------------------
-- function get_gps_point
-- -----------------------------------------------------

USE `hikers_guide_to_the_galaxy`;
DROP function IF EXISTS `hikers_guide_to_the_galaxy`.`get_gps_point`;

DELIMITER $$
USE `hikers_guide_to_the_galaxy`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `get_gps_point`(
	gpsID INT(11)
) RETURNS blob
BEGIN
	SET @gps_point = 
		(SELECT
		gps_coords.point
        FROM
        gps_coords
        WHERE
        gps_coords.gps_id = gpsID);
	RETURN @gps_point;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- function get_nearest_head_distance
-- -----------------------------------------------------

USE `hikers_guide_to_the_galaxy`;
DROP function IF EXISTS `hikers_guide_to_the_galaxy`.`get_nearest_head_distance`;

DELIMITER $$
USE `hikers_guide_to_the_galaxy`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `get_nearest_head_distance`(trailID INT(11), usrID INT(11)) RETURNS float
BEGIN

	declare result float default -1;
    declare usrPoint point default
    (select loc
    from users
    where user_id = usrID);
    
    declare trailLocation point default get_nearest_head_point(trailID, usrPoint);
    
    select get_distance(usrPoint, trailLocation) into result;
    
	return result;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- function get_nearest_head_point
-- -----------------------------------------------------

USE `hikers_guide_to_the_galaxy`;
DROP function IF EXISTS `hikers_guide_to_the_galaxy`.`get_nearest_head_point`;

DELIMITER $$
USE `hikers_guide_to_the_galaxy`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `get_nearest_head_point`(
	trailID INT(11),
    usrLoc point
) RETURNS blob
BEGIN
	SET @nearest_gps_id = 
		(SELECT
		trail_heads.gps_id
        FROM
        trail_heads
        WHERE
        trail_heads.trail_id = trailID
        ORDER BY get_distance(get_gps_point(trail_heads.gps_id), usrLoc) 
        LIMIT 1);
	RETURN get_gps_point(@nearest_gps_id);
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure get_pictures
-- -----------------------------------------------------

USE `hikers_guide_to_the_galaxy`;
DROP procedure IF EXISTS `hikers_guide_to_the_galaxy`.`get_pictures`;

DELIMITER $$
USE `hikers_guide_to_the_galaxy`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_pictures`(
	givenUsername VarChar(45)
)
BEGIN
        
	-- Finding the trail_id from name
    set @user_id = (
    select user_id
    from users
    where users.username = givenUsername);
    

    select trails.name, pic_id, ST_X(gps_coords.point) as Lon, ST_Y(gps_coords.point) as Lat, pic
	from pictures join gps_coords using (gps_id) join trails using (trail_id)
	where user_id = @user_id;
        
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure get_pictures_on_trail
-- -----------------------------------------------------

USE `hikers_guide_to_the_galaxy`;
DROP procedure IF EXISTS `hikers_guide_to_the_galaxy`.`get_pictures_on_trail`;

DELIMITER $$
USE `hikers_guide_to_the_galaxy`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_pictures_on_trail`(
	givenTrail_id int
)
BEGIN
    
    select username, pic, ST_X(gps_coords.point) as Lon, ST_Y(gps_coords.point) as Lat
	from pictures join gps_coords using (gps_id) join users using (user_id)
	where trail_id = givenTrail_id;
        
END$$

DELIMITER ;

-- -----------------------------------------------------
-- function get_rating
-- -----------------------------------------------------

USE `hikers_guide_to_the_galaxy`;
DROP function IF EXISTS `hikers_guide_to_the_galaxy`.`get_rating`;

DELIMITER $$
USE `hikers_guide_to_the_galaxy`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `get_rating`(
	trailID VarChar(45)
) RETURNS float
BEGIN
	SET @rating = 
		(SELECT
			AVG(rating)
		FROM
        trail_reviews JOIN completed_trails USING (review_id)
        WHERE
		trail_id = trailID);
        
	RETURN @rating;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure get_reviews
-- -----------------------------------------------------

USE `hikers_guide_to_the_galaxy`;
DROP procedure IF EXISTS `hikers_guide_to_the_galaxy`.`get_reviews`;

DELIMITER $$
USE `hikers_guide_to_the_galaxy`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_reviews`(
	givenTrail_id int
)
BEGIN
    
    select username, rating, text
    from trail_reviews join completed_trails using (review_id) join users using (user_id)
    where trail_id = givenTrail_id;
        
END$$

DELIMITER ;

-- -----------------------------------------------------
-- function get_user_id
-- -----------------------------------------------------

USE `hikers_guide_to_the_galaxy`;
DROP function IF EXISTS `hikers_guide_to_the_galaxy`.`get_user_id`;

DELIMITER $$
USE `hikers_guide_to_the_galaxy`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `get_user_id`(
	usrName VarChar(45)
) RETURNS blob
BEGIN
	RETURN (SELECT users.user_id WHERE users.username = usrName);
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure remove_activity
-- -----------------------------------------------------

USE `hikers_guide_to_the_galaxy`;
DROP procedure IF EXISTS `hikers_guide_to_the_galaxy`.`remove_activity`;

DELIMITER $$
USE `hikers_guide_to_the_galaxy`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `remove_activity`(IN givenGPSID int, IN givendesc text)
BEGIN

	delete from activities
    where gps_id = givenGPSID and activities.desc = givendesc;

END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure remove_geocache
-- -----------------------------------------------------

USE `hikers_guide_to_the_galaxy`;
DROP procedure IF EXISTS `hikers_guide_to_the_galaxy`.`remove_geocache`;

DELIMITER $$
USE `hikers_guide_to_the_galaxy`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `remove_geocache`(IN givenGpsID int, IN givenUsername varchar(45))
BEGIN

	-- Finding the trail_id from name
    set @user_id = (
    select user_id
    from users
    where users.username = givenUsername);


	delete from geocaches
    where gps_id = givenGpsID and user_id = @user_id;

END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure remove_picture
-- -----------------------------------------------------

USE `hikers_guide_to_the_galaxy`;
DROP procedure IF EXISTS `hikers_guide_to_the_galaxy`.`remove_picture`;

DELIMITER $$
USE `hikers_guide_to_the_galaxy`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `remove_picture`(IN givenPic_id int)
BEGIN

    -- Delete the actual trail
    delete
    from pictures
    where pic_id = givenPic_id;


END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure remove_trail
-- -----------------------------------------------------

USE `hikers_guide_to_the_galaxy`;
DROP procedure IF EXISTS `hikers_guide_to_the_galaxy`.`remove_trail`;

DELIMITER $$
USE `hikers_guide_to_the_galaxy`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `remove_trail`(IN givenTrail_id int)
BEGIN

    -- Delete the actual trail
    delete
    from trails
    where trail_id = givenTrail_id;


END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure remove_trail_head
-- -----------------------------------------------------

USE `hikers_guide_to_the_galaxy`;
DROP procedure IF EXISTS `hikers_guide_to_the_galaxy`.`remove_trail_head`;

DELIMITER $$
USE `hikers_guide_to_the_galaxy`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `remove_trail_head`(IN gpsID int, IN trailID int)
BEGIN

    -- Delete the actual trail
    delete
    from trail_heads
    where gpsID = gps_id AND trail_id = trailID;


END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure remove_user
-- -----------------------------------------------------

USE `hikers_guide_to_the_galaxy`;
DROP procedure IF EXISTS `hikers_guide_to_the_galaxy`.`remove_user`;

DELIMITER $$
USE `hikers_guide_to_the_galaxy`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `remove_user`(IN givenUsername varchar(45))
BEGIN

	-- finally deleting the users
	delete from users
    where users.username = givenUsername;


END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure search
-- -----------------------------------------------------

USE `hikers_guide_to_the_galaxy`;
DROP procedure IF EXISTS `hikers_guide_to_the_galaxy`.`search`;

DELIMITER $$
USE `hikers_guide_to_the_galaxy`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `search`(
  IN trailName VarChar(255),   IN parkName VarChar(45),   IN minDifficulty INT(11),
  IN maxDifficulty INT(11),
  IN minLen INT(11),
  IN maxLen INT(11),
  IN maxDis INT(11),
  IN typeID INT(11),
  IN minRating INT(11),
  IN givenUsername varchar(45)
)
BEGIN

	SET SQL_SAFE_UPDATES = 0;
    
	set @user_id = (
    select user_id
    from users
    where username = givenUsername);

	drop table if exists temp;
	create temporary table temp (
    select *
    from trails
    where trails.trail_id = trails.trail_id);
    
    if trailName != "" then 
    
        delete from temp
        where temp.name != trailName;
	
	end if;
        
	if parkName != "" then
    
		set @park_id = (
		select park_id
		from parks
		where parks.name = parkName);
        
        if @park_id is null then
        truncate table temp;
        end if;
                    
		delete from temp
        where temp.park_id != @park_id;
                    
	end if;
        
	delete from temp
	where 
	temp.difficulty < minDifficulty 
	or
	temp.difficulty > maxDifficulty;
	
    delete from temp
    where
	temp.length < minLen
	or
	temp.length > maxLen;
    
    delete from temp
    where
	(SELECT get_nearest_head_distance(temp.trail_id, @user_id)) > maxDis or (SELECT count(get_nearest_head_distance(temp.trail_id, @user_id))) = 0;
	
    delete from temp
    where
	typeID != temp.type_id;

    delete from temp
    where
	(SELECT get_rating(temp.trail_id)) <= minRating;

    
    select *, get_nearest_head_distance(temp.trail_id, @user_id) as distance_to_user, get_rating(trail_id) as Trail_rating
    from temp
    order by get_nearest_head_distance(temp.trail_id, @user_id);
    
    SET SQL_SAFE_UPDATES = 1;
        
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure set_user_gps
-- -----------------------------------------------------

USE `hikers_guide_to_the_galaxy`;
DROP procedure IF EXISTS `hikers_guide_to_the_galaxy`.`set_user_gps`;

DELIMITER $$
USE `hikers_guide_to_the_galaxy`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `set_user_gps`(IN givenUsername varchar(45), IN Longitude float, IN Latitude float)
BEGIN

	set @user_id = (
    select user_id
    from users
    where username = givenUsername);

	update users
    set loc = point(Longitude, Latitude)
    where user_id = @user_id;

END$$

DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;