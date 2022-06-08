-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 03 Jun 2022 pada 09.39
-- Versi server: 10.4.24-MariaDB
-- Versi PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `guideme`
--

DELIMITER $$
--
-- Prosedur
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_article` (IN `place_id` INT(11), IN `title` VARCHAR(50), IN `description` VARCHAR(100), IN `article_url` VARCHAR(100))   INSERT INTO article(
    place_id,
    title,
    description,
    article_url)
    VALUE(
        place_id,
        title,
        description,
        article_url
        )$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `add_history` (IN `user_id` INT(11), IN `place_id` INT(11))   INSERT INTO place_history(
    user_id,
    place_id,
    created_at)
    VALUE(
        user_id,
        place_id,
        NOW())$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `add_photo` (IN `place_id` INT(11), IN `photo_url` VARCHAR(255))   INSERT INTO places_album (
    place_id,
    photo_url)
    VALUE
    (
      	place_id,
        photo_url
        )$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `add_place` (IN `name` VARCHAR(100), IN `address` VARCHAR(100), IN `description` VARCHAR(255), IN `photo_url` VARCHAR(255))   INSERT INTO places(
    name,
    address,
    description,
    photo_url
    )
VALUE (
    name,
    address,
    description,
    photo_url
    )$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `register_user` (IN `email` VARCHAR(60), IN `username` VARCHAR(50), IN `fullname` VARCHAR(100), IN `password` VARCHAR(20), IN `token` VARCHAR(50))   INSERT INTO users (
	email,
    username,
    fullname,
    password,
    token
)
VALUES (
    email,
    username,
    fullname,
    password,
    token
)$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `article`
--

CREATE TABLE `article` (
  `article_id` int(11) NOT NULL,
  `place_id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `photo_url` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `article_url` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `article`
--

INSERT INTO `article` (`article_id`, `place_id`, `title`, `photo_url`, `description`, `article_url`) VALUES
(1, 1, 'Mengenal Sejarah dan Fungsi Candi Borobudur', 'https://lp-cms-production.imgix.net/2019-06/f4024c571e5e09ce5e4049bc181500b1-borobudur-temple.jpg?sharp=10&vib=20&w=1200&auto=compress&fit=crop&fm=auto&h=800', 'Candi Borobudur terletak di desa Borobudur, Kecamatan Borobudur, Kabupaten Magelang, Jawa Tengah. Ca', 'https://katadata.co.id/intan/berita/6155a8764482c/mengenal-sejarah-dan-fungsi-candi-borobudur'),
(2, 2, 'Sejarah Monumen Nasional (Monas)', 'https://upload.wikimedia.org/wikipedia/id/thumb/b/b1/Merdeka_Square_Monas_02.jpg/800px-Merdeka_Square_Monas_02.jpg', 'Monumen Nasional atau Monas adalah tugu yang dibangun dengan tujuan mengenang sejarah perjuangan di ', 'https://www.kompas.com/stori/read/2022/04/18/170000379/sejarah-monumen-nasional-monas-?page=all'),
(3, 3, 'Mengenal Monjali, Tetenger Sejarah Jogja Era Revol', 'https://media.suara.com/pictures/970x544/2021/08/26/39603-monjali.jpg', 'https://yoursay.suara.com/lifestyle/2021/08/26/144814/mengenal-monjali-tetenger-sejarah-jogja-era-re', 'Museum Monumen Jogja Kembali (Monjali) mungkin tidak asing di telinga kita. Monjali kini menjadi alt'),
(4, 4, 'Monumen Palagan Ambarawa, Simbol Ketangguhan Pejua', 'https://jejakpiknik.com/wp-content/uploads/2017/10/@sdanielmoto-e1575758977249.jpg', 'Monumen Palagan Ambarawa, Simbol Ketangguhan Pejuang Zaman Penjajahan – Jejak penjajahan di bumi Ind', 'https://bob.kemenparekraf.go.id/37192-monumen-palagan-ambarawa-simbol-ketangguhan-pejuang-zaman-penj'),
(5, 5, 'Melihat bukti keberani melawan kejamnya PKI', 'https://cda.1001malam.com/uploads/landmarks/monumengubernursuryo_surabaya_329.jpg', 'Monumen Gubernur Suryo berlokasi di Kompleks Taman Apsari, Jalan Gubernur Suryo, Ngawi, Jawa Timur. ', 'https://news.detik.com/berita/d-3649677/melihat-bukti-kejamnya-pki-di-monumen-gubernur-suryo'),
(6, 6, 'Perjalanan Ke Candi Prambanan', 'https://cdn1-production-images-kly.akamaized.net/zdXkymMKR5qVKxzYCMMcQXgQ7OA=/1200x1200/smart/filters:quality(75):strip_icc():format(jpeg)/kly-media-production/medias/1622719/original/038612200_1497347659-Screen_Shot_2017-06-13_at_3.34.15_PM.jpg', 'candi sewu atau identik dengan panggilan candi prambanan mempunyai asal-usul yang menarik tentang pembuatannya.', 'https://www.yogyes.com/id/yogyakarta-tourism-object/candi/prambanan/');

