-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               11.5.0-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for lembain_tech
DROP DATABASE IF EXISTS `lembain_tech`;
CREATE DATABASE IF NOT EXISTS `lembain_tech` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci */;
USE `lembain_tech`;

-- Dumping structure for table lembain_tech.barang
DROP TABLE IF EXISTS `barang`;
CREATE TABLE IF NOT EXISTS `barang` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `Nama_barang` int(3) NOT NULL,
  `Merk` int(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Merk` (`Merk`),
  KEY `Nama_barang` (`Nama_barang`),
  CONSTRAINT `barang_ibfk_1` FOREIGN KEY (`Merk`) REFERENCES `merk` (`id`),
  CONSTRAINT `barang_ibfk_2` FOREIGN KEY (`Nama_barang`) REFERENCES `component` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table lembain_tech.barang: ~0 rows (approximately)

-- Dumping structure for table lembain_tech.bjt_tipe
DROP TABLE IF EXISTS `bjt_tipe`;
CREATE TABLE IF NOT EXISTS `bjt_tipe` (
  `id` int(1) NOT NULL AUTO_INCREMENT,
  `BJT_tipe_name` char(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table lembain_tech.bjt_tipe: ~2 rows (approximately)
REPLACE INTO `bjt_tipe` (`id`, `BJT_tipe_name`) VALUES
	(1, 'NPN'),
	(2, 'PNP');

-- Dumping structure for table lembain_tech.capacitor
DROP TABLE IF EXISTS `capacitor`;
CREATE TABLE IF NOT EXISTS `capacitor` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `Capacitor_vaue` char(30) NOT NULL,
  `Capacitor_tipe` int(3) NOT NULL,
  `Component_name` int(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Capacitor_tipe` (`Capacitor_tipe`,`Component_name`),
  KEY `Component_name` (`Component_name`),
  CONSTRAINT `capacitor_ibfk_1` FOREIGN KEY (`Capacitor_tipe`) REFERENCES `capacitor_type` (`id`),
  CONSTRAINT `capacitor_ibfk_2` FOREIGN KEY (`Component_name`) REFERENCES `components_name` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table lembain_tech.capacitor: ~0 rows (approximately)

-- Dumping structure for table lembain_tech.capacitor_type
DROP TABLE IF EXISTS `capacitor_type`;
CREATE TABLE IF NOT EXISTS `capacitor_type` (
  `id` int(1) NOT NULL,
  `Capacitor_tipe_name` char(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table lembain_tech.capacitor_type: ~0 rows (approximately)

-- Dumping structure for table lembain_tech.component
DROP TABLE IF EXISTS `component`;
CREATE TABLE IF NOT EXISTS `component` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Component_name` int(3) NOT NULL,
  `Part_number` int(3) DEFAULT NULL,
  `Pakaging` int(3) DEFAULT NULL,
  `Material` int(3) DEFAULT NULL,
  `Mount_tipe` int(3) DEFAULT NULL,
  `Component_category` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Part_number` (`Part_number`),
  KEY `Component_name` (`Component_name`,`Pakaging`,`Mount_tipe`,`Component_category`),
  KEY `Component_category` (`Component_category`),
  KEY `Mount_tipe` (`Mount_tipe`),
  KEY `Pakaging` (`Pakaging`),
  KEY `Material` (`Material`),
  CONSTRAINT `component_ibfk_1` FOREIGN KEY (`Component_name`) REFERENCES `components_name` (`id`),
  CONSTRAINT `component_ibfk_2` FOREIGN KEY (`Component_category`) REFERENCES `component_category` (`id`),
  CONSTRAINT `component_ibfk_3` FOREIGN KEY (`Mount_tipe`) REFERENCES `mounting_tipe` (`id`),
  CONSTRAINT `component_ibfk_4` FOREIGN KEY (`Pakaging`) REFERENCES `pakaging` (`id`),
  CONSTRAINT `component_ibfk_5` FOREIGN KEY (`Material`) REFERENCES `material` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table lembain_tech.component: ~0 rows (approximately)

-- Dumping structure for table lembain_tech.components_name
DROP TABLE IF EXISTS `components_name`;
CREATE TABLE IF NOT EXISTS `components_name` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `Component_name` char(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table lembain_tech.components_name: ~2 rows (approximately)
REPLACE INTO `components_name` (`id`, `Component_name`) VALUES
	(1, 'TRANSISTOR'),
	(2, 'INTEGRATED CICUIT'),
	(3, 'DIODA');

-- Dumping structure for table lembain_tech.component_category
DROP TABLE IF EXISTS `component_category`;
CREATE TABLE IF NOT EXISTS `component_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Component_category_name` char(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `Component_category_name` (`Component_category_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table lembain_tech.component_category: ~2 rows (approximately)
REPLACE INTO `component_category` (`id`, `Component_category_name`) VALUES
	(2, 'ACTIVE'),
	(1, 'PASSIVE');

-- Dumping structure for table lembain_tech.datasheets
DROP TABLE IF EXISTS `datasheets`;
CREATE TABLE IF NOT EXISTS `datasheets` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `Datasheet_name` char(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table lembain_tech.datasheets: ~531 rows (approximately)
REPLACE INTO `datasheets` (`id`, `Datasheet_name`) VALUES
	(1, 'TT2170LS.pdf'),
	(2, 'AM7333P.pdf'),
	(3, 'TPS1120 TPS1120Y.pdf'),
	(4, 'Si4686DY.pdf'),
	(5, 'MD2009DFX.pdf'),
	(6, 'MD1803DFH.PDF'),
	(7, 'TT2140LS.pdf'),
	(8, 'PCF8574T.pdf'),
	(9, 'C6090.pdf'),
	(10, '4N70.pdf'),
	(11, '2SD2498.PDF'),
	(12, 'TC4953.pdf'),
	(13, 'C6089.pdf'),
	(14, 'SC8205.pdf'),
	(15, 'MD2310FX.PDF'),
	(16, '2SC2482.pdf'),
	(17, '2SC1815.PDF'),
	(18, '2SD2251.pdf'),
	(19, '2SD1882.pdf'),
	(20, '2SC5149.pdf'),
	(21, '2N2646 2N2647.pdf'),
	(22, '2SA1659.pdf'),
	(23, '2SA1015.PDF'),
	(24, '2N6027 2N6028.pdf'),
	(25, '7N65.pdf'),
	(26, '2SD2580.pdf'),
	(27, '2SD2499.pdf'),
	(28, '2SC6093LS.PDF'),
	(29, 'test'),
	(30, 'test'),
	(31, 'test'),
	(32, 'WT2003S-16S.pdf'),
	(33, 'TOP252-262.pdf'),
	(34, 'UC3842A UC3843A.PDF'),
	(35, 'tlc59282.pdf'),
	(36, 'TL432 TL432.pdf'),
	(37, 'tl431 tl432.pdf'),
	(38, 'w25q64fw.pdf'),
	(39, 'TMPA8895 6CSNG.pdf'),
	(40, 'TDA8145.pdf'),
	(41, 'TDA6107Q-N1.pdf'),
	(42, 'TC5020S.pdf'),
	(43, 'TC5020.pdf'),
	(44, 'tda7388.pdf'),
	(45, 'TDA7266SA.pdf'),
	(46, 'T78040.pdf'),
	(47, 'STV9302A.PDF'),
	(48, 'STRX6700.pdf'),
	(49, 'str-w6765n_ds_en.pdf'),
	(50, 'str-w6723n.pdf'),
	(51, 'str-w625xseries.pdf'),
	(52, 'STR-6654.pdf'),
	(53, 'T62M99A.pdf'),
	(54, 'STV9302B.pdf'),
	(55, 'sn74hc245.pdf'),
	(56, 'SN74HC595N SN54HC595N.pdf'),
	(57, 'SD7402.pdf'),
	(58, 'SC75823.pdf'),
	(59, 'SA5888.pdf'),
	(60, 'S8205A S8205B.pdf'),
	(61, 'PN8136.pdf'),
	(62, 'MP5016.pdf'),
	(63, 'MH74HC165.pdf'),
	(64, 'pm8903a.pdf'),
	(65, 'OB2358.pdf'),
	(66, 'M74HC65.pdf'),
	(67, 'LT1947.pdf'),
	(68, 'MC74HC595A.pdf'),
	(69, 'MC14051B MC14052B MC14053B.pdf'),
	(70, 'M12L64164A(2Y).pdf'),
	(71, 'LM49321.pdf'),
	(72, 'LA78141-E.PDF'),
	(73, 'LA78045.pdf'),
	(74, 'LA78040N.pdf'),
	(75, 'LA76818A.pdf'),
	(76, 'KIA7019AP.pdf'),
	(77, 'KA431 KA431A KA431L.pdf'),
	(78, 'HT8970.pdf'),
	(79, 'sn74hc165.pdf'),
	(80, 'sphe8288t.pdf'),
	(81, 'sn74hc595.pdf'),
	(82, 'SNx4HC595.pdf'),
	(83, 'HT3582dm.pdf'),
	(84, 'HD44780U.pdf'),
	(85, 'GT34TS04A.pdf'),
	(86, 'GT34TS04.pdf'),
	(87, 'GT34TS02B.pdf'),
	(88, 'GT34C04.pdf'),
	(89, 'GT34C02B.pdf'),
	(90, 'FT232R.pdf'),
	(91, 'FMH07N90E.pdf'),
	(92, 'FM05BT.pdf'),
	(93, 'FAN6755W FAN6755UW.pdf'),
	(94, 'ET6202.pdf'),
	(95, 'DW01A.pdf'),
	(96, 'ds3232.pdf'),
	(97, 'DM7446A DM7447A.pdf'),
	(98, 'DA14531.pdf'),
	(99, 'cp2112.pdf'),
	(100, 'cp2102.pdf'),
	(101, 'CH340G.pdf'),
	(102, 'cd4514b cd4515b.pdf'),
	(103, 'CD4017BC CD4022BC.pdf'),
	(104, 'BK1080.pdf'),
	(105, 'AU6850B.pdf'),
	(106, 'ATmega328P.pdf'),
	(107, 'ATMEGA16HVB ATMEGA32HVB.pdf'),
	(108, 'AT45D011.pdf'),
	(109, 'APQ8064.PDF'),
	(110, 'AN5265.PDF'),
	(111, 'ADNS-2620.pdf'),
	(112, 'AC6969A.pdf'),
	(113, '8002.pdf'),
	(114, '74hc595.pdf'),
	(115, 'test'),
	(116, 'test'),
	(117, 'test'),
	(118, 'test'),
	(119, 'test'),
	(120, 'test'),
	(121, 'test'),
	(122, 'test'),
	(123, 'test'),
	(124, 'test'),
	(125, 'test'),
	(126, 'test'),
	(127, 'test'),
	(128, 'test'),
	(129, 'test datasheet'),
	(130, 'test datasheet'),
	(131, 'test datasheet'),
	(132, 'test datasheet'),
	(133, 'test datasheet'),
	(134, 'test datasheet'),
	(135, 'test datasheet'),
	(136, 'test datasheet'),
	(137, 'test datasheet'),
	(138, 'test datasheet'),
	(139, 'test datasheet'),
	(140, 'test datasheet'),
	(141, 'test datasheet'),
	(142, 'test datasheet'),
	(143, 'test datasheet'),
	(144, 'test datasheet'),
	(145, 'test datasheet'),
	(146, 'test datasheet'),
	(147, 'test datasheet'),
	(148, 'test datasheet'),
	(149, 'test datasheet'),
	(150, 'test datasheet'),
	(151, 'test datasheet'),
	(152, 'test datasheet'),
	(153, 'test datasheet'),
	(154, 'test datasheet'),
	(155, 'test datasheet'),
	(156, 'test datasheet'),
	(157, 'test datasheet'),
	(158, 'test datasheet'),
	(159, 'test datasheet'),
	(160, 'test datasheet'),
	(161, 'test datasheet'),
	(162, 'test datasheet'),
	(163, 'test datasheet'),
	(164, 'test datasheet'),
	(165, 'test datasheet'),
	(166, 'test datasheet'),
	(167, 'test datasheet'),
	(168, 'test datasheet'),
	(169, 'test datasheet'),
	(170, 'test datasheet'),
	(171, 'test datasheet'),
	(172, 'test datasheet'),
	(173, 'test datasheet'),
	(174, 'test datasheet'),
	(175, 'test datasheet'),
	(176, 'test datasheet'),
	(177, 'test datasheet'),
	(178, 'test datasheet'),
	(179, 'test datasheet'),
	(180, 'test datasheet'),
	(181, 'test datasheet'),
	(182, 'test datasheet'),
	(183, 'test datasheet'),
	(184, 'test datasheet'),
	(185, 'test datasheet'),
	(186, 'test datasheet'),
	(187, 'test datasheet'),
	(188, 'test datasheet'),
	(189, 'test datasheet'),
	(190, 'test datasheet'),
	(191, 'test datasheet'),
	(192, 'test datasheet'),
	(193, 'test datasheet'),
	(194, 'test datasheet'),
	(195, 'test datasheet'),
	(196, 'test datasheet'),
	(197, 'test datasheet'),
	(198, 'test datasheet'),
	(199, 'test datasheet'),
	(200, 'test datasheet'),
	(201, 'test datasheet'),
	(202, 'test datasheet'),
	(203, 'test datasheet'),
	(204, 'test datasheet'),
	(205, 'test datasheet'),
	(206, 'test datasheet'),
	(207, 'test datasheet'),
	(208, 'test datasheet'),
	(209, 'test datasheet'),
	(210, 'test datasheet'),
	(211, 'test datasheet'),
	(212, 'test datasheet'),
	(213, 'test datasheet'),
	(214, 'test datasheet'),
	(215, 'test datasheet'),
	(216, 'test datasheet'),
	(217, 'test datasheet'),
	(218, 'test datasheet'),
	(219, 'test datasheet'),
	(220, 'test datasheet'),
	(221, 'test datasheet'),
	(222, 'test datasheet'),
	(223, 'test datasheet'),
	(224, 'test datasheet'),
	(225, 'test datasheet'),
	(226, 'test datasheet'),
	(227, 'test datasheet'),
	(228, 'test datasheet'),
	(229, 'test datasheet'),
	(230, 'test datasheet'),
	(231, 'test datasheet'),
	(232, 'test datasheet'),
	(233, 'test datasheet'),
	(234, 'test datasheet'),
	(235, 'test datasheet'),
	(236, 'test datasheet'),
	(237, 'test datasheet'),
	(238, 'test datasheet'),
	(239, 'test datasheet'),
	(240, 'test datasheet'),
	(241, 'test datasheet'),
	(242, 'test datasheet'),
	(243, 'test datasheet'),
	(244, 'test datasheet'),
	(245, 'test datasheet'),
	(246, 'test datasheet'),
	(247, 'test datasheet'),
	(248, 'test datasheet'),
	(249, 'test datasheet'),
	(250, 'test datasheet'),
	(251, 'test datasheet'),
	(252, 'test datasheet'),
	(253, 'test datasheet'),
	(254, 'test datasheet'),
	(255, 'test datasheet'),
	(256, 'test datasheet'),
	(257, 'test datasheet'),
	(258, 'test datasheet'),
	(259, 'test datasheet'),
	(260, 'test datasheet'),
	(261, 'test datasheet'),
	(262, 'test datasheet'),
	(263, 'test datasheet'),
	(264, 'test datasheet'),
	(265, 'test datasheet'),
	(266, 'test datasheet'),
	(267, 'test datasheet'),
	(268, 'test datasheet'),
	(269, 'test datasheet'),
	(270, 'test datasheet'),
	(271, 'test datasheet'),
	(272, 'test datasheet'),
	(273, 'test datasheet'),
	(274, 'test datasheet'),
	(275, 'test datasheet'),
	(276, 'test datasheet'),
	(277, 'test datasheet'),
	(278, 'test datasheet'),
	(279, 'test datasheet'),
	(280, 'test datasheet'),
	(281, 'test datasheet'),
	(282, 'test datasheet'),
	(283, 'test datasheet'),
	(284, 'test datasheet'),
	(285, 'test datasheet'),
	(286, 'test datasheet'),
	(287, 'test datasheet'),
	(288, 'test datasheet'),
	(289, 'test datasheet'),
	(290, 'test datasheet'),
	(291, 'test datasheet'),
	(292, 'test datasheet'),
	(293, 'test datasheet'),
	(294, 'test datasheet'),
	(295, 'test datasheet'),
	(296, 'test datasheet'),
	(297, 'test datasheet'),
	(298, 'test datasheet'),
	(299, 'test datasheet'),
	(300, 'test datasheet'),
	(301, 'test datasheet'),
	(302, 'test datasheet'),
	(303, 'test datasheet'),
	(304, 'test datasheet'),
	(305, 'test datasheet'),
	(306, 'test datasheet'),
	(307, 'test datasheet'),
	(308, 'test datasheet'),
	(309, 'test datasheet'),
	(310, 'test datasheet'),
	(311, 'test datasheet'),
	(312, 'test datasheet'),
	(313, 'test datasheet'),
	(314, 'test datasheet'),
	(315, 'test datasheet'),
	(316, 'test datasheet'),
	(317, 'test datasheet'),
	(318, 'test datasheet'),
	(319, 'test datasheet'),
	(320, 'test datasheet'),
	(321, 'test datasheet'),
	(322, 'test datasheet'),
	(323, 'test datasheet'),
	(324, 'test datasheet'),
	(325, 'test datasheet'),
	(326, 'test datasheet'),
	(327, 'test datasheet'),
	(328, 'test datasheet'),
	(329, 'test datasheet'),
	(330, 'test datasheet'),
	(331, 'test datasheet'),
	(332, 'test datasheet'),
	(333, 'test datasheet'),
	(334, 'test datasheet'),
	(335, 'test datasheet'),
	(336, 'test datasheet'),
	(337, 'test datasheet'),
	(338, 'test datasheet'),
	(339, 'test datasheet'),
	(340, 'test datasheet'),
	(341, 'test inserr'),
	(342, 'test inserr'),
	(343, 'SC10XX.PDF'),
	(344, 'TIP117.pdf'),
	(345, 'NTE7482.pdf'),
	(346, 'TIP42 TIP42A TIP42B TIP42C.pdf'),
	(347, 'SS9014.pdf'),
	(348, 'TDA2050.pdf'),
	(349, 'TDA2030A.pdf'),
	(350, 'P5NA80 STP5NA80FI.pdf'),
	(351, 'SS8050.pdf'),
	(352, 'tda2030.pdf'),
	(353, 'UM6164.pdf'),
	(354, 'MC9S08FL16.PDF'),
	(355, 'STR6554.pdf'),
	(356, 'LA78141.pdf'),
	(357, 'KSP2907A.pdf'),
	(358, 'KSP2222A.pdf'),
	(359, 'KSC945.pdf'),
	(360, 'KSC5019.PDF'),
	(361, 'KRC101M KRC106M.pdf'),
	(362, 'KIA78R05API KIA78R15API.pdf'),
	(363, 'KA78XX KA78XXA.pdf'),
	(364, 'FQP7N65C FQPF7N65C.pdf'),
	(365, 'D4203D.pdf'),
	(366, 'D313.pdf'),
	(367, 'CPC1217.PDF'),
	(368, 'STR-W6754.pdf'),
	(369, 'STR-6554.PDF'),
	(370, 'C8550.PDF'),
	(371, 'C2611.pdf'),
	(372, 'BQ20Z90.PDF'),
	(373, 'BF422.pdf'),
	(374, 'BD135 BD136 BD139 BD140.pdf'),
	(375, 'AN4544.PDF'),
	(376, '9014.PDF'),
	(377, '3DD13005.pdf'),
	(378, '2SK2806-01.pdf'),
	(379, '2SD471A.pdf'),
	(380, '2SD438 2SD560.pdf'),
	(381, '2SC828 2SC828A.PDF'),
	(382, '2sc5343.pdf'),
	(383, '2SC2383.pdf'),
	(384, '2SC1162.pdf'),
	(385, '2SB560 2SD560.PDF'),
	(386, '2SA743 2SA743A.PDF'),
	(387, 'C8550.PDF'),
	(388, 'TDA2050.pdf'),
	(389, 'UM6164.pdf'),
	(390, 'C2611.pdf'),
	(391, 'BQ20Z90.PDF'),
	(392, 'BF422.pdf'),
	(393, 'BD135 BD136 BD139 BD140.pdf'),
	(394, 'TDA2030A.pdf'),
	(395, 'TIP117.pdf'),
	(396, 'D313.pdf'),
	(397, 'CPC1217.PDF'),
	(398, 'TIP42 TIP42A TIP42B TIP42C.pdf'),
	(399, 'tda2030.pdf'),
	(400, 'STR6554.pdf'),
	(401, 'STR-W6754.pdf'),
	(402, 'STR-6554.PDF'),
	(403, 'SS8050.pdf'),
	(404, 'SS9014.pdf'),
	(405, 'AN4544.PDF'),
	(406, 'SC10XX.PDF'),
	(407, '3DD13005.pdf'),
	(408, '9014.PDF'),
	(409, '2SK2806-01.pdf'),
	(410, '2SD471A.pdf'),
	(411, 'NTE7482.pdf'),
	(412, 'P5NA80 STP5NA80FI.pdf'),
	(413, '2SC828 2SC828A.PDF'),
	(414, '2sc5343.pdf'),
	(415, '2SC2383.pdf'),
	(416, '2SC1162.pdf'),
	(417, '2SB560 2SD560.PDF'),
	(418, '2SA743 2SA743A.PDF'),
	(419, 'MC9S08FL16.PDF'),
	(420, 'LA78141.pdf'),
	(421, 'KSP2907A.pdf'),
	(422, 'KSP2222A.pdf'),
	(423, 'KSC945.pdf'),
	(424, 'KSC5019.PDF'),
	(425, 'KA78XX KA78XXA.pdf'),
	(426, 'KRC101M KRC106M.pdf'),
	(427, 'KIA78R05API KIA78R15API.pdf'),
	(428, 'FQP7N65C FQPF7N65C.pdf'),
	(429, 'D4203D.pdf'),
	(430, '2SD438 2SD560.pdf'),
	(431, 'TDA2050.pdf'),
	(432, 'TDA2030A.pdf'),
	(433, 'KSC5019.PDF'),
	(434, 'KRC101M KRC106M.pdf'),
	(435, 'KSC945.pdf'),
	(436, 'tda2030.pdf'),
	(437, 'STR6554.pdf'),
	(438, 'TIP42 TIP42A TIP42B TIP42C.pdf'),
	(439, 'KSP2222A.pdf'),
	(440, 'KIA78R05API KIA78R15API.pdf'),
	(441, 'UM6164.pdf'),
	(442, 'TIP117.pdf'),
	(443, 'KA78XX KA78XXA.pdf'),
	(444, 'FQP7N65C FQPF7N65C.pdf'),
	(445, 'D4203D.pdf'),
	(446, 'D313.pdf'),
	(447, 'STR-W6754.pdf'),
	(448, 'STR-6554.PDF'),
	(449, 'SS9014.pdf'),
	(450, 'CPC1217.PDF'),
	(451, 'SS8050.pdf'),
	(452, 'SC10XX.PDF'),
	(453, 'P5NA80 STP5NA80FI.pdf'),
	(454, 'NTE7482.pdf'),
	(455, 'C8550.PDF'),
	(456, 'C2611.pdf'),
	(457, 'MC9S08FL16.PDF'),
	(458, 'BQ20Z90.PDF'),
	(459, 'LA78141.pdf'),
	(460, 'KSP2907A.pdf'),
	(461, 'BF422.pdf'),
	(462, 'BD135 BD136 BD139 BD140.pdf'),
	(463, 'AN4544.PDF'),
	(464, '3DD13005.pdf'),
	(465, '2SK2806-01.pdf'),
	(466, '2SD471A.pdf'),
	(467, '2SD438 2SD560.pdf'),
	(468, '2SC828 2SC828A.PDF'),
	(469, '2sc5343.pdf'),
	(470, '2SC1162.pdf'),
	(471, '2SB560 2SD560.PDF'),
	(472, '9014.PDF'),
	(473, '2SC2383.pdf'),
	(474, '2SA743 2SA743A.PDF'),
	(475, '7'),
	(476, '9'),
	(477, '0'),
	(478, '1'),
	(479, '9'),
	(480, '5'),
	(481, '6'),
	(482, '8'),
	(483, '3'),
	(484, '4'),
	(485, '7'),
	(486, '6'),
	(487, '5'),
	(488, '4'),
	(489, '2'),
	(490, '2'),
	(491, '3'),
	(492, '2'),
	(493, '1'),
	(494, '3'),
	(495, '8'),
	(496, '2'),
	(497, '4'),
	(498, '6'),
	(499, '7'),
	(500, '8'),
	(501, '9'),
	(502, '5'),
	(503, '0'),
	(504, '9'),
	(505, '1'),
	(506, '8'),
	(507, '7'),
	(508, '6'),
	(509, '4'),
	(510, '3'),
	(511, '2'),
	(512, '1'),
	(513, '5'),
	(514, '2'),
	(515, '3'),
	(516, '3'),
	(517, '1'),
	(518, '7'),
	(519, '2'),
	(520, '2'),
	(521, '3'),
	(522, '6'),
	(523, '5'),
	(524, '8'),
	(525, '4'),
	(526, '3'),
	(527, '7'),
	(528, '5'),
	(529, '4'),
	(530, '3'),
	(531, '2'),
	(532, '8'),
	(533, '9'),
	(534, '0'),
	(535, '1'),
	(536, '9'),
	(537, '6');

-- Dumping structure for table lembain_tech.diode_category
DROP TABLE IF EXISTS `diode_category`;
CREATE TABLE IF NOT EXISTS `diode_category` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `Diode_category_name` char(15) NOT NULL,
  `Diode_details` int(2) NOT NULL,
  `Component_name` int(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Component_name` (`Component_name`),
  KEY `Component_name_2` (`Component_name`),
  KEY `Diode_details` (`Diode_details`),
  CONSTRAINT `diode_category_ibfk_1` FOREIGN KEY (`Component_name`) REFERENCES `components_name` (`id`),
  CONSTRAINT `diode_category_ibfk_2` FOREIGN KEY (`Diode_details`) REFERENCES `zener_details` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table lembain_tech.diode_category: ~0 rows (approximately)

-- Dumping structure for table lembain_tech.fet_channel
DROP TABLE IF EXISTS `fet_channel`;
CREATE TABLE IF NOT EXISTS `fet_channel` (
  `id` int(1) NOT NULL AUTO_INCREMENT,
  `FET_channel_name` enum('P','N','') NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `FET_channel_name` (`FET_channel_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table lembain_tech.fet_channel: ~2 rows (approximately)
REPLACE INTO `fet_channel` (`id`, `FET_channel_name`) VALUES
	(1, 'P'),
	(2, 'N');

-- Dumping structure for table lembain_tech.fet_tipe
DROP TABLE IF EXISTS `fet_tipe`;
CREATE TABLE IF NOT EXISTS `fet_tipe` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `FET_tipe_name` int(2) NOT NULL,
  `FET_channel` int(2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FET_tipe_name` (`FET_tipe_name`),
  KEY `FET_channel` (`FET_channel`),
  CONSTRAINT `fet_tipe_ibfk_1` FOREIGN KEY (`FET_channel`) REFERENCES `fet_channel` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table lembain_tech.fet_tipe: ~0 rows (approximately)

-- Dumping structure for table lembain_tech.fixed_tipe
DROP TABLE IF EXISTS `fixed_tipe`;
CREATE TABLE IF NOT EXISTS `fixed_tipe` (
  `id` int(1) NOT NULL AUTO_INCREMENT,
  `fixed_tipe_name` char(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table lembain_tech.fixed_tipe: ~0 rows (approximately)

-- Dumping structure for table lembain_tech.harga
DROP TABLE IF EXISTS `harga`;
CREATE TABLE IF NOT EXISTS `harga` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `Harga_barang` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table lembain_tech.harga: ~0 rows (approximately)

-- Dumping structure for table lembain_tech.integrated_circuit_category
DROP TABLE IF EXISTS `integrated_circuit_category`;
CREATE TABLE IF NOT EXISTS `integrated_circuit_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Integrated_cicuit_name` char(20) NOT NULL,
  `Component_name` int(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Component_name` (`Component_name`),
  CONSTRAINT `integrated_circuit_category_ibfk_1` FOREIGN KEY (`Component_name`) REFERENCES `components_name` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table lembain_tech.integrated_circuit_category: ~0 rows (approximately)

-- Dumping structure for table lembain_tech.linear_resistor_tipe
DROP TABLE IF EXISTS `linear_resistor_tipe`;
CREATE TABLE IF NOT EXISTS `linear_resistor_tipe` (
  `id` int(1) NOT NULL AUTO_INCREMENT,
  `Linear_resistor_tipe_name` char(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table lembain_tech.linear_resistor_tipe: ~0 rows (approximately)

-- Dumping structure for table lembain_tech.material
DROP TABLE IF EXISTS `material`;
CREATE TABLE IF NOT EXISTS `material` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `Material_name` char(15) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Material_name` (`Material_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table lembain_tech.material: ~2 rows (approximately)
REPLACE INTO `material` (`id`, `Material_name`) VALUES
	(2, 'Germanium'),
	(1, 'Silicon');

-- Dumping structure for table lembain_tech.merk
DROP TABLE IF EXISTS `merk`;
CREATE TABLE IF NOT EXISTS `merk` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `Nama_merk` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Nama_merk` (`Nama_merk`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table lembain_tech.merk: ~1 rows (approximately)

-- Dumping structure for table lembain_tech.mounting_tipe
DROP TABLE IF EXISTS `mounting_tipe`;
CREATE TABLE IF NOT EXISTS `mounting_tipe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Mounting_tipe_name` char(5) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Mounting_tipe_name` (`Mounting_tipe_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table lembain_tech.mounting_tipe: ~0 rows (approximately)

-- Dumping structure for table lembain_tech.pakaging
DROP TABLE IF EXISTS `pakaging`;
CREATE TABLE IF NOT EXISTS `pakaging` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `Pakaging_name` char(5) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Pakaging_name` (`Pakaging_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table lembain_tech.pakaging: ~0 rows (approximately)

-- Dumping structure for table lembain_tech.resistor
DROP TABLE IF EXISTS `resistor`;
CREATE TABLE IF NOT EXISTS `resistor` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `Resistor_value` int(5) NOT NULL,
  `Resistor_tipe` int(3) NOT NULL,
  `Component_name` int(3) NOT NULL,
  `Resistor_ratins` int(5) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Resistor_value` (`Resistor_value`),
  KEY `Resistor_tipe` (`Resistor_tipe`,`Component_name`),
  KEY `Component_name` (`Component_name`),
  CONSTRAINT `resistor_ibfk_1` FOREIGN KEY (`Component_name`) REFERENCES `components_name` (`id`),
  CONSTRAINT `resistor_ibfk_2` FOREIGN KEY (`Resistor_tipe`) REFERENCES `fixed_tipe` (`id`),
  CONSTRAINT `resistor_ibfk_3` FOREIGN KEY (`Resistor_tipe`) REFERENCES `linear_resistor_tipe` (`id`),
  CONSTRAINT `resistor_ibfk_4` FOREIGN KEY (`Resistor_tipe`) REFERENCES `variable_resistor_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table lembain_tech.resistor: ~0 rows (approximately)

-- Dumping structure for table lembain_tech.toko
DROP TABLE IF EXISTS `toko`;
CREATE TABLE IF NOT EXISTS `toko` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `Barang` int(4) NOT NULL,
  `Harga` int(4) NOT NULL,
  `Nama_toko` varchar(30) NOT NULL,
  `Alamat` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Barang` (`Barang`),
  KEY `Harga` (`Harga`),
  CONSTRAINT `toko_ibfk_1` FOREIGN KEY (`Barang`) REFERENCES `barang` (`id`),
  CONSTRAINT `toko_ibfk_2` FOREIGN KEY (`Harga`) REFERENCES `harga` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table lembain_tech.toko: ~0 rows (approximately)

-- Dumping structure for table lembain_tech.transistor_category
DROP TABLE IF EXISTS `transistor_category`;
CREATE TABLE IF NOT EXISTS `transistor_category` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `transistor_category_name` int(3) NOT NULL,
  `Component_name` int(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `transistor_category_name` (`transistor_category_name`),
  KEY `transistor_category_name_2` (`transistor_category_name`),
  KEY `transistor_category_ibfk_3` (`Component_name`),
  CONSTRAINT `transistor_category_ibfk_1` FOREIGN KEY (`transistor_category_name`) REFERENCES `bjt_tipe` (`id`),
  CONSTRAINT `transistor_category_ibfk_2` FOREIGN KEY (`transistor_category_name`) REFERENCES `fet_tipe` (`id`),
  CONSTRAINT `transistor_category_ibfk_3` FOREIGN KEY (`Component_name`) REFERENCES `components_name` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table lembain_tech.transistor_category: ~0 rows (approximately)

-- Dumping structure for table lembain_tech.variable_resistor_type
DROP TABLE IF EXISTS `variable_resistor_type`;
CREATE TABLE IF NOT EXISTS `variable_resistor_type` (
  `id` int(1) NOT NULL AUTO_INCREMENT,
  `Variable_resistor_typeariable_resistor_type_name` varchar(15) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Variable_resistor_typeariable_resistor_type_name` (`Variable_resistor_typeariable_resistor_type_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table lembain_tech.variable_resistor_type: ~0 rows (approximately)
REPLACE INTO `variable_resistor_type` (`id`, `Variable_resistor_typeariable_resistor_type_name`) VALUES
	(1, 'Potensiometer');

-- Dumping structure for table lembain_tech.zener_details
DROP TABLE IF EXISTS `zener_details`;
CREATE TABLE IF NOT EXISTS `zener_details` (
  `id` int(1) NOT NULL AUTO_INCREMENT,
  `Zener_voltage` char(5) NOT NULL,
  `ZenerRatings` char(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table lembain_tech.zener_details: ~0 rows (approximately)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
