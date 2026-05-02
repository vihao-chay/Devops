-- -------------------------------------------------------------
-- TablePlus 6.0.0(550)
--
-- https://tableplus.com/
--
-- Database: db_spotify
-- Generation Time: 2026-03-03 21:25:40.1950
-- -------------------------------------------------------------


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


CREATE TABLE `Discuss` (
  `userId` int DEFAULT NULL,
  `discussId` int NOT NULL AUTO_INCREMENT,
  `content` text COLLATE utf8mb4_unicode_ci,
  `songId` int DEFAULT NULL,
  `discussDate` datetime DEFAULT NULL,
  `replayDiscussId` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`discussId`),
  KEY `songId` (`songId`),
  KEY `userId` (`userId`),
  CONSTRAINT `Discuss_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `User` (`userId`),
  CONSTRAINT `Discuss_ibfk_2` FOREIGN KEY (`songId`) REFERENCES `Song` (`songId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `Following` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int DEFAULT NULL,
  `followingId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `followingUserId` (`followingId`),
  KEY `userId` (`userId`),
  CONSTRAINT `Following_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `User` (`userId`),
  CONSTRAINT `Following_ibfk_2` FOREIGN KEY (`followingId`) REFERENCES `User` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `Genre` (
  `genreId` int NOT NULL AUTO_INCREMENT,
  `nameGenre` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  PRIMARY KEY (`genreId`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `LikedSong` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idSongLiked` int DEFAULT NULL,
  `userId` int DEFAULT NULL,
  `liked` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idUser` (`userId`),
  KEY `idSongLiked` (`idSongLiked`),
  CONSTRAINT `LikedSong_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `User` (`userId`),
  CONSTRAINT `LikedSong_ibfk_2` FOREIGN KEY (`idSongLiked`) REFERENCES `Song` (`songId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `ListFriends` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int DEFAULT NULL,
  `friendId` int DEFAULT NULL,
  `roomChat` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idUser` (`userId`),
  KEY `friendId` (`friendId`),
  CONSTRAINT `ListFriends_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `User` (`userId`),
  CONSTRAINT `ListFriends_ibfk_3` FOREIGN KEY (`friendId`) REFERENCES `User` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `Message` (
  `idMess` int NOT NULL AUTO_INCREMENT,
  `idSender` int DEFAULT NULL,
  `contentMess` text COLLATE utf8mb4_unicode_ci,
  `timeSend` datetime DEFAULT NULL,
  `roomChat` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`idMess`),
  KEY `idUser` (`idSender`),
  CONSTRAINT `Message_ibfk_2` FOREIGN KEY (`idSender`) REFERENCES `User` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `Playlists` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int DEFAULT NULL,
  `imagePath` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `playlistName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `createDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  CONSTRAINT `Playlists_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `User` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `PlaylistSongs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `playlistId` int DEFAULT NULL,
  `songId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `playlistId` (`playlistId`),
  KEY `songId` (`songId`),
  CONSTRAINT `PlaylistSongs_ibfk_1` FOREIGN KEY (`playlistId`) REFERENCES `Playlists` (`id`),
  CONSTRAINT `PlaylistSongs_ibfk_2` FOREIGN KEY (`songId`) REFERENCES `Song` (`songId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `RecentSong` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int DEFAULT NULL,
  `songId` int DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  KEY `songId` (`songId`),
  CONSTRAINT `RecentSong_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `User` (`userId`),
  CONSTRAINT `RecentSong_ibfk_2` FOREIGN KEY (`songId`) REFERENCES `Song` (`songId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `Song` (
  `songId` int NOT NULL AUTO_INCREMENT,
  `userId` int DEFAULT NULL,
  `genreId` int DEFAULT NULL,
  `songName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `viewer` int DEFAULT '0',
  `duration` text COLLATE utf8mb4_unicode_ci,
  `popular` tinyint(1) DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `songImage` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `publicDate` date DEFAULT NULL,
  `filePath` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discussQuality` int DEFAULT NULL,
  PRIMARY KEY (`songId`),
  KEY `genreId` (`genreId`),
  KEY `userId` (`userId`),
  CONSTRAINT `Song_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `User` (`userId`),
  CONSTRAINT `Song_ibfk_2` FOREIGN KEY (`genreId`) REFERENCES `Genre` (`genreId`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `User` (
  `userId` int NOT NULL AUTO_INCREMENT,
  `account` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nationality` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `chanalName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `desciption` text COLLATE utf8mb4_unicode_ci,
  `refreshToken` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `banner` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `Genre` (`genreId`, `nameGenre`, `createTime`) VALUES
(1, 'Pop', '2026-01-01 00:00:00'),
(2, 'Rock', '2026-01-02 00:00:00'),
(3, 'Hip Hop', '2026-01-03 00:00:00'),
(4, 'R&B', '2026-01-04 00:00:00'),
(5, 'EDM', '2026-01-05 00:00:00'),
(6, 'Jazz', '2026-01-06 00:00:00'),
(7, 'Classical', '2026-01-07 00:00:00'),
(8, 'Lo-fi', '2026-01-08 00:00:00'),
(9, 'K-Pop', '2026-01-09 00:00:00'),
(10, 'V-Pop', '2026-01-10 00:00:00'),
(11, 'Indie', '2026-01-11 00:00:00'),
(12, 'Metal', '2026-01-12 00:00:00'),
(13, 'Country', '2026-01-13 00:00:00'),
(14, 'Reggae', '2026-01-14 00:00:00'),
(15, 'Blues', '2026-01-15 00:00:00'),
(16, 'Soul', '2026-01-16 00:00:00'),
(17, 'Funk', '2026-01-17 00:00:00'),
(18, 'Techno', '2026-01-18 00:00:00'),
(19, 'House', '2026-01-19 00:00:00'),
(20, 'Ambient', '2026-01-20 00:00:00');

INSERT INTO `Song` (`songId`, `userId`, `genreId`, `songName`, `viewer`, `duration`, `popular`, `description`, `songImage`, `publicDate`, `filePath`, `discussQuality`) VALUES
(1, 1, 1, 'Song 01', 120, '03:21', 1, 'Desc song 01', '/img/song01.jpg', '2026-01-01', '/audio/song01.mp3', 80),
(2, 1, 2, 'Song 02', 45, '04:05', 0, 'Desc song 02', '/img/song02.jpg', '2026-01-02', '/audio/song02.mp3', 55),
(3, 1, 3, 'Song 03', 300, '02:58', 1, 'Desc song 03', '/img/song03.jpg', '2026-01-03', '/audio/song03.mp3', 90),
(4, 1, 4, 'Song 04', 10, '03:40', 0, 'Desc song 04', '/img/song04.jpg', '2026-01-04', '/audio/song04.mp3', 40),
(5, 1, 5, 'Song 05', 78, '03:10', 0, 'Desc song 05', '/img/song05.jpg', '2026-01-05', '/audio/song05.mp3', 60),
(6, 1, 6, 'Song 06', 512, '05:12', 1, 'Desc song 06', '/img/song06.jpg', '2026-01-06', '/audio/song06.mp3', 95),
(7, 1, 7, 'Song 07', 33, '01:59', 0, 'Desc song 07', '/img/song07.jpg', '2026-01-07', '/audio/song07.mp3', 35),
(8, 1, 8, 'Song 08', 201, '02:45', 1, 'Desc song 08', '/img/song08.jpg', '2026-01-08', '/audio/song08.mp3', 88),
(9, 1, 9, 'Song 09', 150, '03:33', 1, 'Desc song 09', '/img/song09.jpg', '2026-01-09', '/audio/song09.mp3', 75),
(10, 1, 10, 'Song 10', 66, '04:11', 0, 'Desc song 10', '/img/song10.jpg', '2026-01-10', '/audio/song10.mp3', 50),
(11, 1, 11, 'Song 11', 99, '03:05', 0, 'Desc song 11', '/img/song11.jpg', '2026-01-11', '/audio/song11.mp3', 58),
(12, 1, 12, 'Song 12', 420, '03:49', 1, 'Desc song 12', '/img/song12.jpg', '2026-01-12', '/audio/song12.mp3', 92),
(13, 1, 13, 'Song 13', 12, '02:22', 0, 'Desc song 13', '/img/song13.jpg', '2026-01-13', '/audio/song13.mp3', 30),
(14, 1, 14, 'Song 14', 77, '03:17', 0, 'Desc song 14', '/img/song14.jpg', '2026-01-14', '/audio/song14.mp3', 52),
(15, 1, 15, 'Song 15', 260, '04:44', 1, 'Desc song 15', '/img/song15.jpg', '2026-01-15', '/audio/song15.mp3', 85),
(16, 1, 16, 'Song 16', 18, '03:02', 0, 'Desc song 16', '/img/song16.jpg', '2026-01-16', '/audio/song16.mp3', 45),
(17, 1, 17, 'Song 17', 133, '02:50', 1, 'Desc song 17', '/img/song17.jpg', '2026-01-17', '/audio/song17.mp3', 70),
(18, 1, 18, 'Song 18', 59, '03:55', 0, 'Desc song 18', '/img/song18.jpg', '2026-01-18', '/audio/song18.mp3', 49),
(19, 1, 19, 'Song 19', 310, '04:08', 1, 'Desc song 19', '/img/song19.jpg', '2026-01-19', '/audio/song19.mp3', 89),
(20, 1, 20, 'Song 20', 25, '02:36', 0, 'Desc song 20', '/img/song20.jpg', '2026-01-20', '/audio/song20.mp3', 42);

INSERT INTO `User` (`userId`, `account`, `name`, `nationality`, `chanalName`, `avatar`, `desciption`, `refreshToken`, `password`, `banner`, `role`) VALUES
(1, 'user01@example.com', 'User 01', 'VN', 'Channel 01', '/img/ava01.png', 'Bio user 01', NULL, 'hash_pw_01', '/img/banner01.png', 'user');



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;