-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 21, 2024 at 03:25 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mydb`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `email` varchar(100) NOT NULL,
  `lastName` varchar(45) DEFAULT NULL,
  `firstName` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`email`, `lastName`, `firstName`) VALUES
('a.mi@Sedidrisus.org', 'Benson', 'Ingrid'),
('a.neque@malesuada.com', 'Turner', 'Justin'),
('ac.orci.Ut@nibh.co.uk', 'Hurley', 'Solomon'),
('Aliquam.ultrices.iaculis@sit.ca', 'Mckenzie', 'Virginia'),
('ante.Vivamus.non@eutempor.org', 'Rivers', 'Roanna'),
('arcu@sodalespurus.edu', 'Molina', 'Tamekah'),
('at.sem.molestie@lorem.co.uk', 'Lopez', 'Neve'),
('at@Pellentesquehabitantmorbi.com', 'Reeves', 'Alan'),
('auctor.ullamcorper.nisl@eu.net', 'Simmons', 'Brock'),
('augue@mauris.com', 'Hammond', 'Murphy'),
('blandit.mattis.Cras@euneque.net', 'Levy', 'Orson'),
('commodo.tincidunt.nibh@metus.co.uk', 'Short', 'Iola'),
('condimentum@tinciduntDonec.com', 'Lambert', 'Madaline'),
('congue.a@Vivamus.net', 'Clarke', 'Chancellor'),
('consectetuer.euismod@nonummyFuscefermentum.ca', 'Wyatt', 'Sasha'),
('contoh2@p.com', 'dua', 'contoh'),
('contoh3@p.com', 'tiga', 'contoh'),
('contoh@p.com', 'satu', 'contoh'),
('Cras@eratnequenon.edu', 'Schroeder', 'Alan'),
('Cum.sociis@uterosnon.net', 'Tran', 'Colorado'),
('diam.at@Craspellentesque.ca', 'Clay', 'Whitney'),
('dictum@Integer.net', 'Ingram', 'Castor'),
('dolor@Inornaresagittis.co.uk', 'Heath', 'Nash'),
('Donec.tempor@risusquis.co.uk', 'Hodge', 'Iliana'),
('Donec@lectussitamet.edu', 'Wilkinson', 'Gage'),
('dui@auctorveliteget.edu', 'Blake', 'Bianca'),
('eget.magna.Suspendisse@Morbimetus.com', 'Banks', 'Cain'),
('enim.Etiam@Vivamusnonlorem.edu', 'Hood', 'Lareina'),
('enim@loremvehiculaet.net', 'Montgomery', 'Lewis'),
('enim@turpisvitaepurus.co.uk', 'Macias', 'Jin'),
('erat.Vivamus.nisi@ante.ca', 'Bullock', 'Eric'),
('Etiam@adipiscingligula.net', 'George', 'Branden'),
('eu.enim@congueIn.edu', 'Gutierrez', 'Miranda'),
('eu.odio.tristique@Donec.org', 'Owens', 'Remedios'),
('eu@CrasinterdumNunc.co.uk', 'Goodman', 'Lani'),
('facilisis.facilisis.magna@anteiaculis.org', 'Mullins', 'Dale'),
('facilisis@vitaesodalesat.ca', 'Diaz', 'Adara'),
('felis.orci.adipiscing@infaucibus.org', 'Weber', 'Mia'),
('fringilla.euismod.enim@bibendum.edu', 'Sanford', 'Deanna'),
('fringilla@nislelementum.co.uk', 'Atkins', 'Vernon'),
('Fusce.dolor.quam@sagittisNullam.edu', 'Morrow', 'Hyatt'),
('Fusce.mollis.Duis@IntegermollisInteger.net', 'Beach', 'Ivan'),
('iaculis.enim.sit@non.net', 'Terry', 'Hector'),
('id@ametrisus.edu', 'Young', 'Xavier'),
('imperdiet.ullamcorper.Duis@erat.co.uk', 'Curry', 'Jemima'),
('Integer.urna.Vivamus@quamdignissim.com', 'Gardner', 'Adele'),
('interdum.ligula@odioauctorvitae.net', 'Rivera', 'Amelia'),
('ipsum.primis.in@massa.com', 'Richardson', 'Arden'),
('lacus.Quisque@enimSuspendissealiquet.ca', 'Zamora', 'Quamar'),
('lacus@afacilisis.net', 'Flowers', 'Sydnee'),
('lacus@ut.ca', 'Brooks', 'Shay'),
('libero.at@intempus.org', 'Hebert', 'Chancellor'),
('libero@at.ca', 'Oneal', 'Jonah'),
('ligula@luctusfelispurus.edu', 'Lee', 'Jonah'),
('lobortis@enimMaurisquis.ca', 'Greene', 'Evelyn'),
('Maecenas.mi@feugiat.edu', 'Hoffman', 'Ainsley'),
('Maecenas@auctor.org', 'Burris', 'Charlotte'),
('magna@euaugue.co.uk', 'Suarez', 'Lyle'),
('mauris.blandit@Aeneangravidanunc.co.uk', 'Caldwell', 'Stacy'),
('Mauris.molestie@magnaetipsum.net', 'Knox', 'Erin'),
('metus.In@molestiedapibusligula.ca', 'Buckner', 'Palmer'),
('molestie.sodales.Mauris@gravidanonsollicitudin.ca', 'Melendez', 'Murphy'),
('morbi.tristique@perconubia.co.uk', 'Jimenez', 'Dean'),
('Nam.interdum.enim@dolor.org', 'Bates', 'Genevieve'),
('nibh@dignissimMaecenasornare.ca', 'Garcia', 'Violet'),
('Nulla.eget.metus@nec.com', 'Heath', 'Kareem'),
('nulla.In.tincidunt@duiSuspendisse.org', 'Huber', 'Melvin'),
('Nulla@egestas.net', 'Morrow', 'Ezekiel'),
('Nunc.laoreet.lectus@vitaepurus.net', 'Harding', 'Jana'),
('Nunc.pulvinar.arcu@sagittislobortismauris.edu', 'Holmes', 'Fatima'),
('Nunc.pulvinar@magnaSed.co.uk', 'Gilmore', 'Alden'),
('nunc@dictum.edu', 'Ashley', 'Rylee'),
('odio.tristique@feugiat.net', 'Rush', 'Kenneth'),
('oke@r.com', 'oke', 'yayay'),
('ornare.lectus@leoVivamus.org', 'Cherry', 'Jonah'),
('pede.ultrices@Nunc.ca', 'Patton', 'Lamar'),
('pellentesque@purusaccumsaninterdum.org', 'Vaughn', 'Grant'),
('penatibus@sed.org', 'Carson', 'Odessa'),
('pharetra.felis@Nam.net', 'Herman', 'Kevin'),
('Praesent.luctus@auctorvelit.org', 'Dickson', 'Troy'),
('Proin@anteipsum.co.uk', 'Gallegos', 'Gregory'),
('quam.quis@velitCras.ca', 'Mcmahon', 'Malik'),
('Quisque@vulputatelacus.net', 'Marks', 'Lila'),
('sagittis.felis@semper.ca', 'Griffin', 'Evelyn'),
('sapien@ligulaDonecluctus.com', 'Raymond', 'Katell'),
('scelerisque.mollis.Phasellus@nisidictumaugue.com', 'Dale', 'Ian'),
('Sed.eu@quis.com', 'Bowman', 'Akeem'),
('sit.amet@lectusjusto.org', 'Bryan', 'Ebony'),
('sit@cursus.co.uk', 'Branch', 'Ariel'),
('sit@ridiculus.net', 'Wilkins', 'Raphael'),
('sociis.natoque@nibhQuisque.ca', 'Roberts', 'Virginia'),
('sodales.purus@nequeSed.com', 'Hester', 'Frances'),
('tellus.justo@elitNullafacilisi.co.uk', 'Wooten', 'Adrian'),
('tellus.non.magna@arcu.ca', 'Stout', 'Rose'),
('tempus@interdum.edu', 'Hobbs', 'Hector'),
('tes@p.com', 'tes', 'test'),
('tesbro@gmail.com', 'Dicky', 'Arya'),
('test1@gmail.com', 'Arya', 'Dicky'),
('test22@pr.com', 'nih', 'contoh'),
('test2@gmail.com', 'nih', 'Arya'),
('test@gmail.com', 'Dicky', 'Arya'),
('test@pr.com', 'nih', 'test'),
('turpis@antebibendum.edu', 'Mcintosh', 'Leah'),
('ultrices.sit@habitantmorbi.edu', 'King', 'Oren'),
('ultricies.sem.magna@Morbinonsapien.com', 'Harvey', 'Hoyt'),
('ut.erat@ligula.edu', 'Gilmore', 'Hanae'),
('vel@scelerisquelorem.org', 'Clements', 'Cherokee'),
('Vestibulum.ante@auctorquis.org', 'Sargent', 'Lacota'),
('Vestibulum@porttitor.com', 'Estes', 'Megan'),
('Vestibulum@utcursusluctus.net', 'Vincent', 'Chandler'),
('vitae.sodales.at@Aeneaneuismodmauris.net', 'Haynes', 'Vernon');

-- --------------------------------------------------------

--
-- Table structure for table `mobil`
--

CREATE TABLE `mobil` (
  `nomor_plat` varchar(10) CHARACTER SET utf8 NOT NULL,
  `isAvailable` int(11) DEFAULT NULL,
  `merk` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `jenis` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `model` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `jumlah_penumpang` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `tahun` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  `nomor_telepon` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `harga_sewa` float DEFAULT NULL,
  `lokasi` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `foto_mobil` text CHARACTER SET utf8 DEFAULT NULL,
  `milik_username` varchar(20) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mobil`