-- --------------------------------------------------------

--
-- Struktur dari tabel `places`
--

CREATE TABLE `places` (
  `place_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `address` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `photo_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `places`
--

INSERT INTO `places` (`place_id`, `name`, `address`, `description`, `photo_url`) VALUES
(1, 'Candi Borobudur', 'Jl. Badrawati, Kw. Candi Borobudur, Borobudur, Kec. Borobudur, Kabupaten Magelang, Jawa Tengah', 'Borobudur adalah sebuah candi Buddha yang terletak di Borobudur, Magelang, Jawa Tengah, Indonesia. Candi ini terletak kurang lebih 100 km di sebelah barat daya Semarang, 86 km di sebelah barat Surakarta, dan 40 km di sebelah barat laut Yogyakarta', 'https://mmc.tirto.id/image/2017/09/05/Borobudur--ISTOCK.jpg'),
(2, 'Monumen Nasional (Monas)', 'Gambir, Kecamatan Gambir, Kota Jakarta Pusat, Daerah Khusus Ibukota Jakarta', 'Monumen Nasional atau yang disingkat dengan Monas atau Tugu Monas adalah monumen peringatan setinggi 132 meter (433 kaki) yang didirikan untuk mengenang perlawanan dan perjuangan rakyat Indonesia untuk merebut kemerdekaan dari pemerintahan kolonial Hindia', 'https://upload.wikimedia.org/wikipedia/id/thumb/b/b1/Merdeka_Square_Monas_02.jpg/240px-Merdeka_Square_Monas_02.jpg'),
(3, 'Monumen Yogya Kembali', ' Jl. Ring Road Utara, Jongkang, Sariharjo, Kec. Ngaglik, Kabupaten Sleman, Daerah Istimewa Yogyakart', 'Museum Monumen Yogya Kembali biasa dikenal sebagai Monumen Jogja Kembali disingkat Monjali adalah sebuah museum sejarah perjuangan kemerdekaan Indonesia yang ada di Daerah Istimewa Yogyakarta dan dikelola oleh Kementerian Pariwisata dan Ekonomi Kreatif. M', 'https://upload.wikimedia.org/wikipedia/id/thumb/4/4a/Monumen_Yogya_Kembali.JPG/250px-Monumen_Yogya_Kembali.JPG'),
(4, 'Monumen Ambarawa', 'Jl. Mgr. Sugiyopranoto, Panjang Lor, Panjang, Kec. Ambarawa, Kabupaten Semarang, Jawa Tengah 50614', 'Monumen Palagan Ambarawa adalah sebuah monumen yang terdapat di Ambarawa, Kabupaten Semarang.\r\n\r\nMonumen ini merupakan simbol untuk mengenang sejarah pertempuran Palagan Ambarawa pada tanggal 12 Desember - 15 Desember 1945 Ambarawa. Pasukan Sekutu yang te', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQNhMeyotI3cM_Eos4YbSP2Q4PG5O6DHsnZFUKjMtSifg&s'),
(5, 'Monumen Gubernur Suryo', 'Jl. Gubernur Suryo, Embong Kaliasin, Kec. Genteng, Kota SBY, Jawa Timur 60271', 'Monumen Gubernur Suryo berlokasi di Kompleks Taman Apsari, Jalan Gubernur Suryo, Ngawi, Jawa Timur. Dialah Gubernur Jawa Timur pertama yang dibunuh saat pemberontakan PKI di Madiun tahun 1948. Monumennya berbentuk patung figur sang mantan gubernur dalam p', 'https://cda.1001malam.com/uploads/landmarks/monumengubernursuryo_surabaya_329.jpg'),
(6, 'Candi Prambanan', 'Jl. Raya Solo - Yogyakarta No.16, Kranggan, Bokoharjo, Kec. Prambanan, Kabupaten Sleman, Daerah Istimewa Yogyakarta 55571','Candi Prambanan atau Candi Roro Jonggrang adalah kompleks candi Hindu terbesar di Indonesia yang dibangun pada abad ke-9 masehi. Candi ini dipersembahkan untuk Trimurti, tiga dewa utama Hindu yaitu dewa Brahma sebagai dewa pencipta, dewa Wisnu sebagai dewa pemelihara, dan dewa Siwa sebagai dewa pemusnah.', 'https://awsimages.detik.net.id/community/media/visual/2020/03/20/b86bb4c8-f0b2-4771-83f3-57b723d5ccd4_169.jpeg?w=700&q=90');

-- --------------------------------------------------------

--
-- Struktur dari tabel `places_album`
--

CREATE TABLE `places_album` (
  `photo_id` int(11) NOT NULL,
  `place_id` int(11) NOT NULL,
  `photo_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `places_album`
--

INSERT INTO `places_album` (`photo_id`, `place_id`, `photo_url`) VALUES
(1, 1, 'https://lp-cms-production.imgix.net/2019-06/f4024c571e5e09ce5e4049bc181500b1-borobudur-temple.jpg?sharp=10&vib=20&w=1200&auto=compress&fit=crop&fm=auto&h=800'),
(2, 1, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/05/ef/47/1c/borobudur-temple.jpg?w=1200&h=1200&s=1'),
(3, 1, 'https://i0.wp.com/borobudurnews.com/wp-content/uploads/2021/09/Screen-Shot-2021-09-09-at-08.01.55.png?fit=823%2C548&ssl=1'),
(4, 1, 'https://res.klook.com/images/fl_lossy.progressive,q_65/c_fill,w_1200,h_630/w_80,x_15,y_15,g_south_west,l_Klook_water_br_trans_yhcmh3/activities/pdhavobrpctqu0igmjox/[PROMO]%20Trip%20Candi%20Borobudur%20dan%20Candi%20Prambanan.jpg'),
(5, 1, 'https://cdn.medcom.id/dynamic/content/2020/10/16/1199908/ytuQAC7sFv.jpg?w=480'),
(6, 2, 'https://upload.wikimedia.org/wikipedia/id/thumb/b/b1/Merdeka_Square_Monas_02.jpg/800px-Merdeka_Square_Monas_02.jpg'),
(7, 2, 'https://cdns.klimg.com/dream.co.id/resized/640x320/news/2020/06/18/139659/dibuka-20-juni-monas-hanya-bisa-diakses-dari-2-pintu-200618h.jpg'),
(8, 2, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTW9QuU9IxLHY7_uLnasqATm1sYTmKTccfSvQ&usqp=CAU'),
(9, 2, 'https://thumb.viva.co.id/media/frontend/thumbs3/2016/12/30/5866269b57c8d-berwisata-di-monumen-nasional-monas-jakarta_665_374.jpg'),
(10, 2, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRi-mbizp__2XOxKsZ8C-MXTUIPSJvNpQKtng&usqp=CAU'),
(11, 3, 'https://media.suara.com/pictures/970x544/2021/08/26/39603-monjali.jpg'),
(12, 3, 'https://upload.wikimedia.org/wikipedia/id/4/4a/Monumen_Yogya_Kembali.JPG'),
(13, 3, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSJRJH-DkM7gmpubZAOhROEnj7RbY0fuBx2Rg&usqp=CAU'),
(14, 3, 'http://www.tanahnusantara.com/wp-content/uploads/2017/08/Monjali.jpgv'),
(15, 3, 'https://statik.tempo.co/data/2019/11/10/id_888023/888023_720.jpg'),
(16, 4, 'https://jejakpiknik.com/wp-content/uploads/2017/10/@sdanielmoto-e1575758977249.jpg'),
(17, 4, 'http://idsejarah.net/wp-content/uploads/2017/01/MonumenPalaganAmbarawa.jpg'),
(18, 4, 'https://jatengtravelguide.info/images/1629964712.png'),
(19, 4, 'https://pict-a.sindonews.net/dyn/620/pena/news/2020/11/08/29/223906/karomah-kr-sumomihardho-isi-kekuatan-magis-tkr-di-pertempuran-ambara-eob.jpg'),
(20, 4, 'https://pict-a.sindonews.net/dyn/620/content/2018/06/08/29/1312840/monumen-palagan-ambarawa-simbol-ketangguhan-tkr-usir-tentara-sekutu-j2G-thumb.jpg'),
(21, 5, 'https://cda.1001malam.com/uploads/landmarks/monumengubernursuryo_surabaya_329.jpg'),
(22, 5, 'https://www.gotravelly.com/assets/img/review/gallery/1766/cb108f97d93df290e2f1b76b9fa4f193.jpg'),
(23, 5, 'https://assets.promediateknologi.com/crop/0x0:0x0/x/photo/2021/11/09/173752899.jpeg'),
(24, 5, 'https://lh3.googleusercontent.com/p/AF1QipPSPkVyL7eH-cqHhYIQma3FEdbXwKW9WWu3jZsL=s1600-w5472'),
(25, 5, 'https://astumd.files.wordpress.com/2016/08/gubernur-suryo-e1470406203305.jpg'),
(26, 6, 'https://awsimages.detik.net.id/community/media/visual/2020/03/20/b86bb4c8-f0b2-4771-83f3-57b723d5ccd4_169.jpeg?w=700&q=90'),
(27, 6, 'https://akcdn.detik.net.id/visual/2020/10/21/candi-prambanan_169.jpeg?w=650'),
(28, 6, 'https://borobudurpark.com/wp-content/uploads/2017/05/homepage-portrait-prambanan.jpg'),
(29, 6, 'https://4.bp.blogspot.com/-yAptckjLyps/XDX6S1t4r3I/AAAAAAAABVo/p-iRhH2MzhcOv-zR-VwOzQjMiBGF-6K8ACLcBGAs/s1600/wisata%2Bcandi%2Bperambanan.jpg'),
(30, 6, 'https://images.solopos.com/2021/04/candi-sewu.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `email` varchar(60) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `password_salt` varchar(255) NOT NULL,
  `password_hash` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`user_id`, `email`, `fullname`, `password_salt`, `password_hash`) VALUES
(1, 'kennethliem@gmail.com', 'Kenneth Liem Hardadi', '123456', ''),
(4, 'karthikeyan.ranasthala@gmail.com', '', '123456', '123456'),
(5, 'choyihyun@mail.com', 'Cho Yi Hyun', 'e08c37d45bf09dc9e2ae94fa35d6e64e', 'e6241c405c053b1df8fede084160900c37c476dfcf2e24c6a7854b36f8e46acc'),
(7, 'iu@mail.com', 'Lee Ji Eun', '3d80eebf3c99de3104a7b52ea6a881a1', '1cab63b71d706315d48de6eb962671e8bd15c58da35ede44be070785a02f7666'),
(8, 'rt@mail.com', 'Robert', '211db83f551582e09ab8f059ab457078', '2dbc03b4ed3c717f4c93f361f568b1448e9b5051e98e836e5f3e6ed68df5e1dd'),
(9, 'geraldo@gmail.com', 'Geraldo Julius Halim', '7bf692ca5f24889e38e4ce0432e99727', 'efbd329dcb4435d26e5cae0567c58c8555fe6e42b7209910b1880126d6b7228e'),
(10, 'bts@mail.com', 'BTS Big Hit Ent.', '6fb450c2a09e5bf370ceaa9676ccab4c', '592f1e131a2c895cb703798ac1f45c724844d19eb52caf0ae554b63e1a8dfe12'),
(11, 'leesk@mail.com', 'Lee Sung Kyung', '95fd5d3bfa569d0532bdac73d55a89e9', 'f099ac5ab89d66195a7d57f0364aa97e75e9bd938c2ddcd558b08d2f1349438e'),
(14, 'ksj@mail.com', 'Kim Se Jeong', '6a124b1547bb9e56144db8732b0e88bc', '88fee835ba25a88d210eca7d0c43375e60e655856ef8d2cc638f836549872eb7'),
(15, 'aca@mail.com', 'Natasya', '382ace25b0df22913a17a3538474abb8', '11fa2e7d683f3a53204556c0f8dd31bea3593702288f28147c466898d44da1c4');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users_visit_history`
--

CREATE TABLE `users_visit_history` (
  `history_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `place_id` int(11) NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `users_visit_history`
--

INSERT INTO `users_visit_history` (`history_id`, `user_id`, `place_id`, `created_at`) VALUES
(1, 7, 1, '2022-05-29'),
(2, 7, 2, '2022-05-29');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`article_id`);

--
-- Indeks untuk tabel `places`
--
ALTER TABLE `places`
  ADD PRIMARY KEY (`place_id`);

--
-- Indeks untuk tabel `places_album`
--
ALTER TABLE `places_album`
  ADD PRIMARY KEY (`photo_id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indeks untuk tabel `users_visit_history`
--
ALTER TABLE `users_visit_history`
  ADD PRIMARY KEY (`history_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `article`
--
ALTER TABLE `article`
  MODIFY `article_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `places`
--
ALTER TABLE `places`
  MODIFY `place_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `places_album`
--
ALTER TABLE `places_album`
  MODIFY `photo_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `users_visit_history`
--
ALTER TABLE `users_visit_history`
  MODIFY `history_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
