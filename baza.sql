-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 13, 2024 at 09:58 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `baza`
--

-- --------------------------------------------------------

--
-- Table structure for table `korisnik`
--

CREATE TABLE `korisnik` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `korisnik`
--

INSERT INTO `korisnik` (`id`, `username`, `password`, `is_admin`) VALUES
(31, 'admin', '$2y$10$c1Jkq1UsuIzs.OAG5fUzS.hbQ4R.NsLSunGEEcwWzqjoqssVUFCz6', 1),
(32, 'chupimir', '$2y$10$kp4nCxye6XLrS3FL5qlvRO6tKJAm8tLPzd0jEryPINlcFiO5kf4YO', 0);

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `summary` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `category` varchar(50) NOT NULL,
  `archived` tinyint(1) NOT NULL DEFAULT 0,
  `date` date DEFAULT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id`, `title`, `summary`, `content`, `category`, `archived`, `date`, `image`) VALUES
(8, 'Dortmund boss Terzic departs after asking to leave', 'Borussia Dortmund have parted company with manager Edin Terzic after he asked the club \"to terminate his contract with immediate effect\"', 'Dortmund reached the Champions League final in 2023-24 under Terzic but they were beaten by Real Madrid at Wembley.\r\n\r\nThe German club said they agreed to Terzic\'s request following \"a joint discussion\".\r\n\r\n\"After the game at Wembley, I asked for a meeting with the club’s senior management team, because after nine years at BVB - including six on the coaching staff and two and a half as head coach - I feel that the club’s new era should begin with a new man on the touchline,\" said Terzic, 41.\r\n\r\n\"Everyone close to me knows that this has been a very difficult decision for me to take over the last few weeks, but after intensive discussions my fundamental feeling has not changed.\r\n\r\n\"I wish Borussia Dortmund the very best, thank you and see you soon.”\r\n\r\nTerzic began his coaching career with Dortmund\'s academy between 2010 and 2013 before becoming Slaven Bilic\'s assistant at Turkish club Besiktas.\r\n\r\nHe followed Bilic to Premier League side West Ham in 2015 but left following the Croatian\'s sacking in November 2017, re-joining Dortmund as Lucien Favre\'s assistant the following year.\r\n\r\nFollowing Favre\'s dismissal in December 2020, Terzic was named interim boss until the end of that season and led the club to German Cup final success with victory over RB Leipzig.\r\n\r\nHe then had a stint as the club\'s technical director before becoming their manager in 2022.\r\n\r\nDortmund finished runners-up in the Bundesliga last season - missing out on the title after failing to beat Mainz on the final day of the campaign - and followed that up with a fifth-place finish in the 2023-24 campaign, which achieved qualification for next season\'s Champions League.\r\n\r\n“Edin Terzic has done an outstanding job in his time at BVB, and we all owe him a huge debt of gratitude,\" said Dortmund chief executive Hans-Joachim Watzke.', 'sport', 0, '0000-00-00', 'uploads/G-Terzic-Abgang_bvbnachrichtenbild_regular.jpg'),
(9, 'Lakers legend and NBA logo muse West dies aged 86', 'Jerry West, the basketball legend whose silhouette inspired the iconic NBA logo, has died aged 86, the Los Angeles Clippers have confirmed.', 'West featured in nine NBA Finals with the Los Angeles Lakers, winning the title once in 1972.\r\n\r\nHe was also an NBA All-Star in every season of his 14-year playing career.\r\n\r\n\"Jerry West, the personification of basketball excellence and a friend to all who knew him, passed away peacefully this morning at the age of 86. His wife, Karen, was by his side,\" the Clippers announced.\r\n\r\nWest was the third player in league history to reach 25,000 points after Wilt Chamberlain and Oscar Robertson - retiring on 25,192.\r\n\r\nHe was part of the USA team that won a gold medal at the 1960 Olympics in Rome and was nicknamed \"Mr Clutch\" for his ability to deliver late in a game.\r\n\r\nThe American called time on his playing career in 1974 and moved into coaching two years later, spending three seasons in charge of the Lakers.\r\n\r\nWest later became an NBA executive and is credited with building the Showtime Lakers of the 1980s, which won five titles in a decade.\r\n\r\nHis time with the Lakers ended in 2000 and West went on to enjoy executive roles with the Memphis Grizzlies, Golden State Warriors and Los Angeles Clippers.\r\n\r\n\"Jerry West was a basketball genius and a defining figure in our league for more than 60 years,\" NBA commissioner Adam Silver said.\r\n\r\n\"As a player and an executive, his profound impact on the game of basketball is matched only by his character and integrity,\" a statement from the Basketball Hall of Fame added.', 'sport', 0, '0000-00-00', 'uploads/130528114807-jerry-west-01168771-nba-logo-single-image-cutjpg.jpg'),
(10, 'How the LCS Is Changing in 2025', 'The heads behind LoL Esports announced the LCS region\'s consolidation in the latest Dev Update.', 'LoL Esports is a dynamic ecosystem that fosters the best pro-talents in League of Legends history. The current structure has had eight international regions for years. But 2025 will introduce major changes to the current landscape, one of which fuses the LCS, CBLoL and LLA (North and South American regions, respectively) into a singular group: the “Americas” league.\r\n\r\nFollow our LCS guide to know what the Americas region will look like in LoL Esports, the reasons behind the change and the all-new uniform split format every region will follow.', 'sport', 0, '0000-00-00', 'uploads/League-of-Legends.jpeg'),
(11, 'Jude Law reveals he turned down playing Superman: ‘It just felt like a step too far', 'Actor tells podcast he remembers trying on the costume for the axed 2003 film Flyby before deciding, ‘You can’t do this. You can’t’', '\r\nJude Law reveals he turned down playing Superman: ‘It just felt like a step too far’\r\nActor tells podcast he remembers trying on the costume for the axed 2003 film Flyby before deciding, ‘You can’t do this. You can’t’\r\n\r\nCatherine Shoard\r\nThu 13 Jun 2024 13.04 CEST\r\nShare\r\nJude Law has spoken out about his decision to decline the role of Superman 20 years ago because “it just felt off”.\r\n\r\nSpeaking on The Playlist’s Discourse podcast, Law conceded that his resistance to joining a franchise seemed unlikely, given his later involvement in the Captain Marvel and the Fantastic Beasts series, but that he had never been especially keen to take the lead in the axed 2002 Superman film Flyby.\r\n\r\n“So this is true. Yeah. And there was a process of flirtation going on,” Law said. “And I always resisted because it just felt like [off]. And I know you can say, ‘Well, but you played Yon-Rogg and Dumbledore!’ It just felt like a step too far.\r\n\r\n“It was when Brett Ratner was going to direct, I think. And they didn’t have a script, if I remember rightly,” Law continued. “Did they have a script? I don’t remember reading one. This is a long time ago. They brought me the suit. They thought, ‘This might change your mind.’”\r\n\r\nYet even the outfit – a more metallic getup than that worn by Christopher Reeve – failed to convince Law.\r\n\r\n“Anyway, I tried it on and I looked in the mirror and part of me initially was like, ‘Wow, this would be a [good thing],’ and then I just thought, ‘No, you can’t – you can’t do this. You can’t,’” Law said. “And I didn’t sell myself to myself. And I stepped away and the film never happened anyway. So maybe it probably wouldn’t have done anything.”\r\n\r\nThe film eventually collapsed, and in 2006 Warner Bros released the Bryan Singer directed Superman Returns starring Brandon Routh', 'culture', 0, '0000-00-00', 'uploads/jude-law-052423-8103f97003e347ee8416707fe3e7c1fd.jpg'),
(12, ' Civilization 7 and more announced at Summer Game Fest', 'The latest title in the long-running strategy series was the biggest reveal at an event that celebrated small indie titles as much as big hitters', 'In a two-hour presentation that was short on major announcements, but big on independent titles, this year’s Summer Game Fest was dominated by one reveal – Civilization 7 is coming out in 2025.\r\n\r\nThe legendary strategy simulation series, which debuted back in 1991, hasn’t seen a fresh instalment for eight years. Although it seems publisher 2K accidentally leaked the announcement earlier in the day, it was still a treat for fans to see designer Sid Meier on video, introducing the new project standing in front of a table filled with Bafta awards.\r\n\r\n“For more than 30 years, players from around the world have shared their love and support for Civ,” said Meier, who began the series at Microprose before forming Firaxis Games. “I’m incredibly excited for Civ fans to see Civilization VII, a game that represents the culmination of three decades of strategy innovation and refinement.”\r\n\r\nThe game will be launching on PC, PlayStation, Xbox and Switch, but no firm release date has been given.\r\nHarry Potter, Lego Horizon Adventures and more\r\n\r\nElsewhere in the show, which started with presenter and organiser Geoff Keighley acknowledging the large number of studio closures and redundancies that have blighted the industry over the past year, there were a few other announcements.\r\n\r\nLego Horizon Adventures had already been rumoured, but this was the official debut for what looks to be a typically light-hearted take on the PlayStation sci-fi adventure. Its a co-op game combining puzzles and combat in which lead character Aloy and pals must confront Helis, “the leader of a group of sun worshipers who bow to an Ancient Evil shrouded in mystery,” according to the PlayStation blog. There’s also some town building, with Aloy able to customise the village of Mother’s Heart. It’s coming out this winter.\r\n\r\nAlso revealed was Harry Potter: Quidditch Champions from Warner Bros and Unbroken Studios, due for release on PC, Xbox, PlayStation and Switch on 3 September. It looks to be a straight simulation of the magical sport, featuring solo play, co-op online matches with friends, or online play against other players.\r\nThere were also new trailers for Monster Hunter Wilds, the horror game Slitterhead from the creators of Silent Hill, and Funcom’s survival MMO, Dune Awakening, which were all suitably breathless and epic. Ahead of its own event taking place on Sunday, Ubisoft showed a fresh trailer for open-world adventure Star Wars Outlaws, which featured a veritable Who’s Who of Star Wars cameos, including Lando Calrissian, Jabba the Hut and a lot of Jawas.', 'culture', 0, '0000-00-00', 'uploads/Summer-Game-Fest-2024.jpeg'),
(13, 'Hip-Hop Is History by Questlove review – a soundtrack for the world, from the Sugarhill Gang to Kanye West', ' Review Hip-Hop Is History by Questlove review – a soundtrack for the world, from the Sugarhill Gang to Kanye West The Roots drummer, DJ, author and director is the ‘Ken Burns of black music’, and his personal reflections on a genre that last year turned ', 'Hip-hop officially turned 50 last year.\r\nIn Questlove’s analysis, hip-hop is an eternal cycle of death and rebirth. It has always fetishised the new style: note how many MCs still use the prefix “Yung” or “Lil”. During its first two decades, it was dizzyingly ruthless. A debut record could change the whole game only for its creator to be eclipsed in turn a couple of years later. Longevity seemed impossible. But around the time XXL magazine convened 177 artists in Harlem for a 25th anniversary group portrait in 1998, hip-hop learned to appreciate its own heritage. When 20-year-old Queens rapper Nas released his stone-cold masterpiece Illmatic in 1994, it would have been strange to imagine that he would one day be performing a 30th anniversary tour, yet here he is, one of many revered elder statesmen.\r\n\r\nQuestlove has no allergy to hyperbole. When he compares the 1995 Source awards, the epicentre of the war between east and west coast rappers that contributed to the murders of Tupac and the Notorious BIG, to the Battle of Gettysburg, or the kick drum on the Pharcyde’s Bullshit to the French Revolution, he is only half joking. This is indeed a dramatic tale. During the 1980s, hip-hop went from delightful novelty to scowling bogeyman, with leading scold Tipper Gore claiming: “The music says it’s OK to beat people up.” Then, in the decade between KRS-One insisting “It’s not about a salary, it’s all about reality”, and the Notorious BIG boasting “It’s all about the Benjamins”, it became a money-making machine. New sounds from new regions produced new disruptions. Questlove was in the thick of it, fretting with each sea change that he was out of touch and washed up – “obsessed with the threat of erasure”. It is generally accepted that it was born on 11 August 1973, when 18-year-old DJ Kool Herc first cut up breakbeats at a party in the Bronx and his friend Coke La Rock rapped along, but this DJ-driven art form, which evolved parallel to disco, took another six years to spawn its first hit single, the Sugarhill Gang’s Rapper’s Delight. The star MCs emerged in its second decade, each one redrawing the bounds of the possible. Run-DMC stripped it down, then Public Enemy blew it up. De La Soul made it friendly, Kool Keith made it freaky, NWA made it outrageous, and so on. Always changing, always expanding.\r\n\r\nNobody knows more about hip-hop, and perhaps popular music in general, than Ahmir “Questlove” Thompson. Still drumming with the Roots, the Philadelphia hip-hop crew that have been Jimmy Fallon’s TV house band since 2009, he is also the Oscar-winning director of Summer of Soul, a prolific author, podcaster and DJ, and the man tasked with herding cats for the Grammys’ salute to hip-hop at 50. Two years older than the art form itself, he has become its unofficial curator, the Ken Burns of black music, the nerd’s nerd. “History is how change gets marked and assessed,” he writes in his eighth book. “It’s a communal form of memory and a collective acknowledgment that what we remember matters.”', 'culture', 0, '0000-00-00', 'uploads/Questlove-Announces-Childrens-Book-Debut-with-Rhythm-of-Time-111722-3-2000-d792612116cf4d3a8e0a025fb9e110e2.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `korisnik`
--
ALTER TABLE `korisnik`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `korisnik`
--
ALTER TABLE `korisnik`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
