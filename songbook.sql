# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.21)
# Database: songbook
# Generation Time: 2020-12-17 15:15:16 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table album
# ------------------------------------------------------------

DROP TABLE IF EXISTS `album`;

CREATE TABLE `album` (
  `id` int(11) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `release_date` datetime NOT NULL,
  `artist_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`artist_id`),
  KEY `fk_album_artist1_idx` (`artist_id`),
  CONSTRAINT `fk_album_artist1` FOREIGN KEY (`artist_id`) REFERENCES `artist` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `album` WRITE;
/*!40000 ALTER TABLE `album` DISABLE KEYS */;

INSERT INTO `album` (`id`, `title`, `release_date`, `artist_id`)
VALUES
	(1,'Midt om natten','1983-05-20 00:00:00',1),
	(2,'Blood on the tracks','1975-09-10 00:00:00',2),
	(3,'Harvest Moon','1992-03-20 00:00:00',3),
	(4,'Closing Time','1973-02-18 00:00:00',4),
	(5,'Rain Dogs','1985-08-16 00:00:00',4);

/*!40000 ALTER TABLE `album` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table artist
# ------------------------------------------------------------

DROP TABLE IF EXISTS `artist`;

CREATE TABLE `artist` (
  `id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `info` blob,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `artist` WRITE;
/*!40000 ALTER TABLE `artist` DISABLE KEYS */;

INSERT INTO `artist` (`id`, `name`, `info`)
VALUES
	(1,'Kim Larsen',NULL),
	(2,'Bob Dylan',NULL),
	(3,'Neil Young',NULL),
	(4,'Tom Waits',NULL);

/*!40000 ALTER TABLE `artist` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table genre
# ------------------------------------------------------------

DROP TABLE IF EXISTS `genre`;

CREATE TABLE `genre` (
  `id` int(11) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `genre` WRITE;
/*!40000 ALTER TABLE `genre` DISABLE KEYS */;

INSERT INTO `genre` (`id`, `title`)
VALUES
	(1,'Pop'),
	(2,'Rock'),
	(3,'Reggea'),
	(4,'Jazz'),
	(5,'Blues'),
	(6,'Folk'),
	(7,'Country'),
	(8,'Heavy'),
	(9,'Elektronic'),
	(10,'Hip Hop');

/*!40000 ALTER TABLE `genre` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table song
# ------------------------------------------------------------

DROP TABLE IF EXISTS `song`;

CREATE TABLE `song` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `content` text,
  `genre_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`genre_id`),
  KEY `fk_song_genre1_idx` (`genre_id`),
  CONSTRAINT `fk_song_genre1` FOREIGN KEY (`genre_id`) REFERENCES `genre` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `song` WRITE;
/*!40000 ALTER TABLE `song` DISABLE KEYS */;

INSERT INTO `song` (`id`, `title`, `content`, `genre_id`)
VALUES
	(1,'Midt om natten','\n[Vers 1]\nStrisserne kom, før vi ventede dem\nMidt om natten\nSå mig og min baby vi var på den igen\nMidt om natten\nDe kylede gas gennem vinduerne\nSå tårerne de trillede i stuerne, åh ja\nMidt om natten\nMidt om natten\n\n[Vers 2]\nDet næste, der skete, tør jeg ikke tænke på\nMidt om natten\nEn fyr, vi kaldte Spacy, tog den ud i det blå\nMidt om natten\nHan ramte gaden fra en femte sal\nDet\' ikke vores skyld, han var bare bindegal\nSagde strisserne\nMidt om natten\nMidt om natten\n\n[Vers 3]\nDe lukked\' os ud, da klokken den var cirka tre\nMidt om natten\nDe sagde: \"Gå nu hjem\", men vi spurgte: \"Hvor er det?\"\nMidt om natten\nNu glæder jeg mig, til jeg bli\'r en gammel mand\nSå får jeg nok et værelse med lys og med vand\nOg der kommer strisserne vel næppe på besøg igen\nMidt om natten\nMidt om natten\nMidt om natten\nMidt om natten\n[Outro]\nÅåh, mañana\nHåber, vi får i morgen med\nÅåh, mañana\nHåber, vi får i morgen med\nÅåh, mañana\nHåber, vi får i morgen med\nÅåh, mañana\nHåber, vi får i morgen med\nÅåh, mañana\nHåber, vi får i morgen med\nÅåh, mañana\nHåber, vi får i morgen med\nÅåh, mañana\nHåber, vi får i morgen med',1),
	(2,'Susan Himmelblå','G                 Em           D   \r\nKære Susan med de himmelblå tillykke\r\nG                               Em                D\r\nmåske jeg bliver en smugle sentimental,når men tillykke\r\nAm         D               Am            D\r\nenglene de kyssede dig den dag du kom hertil\r\n    Am            D                   Am          D\r\ndet er jeg ganske sikker på,så kan du tro hva\' du vil\r\n\r\nG    F    G     F                   D\r\nÅh Susan, himmelblå ved du hvad jeg tænker på\r\nG        F                  G                         F\r\nhvis jeg ku\', så lovede jeg dig et langt og lykkeligt liv\r\n                 D\r\nmen jeg kan ikke spå\r\n\r\nHvis nogen siger det hele går ad helvedes til,så tro dem ikke\r\ndet har altid været sådan og det bli\'r det nok ved med,tror du ikke\r\nmen lov mig at du aldrig blir\' træt,af livet en skønne dag\r\nfor du er Susan himmelblå og det er dit fra nu af\r\n\r\nOMK\r\n\r\nJeg ved da godt du synes,at jeg er en gammel nar og hva\' så\r\njeg har prøvet mit nu skal du prøve dit,kom så\r\nhimmelen og stjernerne og fanden det store kvaj\r\nde står på hver sin side af dig,lige nu sig ja eller nej',1),
	(3,'Papirsklip','    D                    Em\r\nNår nu min verden bliver kold og forladt\r\nA                      D\r\nfinder jeg trøst i min kæreste skat\r\nBm                  Em\r\nklipper motiver med drømme og saks\r\nA                              D\r\npapirsilouetter af den fineste slags\r\n\r\nHer er et af min far og min mor\r\nde som gav mig til denne jord\r\nkærlige kys og et duft af jasmin\r\naltid solskin og sødeste min\r\n\r\nD\r\nLivet er langt\r\nEm\r\nlykken er kort\r\nA\r\nsalig er den\r\n        D            \r\nder tør give det bort    [Bm][E][A]\r\n\r\n\r\nHer er et af min bedste ven\r\nutallige klip går igen og igen\r\net aldrig færdigt eller fuldendt motiv\r\nsort silhouet af kvinden i mit liv',1),
	(4,'Haveje','            C\r\nJeg bor til leje\r\n     F\r\npå Haveje\r\n	G		 C\r\ni restaurant \"Den Gyldne Reje\"                    \r\n                    F\r\nmin kone hun har en skønhedsklinik\r\nG	       C\r\ninde midt i et negerdistrikt\r\n   F	       G	  C\r\nSå vi ber bare guderne om godt vejr\r\n   F	       G	  C\r\nja vi ber bare guderne om godt vejr\r\nF  G     C\r\nah åh jø-hø\r\nF  G     C\r\nah åh jø-hø\r\n\r\n\r\nDer er mange \r\naf de seje\r\nder bor til leje på Haveje\r\nmin kone vil så gerne eje \r\nen strandpromenade på Haveje\r\nSå vi ber bare...\r\n',1),
	(5,'Tangled Up In Blue','A  |  Asus4 sus2  |  A  |  Asus4 sus2\r\n\r\nA                        G\r\nEarly one morning the sun was shinin\'\r\n\r\nA                 G\r\nI was layin\' in bed.\r\n\r\nA                      G\r\nWondering if she\'d changed at all\r\n\r\n       D\r\nIf her hair was still red.\r\n\r\nA                                G\r\nHer folks they said that our lives together,\r\n\r\nA                     G\r\nSure was gonna be rough.\r\n\r\n     A                     G\r\nThey never did like Mama\'s home-made dress,\r\n\r\n        A\r\nPapa\'s bank book wasn\'t big enough.\r\n\r\n    E                     F#m\r\nAnd I was standing on the side of the road,\r\n\r\nA                     D\r\nRain falling on my shoes.\r\n\r\nE                           F#m\r\nHeading out for the old east coast,\r\n\r\n       A                   D\r\nLord knows I\'ve paid some dues,\r\n\r\n              E\r\nGetting through,\r\n\r\nG       D        A  |  Asus4 sus2  |  A  |  Asus4 sus2\r\nTangled up in blue.\r\n\r\n\r\nShe was married when we first met\r\nSoon to be divorced\r\nI helped her out of a jam I guess\r\nBut I used a little too much force\r\nWe drove that car as far as we could\r\nAbandoned it out west\r\nSplit up on a sad dark night\r\nBoth agreeing it was best\r\nShe turned around to look at me\r\nAs I was walking away\r\nI heard her say over her shoulder\r\nWe\'ll meet again some day\r\nOn the avenue\r\nTangled up in Blue\r\n\r\nI had a job in the great north woods\r\nWorking as a cook for a spell\r\nBut I never did like it all that  much\r\nAnd one day the axe just fell\r\nSo I drifted down to New Orleans\r\nWhere I was lucky to be employed\r\nWorkin\' for a while on a fishing boat\r\nRight outside of Delacroix\r\nBut all the while I was alone\r\nThe past was close behind\r\nI seen alot of women\r\nBut she never escaped my mind\r\nAnd I just grew\r\nTangled up in blue\r\n\r\nShe was working in topless place\r\nAnd I stopped in for a beer\r\nI just kept looking at the side of her face\r\nIn the spotlight so clear\r\nAnd later on when the crowd thinned out\r\nI was just about to do the same\r\nShe was standing there in back of my chair\r\nSaid to me Don\'t I know your name\r\nI muttered something undernaeth my breath\r\nShe studdied the lines on my face\r\nI must admit I felt a little uneasy\r\nWhen she bent down to tie the laces\r\nOf my shoe\r\nTangled up in blue\r\n\r\nShe lit a burner on the stove\r\nAnd offered me a pipe\r\nI thought you\'d never say hello she said\r\nYou look like the silent type\r\nThen open up a book of poems \r\nAnd handed it to me\r\nWritten by an Italian poet\r\n>From the thirteenth century\r\nAnd every one of them words rang true\r\nAnd glowed like burning coal\r\nPourin\' off of every page\r\nLike it was written in my soul\r\nFrom me to you\r\nTangled up in blue\r\n\r\nI lived with them on Montague Street\r\nIn a basement down the stairs\r\nThere was music in the cafes at night\r\nAnd revolution in the air\r\nThen he started dealing in slaves\r\nAnd something inside of died\r\nShe had to sell everything she owned\r\nAnd froze up inside.\r\nAnd when the bottom finally feel out\r\nI became withdrawn\r\nThe only thing I knew how to do\r\nWas to keep on keeping on\r\nLike a bird that flew\r\nTangled up in blue\r\n\r\nSo now I\'m going on back again\r\nI got to get to her some how\r\nAll the people we used to know\r\nThey\'re an illusion to me now\r\nSome are mathematicians\r\nSome are carpenters wives\r\nDon\'ty know how it all got started\r\nI don\'t know what they\'re doing with their lives\r\nBut me, I\'m still on the road\r\nHeadin\' for another joint\r\nWe always did feel the same\r\nWe just saw it from a different point of view\r\nTangled up in blue.',6),
	(6,'Simple Twist Of Fate','They sat together in the park\nAs the evening sky grew dark.\nShe looked at him and he felt a spark\nTingle to his bones.\n\'Twas then he felt alone\nAnd wished that he\'d gone straight\nAnd watched out for a simple twist of fate.\n\nThey walked alone by the old canal.\nA little confused, I remember well,\nAnd stopped into a strange hotel with a neon burning bright.\nHe felt the heat of the night hit him like a freight train\nMoving with a simple twist of fate.\n\nA saxophone someplace far off played\nAs she was walking on by the arcade\nAs the light bust through a beat up shade\nWhere he was waking up.\nShe dropped a coin into the cup of a blind man at the gate\nAnd forgot about a simple twist of fate.\n\nHe woke up; the room was bare.\nHe didn\'t see her anywhere.\nHe told himself he didn\'t care; pushed the window open wide;\nFelt an emptiness inside to which he just could not relate\nBrought on by a simple twist of fate.\n\nHe hears the ticking of the clocks\nAnd walks along with a parrot that talks.\nHunts her down by the waterfront docks\nWhere the sailors all come in.\nMaybe she\'ll pick him out again. How long must he wait\nOne more time for a simple twist of fate.\n\nPeople tell me it\'s a sin\nTo know and feel too much within.\nI still believe she was my twin, but I lost the ring.\nShe was born in spring, but I was born too late.\nBlame it on a simple twist of fate',6),
	(7,'You\'re a Big Girl Now','Our conversation was short and sweet\nIt nearly swept me off my feet\nAnd I\'m back in the rain, oh\nAnd you are on dry land\nYou made it there somehow\nYou\'re a big girl now\n\nBird on the horizon, sittin\' on a fence\nHe\'s singin\' his song for me at his own expense\nAnd I\'m just like that bird, oh\nSingin\' just for you\nI hope that you can hear\nHear me singin\' through these tears\n\nTime is a jet plane, it moves too fast\nOh, but what a shame if all we\'ve shared can\'t last\nI can change, I swear, oh\nSee what you can do\nI can make it through\nYou can make it, too\n\nLove is so simple, to quote a phrase\nYou\'ve known it all the time, I\'m learnin\' it these days\nOh, I know where I can find you, oh\nIn somebody\'s room\nIt\'s a price I have to pay\nYou\'re a big girl all the way\n\nA change in the weather is known to be extreme\nBut what\'s the sense of changing horses in midstream?\nI\'m going out of my mind, oh\nWith a pain that stops and starts\nLike a corkscrew to my heart\nEver since we\'ve been apart\n',6),
	(8,'Idiot Wind','C                                   D                       G\r\nSomeone\'s got it in for me, they\'re planting stories in the press\r\n   C                                       D                         G\r\nWhoever it is I wish they\'d cut it out but when they will I can only guess.\r\n     C            Hm                 Am                G\r\nThey say I shot a man named Gray and took his wife to Italy,\r\nC               Hm                Am               G\r\nShe inherited a million bucks and when she died it came to me.\r\n        Hm             D\r\nI can\'t help it if I\'m lucky.\r\n\r\nC                              D                               G\r\nPeople see me all the time and they just can\'t remember how to act\r\n      C                                 D                   G\r\nTheir minds are filled with big ideas, images and distorted facts.\r\nC         Hm            Am                  G\r\nEven you, yesterday you had to ask me where it was at,\r\n  C                      Hm                   Am             G\r\nI couldn\'t believe after all these years, you didn\'t know me better than that\r\nHm    D\r\nSweet lady.\r\n\r\nG           C                                G\r\nIdiot wind, blowing every time you move your mouth,\r\nC                                  D\r\nBlowing down the backroads headin\' south.\r\nG           C                                G\r\nIdiot wind, blowing every time you move your teeth,\r\n          G      C\r\nYou\'re an idiot, babe.\r\n       D                                 G         C - G\r\nIt\'s a wonder that you still know how to breathe.\r\n\r\n\r\nI ran into the fortune-teller, who said beware of lightning that might strike\r\nI haven\'t known peace and quiet for so long I can\'t remember what it\'s like.\r\nThere\'s a lone soldier on the cross, smoke pourin\' out of a boxcar door,\r\nYou didn\'t know it, you didn\'t think it could be done, in the final end he won the wars\r\nAfter losin\' every battle.\r\n\r\nI woke up on the roadside, daydreamin\' \'bout the way things sometimes are\r\nVisions of your chestnut mare shoot through my head and are makin\' me see stars.\r\nYou hurt the ones that I love best and cover up the truth with lies.\r\nOne day you\'ll be in the ditch, flies buzzin\' around your eyes,\r\nBlood on your saddle.\r\n\r\nIdiot wind, blowing through the flowers on your tomb,\r\nBlowing through the curtains in your room.\r\nIdiot wind, blowing every time you move your teeth,\r\nYou\'re an idiot, babe.\r\nIt\'s a wonder that you still know how to breathe.\r\n\r\nIt was gravity which pulled us down and destiny which broke us apart\r\nYou tamed the lion in my cage but it just wasn\'t enough to change my heart.\r\nNow everything\'s a little upside down, as a matter of fact the wheels have stopped,\r\nWhat\'s good is bad, what\'s bad is good, you\'ll find out when you reach the top\r\nYou\'re on the bottom.\r\n\r\nI noticed at the ceremony, your corrupt ways had finally made you blind\r\nI can\'t remember your face anymore, your mouth has changed, your eyes\r\ndon\'t look into mine.\r\nThe priest wore black on the seventh day and sat stone-faced while the building \r\nburned.\r\nI waited for you on the running boards, near the cypress trees, while the springtime \r\nturned Slowly into autumn.\r\n\r\nIdiot wind, blowing like a circle around my skull,\r\nFrom the Grand Coulee Dam to the Capitol.\r\nIdiot wind, blowing every time you move your teeth,\r\nYou\'re an idiot, babe.\r\nIt\'s a wonder that you still know how to breathe.\r\n\r\nI can\'t feel you anymore, I can\'t even touch the books you\'ve read\r\nEvery time I crawl past your door, I been wishin\' I was somebody else instead.\r\nDown the highway, down the tracks, down the road to ecstasy,\r\nI followed you beneath the stars, hounded by your memory\r\nAnd all your ragin\' glory.\r\n\r\nI been double-crossed now for the very last time and now I\'m finally free,\r\nI kissed goodbye the howling beast on the borderline which separated you from me.\r\nYou\'ll never know the hurt I suffered nor the pain I rise above,\r\nAnd I\'ll never know the same about you, your holiness or your kind of love,\r\nAnd it makes me feel so sorry.\r\n\r\nIdiot wind, blowing through the buttons of our coats,\r\nBlowing through the letters that we wrote.\r\nIdiot wind, blowing through the dust upon our shelves,\r\nWe\'re idiots, babe.\r\nIt\'s a wonder we can even feed ourselves.',6),
	(9,'Unknown Legend','She used to work in a diner\nNever saw a woman look finer\nI used to order just to watch her float across the floor\nShe grew up in a small town\nNever put her roots down\nDaddy always kept movin\', so she did too\n\nSomewhere on a desert highway\nShe rides a Harley-Davidson\nHer long blonde hair flyin\' in the wind\nShe\'s been runnin\' half her life\nThe chrome and steel she rides\nCollidin\' with the very air she breathes\nThe air she breathes\n\nYou know it ain\'t easy\nYou got to hold on\nShe was an unknown legend in her time\nNow she\'s dressin\' two kids\nLookin\' for a magic kiss\nShe gets the far-away look in her eyes\n\nSomewhere on a desert highway\nShe rides a Harley-Davidson\nHer long blonde hair flyin\' in the wind\nShe\'s been runnin\' half her life\nThe chrome and steel she rides\nCollidin\' with the very air she breathes\nThe air she breathes\n\nSomewhere on a desert highway\nShe rides a Harley-Davidson\nHer long blonde hair flyin\' in the wind\nShe\'s been runnin\' half her life\nThe chrome and steel she rides\nCollidin\' with the very air she breathes\nThe air she breathes',6),
	(11,'Harvest Moon','Come a little bit closer\r\nHear what I have to say\r\nJust like children sleepin\'\r\nWe could dream this night away.\r\n\r\nBut there\'s a full moon risin\'\r\nLet\'s go dancin\' in the light\r\nWe know where the music\'s playin\'\r\nLet\'s go out and feel the night.\r\n\r\nBecause I\'m still in love with you\r\nI want to see you dance again\r\nBecause I\'m still in love with you\r\nOn this harvest moon.\r\n\r\nWhen we were strangers\r\nI watched you from afar\r\nWhen we were lovers\r\nI loved you with all my heart.\r\n\r\nBut now it\'s gettin\' late\r\nAnd the moon is climbin\' high\r\nI want to celebrate\r\nSee it shinin\' in your eye.\r\n\r\nBecause I\'m still in love with you\r\nI want to see you dance again\r\nBecause I\'m still in love with you\r\nOn this harvest moon.',6),
	(12,'Ol\' \'55','        G                           Hm7\r\nWell my time went so quickly I went lickety-splitly\r\nC         D         G\r\nOut to my ol\' fifty-five\r\n     G           Hm7\r\nAs I pulled away slowly feelin\' so holy\r\n    C                    D   D7\r\nGod knows I was feelin\' alive.\r\n\r\n            G     Hm7    C  D  D7\r\nAnd now the sun\'s comin\' up\r\n    G           Hm7  C  D  D7\r\nI\'m ridin\' with Lady Luck\r\nG       Hm7      C     Hm\r\nFreeway cars and trucks\r\nAm    D            G   Em\r\nStars beginning to fade\r\nAm    D            G   Em\r\nAnd I lead the parade\r\nAm     D           Em\r\nJust a-wishin\' I\'d stayed a little longer\r\nA                       C                D7\r\nLord don\'t you know the feelin\'s gettin\' stronger.\r\n\r\nSix in the mornin\' gave me no warnin\'\r\nI had to be on my way.\r\nNow the cars are all passin\' me, trucks are all flashin\' me\r\nI\'m headed home from your place.\r\n\r\nAnd now the sun\'s comin\' up\r\nI\'m ridin\' with Lady Luck\r\nFreeway cars and trucks\r\nStars beginning to fade\r\nAnd I lead the parade\r\nJust a-wishin\' I\'d stayed a little longer\r\nLord don\'t you know the feelin\'s gettin\' stronger.\r\n\r\nWell my time went so quickly I went lickety-splitly\r\nOut to my ol\' fifty-five\r\nAs I pulled away slowly feelin\' so holy\r\nGod knows I was feelin\' alive.\r\n\r\n            C     Em7    F  G  G7    C           Em7    F  G  G7\r\nAnd now the sun\'s comin\' up      I\'m ridin\' with Lady Luck\r\nC       Em7      F       G G7    C           Em7    F  G  G7\r\nFreeway cars and trucks,         Ridin\' with Lady Luck\r\nC       Em7      F       G G7    C           Em7    F  G  G7\r\nFreeway cars and trucks,         Ridin\' with Lady Luck\r\n',6),
	(13,'I Hope That I Don\'t Fall in Love With You','   C                F                 G\r\nI hope that I don\'t fall in love with you\r\n      C           F                   G\r\nCause falling in love just makes me blue\r\n          F              C                F               C\r\nWell the music plays and you display your heart for me to see\r\n  F              C              F              G\r\nI had a beer and now I hear you calling out to me\r\n      C                 F                 G\r\nAnd I hope that I don\'t fall in love with you.\r\n\r\nNow the room is crowded, people everywhere\r\nAnd I wonder should I offer you a chair\r\nWell if you sit down with this old clown,\r\nhe\'ll take that frown and break it\r\nBefore the evening\'s gone away, I think that we could make it\r\nAnd I hope that I don\'t fall in love with you\r\n\r\nNow the night does funny things inside a man\r\nThese old tomcat feelings you don\'t understand\r\nI turn around and look at you, you light a cigarette\r\nWish I had the guts to bum one, but we\'ve never met\r\nAnd I hope that I don\'t fall in love with you\r\n\r\nAnd I can see that you are lonesome just like me\r\nAnd I\'m feeling like you\'d like some company\r\nWell I turn around to look at you, and you look back at me\r\nThe guy you\'re with is up and split, the chair next to you\'s free\r\nAnd I hope that you don\'t fall in love with me\r\n\r\nNow it\'s closing time, the music\'s fading out\r\nLast call for drinks I\'ll have another stout\r\nI turn around and look at you, you\'re nowhere to be found\r\nI search the place for your lost face, I guess I\'ll have another round\r\nand I think that I just fell in love with you',6),
	(14,'Old Shoes (& Picture Postcards)','I\'m singing this song, it\'s time it was sung\r\nI\'ve been putting it off for a while,\r\nBut it\'s harder by now, \'cause the truth is so clear\r\nThat I cry when I\'m seeing you smile.\r\nSo goodbye, so long, the road calls me dear\r\nAnd your tears cannot bind me anymore,\r\nAnd farewell to the girl with the sun in her eyes\r\nCan I kiss you, and then I\'ll be gone.\r\n\r\nEvery time that I tried to tell\r\nthat we\'d lost the magic we had at the start,\r\nI would weep my heart when I looked in your eyes\r\nAnd I searched once again for the spark.\r\nSo goodbye, so long, the road calls me dear\r\nAnd your tears cannot bind me anymore,\r\nAnd farewell to the girl with the sun in her eyes\r\nCan I kiss you, and then I\'ll be gone.\r\n\r\nI can see by your eyes, it\'s time now to go\r\nSo I\'ll leave you to cry in the rain,\r\nThough I held in my hand, the key to all joy\r\nHoney my heart was not born to be tamed.\r\nSo goodbye, so long, the road calls me dear\r\nAnd your tears cannot bind me anymore,\r\nAnd farewell to the girl with the sun in her eyes\r\nCan I kiss you, and then I\'ll be gone.\r\n\r\nSo goodbye, so long, the road calls me dear\r\nAnd your tears cannot bind me anymore,\r\nAnd farewell to the girl with the sun in her eyes\r\nCan I kiss you, and then I\'ll be gone,\r\nCan I kiss you, and then I\'ll be gone,\r\ncan I kiss you, and then I\'ll be gone.',6),
	(15,'Martha','Intro:  / D - A7 - / D - A7 - /\r\n        / Bm - A - / G - - - /  \r\n\r\nD  A7     D       A7           Bm      A    G\r\nOperator, number, please: it\'s been so many years\r\n     D     A7     D      A7    Bm      A         G\r\nWill she remember my old voice while I fight the tears?\r\n   D      B7        Em      A7      D       B7      Em     A7\r\nHello, hello there, is this Martha? this is old Tom Frost,\r\n    D    B7      Em      A7           Bm     A        G\r\nAnd I am calling long distance, don\'t worry \'bout the cost.\r\n       D    B7         Em       A7        D      B7       Em    A7\r\n\'Cause it\'s been forty years or more, now Martha please recall,\r\nD       B7      Em      A7          Bm    A       G\r\nMeet me out for coffee, where we\'ll talk about it all.\r\n\r\n \r\nChorus:\r\n    D                      G      D          G\r\nAnd those were the days of roses, poetry and prose and Martha\r\nBm            G               Em  A   D\r\nAll I had was you and all you had was me.\r\nD              G             D               G\r\nThere was no tomorrows, we\'d packed away our sorrows\r\n       Bm         G     Em  A D\r\nAnd we saved them for a rainy day.\r\n\r\n/ D - A7 - / D - A7 - /\r\n/ Bm - A - / G - - - /  \r\n\r\nAnd I feel so much older now, and you\'re much older too,\r\nHow\'s your husband? and how\'s the kids? you know that I got married \r\ntoo?\r\nLucky that you found someone to make you feel secure,\r\n\'Cause we were all so young and foolish, now we are mature.\r\n\r\nChorus\r\n \r\n/ D - A7 - / D - A7 - /\r\n/ Bm - A - / G - - - /\r\n\r\nAnd I was always so impulsive, I guess that I still am,\r\nAnd all that really mattered then was that I was a man.\r\nI guess that our being together was never meant to be.\r\nAnd Martha,    Martha,   I love you can\'t you see?\r\n\r\nChorus\r\n\r\n/ D - A7 - / D - A7 - /\r\n/ Bm - A - / G - - - /  \r\n\r\nAnd I remember quiet evenings trembling close to you...',6),
	(16,'Singapore','We sail tonight for Singapore\nWe\'re all as mad as hatters here\nI\'ve fallen for a tawny moor\nTook off to the land of nod\nDrank with all the Chinamen\nWalked the sewers of Paris\nI danced along a colored wind\nDangled from a rope of sand\nYou must say goodbye to me\n\nWe sail tonight for Singapore\nDon\'t fall asleep while you\'re ashore\nCross your heart and hope to die\nWhen you hear the children cry\nLet marrow bone and cleaver choose\nWhile making feet for children\'s shoes\nThrough the alley, back from hell\nWhen you hear that steeple bell\nYou must say goodbye to me\n\nWipe him down with gasoline\nTill his arms are hard and mean\nFrom now on boys this iron boat\'s your home\nSo heave away, boys\n\nWe sail tonight for Singapore\nTake your blankets from the floor\nWash your mouth out by the door\nThe whole town\'s made of iron ore\nEvery witness turns to steam\nThey all become Italian dreams\nFill your pockets up with earth\nGet yourself a dollar\'s worth\nAway boys, away boys, heave away\n\nThe captain is a one-armed dwarf\nHe\'s throwing dice along the wharf\nIn the land of the blind the one-eyed man is king\nSo take this ring\n\nWe sail tonight for Singapore\nWe\'re all as mad as hatters here\nI\'ve fallen for a tawny moor\nTook off to the land of nod\nDrank with all the Chinamen\nWalked the sewers of Paris\nI drank along a colored wind\nI dangled from a rope of sand\nYou must say goodbye to me',6),
	(17,'Big Black Mariah','Well, cutting through the cane break, rattling the sill\nThunder that the rain makes when the shadow tops the hill\nBig light on the back street, hill to ever more\nPacking down the ladder with the hammer to the floor\nHere come the Big Black Mariah, here come the Big Black Mariah\nHere come the Big Black Mariah, I seen the big black Ford\n\nWell, he\'s all boxed up on a red belle dame\nHunted Black Johnny with a blind man\'s cane\nA yellow bullet with a rag out in the wind\nAn old blind tiger, got an old bell Jim\nHere come the Big Black Mariah, here come the Big Black Mariah\nHere come the Big Black Mariah, here come the big black Ford\n\nSent to the skies on a Benny Jag Blue\nOff to bed without his supper like a Linda bride do\nHe got to do the story with the old widow Jones\nGot a wooden coat, this boy is never coming home\nHere come the Big Black Mariah, here come the Big Black Mariah\nHere come the Big Black Mariah, I seen that big black Ford\n\nCut through the canebrake, oh yeah\nWell, he\'s all boxed up on a red belle dame\nFlat Blue Johnny with a blind man\'s cane\nA hundred yellow bullets shook a rag out in the wind\nAn old blind tiger, on a bell you win\nHere come the Big Black Mariah, here come the Big Black Mariah\nHere come the Big Black Mariah, here come the big black Ford',6),
	(19,'Time','D\r\nThe smart money\'s on Harlem\r\nD\r\nAnd the moon is in the street\r\n    G               A7               D  \r\nThe shadow boys are breaking all the laws\r\n           D                  A7 \r\nAnd you\'re east of East Saint Louis\r\n        D\r\nAnd the wind is making speeches\r\n        G                           A7\r\nAnd the rain sounds like a round of applause\r\n\r\n\r\nD\r\nNapoleon is weeping\r\nD\r\nIn the carnival saloon\r\n       G        A7             D\r\nHis invisible fiance\'s in the mirror\r\n        D             A7\r\nAnd the band is going home\r\n             D\r\nIt\'s raining hammers, it\'s raining nails\r\n     G                                  A7\r\nIt\'s true there\'s nothing left for him down here\r\n\r\n\r\nCHORUS:\r\n\r\n         D     A7    D \r\nAnd it\'s time, time, time\r\n         G     D     A7 \r\nAnd it\'s time, time, time\r\n         D     F#m   G              Em\r\nAnd it\'s time, time, time, that you love\r\n         D     A7    D\r\nAnd it\'s time, time, time\r\n\r\n\r\nVERSE 2:\r\n\r\nD\r\nAnd they all pretend they\'re orphans\r\nD\r\nAnd their memory\'s like a train\r\n        G              A7                   D\r\nYou can see it getting smaller as it pulls away\r\n        D                  A7\r\nAnd the things you can\'t remember\r\n         D\r\nTell the things you can\'t forget\r\n     G                             A7 \r\nThat history puts a saint in every dream\r\n\r\nD\r\nWell she said she\'d stick around\r\nD\r\nUntil the bandages came off\r\n          G                A7                 D\r\nBut these mama\'s boys just don\'t know when to quit\r\n       D                 A7\r\nAnd Matilda asks the sailors\r\n          D\r\nAre those dreams or are those prayers?\r\n     G                          A7\r\nSo close your eys, son and this won\'t hurt a bit\r\n\r\n\r\nCHORUS...\r\n\r\n\r\nVERSE 3:\r\n\r\nD\r\nWell things are pretty lousy\r\nD\r\nFor a calendar girl\r\n    G                    A7                D\r\nThe boys just dive right off the cars and into the street\r\n    D                 A7\r\nAnd when they\'re on a roll\r\n            D\r\nShe pulls a razor from her boot\r\n      G                                A7\r\nAnd a thousand pigeons fall around her feet\r\n\r\n\r\nD\r\nSo put a candle in the window\r\nD\r\nAnd a kiss upon his lips\r\n       G                A7                D\r\nAs the dish outside the window fills with rain\r\nD                A7\r\nJust like a stranger\r\n         D\r\nWith the weeds in your heart\r\n    G                                A7\r\nAnd pay the fiddler off \'till I come back again\r\n\r\n\r\nCHORUS x2',6),
	(21,'Romeo','D \r\nDer\' no\'ed ved denne scene \r\n    B7                                Em \r\nder minder mig om Romeo og Julie \r\n    A7                         F#7            Bm \r\nDen minder også om hvor lidt du bru\'r din fantasi \r\n     D                       B7              Em \r\nI stedet for at grine gør du livet til det allermest    \r\n   A7                                   F#7       Bm G  Em \r\nDu ender tragikomisk uden vid\'re i melankoli - og nostalgi \r\n          F#7sus \r\nsom er en pestilens for dem der no\'ed at si\' - men \r\n \r\nD      A/C#  Am/c    B7         Em \r\nRomeo   -   vågner aldrig af drømmen \r\nA             D \r\nstår på balkonen \r\nH                Em \r\nRomeo, når Julie \r\nA7             G       Em7 A7sus F#7sus A7 \r\ngår med en anden hjem \r\n \r\nHvad hjælper det at vente \r\npå en der længst er fløjet forbi dig. \r\nJeg er sikker  på hun kendte \r\nhver en tone i din melodi. \r\nHvad hjælper dine sange \r\nhvis de egentlig ikke har mere at gi\' af. \r\nSignor \'Sole mio\' \r\ndu er fanget i en maskepi \r\nW:C: Fields ville ha\' forlangt en whisky \r\nog et klart dementi - men \r\n \r\nRomeo...... \r\n \r\nDer\' no\'ed ved denne scene \r\nder minder mig om Romeo og Julie. \r\nHvis det ikke var fordi - det\' lissom om \r\nder altså mangler en. \r\nDu styrter rundt alene \r\nmens du rimer på det allermest uduelige. \r\nDer er ingen hjælp at hente \r\nnår suffløren holder feriefri. \r\nSå tæl til ti \r\nog hvis hun ikke venter i kulissen \r\ner det sikkert forbi - men \r\n \r\nRomeo.........',2);

/*!40000 ALTER TABLE `song` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table song_album_rel
# ------------------------------------------------------------

DROP TABLE IF EXISTS `song_album_rel`;

CREATE TABLE `song_album_rel` (
  `album_id` int(11) NOT NULL,
  `song_id` int(11) NOT NULL,
  PRIMARY KEY (`album_id`,`song_id`),
  KEY `fk_song_album_rel_album_idx` (`album_id`),
  KEY `fk_song_album_rel_song1_idx` (`song_id`),
  CONSTRAINT `song_album_rel_ibfk_1` FOREIGN KEY (`song_id`) REFERENCES `song` (`id`) ON DELETE CASCADE,
  CONSTRAINT `song_album_rel_ibfk_2` FOREIGN KEY (`album_id`) REFERENCES `album` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `song_album_rel` WRITE;
/*!40000 ALTER TABLE `song_album_rel` DISABLE KEYS */;

INSERT INTO `song_album_rel` (`album_id`, `song_id`)
VALUES
	(1,1),
	(1,2),
	(1,3),
	(1,4),
	(2,5),
	(2,6),
	(2,7),
	(2,8),
	(3,9),
	(3,11),
	(4,12),
	(4,13),
	(4,14),
	(4,15),
	(5,12),
	(5,16),
	(5,17),
	(5,19);

/*!40000 ALTER TABLE `song_album_rel` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
