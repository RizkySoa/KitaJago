-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 10, 2024 at 01:53 PM
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
-- Database: `jago3`
--

-- --------------------------------------------------------

--
-- Table structure for table `battlefield1`
--

CREATE TABLE `battlefield1` (
  `player_name` varchar(50) NOT NULL,
  `win` int(11) DEFAULT NULL,
  `winrate` decimal(5,2) DEFAULT NULL,
  `kills` int(11) DEFAULT NULL,
  `headshot_percentage` decimal(5,2) DEFAULT NULL,
  `weapon_used` enum('Pistol','Sniper','Melee','Rifle','SMG') DEFAULT NULL,
  `mvp` int(11) DEFAULT NULL,
  `overall_total_score` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `battlefield1`
--

INSERT INTO `battlefield1` (`player_name`, `win`, `winrate`, `kills`, `headshot_percentage`, `weapon_used`, `mvp`, `overall_total_score`) VALUES
('AirborneAce', 21, 105.00, 300, 57.00, 'Rifle', 7, 2900),
('AssaultKing', 18, 90.00, 280, 55.00, 'Rifle', 4, 2400),
('CavalryHero', 7, 35.00, 130, 37.00, 'SMG', 1, 1000),
('EngineerFixer', 9, 45.00, 140, 38.00, 'SMG', 2, 1200),
('FieldMedic', 17, 85.00, 270, 53.00, 'Sniper', 5, 2600),
('FlameTrooper', 13, 65.00, 210, 43.00, 'Rifle', 3, 2200),
('Flanker', 11, 55.00, 180, 40.00, 'SMG', 2, 1800),
('HeavyGunner', 16, 80.00, 260, 51.00, 'Rifle', 4, 2500),
('MedicHero', 12, 60.00, 150, 40.00, 'Pistol', 2, 1300),
('MortarMaster', 12, 60.00, 200, 45.00, 'Rifle', 3, 2000),
('PilotAce', 20, 100.00, 220, 48.00, 'Rifle', 6, 2700),
('ReconMaster', 11, 55.00, 160, 42.00, 'Pistol', 3, 1400),
('ScoutSniper', 10, 50.00, 170, 39.00, 'Rifle', 2, 1700),
('ShotgunExpert', 15, 75.00, 250, 50.00, 'Sniper', 5, 2400),
('SniperPro', 15, 75.00, 300, 50.00, 'Sniper', 5, 2500),
('Soldier01', 10, 50.00, 200, 45.00, 'Rifle', 3, 1500),
('StealthRecon', 19, 95.00, 290, 56.00, 'Rifle', 6, 2800),
('SupportGenius', 14, 70.00, 250, 47.00, 'Rifle', 4, 2300),
('TankDriver', 8, 40.00, 180, 35.00, 'SMG', 1, 1100),
('TrenchRaider', 6, 30.00, 120, 36.00, 'Pistol', 1, 900);

-- --------------------------------------------------------

--
-- Table structure for table `battlefieldv`
--

CREATE TABLE `battlefieldv` (
  `player_name` varchar(50) NOT NULL,
  `win` int(11) DEFAULT NULL,
  `winrate` decimal(5,2) DEFAULT NULL,
  `kills` int(11) DEFAULT NULL,
  `headshot_percentage` decimal(5,2) DEFAULT NULL,
  `weapon_used` enum('Pistol','Sniper','Melee','Rifle','SMG') DEFAULT NULL,
  `mvp` int(11) DEFAULT NULL,
  `overall_total_score` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `battlefieldv`
--

INSERT INTO `battlefieldv` (`player_name`, `win`, `winrate`, `kills`, `headshot_percentage`, `weapon_used`, `mvp`, `overall_total_score`) VALUES
('AirAce', 21, 105.00, 300, 57.00, 'Rifle', 7, 2900),
('AssaultAssassin', 18, 90.00, 280, 55.00, 'Rifle', 4, 2400),
('CavalryCommander', 7, 35.00, 130, 37.00, 'SMG', 1, 1000),
('DriverDude', 8, 40.00, 180, 35.00, 'SMG', 1, 1100),
('EngineerEd', 9, 45.00, 140, 38.00, 'SMG', 2, 1200),
('FieldDoctor', 17, 85.00, 270, 53.00, 'Sniper', 5, 2600),
('FlameThrower', 13, 65.00, 210, 43.00, 'Rifle', 3, 2200),
('FlankMaster', 11, 55.00, 180, 40.00, 'SMG', 2, 1800),
('GunnerGuy', 16, 80.00, 260, 51.00, 'Rifle', 4, 2500),
('MedicMan', 12, 60.00, 150, 40.00, 'Pistol', 2, 1300),
('MortarMan', 12, 60.00, 200, 45.00, 'Rifle', 3, 2000),
('PilotPete', 20, 100.00, 220, 48.00, 'Rifle', 6, 2700),
('ReconRanger', 11, 55.00, 160, 42.00, 'Pistol', 3, 1400),
('ScoutSniperV', 10, 50.00, 170, 39.00, 'Rifle', 2, 1700),
('Sharpshooter', 15, 75.00, 300, 50.00, 'Sniper', 5, 2500),
('ShotgunSavage', 15, 75.00, 250, 50.00, 'Sniper', 5, 2400),
('StealthSniper', 19, 95.00, 290, 56.00, 'Rifle', 6, 2800),
('SupportSpecialist', 14, 70.00, 250, 47.00, 'Rifle', 4, 2300),
('TrenchTerror', 6, 30.00, 120, 36.00, 'Pistol', 1, 900),
('Warrior1', 10, 50.00, 200, 45.00, 'Rifle', 3, 1500);

-- --------------------------------------------------------

--
-- Table structure for table `counterstrike2`
--

CREATE TABLE `counterstrike2` (
  `player_name` varchar(50) NOT NULL,
  `win` int(11) DEFAULT NULL,
  `winrate` decimal(5,2) DEFAULT NULL,
  `kills` int(11) DEFAULT NULL,
  `headshot_percentage` decimal(5,2) DEFAULT NULL,
  `weapon_used` enum('Pistol','Sniper','Melee','Rifle','SMG') DEFAULT NULL,
  `mvp` int(11) DEFAULT NULL,
  `overall_total_score` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `counterstrike2`
--

INSERT INTO `counterstrike2` (`player_name`, `win`, `winrate`, `kills`, `headshot_percentage`, `weapon_used`, `mvp`, `overall_total_score`) VALUES
('AirCS', 21, 105.00, 300, 57.00, 'Rifle', 7, 2900),
('AssaultCS', 18, 90.00, 280, 55.00, 'Rifle', 4, 2400),
('CavalryCS', 7, 35.00, 130, 37.00, 'SMG', 1, 1000),
('CSPro1', 10, 50.00, 200, 45.00, 'Rifle', 3, 1500),
('EngineerCS', 9, 45.00, 140, 38.00, 'SMG', 2, 1200),
('FieldCS', 17, 85.00, 270, 53.00, 'Sniper', 5, 2600),
('FlameCS', 13, 65.00, 210, 43.00, 'Rifle', 3, 2200),
('FlankCS', 11, 55.00, 180, 40.00, 'SMG', 2, 1800),
('GunnerCS', 16, 80.00, 260, 51.00, 'Rifle', 4, 2500),
('MedicCS', 12, 60.00, 150, 40.00, 'Pistol', 2, 1300),
('MortarCS', 12, 60.00, 200, 45.00, 'Rifle', 3, 2000),
('PilotCS', 20, 100.00, 220, 48.00, 'Rifle', 6, 2700),
('ReconCS', 11, 55.00, 160, 42.00, 'Pistol', 3, 1400),
('ScoutCS', 10, 50.00, 170, 39.00, 'Rifle', 2, 1700),
('ShotgunCS', 15, 75.00, 250, 50.00, 'Sniper', 5, 2400),
('SniperElite', 15, 75.00, 300, 50.00, 'Sniper', 5, 2500),
('StealthCS', 19, 95.00, 290, 56.00, 'Rifle', 6, 2800),
('SupportCS', 14, 70.00, 250, 47.00, 'Rifle', 4, 2300),
('TankCS', 8, 40.00, 180, 35.00, 'SMG', 1, 1100),
('TrenchCS', 6, 30.00, 120, 36.00, 'Pistol', 1, 900);

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` int(11) NOT NULL,
  `question` text NOT NULL,
  `answer` text NOT NULL,
  `frequency` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `faqs`
--

INSERT INTO `faqs` (`id`, `question`, `answer`, `frequency`, `created_at`) VALUES
(1, 'Show me the player with the most kills', 'Player X has the most kills with Y kills.', 16, '2024-07-10 09:30:41'),
(2, 'Who is the player with the lowest kill?', 'Player A has the lowest kills with B kills.', 2, '2024-07-10 09:30:41'),
(3, 'Show me the player with the highest kill and winrate using sniper', 'Player M has the highest kills and winrate using sniper with N kills and W% winrate.', 7, '2024-07-10 09:30:41');

-- --------------------------------------------------------

--
-- Table structure for table `fortnite`
--

CREATE TABLE `fortnite` (
  `player_name` varchar(50) NOT NULL,
  `win` int(11) DEFAULT NULL,
  `winrate` decimal(5,2) DEFAULT NULL,
  `kills` int(11) DEFAULT NULL,
  `headshot_percentage` decimal(5,2) DEFAULT NULL,
  `weapon_used` enum('Pistol','Sniper','Melee','Rifle','SMG') DEFAULT NULL,
  `mvp` int(11) DEFAULT NULL,
  `overall_total_score` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fortnite`
--

INSERT INTO `fortnite` (`player_name`, `win`, `winrate`, `kills`, `headshot_percentage`, `weapon_used`, `mvp`, `overall_total_score`) VALUES
('AirFortnite', 21, 105.00, 300, 57.00, 'Rifle', 7, 2900),
('AssaultFortnite', 18, 90.00, 280, 55.00, 'Rifle', 4, 2400),
('CavalryFortnite', 7, 35.00, 130, 37.00, 'SMG', 1, 1000),
('EngineerFortnite', 9, 45.00, 140, 38.00, 'SMG', 2, 1200),
('FieldFortnite', 17, 85.00, 270, 53.00, 'Sniper', 5, 2600),
('FlameFortnite', 13, 65.00, 210, 43.00, 'Rifle', 3, 2200),
('FlankFortnite', 11, 55.00, 180, 40.00, 'SMG', 2, 1800),
('FortnitePro1', 10, 50.00, 200, 45.00, 'Rifle', 3, 1500),
('GunnerFortnite', 16, 80.00, 260, 51.00, 'Rifle', 4, 2500),
('MedicFortnite', 12, 60.00, 150, 40.00, 'Pistol', 2, 1300),
('MortarFortnite', 12, 60.00, 200, 45.00, 'Rifle', 3, 2000),
('PilotFortnite', 20, 100.00, 220, 48.00, 'Rifle', 6, 2700),
('ReconFortnite', 11, 55.00, 160, 42.00, 'Pistol', 3, 1400),
('ScoutFortnite', 10, 50.00, 170, 39.00, 'Rifle', 2, 1700),
('ShotgunFortnite', 15, 75.00, 250, 50.00, 'Sniper', 5, 2400),
('SniperFortnite', 15, 75.00, 300, 50.00, 'Sniper', 5, 2500),
('StealthFortnite', 19, 95.00, 290, 56.00, 'Rifle', 6, 2800),
('SupportFortnite', 14, 70.00, 250, 47.00, 'Rifle', 4, 2300),
('TankFortnite', 8, 40.00, 180, 35.00, 'SMG', 1, 1100),
('TrenchFortnite', 6, 30.00, 120, 36.00, 'Pistol', 1, 900);

-- --------------------------------------------------------

--
-- Table structure for table `pubg`
--

CREATE TABLE `pubg` (
  `player_name` varchar(50) NOT NULL,
  `win` int(11) DEFAULT NULL,
  `winrate` decimal(5,2) DEFAULT NULL,
  `kills` int(11) DEFAULT NULL,
  `headshot_percentage` decimal(5,2) DEFAULT NULL,
  `weapon_used` enum('Pistol','Sniper','Melee','Rifle','SMG') DEFAULT NULL,
  `mvp` int(11) DEFAULT NULL,
  `overall_total_score` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pubg`
--

INSERT INTO `pubg` (`player_name`, `win`, `winrate`, `kills`, `headshot_percentage`, `weapon_used`, `mvp`, `overall_total_score`) VALUES
('AirPUBG', 21, 105.00, 300, 57.00, 'Rifle', 7, 2900),
('AssaultPUBG', 18, 90.00, 280, 55.00, 'Rifle', 4, 2400),
('CavalryPUBG', 7, 35.00, 130, 37.00, 'SMG', 1, 1000),
('EngineerPUBG', 9, 45.00, 140, 38.00, 'SMG', 2, 1200),
('FieldPUBG', 17, 85.00, 270, 53.00, 'Sniper', 5, 2600),
('FlamePUBG', 13, 65.00, 210, 43.00, 'Rifle', 3, 2200),
('FlankPUBG', 11, 55.00, 180, 40.00, 'SMG', 2, 1800),
('GunnerPUBG', 16, 80.00, 260, 51.00, 'Rifle', 4, 2500),
('MedicPUBG', 12, 60.00, 150, 40.00, 'Pistol', 2, 1300),
('MortarPUBG', 12, 60.00, 200, 45.00, 'Rifle', 3, 2000),
('PilotPUBG', 20, 100.00, 220, 48.00, 'Rifle', 6, 2700),
('PUBGPro1', 10, 50.00, 200, 45.00, 'Rifle', 3, 1500),
('ReconPUBG', 11, 55.00, 160, 42.00, 'Pistol', 3, 1400),
('ScoutPUBG', 10, 50.00, 170, 39.00, 'Rifle', 2, 1700),
('ShotgunPUBG', 15, 75.00, 250, 50.00, 'Sniper', 5, 2400),
('SniperPUBG', 15, 75.00, 300, 50.00, 'Sniper', 5, 2500),
('StealthPUBG', 19, 95.00, 290, 56.00, 'Rifle', 6, 2800),
('SupportPUBG', 14, 70.00, 250, 47.00, 'Rifle', 4, 2300),
('TankPUBG', 8, 40.00, 180, 35.00, 'SMG', 1, 1100),
('TrenchPUBG', 6, 30.00, 120, 36.00, 'Pistol', 1, 900);

-- --------------------------------------------------------

--
-- Table structure for table `valorant`
--

CREATE TABLE `valorant` (
  `player_name` varchar(50) NOT NULL,
  `win` int(11) DEFAULT NULL,
  `winrate` decimal(5,2) DEFAULT NULL,
  `kills` int(11) DEFAULT NULL,
  `headshot_percentage` decimal(5,2) DEFAULT NULL,
  `weapon_used` enum('Pistol','Sniper','Melee','Rifle','SMG') DEFAULT NULL,
  `mvp` int(11) DEFAULT NULL,
  `overall_total_score` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `valorant`
--

INSERT INTO `valorant` (`player_name`, `win`, `winrate`, `kills`, `headshot_percentage`, `weapon_used`, `mvp`, `overall_total_score`) VALUES
('Astra', 19, 95.00, 290, 56.00, 'Rifle', 6, 2800),
('Breach', 8, 40.00, 180, 35.00, 'SMG', 1, 1100),
('Brimstone', 13, 65.00, 210, 43.00, 'Rifle', 3, 2200),
('Chamber', 15, 75.00, 250, 50.00, 'Sniper', 5, 2400),
('Cypher', 11, 55.00, 160, 42.00, 'Pistol', 3, 1400),
('Fade', 11, 55.00, 180, 40.00, 'SMG', 2, 1800),
('Harbor', 10, 50.00, 170, 39.00, 'Rifle', 2, 1700),
('Jett', 15, 75.00, 300, 50.00, 'Sniper', 5, 2500),
('KAY/O', 7, 35.00, 130, 37.00, 'SMG', 1, 1000),
('Killjoy', 9, 45.00, 140, 38.00, 'SMG', 2, 1200),
('Neon', 21, 105.00, 300, 57.00, 'Rifle', 7, 2900),
('Omen', 20, 100.00, 220, 48.00, 'Rifle', 6, 2700),
('Phoenix', 10, 50.00, 200, 45.00, 'Rifle', 3, 1500),
('Raze', 16, 80.00, 260, 51.00, 'Rifle', 4, 2500),
('Reyna', 18, 90.00, 280, 55.00, 'Rifle', 4, 2400),
('Sage', 12, 60.00, 150, 40.00, 'Pistol', 2, 1300),
('Skye', 12, 60.00, 200, 45.00, 'Rifle', 3, 2000),
('Sova', 14, 70.00, 250, 47.00, 'Rifle', 4, 2300),
('Viper', 17, 85.00, 270, 53.00, 'Sniper', 5, 2600),
('Yoru', 6, 30.00, 120, 36.00, 'Pistol', 1, 900);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `battlefield1`
--
ALTER TABLE `battlefield1`
  ADD PRIMARY KEY (`player_name`);

--
-- Indexes for table `battlefieldv`
--
ALTER TABLE `battlefieldv`
  ADD PRIMARY KEY (`player_name`);

--
-- Indexes for table `counterstrike2`
--
ALTER TABLE `counterstrike2`
  ADD PRIMARY KEY (`player_name`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fortnite`
--
ALTER TABLE `fortnite`
  ADD PRIMARY KEY (`player_name`);

--
-- Indexes for table `pubg`
--
ALTER TABLE `pubg`
  ADD PRIMARY KEY (`player_name`);

--
-- Indexes for table `valorant`
--
ALTER TABLE `valorant`
  ADD PRIMARY KEY (`player_name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
