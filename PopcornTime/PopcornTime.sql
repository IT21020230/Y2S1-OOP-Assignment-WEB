CREATE TABLE `popcorntimedb`.`usertb` (
  `user_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(50) NOT NULL,
  `username` VARCHAR(20) NOT NULL,
  `password` VARCHAR(20) NOT NULL,
  `role` CHAR(1) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE INDEX `user_id_UNIQUE` (`user_id` ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  UNIQUE INDEX `username_UNIQUE` (`username` ASC) VISIBLE);
  
CREATE TABLE `popcorntimedb`.`movietb` (
  `movie_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NULL,
  `description` longtext NULL,
  `release_date` DATE NULL,
  `budget` DECIMAL(15,2) UNSIGNED NULL DEFAULT 0.00,
  `country` VARCHAR(20) NULL,
  `language` VARCHAR(20) NULL,
  `director` VARCHAR(30) NULL,
  `production_company` VARCHAR(30) NULL,
  `runtime` INT(5) UNSIGNED NULL DEFAULT 0,
  `rating` VARCHAR(10) NULL DEFAULT 'RATED NR',
  `poster_image` VARCHAR(50) NULL,
  `banner_image` VARCHAR(50) NULL,
  `trailer` VARCHAR(100) NULL,
  `path` VARCHAR(50) NULL,
  PRIMARY KEY (`movie_id`),
  UNIQUE INDEX `movie_id_UNIQUE` (`movie_id` ASC) VISIBLE);
  