--

INSERT INTO `mobil` (`nomor_plat`, `isAvailable`, `merk`, `jenis`, `model`, `jumlah_penumpang`, `tahun`, `nomor_telepon`, `harga_sewa`, `lokasi`, `foto_mobil`, `milik_username`) VALUES
('B 2471 NN', 1, 'Pilih Merk', 'Pilih Jenis', 'Super', 'Jumlah Penumpang', '2005', '082325902842', 800000, 'Jakarta', '2023_Toyota_Fortuner.jpg', 'fahmi'),
('R 2012 A', 1, 'Toyota', 'SUV', 'CIVIC', '6', '2022', '082325902842', 350000, 'Purwokerto', 'Team_Gillman_Honda_North___Houston_Dealership__Service_Center.jpg', 'ckyar'),
('R 2012 ABE', 1, 'Toyota', 'Sedan', 'Corolla', '4', '2021', '081227233267', 400000, 'Purwokerto', 'Ah_boy_on_Instagram____toyota_ae86_trueno....jpg', 'contoh'),
('R 9012 CXF', 1, 'Honda', 'Mobil Hibrida', '180 SX', '2', '2008', '082325902842', 5000000, 'Widarapayung', 'Nissan_180SX_outsidesam_jdm_supercars_180sx_nissan_iconiccars_car_cars.jpg', 'fahmi');

