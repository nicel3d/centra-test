-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1
-- Время создания: Дек 30 2017 г., 10:21
-- Версия сервера: 10.1.16-MariaDB
-- Версия PHP: 7.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `centra`
--

-- --------------------------------------------------------

--
-- Структура таблицы `centra_migration`
--

CREATE TABLE `centra_migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `centra_migration`
--

INSERT INTO `centra_migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1514590520),
('m171229_233359_create_user_table', 1514590534);

-- --------------------------------------------------------

--
-- Структура таблицы `centra_news`
--

CREATE TABLE `centra_news` (
  `id` int(11) NOT NULL,
  `title` varchar(40) DEFAULT NULL,
  `image` varchar(40) DEFAULT NULL,
  `alias` varchar(40) DEFAULT NULL,
  `article` text,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `centra_news`
--

INSERT INTO `centra_news` (`id`, `title`, `image`, `alias`, `article`, `created_at`, `updated_at`, `user_id`) VALUES
(1, 'News2 1', 'Intel_Xeon_E5-2600_v2_01.jpg', 'news-1', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam imperdiet aliquet est ut posuere. Cras placerat odio ac fringilla mollis. Maecenas semper lacus at massa laoreet lacinia. Sed a odio vitae neque laoreet posuere eu ut mauris. Aliquam quis euismod justo. Nullam purus justo, porttitor a lacus ac, iaculis porttitor dui. Etiam facilisis, justo et luctus blandit, metus nulla vehicula nunc, eu venenatis lacus lacus nec urna. Vestibulum ac malesuada nibh. Nam ultrices tortor quis arcu efficitur, eget dapibus leo posuere.\r\n\r\nPraesent imperdiet molestie orci congue ultrices. Phasellus efficitur augue lectus, sed porttitor risus commodo sit amet. Praesent aliquet libero quis tincidunt cursus. Sed sed mi a urna fermentum rhoncus. Aenean eros mi, venenatis non eleifend nec, posuere sed sapien. Quisque consectetur, turpis ut pellentesque molestie, dolor ex cursus diam, at suscipit dolor sapien quis tellus. In posuere lacus metus, in pretium dui egestas at. Donec nibh lacus, fringilla ac eleifend ac, pulvinar ultricies velit. Mauris faucibus lacinia erat sed tristique. Duis tempor urna quis tempus molestie. Nulla vel est elit. Duis vel tristique ante. Aliquam feugiat urna sit amet nulla fringilla dapibus at non risus. Quisque iaculis, metus at sodales luctus, est dolor placerat massa, eget scelerisque dolor ipsum id lacus. Phasellus dictum magna magna, eget finibus leo dictum vitae. Fusce auctor purus rhoncus elementum tincidunt.', 1514604273, 1514622620, 8),
(2, 'Новость 2', 'Thumb_350.jpg', '', 'Suspendisse ultricies justo id quam maximus, et hendrerit erat feugiat. Nunc molestie tortor nec mi rutrum, ut blandit est pharetra. Etiam blandit egestas elit, vitae eleifend metus lobortis a. Etiam suscipit, elit eu pellentesque vehicula, ante magna commodo justo, sit amet dapibus nulla elit id turpis. Mauris hendrerit ante nec ullamcorper maximus. Ut ut nisi quis velit ornare tempus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Donec ac ultrices ante. Integer neque lacus, faucibus ac tellus quis, mollis pellentesque est. Etiam interdum justo eu nulla interdum condimentum.', 1514611406, 1514622259, 8),
(3, 'Новость 3', '', '', 'Nunc sit amet molestie lectus. Vivamus laoreet nibh ante. Nam orci nibh, efficitur sed nulla vel, rhoncus semper diam. Pellentesque ac maximus neque. Morbi et vestibulum mauris, et ullamcorper arcu. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Phasellus at iaculis elit, ut iaculis magna.\r\n\r\nIn hac habitasse platea dictumst. Cras non scelerisque neque. Cras commodo urna eu arcu malesuada commodo. Integer sed nulla orci. Curabitur ac iaculis nulla, in pharetra urna. Integer posuere tellus ligula, vitae dictum velit volutpat ac. Praesent sit amet mauris quis elit mollis commodo at nec lorem. Ut tempor mauris ut mattis elementum. Integer sagittis aliquam nisl, a semper quam fringilla et. Vivamus in congue enim. Nam nibh dolor, tincidunt in ante vitae, iaculis rutrum erat. Nam consequat vulputate metus quis sodales. Duis a tincidunt ex, et tincidunt orci. Quisque vitae ante vel elit finibus interdum. Donec id leo sed dui eleifend tempus.', 1514611406, 1514615897, 8),
(4, 'Новость 4', '', '', 'Aliquam ac ultricies neque. Praesent tristique, mauris ut tincidunt tristique, sem elit euismod diam, a dictum tellus nisi nec diam. Nam mollis placerat velit, a pulvinar nunc semper in. Phasellus id tortor justo. Morbi fermentum dignissim vehicula. Nulla lacinia iaculis justo eu interdum. Donec eu bibendum arcu, luctus ultrices orci. Duis dignissim, neque ut elementum sodales, nibh sapien porttitor nisi, vel commodo purus tortor vitae lectus. Ut sed tempus ex, id laoreet metus. Suspendisse potenti. Donec tincidunt magna augue, at ullamcorper enim blandit porttitor. Nunc ligula nisl, lobortis id ex quis, sollicitudin vulputate sapien. In consequat nulla ac urna porta malesuada. Suspendisse id purus vel eros gravida tristique sit amet sed lectus. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae;\r\n\r\nNunc sit amet mauris ac ex ornare tempor non molestie purus. Etiam elementum tempus justo, eu eleifend erat feugiat non. Sed convallis efficitur dui, ac suscipit ipsum fermentum eu. Vivamus bibendum neque lectus, vitae malesuada mauris vehicula sit amet. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Quisque non nunc tristique, efficitur orci at, hendrerit leo. Pellentesque vestibulum pulvinar elit quis imperdiet. Aenean dignissim, nulla sit amet rutrum tincidunt, augue augue sollicitudin nisl, id elementum nibh augue et risus. Vivamus ac sapien a diam fermentum dapibus luctus ut massa.', 1514611406, 1514615938, 8),
(5, 'Новость 5', NULL, NULL, NULL, 1514611406, 1514611406, 8),
(6, 'Новость 6', NULL, NULL, NULL, 1514611406, 1514611406, 8),
(7, 'Новость 7', '', '', '', 1514611406, 1514620209, 8),
(8, 'Новость 8', NULL, NULL, NULL, 1514611406, 1514611406, 8),
(9, 'Новость 9', 'AMD_E_RGBR.jpg', '', 'Suspendisse tincidunt ultrices enim, eu gravida turpis cursus eget. Phasellus sit amet enim id purus placerat mattis. Suspendisse id lorem orci. Ut gravida lacinia dictum. Mauris tempor posuere nunc, et faucibus dolor bibendum quis. Aenean gravida, ligula vel interdum porttitor, diam erat cursus ante, non tincidunt orci orci eu erat. Interdum et malesuada fames ac ante ipsum primis in faucibus. Etiam vestibulum, enim a scelerisque pretium, odio libero dignissim ex, vel accumsan urna eros vitae ante. Morbi pharetra, mauris non vestibulum pellentesque, lacus turpis lobortis nisl, a feugiat dui est non leo. Cras urna arcu, vulputate a ex vel, sagittis eleifend lacus. Nulla quis massa mattis, commodo sem id, lobortis erat. Fusce varius diam ut dictum venenatis. Aliquam egestas, enim vestibulum accumsan convallis, nisi mi pellentesque lectus, in elementum sapien augue eu nisl. Proin rhoncus ullamcorper odio. Nam varius, eros at volutpat mollis, massa ante sollicitudin metus, venenatis tempor quam turpis in leo. Donec facilisis sodales est, quis dignissim ex ultrices sed.', 1514611406, 1514623573, 8),
(10, 'Новость 10', 'lcd1.jpg', '', 'Morbi tristique risus risus, vitae vehicula sem posuere vitae. Ut posuere risus ac nibh egestas varius. Fusce arcu lacus, vehicula id viverra in, egestas a diam. Quisque sollicitudin mi fringilla eros convallis maximus. Proin posuere non urna in sagittis. Aenean vulputate molestie nunc, sit amet dictum eros pellentesque sit amet. Morbi fermentum vulputate justo ut scelerisque. Sed id sem leo. Fusce iaculis pulvinar turpis, eget vehicula nibh iaculis sit amet. Phasellus erat sem, lobortis eu erat nec, consequat mattis sapien.', 1514611406, 1514623547, 8),
(11, 'Новость 11', NULL, '', '', 1514611406, 1514623080, 8),
(12, 'Новость 12', NULL, NULL, NULL, 1514611406, 1514611406, 8),
(13, 'Новость 13', 'Thumb_350.jpg', '', 'Nunc sit amet mauris ac ex ornare tempor non molestie purus. Etiam elementum tempus justo, eu eleifend erat feugiat non. Sed convallis efficitur dui, ac suscipit ipsum fermentum eu. Vivamus bibendum neque lectus, vitae malesuada mauris vehicula sit amet. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Quisque non nunc tristique, efficitur orci at, hendrerit leo. Pellentesque vestibulum pulvinar elit quis imperdiet. Aenean dignissim, nulla sit amet rutrum tincidunt, augue augue sollicitudin nisl, id elementum nibh augue et risus. Vivamus ac sapien a diam fermentum dapibus luctus ut massa.', 1514611406, 1514623447, 8),
(14, 'Новость 14', '', '', '', 1514611406, 1514620221, 8),
(15, 'Новость 15', NULL, NULL, NULL, 1514611406, 1514611406, 8),
(16, 'Новость 16', NULL, NULL, NULL, 1514611406, 1514611406, 8),
(17, 'Новость 17', NULL, '', '', 1514611406, 1514623115, 8),
(18, 'Новость 18', NULL, '', '', 1514611406, 1514623085, 8),
(19, 'Новость 19', '', '', 'as', 1514611406, 1514612117, 8),
(20, 'Новость 20', '', '', '', 1514611406, 1514620366, 8),
(21, 'Новость 21', NULL, NULL, NULL, 1514611406, 1514611406, 8),
(22, 'Новость 22', NULL, NULL, NULL, 1514611406, 1514611406, 8),
(23, 'Новость 23', NULL, NULL, NULL, 1514611406, 1514611406, 8),
(24, 'Новость 24', NULL, NULL, NULL, 1514611406, 1514611406, 8),
(25, 'Новость 25', NULL, NULL, NULL, 1514611406, 1514611406, 8),
(26, 'Новость 26', NULL, NULL, NULL, 1514611406, 1514611406, 8),
(27, 'Новость 27', NULL, NULL, NULL, 1514611406, 1514611406, 8),
(28, 'Новость 28', NULL, NULL, NULL, 1514611406, 1514611406, 8),
(29, 'Новость 29', NULL, NULL, NULL, 1514611406, 1514611406, 8),
(30, 'Новость 30', NULL, NULL, NULL, 1514611406, 1514611406, 8),
(31, 'Новость 31', 'maxresdefault.jpg', '', '', 1514611406, 1514623520, 8),
(32, 'Новость 32', 'luchshie_full_hd_monitory_2017.jpg', '', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse et bibendum leo, sit amet ultricies sapien. Integer massa elit, vestibulum at elit non, egestas semper ipsum. Quisque finibus massa eget justo accumsan, at bibendum mi porttitor. Nulla sodales odio diam, iaculis consectetur lectus feugiat a. Sed non purus quis urna tincidunt auctor id ac libero. Nam lectus odio, rutrum sit amet gravida et, posuere sed diam. Vivamus lobortis velit vel dignissim finibus. Donec at hendrerit metus. Nunc cursus convallis nunc sit amet sagittis. Maecenas consequat justo eros, ut ullamcorper tellus ullamcorper eget. Nam aliquet fringilla gravida. Duis condimentum mollis accumsan.', 1514611406, 1514623512, 8),
(33, 'Новость 33', NULL, '', 'Aliquam ac ultricies neque. Praesent tristique, mauris ut tincidunt tristique, sem elit euismod diam, a dictum tellus nisi nec diam. Nam mollis placerat velit, a pulvinar nunc semper in. Phasellus id tortor justo. Morbi fermentum dignissim vehicula. Nulla lacinia iaculis justo eu interdum. Donec eu bibendum arcu, luctus ultrices orci. Duis dignissim, neque ut elementum sodales, nibh sapien porttitor nisi, vel commodo purus tortor vitae lectus. Ut sed tempus ex, id laoreet metus. Suspendisse potenti. Donec tincidunt magna augue, at ullamcorper enim blandit porttitor. Nunc ligula nisl, lobortis id ex quis, sollicitudin vulputate sapien. In consequat nulla ac urna porta malesuada. Suspendisse id purus vel eros gravida tristique sit amet sed lectus. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae;', 1514611406, 1514623485, 8),
(34, 'Новость 34', NULL, NULL, NULL, 1514611406, 1514611406, 8),
(35, 'Новость 35', NULL, NULL, NULL, 1514611406, 1514611406, 8),
(36, 'Новость 36', NULL, NULL, NULL, 1514611406, 1514611406, 8),
(37, 'Новость 37', NULL, NULL, NULL, 1514611406, 1514611406, 8),
(38, 'Новость 38', NULL, NULL, NULL, 1514611406, 1514611406, 8),
(39, 'Новость 39', NULL, NULL, NULL, 1514611406, 1514611406, 8),
(40, 'Новость 40', NULL, NULL, NULL, 1514611406, 1514611406, 8),
(41, 'NewsPomp', 'lg-en33-medium.jpg', '', 'Proin in lobortis est, eget interdum nulla. Duis ac lacus est. In eu condimentum velit. In ac bibendum ante. Donec rhoncus sem semper nulla convallis molestie. Praesent sodales tortor mauris, nec eleifend dolor pharetra non. Integer in turpis nulla. Quisque lacinia arcu est, ac ornare dui dictum non. Proin erat orci, ullamcorper et scelerisque in, tincidunt viverra odio. Integer risus risus, luctus eu rhoncus vel, dictum et ligula. Ut pretium ex id nisl malesuada consectetur. Quisque quis erat ut leo mattis ultricies.', 1514623727, 1514624044, 9),
(42, 'В Дагестане рассказали, сколько россиян ', '1501110983.jpg', 'sd', 'МАХАЧКАЛА, 30 дек — РИА Новости. На подконтрольной боевикам "Исламского государства"* территории Сирии и Ирака находятся несколько тысяч россиян с детьми, заявила РИА Новости уполномоченный по правам ребенка Дагестана Марина Ежова.\r\n\r\nЖительницы Чечни во время встречи российских детей и женщин, возвращенных из Ирака, в аэропорту Грозного\r\n© РИА Новости / Саид Царнаев\r\nПерейти в фотобанк\r\nОмбудсмен рассказала о возвращении в Дагестан детей и женщин из Ирака\r\nОна подчеркнула, что это приблизительная оценка. "Точной цифры нет, они ведь никому не говорили, что они выезжали", — сказала Ежова.\r\n"Есть сведения, что многие перебрались благополучно в соседние арабские государства. У нас из Бабаюрта пришла информация, что в Египте сидят две семьи, это женщины с детьми, и они не намереваются никуда выезжать. Они не сидят на месте и мигрируют внутри страны под видом беженцев и местных жителей", — добавила она.\r\n\r\n\r\n\r\nРИА Новости https://ria.ru/society/20171230/1512005344.html', 1514623964, 1514623983, 9);

-- --------------------------------------------------------

--
-- Структура таблицы `centra_news_to_tag`
--

CREATE TABLE `centra_news_to_tag` (
  `id` int(11) NOT NULL,
  `news_id` int(11) DEFAULT NULL,
  `tag_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `centra_news_to_tag`
--

INSERT INTO `centra_news_to_tag` (`id`, `news_id`, `tag_id`) VALUES
(8, 7, 2),
(9, 7, 3),
(10, 14, 2),
(16, 2, 2),
(17, 2, 3),
(20, 1, 2),
(21, 11, 5),
(22, 18, 5),
(23, 19, 4),
(24, 19, 5),
(25, 20, 3),
(26, 20, 5),
(27, 17, 5),
(34, 13, 4),
(35, 13, 5),
(36, 33, 3),
(37, 33, 4),
(38, 32, 2),
(39, 32, 5),
(40, 31, 3),
(41, 31, 4),
(44, 10, 4),
(45, 10, 5),
(46, 9, 2),
(47, 9, 3),
(48, 9, 4),
(49, 9, 5),
(54, 42, 2),
(55, 42, 3),
(56, 42, 4),
(57, 42, 5),
(59, 41, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `centra_tags`
--

CREATE TABLE `centra_tags` (
  `id` int(11) NOT NULL,
  `title` varchar(30) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `centra_tags`
--

INSERT INTO `centra_tags` (`id`, `title`, `created_at`, `updated_at`) VALUES
(2, '#kemer#', 1514601720, 1514623045),
(3, '#Novok#', 1514602908, 1514623053),
(4, '#Teg1#', 1514622722, 1514623035),
(5, '#Azart#', 1514623070, 1514623070);

-- --------------------------------------------------------

--
-- Структура таблицы `centra_user`
--

CREATE TABLE `centra_user` (
  `id` int(11) NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `auth_key` varchar(32) DEFAULT NULL,
  `email_confirm_token` varchar(255) DEFAULT NULL,
  `password_hash` varchar(255) NOT NULL,
  `password_reset_token` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `centra_user`
--

INSERT INTO `centra_user` (`id`, `created_at`, `updated_at`, `username`, `auth_key`, `email_confirm_token`, `password_hash`, `password_reset_token`, `email`, `status`) VALUES
(8, 1514597058, 1514597155, 'nicel', 'k2rX3HzOCt8vm0gGTR42p4g78-SDe9oZ', NULL, '$2y$13$KuHu8CASJo8CMYRqcIb24u6/7ZsDxtyz7hrA/bzEdB8fhclRX35rG', NULL, 'centra@localhost.com', 1),
(9, 1514623792, 1514623820, 'test_ueser', 'jZW3oGCVTVF_m38ap66coab6LiemxhTC', NULL, '$2y$13$k22kal/7h9yDiQHVk/S5IeMUN0xalU23QGcNp2A56PYiwGzXhGyWS', NULL, 'admin@localhost.com', 1);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `centra_migration`
--
ALTER TABLE `centra_migration`
  ADD PRIMARY KEY (`version`);

--
-- Индексы таблицы `centra_news`
--
ALTER TABLE `centra_news`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `centra_news_id_uindex` (`id`),
  ADD KEY `centra_news_centra_user_id_fk` (`user_id`);

--
-- Индексы таблицы `centra_news_to_tag`
--
ALTER TABLE `centra_news_to_tag`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `centra_news_to_tag_id_uindex` (`id`),
  ADD KEY `centra_news_to_tag_centra_news_id_fk` (`news_id`),
  ADD KEY `centra_news_to_tag_centra_tags_id_fk` (`tag_id`);

--
-- Индексы таблицы `centra_tags`
--
ALTER TABLE `centra_tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `centra_tegs_id_uindex` (`id`);

--
-- Индексы таблицы `centra_user`
--
ALTER TABLE `centra_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx-user-username` (`username`),
  ADD KEY `idx-user-email` (`email`),
  ADD KEY `idx-user-status` (`status`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `centra_news`
--
ALTER TABLE `centra_news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;
--
-- AUTO_INCREMENT для таблицы `centra_news_to_tag`
--
ALTER TABLE `centra_news_to_tag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;
--
-- AUTO_INCREMENT для таблицы `centra_tags`
--
ALTER TABLE `centra_tags`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT для таблицы `centra_user`
--
ALTER TABLE `centra_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `centra_news`
--
ALTER TABLE `centra_news`
  ADD CONSTRAINT `centra_news_centra_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `centra_user` (`id`);

--
-- Ограничения внешнего ключа таблицы `centra_news_to_tag`
--
ALTER TABLE `centra_news_to_tag`
  ADD CONSTRAINT `centra_news_to_tag_centra_news_id_fk` FOREIGN KEY (`news_id`) REFERENCES `centra_news` (`id`),
  ADD CONSTRAINT `centra_news_to_tag_centra_tags_id_fk` FOREIGN KEY (`tag_id`) REFERENCES `centra_tags` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