CREATE TABLE `popcorntimedb`.`tvseriestb` (
  `tvseries_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NULL,
  `description` longtext NULL,
  `release_date` DATE NULL,
  `budget` DECIMAL(15,2) UNSIGNED NULL DEFAULT 0.00,
  `country` VARCHAR(20) NULL,
  `language` VARCHAR(20) NULL,
  `director` VARCHAR(30) NULL,
  `production_company` VARCHAR(30) NULL,
  `rating` VARCHAR(10) NULL DEFAULT 'RATED NR',
  `poster_image` VARCHAR(50) NULL,
  `banner_image` VARCHAR(50) NULL,
  `trailer` VARCHAR(100) NULL,
  `seasons` INT(4) UNSIGNED NOT NULL DEFAULT 1,
  PRIMARY KEY (`tvseries_id`),
  UNIQUE INDEX `tvseries_id_UNIQUE` (`tvseries_id` ASC) VISIBLE);
  
CREATE TABLE `popcorntimedb`.`episodetb` (
  `episode` INT(4) UNSIGNED NOT NULL,
  `season` INT(4) UNSIGNED NOT NULL,
  `tvshow` INT UNSIGNED NOT NULL,
  `path` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`episode`, `season`, `tvshow`),
  INDEX `tvshow_idx` (`tvshow` ASC) VISIBLE,
  CONSTRAINT `tvshowfk`
    FOREIGN KEY (`tvshow`)
    REFERENCES `popcorntimedb`.`tvseriestb` (`tvseries_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

CREATE TABLE `popcorntimedb`.`celebritytb` (
  `celebrity_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `biography` longtext NULL,
  `dob` DATE NULL,
  `gender` VARCHAR(7) NULL,
  `country` VARCHAR(20) NULL,
  `poster_image` VARCHAR(50) NULL,
  `banner_image` VARCHAR(50) NULL,
  PRIMARY KEY (`celebrity_id`),
  UNIQUE INDEX `celebrity_id_UNIQUE` (`celebrity_id` ASC) VISIBLE);
  
CREATE TABLE `popcorntimedb`.`moviecelebritytb` (
  `movie` INT UNSIGNED NOT NULL,
  `celebrity` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`movie`, `celebrity`),
  CONSTRAINT `moviecelebrityfk`
    FOREIGN KEY (`movie`)
    REFERENCES `popcorntimedb`.`movietb` (`movie_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY (`celebrity`)
    REFERENCES `popcorntimedb`.`celebritytb` (`celebrity_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);
    
CREATE TABLE `popcorntimedb`.`tvshowcelebritytb` (
  `tvshow` INT UNSIGNED NOT NULL,
  `celebrity` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`tvshow`, `celebrity`),
  CONSTRAINT `tvshowcelebrityfk`
    FOREIGN KEY (`tvshow`)
    REFERENCES `popcorntimedb`.`tvseriestb` (`tvseries_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY (`celebrity`)
    REFERENCES `popcorntimedb`.`celebritytb` (`celebrity_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);
  
insert into usertb (email, username, password, role) values ('wudeshp@gmail.com', 'udesh2000', '1234', 'u');
insert into usertb (email, username, password, role) values ('sahan@gmail.com', 'sahan2000', '2345', 'u');
insert into usertb (email, username, password, role) values ('kithmina@gmail.com', 'kithmina2001', '3456moviecelebritytb', 'e');
insert into usertb (email, username, password, role) values ('sandali@gmail.com', 'sandali2001', '4567', 'm');

insert into movietb (name, description, release_date, budget, country, language, director, production_company, runtime) values ('Jumanji', 'The story centers on a supernatural board game that releases jungle-based hazards upon its players with every turn they take. As a boy in 1969, Alan Parrish became trapped inside the game itself while playing with his friend, Sarah Whittle. Twenty-six years later, siblings Judy & Peter Shepherd find the game, begin playing,then unwittingly release the now-adult Alan. After tracking down Sarah, the quartet resolves to finish the game in order to reverse all of the destruction it has caused.', '1995-12-15', '65000000', 'USA', 'English', 'Joe Johnston', 'TriStar Pictures', '104');
insert into movietb (name, description, release_date, budget, country, language, director, production_company, runtime) values ('The Avengers', 'Loki, the adopted brother of Thor, teams-up with the Chitauri Army & uses the Tesseracts power to travel from Asgard to Midgard to plot the invasion of Earth & become a king. The director of the agency S.H.I.E.L.D., Nick Fury, sets in motion project Avengers, joining Tony Stark a.k.a. the Iron Man; Steve Rogers, a.k.a. Captain America; Bruce Banner, a.k.a. The Hulk; Thor; Natasha Romanoff, a.k.a. Black Widow; & Clint Barton, a.k.a. Hawkeye, to save the world from the powerful Loki & the alien invasion.', '2012-05-04', '220000000', 'USA', 'English', 'Joss Whedon', 'Marvel Studios', '143');
insert into movietb (name, description, release_date, budget, country, language, director, production_company, runtime) values ('Harry Potter – The Philosopher Stone', 'Adaptation of the first of J.K. Rowlings popular childrens novels about Harry Potter, a boy who learns on his eleventh birthday that he is the orphaned son of two powerful wizards & possesses unique magical powers of his own. He is summoned from his life as an unwanted child to become a student at Hogwarts, an English boarding school for wizards. There, he meets several friends who become his closest allies & help him discover the truth about his parents mysterious deaths.', '2001-11-04', '125000000', 'UK', 'English', 'Chris Columbus', 'Warner Bros Pictures', '152');
insert into movietb (name, description, release_date, budget, country, language, director, production_company, runtime) values ('The Hobbit', 'Bilbo Baggins is swept into a quest to reclaim the lost Dwarf Kingdom of Erebor from the fearsome dragon Smaug. Approached out of the blue by the wizard Gandalf the Grey, Bilbo finds himself joining a company of thirteen dwarves led by the legendary warrior, Thorin Oakenshield. Their journey will take them into the Wild; through treacherous lands swarming with Goblins & Orcs, deadly Wargs & Giant Spiders, Shapeshifters & Sorcerers. Although their goal lies to the East & the wastelands of the Lonely Mountain first they must escape the goblin tunnels, where Bilbo meets the creature that will change his life forever ... Gollum. Here, alone with Gollum, on the shores of an underground lake, the unassuming Bilbo Baggins not only discovers depths of guile & courage that surprise even him, he also gains possession of Gollums "precious" ring that holds unexpected & useful qualities ... A simple, gold ring that is tied to the fate of all Middle-earth in ways Bilbo cannot begin to know', '2012-11-28', '315000000', 'USA', 'English', 'Peter Jackson', 'Warner Bros. Pictures ', '169');
insert into movietb (name, description, release_date, budget, country, language, director, production_company, runtime) values ('Back to the Future', 'Marty McFly, a 17-year-old high school student, is accidentally sent thirty years into the past in a time-traveling DeLorean invented by his close friend, the eccentric scientist Doc Brown.Marty McFly, a typical American teenager of the Eighties, is accidentally sent back to 1955 in a plutonium-powered DeLorean "time machine" invented by a slightly mad scientist. During his often hysterical, always amazing trip back in time, Marty must make certain his teenage parents-to-be meet & fall in love - so he can get back to the future.', '1985-07-03', '19000000', 'USA', 'English', 'Robert Zemeckis', 'Amblin Entertainment', '116');
insert into movietb (name, description, release_date, budget, country, language, director, production_company, runtime) values ('Inception', 'Dominic Cobb is an spy who instead of breaking into a persons home, office, or even computer, gets the information he needs by getting into the persons mind through their dreams. Cobb is also a fugitive who misses his children. Someone approaches Cobb & wants to hire him but instead of getting information out, the man wants Cobb to implant something, a process called "inception", which is not easy to do. Cobb is hesitant to do it, but when the man offers to help Cobb go back to his children, Cobb agrees. So he assembles his team but when they begin, there are things Cobb did not tell his team that could jeopardize the job, & when they occur, they are not sure if they should continue.', '2010-07-08', '160000000', 'USA', 'English', 'Christopher Nolan', 'Warner Bros. Pictures ', '148');

INSERT INTO tvseriestb (name, description, release_date, budget, country, language, director, production_company) VALUES ('The Witcher', 'The Witcher is a fantasy drama web television series created by Lauren Schmidt Hissrich for Netflix. It is based on the book series of the same name by Polish writer Andrzej Sapkowski. The Witcher follows the story of Geralt of Rivia, a solitary monster hunter, who struggles to find his place in a world where people often prove more wicked than monsters & beasts. But when destiny hurtles him toward a powerful sorceress, & a young princess with a special gift, the three must learn to navigate independently the increasingly volatile Continent.', '2019-12-20', 2370000000, 'USA', 'English', 'Sean Daniel', 'Stillking Films');
INSERT INTO tvseriestb (name, description, release_date, budget, country, language, director, production_company) VALUES ('Friends', 'Six young (20-something) people from New York City (Manhattan), on their own & struggling to survive in the real world, find the companionship, comfort & support they get from each other to be the perfect antidote to the pressures of life. This average group of buddies goes through massive mayhem, family trouble, past &future romances, fights, laughs, tears & surprises as they learn what it really means to be a friend.', '1994-09-22', 20000000, 'USA', 'English', 'David Crane', 'Warner Bros Television');
INSERT INTO tvseriestb (name, description, release_date, budget, country, language, director, production_company) VALUES ('Sherlock', 'A modern adaptation of the famous Sir Arthur Conan Doyle stories. Sherlock Holmes lives in 21st century London, a city filled with mystery, crime & deceit. The back streets are alive with robbers, blackmailers, smugglers & serial killers. When the police are desperate they call upon Mr Sherlock Holmes & his unconventional methods of deduction to shed light on the matter. Ably assisted by Doctor John Watson, a recently returned Afghanistan vet, Sherlock attempts to solve some of the countries most intriguing puzzles.', '2010-07-25', 23000000, 'UK', 'English', 'Mark Gatiss', 'Hartswood Films');
INSERT INTO tvseriestb (name, description, release_date, budget, country, language, director, production_company) VALUES ('Rick & Morty', 'Rick, an alcoholic mad scientist, stumbles into his grandson Mortys room begging for help on an intergalactic adventure. Morty reluctantly agrees & finds himself on a never ending quest across time, dimension & space. Morty must keep Rick in check as he causes havoc everywhere they go. Traveling across the multiverse together, super genius Rick Sanchez and his grandson Morty Smith embark on wacky adventures where only one thing is absolute: Rick is the smartest madman in all the multiverse & nothing can change that, portal guns & all.', '2013-12-02',10000000, 'USA', 'English', 'Dan Harmon', 'Williams Street');
INSERT INTO tvseriestb (name, description, release_date, budget, country, language, director, production_company) VALUES ('Mr. Robot', 'Young, anti-social computer programmer Elliot works as a cybersecurity engineer during the day, but at night he is a vigilante hacker. He is recruited by the mysterious leader of an underground group of hackers to join their organization. Elliots task? Help bring down corporate America, including the company he is paid to protect, which presents him with a moral dilemma. Although he works for a corporation, his personal beliefs make it hard to resist the urge to take down the heads of multinational companies that he believes are running & ruining the world.', '2015-06-24',25000000, 'USA', 'English', 'Sam Esmail', 'Universal Cable Productions');
INSERT INTO tvseriestb (name, description, release_date, budget, country, language, director, production_company) VALUES ('Game Of Thrones', 'Based on the best-selling book series "A Song of Ice & Fire" by George R.R. Martin, this sprawling HBO drama is set in a world where summers span several decades & winters can last a lifetime. From the scheming south & the savage eastern lands, to the frozen north & ancient Wall that protects the realm from the mysterious darkness beyond, the powerful families of the Seven Kingdoms are locked in a battle for the Iron Throne. This is a story of duplicity & treachery, nobility & honor, conquest & triumph. In the Game of Thrones, you either win or you die.', '2011-04-17',100000000, 'USA', 'English', 'David Benioff', 'HBO Entertainment');
                    
INSERT INTO celebritytb(name, biography, dob, gender, country) VALUES ('Tom Holland', 'Thomas Stanley Holland (born 1 June 1996) is an English actor. His accolades include a British Academy Film Awards, three Saturn Awards, a Guinness World Record & an appearance on the Forbes 30 under 30 Europe list. Some publications have called him one of the most popular actors of his generation. Holland career began at age nine when he enrolled in a dancing class, where a choreographer noticed him & arranged for him to audition for a role in Billy Elliot the Musical at Londons Victoria Palace Theatre After two years of training, he secured a supporting part in 2008 & was upgraded to the title role that year, which he played until 2010. Holland made his film debut in the disaster drama The Impossible (2012) as a teenage tourist trapped in a tsunami, for which he received a London Film Critics Circle Award for Young British Performer of the Year. After this, Holland decided to pursue acting as a full-time career, appearing in How I Live Now (2013) & playing historical figures in the film In the Heart of the Sea (2015) & the miniseries Wolf Hall (2015).', '1996-06-01', 'Male', 'USA');
INSERT INTO celebritytb(name, biography, dob, gender, country) VALUES ('Emma Watson', 'Emma Charlotte Duerre Watson (born 15 April 1990) is an English actress & activist. Known for her roles in both blockbusters & independent films, as well as for her women rights work, she has received a selection of accolades, including a Young Artist Award & three MTV Movie Awards. Watson has been ranked among the world highest-paid actresses by Forbes & Vanity Fair, & was named one of the 100 most influential people in the world by Time magazine in 2015. Watson attended the Dragon School & trained in acting at the Oxford branch of Stagecoach Theatre Arts. As a child, she rose to stardom after landing her first professional acting role as Hermione Granger in the Harry Potter film series, having previously acted only in school plays. Watson also starred in the 2007 television adaptation of the novel Ballet Shoes & lent her voice to The Tale of Despereaux (2008). After the final Harry Potter film, she took on a supporting role in My Week with Marilyn (2011), before starring as Sam, a flirtatious, free-spirited student in The Perks of Being a Wallflower (2012) to critical success. ', '1990-04-15', 'Female', 'UK');
INSERT INTO celebritytb(name, biography, dob, gender, country) VALUES ('Chris Evans', 'Christopher Robert Evans (born June 13, 1981) is an American actor. He began his career with roles in television series, such as in Opposite Sex in 2000. Following appearances in several teen films including 2001 Not Another Teen Movie, he gained attention for his portrayal of Marvel Comics character the Human Torch in 2005 Fantastic Four, & its sequel Fantastic Four: Rise of the Silver Surfer (2007). Evans made further appearances in film adaptations of comic books &graphic novels: TMNT (2007), Scott Pilgrim vs. the World (2010), & Snowpiercer (2013). He gained wider recognition for his portrayal of Steve Rogers / Captain America in several Marvel Cinematic Universe films, namely Captain America: The First Avenger (2011), Captain America: The Winter Soldier (2014), & Captain America: Civil War (2016), & the ensemble films The Avengers (2012), Avengers: Age of Ultron (2015), Avengers: Infinity War (2018), & Avengers: Endgame (2019). His work on the Marvel series established him as one of the worlds highest-paid actors.', '1981-06-13', 'Male', 'USA');
INSERT INTO celebritytb(name, biography, dob, gender, country) VALUES ('Jennifer Lawrence', 'Jennifer Shrader Lawrence (born August 15, 1990) is an American actress. The worlds highest-paid actress in 2015 & 2016, her films have grossed over $6 billion worldwide to date. She appeared in Times 100 most influential people in the world list in 2013 & the Forbes Celebrity 100 list from 2013 to 2016. During her childhood, Lawrence performed in church plays & school musicals. At the age of 14, she was spotted by a talent scout while vacationing in New York City with her family. She moved to Los Angeles & began her acting career in guest roles on television. Her first major role was that of a main cast member on the sitcom The Bill Engvall Show (2007–2009). She made her film debut in a supporting role in the drama Garden Party (2008), & had her breakthrough playing a poverty-stricken teenager in the independent mystery drama Winter Bone (2010). Lawrence career progressed with starring roles as the mutant Mystique in the X-Men film series (2011–2019) & Katniss Everdeen in The Hunger Games film series (2012–2015). The latter made her the highest-grossing action heroine of all time.', '1990-08-15', 'Female', 'USA');
INSERT INTO celebritytb(name, biography, dob, gender, country) VALUES ('Ryan Reynolds', 'Ryan Rodney Reynolds (born October 23, 1976) is a Canadian-American actor & producer. Throughout his 30-year career in film & television, he has received multiple accolades, including a Critics Choice Movie Award, three Peoples Choice Awards, a Grammy & Golden Globe nomination, & a star on the Hollywood Walk of Fame. Led by his several appearances as Deadpool in Marvel films, he is one of the highest-grossing film actors of all time, with a worldwide box-office gross of over $5 billion worldwide. He began his career starring in the Canadian teen soap opera Hillside (1991–1993), & had minor roles before landing the lead role on the sitcom Two Guys & a Girl between 1998 &2001. Reynolds then starred in a range of films, including comedies such as National Lampoon Van Wilder (2002), Waiting... (2005), 7 The Proposal (2009). He also performed in dramatic roles in Buried (2010), Woman in Gold (2015), & Life (2017), starred in action films such as Blade: Trinity (2004), Green Lantern (2011), 6 Underground (2019) & Free Guy (2021), & provided voice acting in the animated features The Croods film series (2013–2020), Turbo (2013) & Pokémon: Detective Pikachu (2019).', '1976-10-23','Male', 'USA');

UPDATE movietb SET trailer='https://www.youtube.com/watch?v=eTjDsENDZ6s&t=16s' WHERE movie_id=1;
UPDATE movietb SET trailer='https://www.youtube.com/watch?v=eOrNdBpGMv8&t=27s' WHERE movie_id=2;
UPDATE movietb SET trailer='https://www.youtube.com/watch?v=VyHV0BRtdxo&t=1s' WHERE movie_id=3;
UPDATE movietb SET trailer='https://www.youtube.com/watch?v=SDnYMbYB-nU' WHERE movie_id=4;
UPDATE movietb SET trailer='https://www.youtube.com/watch?v=qvsgGtivCgs' WHERE movie_id=5;
UPDATE movietb SET trailer='https://www.youtube.com/watch?v=YoHD9XEInc0&t=20s' WHERE movie_id=6;

UPDATE tvseriestb SET trailer='https://www.youtube.com/watch?v=ndl1W4ltcmg' WHERE tvseries_id='1';
UPDATE tvseriestb SET trailer='https://www.youtube.com/watch?v=LTpmw0Ac6Zs' WHERE tvseries_id='2';
UPDATE tvseriestb SET trailer='https://www.youtube.com/watch?v=IrBKwzL3K7s' WHERE tvseries_id='3';
UPDATE tvseriestb SET trailer='https://www.youtube.com/watch?v=BFTSrbB2wII' WHERE tvseries_id='4';
UPDATE tvseriestb SET trailer='https://www.youtube.com/watch?v=xIBiJ_SzJTA' WHERE tvseries_id='5';
UPDATE tvseriestb SET trailer='https://www.youtube.com/watch?v=KPLWWIOCOOQ' WHERE tvseries_id='6';