-- --------------------------------------------------------

--
-- Table structure for table `mobilhapus`
--

CREATE TABLE `mobilhapus` (
  `nomor_plat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `penyewaan`
--

CREATE TABLE `penyewaan` (
  `id_sewa` varchar(8) NOT NULL,
  `id_penyewa` varchar(255) DEFAULT NULL,
  `nomor_plat` varchar(255) DEFAULT NULL,
  `pemilik` varchar(20) NOT NULL,
  `fromdate` date DEFAULT NULL,
  `todate` date DEFAULT NULL,
  `tarif_sewa` int(11) DEFAULT NULL,
  `total_hari` int(11) DEFAULT NULL,
  `total_biaya` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `penyewaan`
--

INSERT INTO `penyewaan` (`id_sewa`, `id_penyewa`, `nomor_plat`, `pemilik`, `fromdate`, `todate`, `tarif_sewa`, `total_hari`, `total_biaya`) VALUES
('3EGEN2PA', 'ckyar_', 'R 9012 CXF', 'fahmi', '2024-01-21', '2024-01-26', 5000000, 5, '25000000.00'),
('DJ7HOOYW', 'ckyar', 'R 2012 ABE', 'contoh', '2024-01-21', '2024-01-26', 5000000, 5, '25000000.00');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `userName` varchar(20) NOT NULL,
  `password` varchar(45) DEFAULT NULL,
  `isVIP` int(11) DEFAULT NULL,
  `Customer_email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userName`, `password`, `isVIP`, `Customer_email`) VALUES
('ckyar', '123', 0, 'tesbro@gmail.com'),
('ckyar_', '123', 0, 'test1@gmail.com'),
('contoh', '123', 0, 'contoh@p.com'),
('contoh2', '123', 0, 'contoh2@p.com'),
('contoh3', '123', 0, 'contoh3@p.com'),
('contohh', '123', 0, 'test22@pr.com'),
('fahmi', '12345678', 0, 'test2@gmail.com'),
('tess', '123', 0, 'tes@p.com'),
('user0', 'password0', 0, 'tellus.justo@elitNullafacilisi.co.uk'),
('user1', 'password1', 0, 'sapien@ligulaDonecluctus.com'),
('user10', 'password10', 0, 'id@ametrisus.edu'),
('user11', 'password11', 0, 'eu.odio.tristique@Donec.org'),
('user12', 'password12', 0, 'augue@mauris.com'),
('user13', 'password13', 0, 'condimentum@tinciduntDonec.com'),
('user14', 'password14', 0, 'enim@loremvehiculaet.net'),
('user15', 'password15', 0, 'Vestibulum@utcursusluctus.net'),
('user16', 'password16', 0, 'Vestibulum@porttitor.com'),
('user17', 'password17', 0, 'Etiam@adipiscingligula.net'),
('user18', 'password18', 0, 'sit@cursus.co.uk'),
('user19', 'password19', 0, 'turpis@antebibendum.edu'),
('user2', 'password2', 0, 'Nunc.pulvinar@magnaSed.co.uk'),
('user20', 'password20', 0, 'Nulla@egestas.net'),
('user21', 'password21', 0, 'facilisis@vitaesodalesat.ca'),
('user22', 'password22', 0, 'eu@CrasinterdumNunc.co.uk'),
('user23', 'password23', 0, 'dolor@Inornaresagittis.co.uk'),
('user24', 'password24', 0, 'felis.orci.adipiscing@infaucibus.org'),
('user25', 'password25', 0, 'libero.at@intempus.org'),
('user26', 'password26', 0, 'iaculis.enim.sit@non.net'),
('user27', 'password27', 0, 'Aliquam.ultrices.iaculis@sit.ca'),
('user28', 'password28', 0, 'sodales.purus@nequeSed.com'),
('user29', 'password29', 0, 'vitae.sodales.at@Aeneaneuismodmauris.net'),
('user3', 'password3', 0, 'sit@ridiculus.net'),
('user30', 'password30', 0, 'congue.a@Vivamus.net'),
('user31', 'password31', 0, 'metus.In@molestiedapibusligula.ca'),
('user32', 'password32', 0, 'lacus.Quisque@enimSuspendissealiquet.ca'),
('user33', 'password33', 0, 'at@Pellentesquehabitantmorbi.com'),
('user34', 'password34', 0, 'facilisis.facilisis.magna@anteiaculis.org'),
('user35', 'password35', 0, 'Fusce.mollis.Duis@IntegermollisInteger.net'),
('user36', 'password36', 0, 'sit.amet@lectusjusto.org'),
('user37', 'password37', 0, 'odio.tristique@feugiat.net'),
('user38', 'password38', 0, 'morbi.tristique@perconubia.co.uk'),
('user39', 'password39', 0, 'pede.ultrices@Nunc.ca'),
('user4', 'password4', 0, 'sociis.natoque@nibhQuisque.ca'),
('user40', 'password40', 0, 'molestie.sodales.Mauris@gravidanonsollicitudin.ca'),
('user41', 'password41', 0, 'Maecenas@auctor.org'),
('user42', 'password42', 0, 'ultricies.sem.magna@Morbinonsapien.com'),
('user43', 'password43', 0, 'ut.erat@ligula.edu'),
('user44', 'password44', 0, 'a.neque@malesuada.com'),
('user45', 'password45', 0, 'Nunc.laoreet.lectus@vitaepurus.net'),
('user46', 'password46', 0, 'ipsum.primis.in@massa.com'),
('user47', 'password47', 0, 'eu.enim@congueIn.edu'),
('user48', 'password48', 0, 'Vestibulum.ante@auctorquis.org'),
('user49', 'password49', 0, 'quam.quis@velitCras.ca'),
('user5', 'password5', 0, 'Proin@anteipsum.co.uk'),
('user50', 'password50', 0, 'blandit.mattis.Cras@euneque.net'),
('user51', 'password51', 0, 'consectetuer.euismod@nonummyFuscefermentum.ca'),
('user52', 'password52', 0, 'Maecenas.mi@feugiat.edu'),
('user53', 'password53', 0, 'ligula@luctusfelispurus.edu'),
('user54', 'password54', 0, 'Cras@eratnequenon.edu'),
('user55', 'password55', 0, 'ac.orci.Ut@nibh.co.uk'),
('user56', 'password56', 0, 'fringilla.euismod.enim@bibendum.edu'),
('user57', 'password57', 0, 'ultrices.sit@habitantmorbi.edu'),
('user58', 'password58', 0, 'penatibus@sed.org'),
('user59', 'password59', 0, 'arcu@sodalespurus.edu'),
('user6', 'password6', 0, 'Nunc.pulvinar.arcu@sagittislobortismauris.edu'),
('user60', 'password60', 0, 'sagittis.felis@semper.ca'),
('user61', 'password61', 0, 'erat.Vivamus.nisi@ante.ca'),
('user62', 'password62', 0, 'magna@euaugue.co.uk'),
('user63', 'password63', 0, 'vel@scelerisquelorem.org'),
('user64', 'password64', 0, 'tellus.non.magna@arcu.ca'),
('user65', 'password65', 0, 'commodo.tincidunt.nibh@metus.co.uk'),
('user66', 'password66', 0, 'nibh@dignissimMaecenasornare.ca'),
('user67', 'password67', 0, 'Sed.eu@quis.com'),
('user68', 'password68', 0, 'auctor.ullamcorper.nisl@eu.net'),
('user69', 'password69', 0, 'imperdiet.ullamcorper.Duis@erat.co.uk'),
('user7', 'password7', 0, 'lacus@ut.ca'),
('user70', 'password70', 0, 'eget.magna.Suspendisse@Morbimetus.com'),
('user71', 'password71', 0, 'Fusce.dolor.quam@sagittisNullam.edu'),
('user72', 'password72', 0, 'lobortis@enimMaurisquis.ca'),
('user73', 'password73', 0, 'dui@auctorveliteget.edu'),
('user74', 'password74', 0, 'Quisque@vulputatelacus.net'),
('user75', 'password75', 0, 'ornare.lectus@leoVivamus.org'),
('user76', 'password76', 0, 'pharetra.felis@Nam.net'),
('user77', 'password77', 0, 'Praesent.luctus@auctorvelit.org'),
('user78', 'password78', 0, 'interdum.ligula@odioauctorvitae.net'),
('user79', 'password79', 0, 'dictum@Integer.net'),
('user8', 'password8', 0, 'a.mi@Sedidrisus.org'),
('user80', 'password80', 0, 'Nulla.eget.metus@nec.com'),
('user81', 'password81', 0, 'nulla.In.tincidunt@duiSuspendisse.org'),
('user82', 'password82', 0, 'Donec@lectussitamet.edu'),
('user83', 'password83', 0, 'diam.at@Craspellentesque.ca'),
('user84', 'password84', 0, 'nunc@dictum.edu'),
('user85', 'password85', 0, 'libero@at.ca'),
('user86', 'password86', 0, 'Mauris.molestie@magnaetipsum.net'),
('user87', 'password87', 0, 'Cum.sociis@uterosnon.net'),
('user88', 'password88', 0, 'pellentesque@purusaccumsaninterdum.org'),
('user89', 'password89', 0, 'scelerisque.mollis.Phasellus@nisidictumaugue.com'),
('user9', 'password9', 0, 'enim@turpisvitaepurus.co.uk'),
('user90', 'password90', 0, 'ante.Vivamus.non@eutempor.org'),
('user91', 'password91', 0, 'enim.Etiam@Vivamusnonlorem.edu'),
('user92', 'password92', 0, 'Integer.urna.Vivamus@quamdignissim.com'),
('user93', 'password93', 0, 'lacus@afacilisis.net'),
('user94', 'password94', 0, 'Donec.tempor@risusquis.co.uk'),
('user95', 'password95', 0, 'mauris.blandit@Aeneangravidanunc.co.uk'),
('user96', 'password96', 0, 'fringilla@nislelementum.co.uk'),
('user97', 'password97', 0, 'Nam.interdum.enim@dolor.org'),
('user98', 'password98', 0, 'tempus@interdum.edu'),
('user99', 'password99', 0, 'at.sem.molestie@lorem.co.uk'),
('waduh', '123', 0, 'test@pr.com'),
('yaaa', '123', 0, 'oke@r.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `mobil`
--
ALTER TABLE `mobil`
  ADD PRIMARY KEY (`nomor_plat`,`milik_username`),
  ADD KEY `fk_user_has_car` (`milik_username`);

--
-- Indexes for table `mobilhapus`
--
ALTER TABLE `mobilhapus`
  ADD PRIMARY KEY (`nomor_plat`);

--
-- Indexes for table `penyewaan`
--
ALTER TABLE `penyewaan`
  ADD PRIMARY KEY (`id_sewa`),
  ADD KEY `fk_car_sewa` (`nomor_plat`),
  ADD KEY `id_penyewa` (`id_penyewa`),
  ADD KEY `pemilik` (`pemilik`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userName`),
  ADD KEY `fk_User_Customer_idx` (`Customer_email`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `mobil`
--
ALTER TABLE `mobil`
  ADD CONSTRAINT `fk_user_has_car` FOREIGN KEY (`milik_username`) REFERENCES `user` (`userName`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `penyewaan`
--
ALTER TABLE `penyewaan`
  ADD CONSTRAINT `fk_car_sewa` FOREIGN KEY (`nomor_plat`) REFERENCES `mobil` (`nomor_plat`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `penyewaan_ibfk_1` FOREIGN KEY (`id_penyewa`) REFERENCES `user` (`userName`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `penyewaan_ibfk_2` FOREIGN KEY (`pemilik`) REFERENCES `mobil` (`milik_username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `fk_User_Customer` FOREIGN KEY (`Customer_email`) REFERENCES `customer` (`email`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
