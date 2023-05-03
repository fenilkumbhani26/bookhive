-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 19, 2021 at 09:25 AM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shopping`
--
CREATE DATABASE IF NOT EXISTS `shopping` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `shopping`;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `creationDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `creationDate`, `updationDate`) VALUES
(1, 'admin', 'f925916e2754e5e03f75dd58a5733251', '2017-01-24 16:21:18', '21-06-2018 08:27:55 PM');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `categoryName` varchar(255) DEFAULT NULL,
  `categoryDescription` longtext DEFAULT NULL,
  `creationDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `categoryName`, `categoryDescription`, `creationDate`, `updationDate`) VALUES
(1, 'Fiction', '', '2021-06-19 06:40:06', NULL),
(2, 'Non-Fiction', '', '2021-06-19 06:40:32', NULL),
(3, 'Poetry ', '', '2021-06-19 06:41:11', NULL),
(4, 'Drama/Plays', '', '2021-06-19 06:41:21', NULL),
(5, 'Academic/Textbooks', '', '2021-06-19 06:41:27', NULL),
(6, 'Reference', '', '2021-06-19 06:43:29', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subcategory`
--

CREATE TABLE `subcategory` (
  `id` int(11) NOT NULL,
  `categoryid` int(11) DEFAULT NULL,
  `subcategory` varchar(255) DEFAULT NULL,
  `creationDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subcategory`
--

INSERT INTO `subcategory` (`id`, `categoryid`, `subcategory`, `creationDate`, `updationDate`) VALUES
(1, 1, 'Mystery', '2021-06-19 06:42:16', NULL),
(2, 1, 'Horror', '2021-06-19 06:42:34', NULL),
(3, 1, 'Thriller/Suspense', '2021-06-19 06:42:52', NULL),

(4, 2, 'History', '2021-06-19 06:43:11', NULL),
(5, 2, 'Science/Technology', '2021-06-19 06:43:39', NULL),
(6, 2, 'Self-help', '2021-06-19 06:44:05', NULL),

(7, 3, 'Sonnets', '2021-06-19 06:44:22', NULL),
(8, 3, 'Ballads', '2021-06-19 06:44:55', NULL),
(9, 3, 'Epic poetry', '2021-06-19 06:45:08', NULL),

(10, 4, 'Tragedy', '2021-06-19 06:45:25', NULL),
(11, 4, 'Comedy', '2021-06-19 06:45:36', NULL),
(12, 4, 'Historical plays', '2021-06-19 06:45:54', NULL),

(13, 5, 'Mathematics', '2021-06-19 06:46:29', NULL),
(14, 5, 'Science', '2021-06-19 06:46:29', NULL),
(15, 5, 'Education', '2021-06-19 06:46:43', NULL),

(16, 6, 'Dictionaries', '2021-06-19 06:46:52', NULL),
(17, 6, 'Encyclopedias', '2021-06-19 07:10:26', NULL),
(18, 6, 'Atlases', '2021-06-20 08:12:35', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `productId` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `orderDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `paymentMethod` varchar(50) DEFAULT NULL,
  `orderStatus` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ordertrackhistory`
--

CREATE TABLE `ordertrackhistory` (
  `id` int(11) NOT NULL,
  `orderId` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `remark` mediumtext DEFAULT NULL,
  `postingDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bookreviews`
--

CREATE TABLE `bookreviews` (
  `id` int(11) NOT NULL,
  `productId` int(11) DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `value` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `review` longtext DEFAULT NULL,
  `reviewDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `category` int(11) NOT NULL,
  `subCategory` int(11) DEFAULT NULL,
  `bookName` varchar(255) DEFAULT NULL,
  `bookAuthor` varchar(255) DEFAULT NULL,
  `bookPrice` int(11) DEFAULT NULL,
  `bookPriceBeforeDiscount` int(11) DEFAULT NULL,
  `bookDescription` longtext DEFAULT NULL,
  `productImage1` varchar(255) DEFAULT NULL,
  `productImage2` varchar(255) DEFAULT NULL,
  `productImage3` varchar(255) DEFAULT NULL,
  `shippingCharge` int(11) DEFAULT NULL,
  `bookAvailability` varchar(255) DEFAULT NULL,
  `postingDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category`, `subCategory`, `bookName`, `bookAuthor`, `bookPrice`, `bookPriceBeforeDiscount`, `bookDescription`, `productImage1`, `productImage2`, `productImage3`, `shippingCharge`, `bookAvailability`, `postingDate`, `updationDate`) VALUES

(1, 1, 1, 'The Golden Spoon', 'Jessa Maxwell', 799, 500, '<div>For six amateur bakers, competing in Bake Week is a dream come true.</div><div>When they arrive at Grafton Manor to compete, they re ready to do whatever it takes to win the ultimate The Golden Spoon.</div><div>But for the shows famous host, Betsy Martin, Bake Week is more than just a competition. Grafton Manor is her familys home and legacy - and Bake Week is her lifes work. Its imperative that both continue to succeed.</div><div>But as the competition commences, things begin to go awry. At first, its small acts of sabotage. Someone switching sugar for salt. A hob turned far too high.</div><div>But when a body is discovered, its clear that for someone in the competition, The Golden Spoon is a prize worth killing for...</div>', '61GG25YKiFL.jpg', '715Jn2EWqhL.jpg','816fysYwjZL._SL1600_.jpg',  100, 'In Stock', '2021-06-19 06:51:59', NULL),

(2, 1, 2, 'The Silent Patient', 'Alex Michaelides', 599, 850, '<div>Alicia Berenson’s life is seemingly perfect. A famous painter married to an in-demand fashion photographer, she lives in a grand house with big windows overlooking a park in one of London’s most desirable areas. One evening her husband Gabriel returns home late from a fashion shoot, and Alicia shoots him five times in the face, and then never speaks another word.</div><div>Alicia’s refusal to talk, or give any kind of explanation, turns a domestic tragedy into something far grander, a mystery that captures the public imagination and casts Alicia into notoriety. The price of her art skyrockets, and she, the silent patient, is hidden away from the tabloids and spotlight at the Grove, a secure forensic unit in North London.</div><div>Theo Faber is a criminal psychotherapist who has waited a long time for the opportunity to work with Alicia. His determination to get her to talk and unravel the mystery of why she shot her husband takes him down a twisting path into his own motivations—a search for the truth that threatens to consume him....</div><div>The Silent Patient is a shocking psychological thriller of a woman’s act of viol</div>', '40097951.jpg', '81NJqOGFPHL.jpg', 'xtleofc4v0jgebvz6oyn.jpg', 100, 'In Stock', '2021-06-19 06:55:40', NULL),

(3, 1, 3, 'A Good House for Children', 'Kate Collins', 699, 799, '<div>The dazzling debut novel from Kate Collins—a feminist gothic mystery spanning decades, in the vein of Mexican Gothic and The Essex Serpent . Once upon a time Orla a woman, a painter, a lover.&nbsp;</div><div>Now she is a mother and a wife, and when her husband Nick suggests that their city apartment has grown too small for their lives, she agrees, in part because she does agree, and in part because she is too tired to think about what she really does want.&nbsp;</div><div>She agrees again when Nick announces with pride that he has found an antiquated Georgian house on the Dorset cliffs—a good house for children, he says, tons of space and gorgeous grounds. But as the family settles into the mansion—Nick absent all week, commuting to the city for work—Orla finds herself unsettled.&nbsp;</div><div>She hears voices when no one is around; doors open and close on their own; and her son Sam, who has not spoken in six months, seems to have made an imaginary friend whose motives Orla does not trust. Four decades earlier, Lydia moves into the same house as a live-in nanny to a grieving family.&nbsp;</div><div>Lydia, too, becomes aware of intangible presences in the large house, and she, like Orla four decades later, becomes increasingly fearful for the safety of the children in her care. But no one in either woman’s life believes the stories seem fanciful, the stuff of magic and mayhem, sprung from the imaginations of hysterical women who spend too much time in the company of children.&nbsp;</div><div>Are both families careening towards tragedy? Are Orla and Lydia seeing things that aren’t there? What secrets is the house hiding? A feminist gothic tale perfectly suited for the current moment, A Good House for Children&nbsp; combines an atmospheric mystery with resonant themes of motherhood, madness, and the value of a woman’s work.</div>', '62925087.jpg', 'kak1b2o6qll6qpmmx9v3.jpg', 'u5aso0kvjohls1orsq71m63uaq.jpg', 100, 'In Stock', '2021-06-19 06:59:26', NULL),

(4, 2, 4, 'Think and Grow Rich', 'Napoleon Hill', 399, 499, '<div>Think and Grow Rich has earned itself The reputation of being considered a textbook for actionable techniques that can help one get better at doing anything, not just by rich and wealthy, but also by people doing wonderful work in their respective fields.&nbsp;</div><div>There are hundreds and thousands of successful people in the world who can vouch for the contents of this book.&nbsp;</div><div>At the time of authors death, about 20 million copies had already been sold. Numerous revisions have been made in the book, from time to time, to make the book more readable and comprehensible to the readers.</div><div>&nbsp;The book details out the most fundamental questions that once bothered the author, Napoleon Hill. The author once set out on a personal quest to find out what really made some people so successful. Why is it that some people manage to remain healthy, happy and financially independent, all at the same time? Why, after all, do some end up being called as lucky? The answers, no wonder, had to be no less than revelations.</div><div>&nbsp;For more than a decade, the author interviewed some of the wealthiest and most successful people in the world. It was based on what author learnt in the process from all these people, when asked about how they achieved not just great riches but also personal wellbeing.&nbsp;&nbsp;</div><div>The book, even author recommends, has to be read one br&gt;Chapter at a time and in sequence. Several readers and even some motivational speakers claim to have been reading this book over and over again, few pages at a time, for a long time now.as an author of self-help books, Hill has always abided by and promoted principle of intense and burning passion being the sole key to achieve success. Hill has authored numerous books among which think and Grow Rich has been his most well-known works and had sold over 20 million copies back in the 1930s.</div>', '71AdHA+qqwL.jpg', 'zvo5jraqmpp5okczrqas.jpg', 'kklmzlcok1avcxfsyfx8.jpg', 100, 'In Stock', '2021-06-19 07:03:16', NULL),

(5, 2, 5, 'Unique Bhartiya Itihas', 'Arvind Kumar Porwal', 399, 459, '<div><span style="font-family: Poppins, Helvetica, sans-serif; letter-spacing: 1px;">Universal Unique Indian History (Bhartiya Itihas) By Arvind Kumar Porwal And Dr. Sanjay Kumar Tripathi Useful For Civil Services CSAT TGT PGT And All Other Competitive Exams&nbsp;</span><br></div>', '81uEuBQd5gL.jpg', '81YerEvStML.jpg', '41+romk2vUL.jpg', 100, 'In Stock', '2021-06-19 07:04:56', NULL),

(6, 2, 6, 'Relativity: The Special And The General Theory', 'Albert Einstein', 650, 850, '<div>When you are courting a nice girl an hour seems like a second. When you sit on a red-hot cinder a second seems like an hour.</div><div>Thats relativity.’Dealing with the theory of relativity—special relativity and general relativity—and the considerations on the universe as a whole, this book gives an insight into the scientific theory about the relationship between space and time, the theory of gravitation and the universe.</div><div>A Nobel laureate, Einstein’s research and theories changed the world. First published in 1916, Relativity: The Special and the General Theory is regarded as the most significant work in modern physics. It continues to remain popular and highly influential.</div>','813ExjDkhxS.jpg', '91qbQ2YWpgL.jpg', '91xpmt9AjtL.jpg', 100, 'Out of Stock', '2021-06-19 07:06:40', NULL),

(7, 3, 7, 'Shakespeares Sonnets', 'William Shakespeare', 550, 760, '<div>A bestselling, beautifully designed edition of William Shakespeare’s sonnets, complete with valuable tools for educators.</div><div>The authoritative edition of Shakespeare’s Sonnets from The Folger Shakespeare Library, the trusted and widely used Shakespeare series for students and general readers, includes:</div><div>-Full explanatory notes conveniently placed on the facing page of each sonnet-A brief introduction to each sonnet, providing insight into its possible meaning-An index of first lines-Illustrations from the Folger Shakespeare Library’s vast holdings of rare books-An essay by a leading Shakespeare scholar providing a modern perspective on the sonnets</div><div>The Folger Shakespeare Library in Washington, DC, is home to the world’s largest collection of Shakespeare’s printed works, and a magnet for Shakespeare scholars from around the globe. In addition to exhibitions open to the public throughout the year, the Folger offers a full calendar of performances and programs. For more information, visit Folger.edu.</div>', '51dgUzhPUuL._SX302_BO1,204,203,200_.jpg', '61mz7d9iceL.jpg', '31uz5VsLDEL.jpg', 100, 'In Stock', '2021-06-19 07:08:04', NULL),

(8, 3, 8, 'The Ballad of Reading Gaol', 'Oscar Wilde', 650, 750, '<div>Born in Dublin in 1854, Oscar Wilde dazzled the salons of his day with supremely witty conversation and his ardent championship of a philosophy of aestheticism.</div><div> As a writer, he produced The Importance of Being Earnest, one of the finest comedies in English, and other classic plays. </div><div>His one novel, The Picture of Dorian Gray, is still widely read, as is "The Ballad of Reading Gaol," a powerful poetic indictment of the degradation and inhumanity of prison life. </div><div>This carefully edited volume focuses on Wildes poetic legacy. In addition to the title poem, readers will find twenty-three other important works: "The Sphinx," "The Grave of Keats," "Requiescat," "Impression du Matin," "Panthea," "Silentium Amoris," "The Harlots House," "To L. L. " and others.</div><div> While Wildes fame rests mainly on his achievements as a dramatist and critic, these poems offer important clues to the themes and subjects that preoccupied him in his other works.</div>', '81RrAP0LUUL.jpg', '51qb0eZ9pZL.jpg', '31TaqmZiV0L.jpg', 100, 'In Stock', '2021-06-19 07:09:14', NULL),

(9, 3, 9, 'The Iliad', 'Homer,Emily Wilson', 399, 499, '<div>One of the foremost achievements in Western literature, Homers Iliad tells the story of the darkest episode of the Trojan War.</div><div> At its center is Achilles, the greatest warrior-champion of the Greeks, and his conflict with his leader Agamemnon. </div><div>Interwoven in the tragic sequence of events are powerfully moving descriptions of the ebb and flow of battle, the besieged city of Ilium, the feud between the gods, and the fate of mortals.</div>', '77265004.jpg', 'bc9ae5e4b7b0117mmlr8.jpg', 'iypdwiswlufoiz9xhdqa.png', 100, 'In Stock', '2021-06-19 07:11:34', NULL),

(10, 4, 10, 'The Shack: Where Tragedy Confronts Eternity', 'William P. Young', 550, 680, '<div>Mackenzie Allen Philips youngest daughter, Missy, has been abducted during a family vacation and evidence that she may have been brutally murdered is found in an abandoned shack deep in the Oregon wilderness. </div><div>Four years later in the midst of his Great Sadness, Mack receives a suspicious note, apparently from God, inviting him back to that shack for a weekend. </div><div>Against his better judgment he arrives at the shack on a wintry afternoon and walks back into his darkest nightmare. What he finds there will change Macks world forever.</div><div>In a world where religion seems to grow increasingly irrelevant The Shack wrestles with the timeless question, "Where is God in a world so filled with unspeakable pain?" The answers Mack gets will astound you and perhaps transform you as much as it did him. Youll want everyone you know to read this book!</div>', '91OwBO1wB1L.jpg', '911341kg6AL.jpg', '81e5TFZdi8L.jpg', 29, 'Out of Stock', '2021-06-19 07:12:52', NULL),

(11, 4, 11, 'The Comedy of Errors Paperback', 'William Shakespeare', 350, 499, '<div>shipwrecked by a storm at sea, two sets of identical twins are separated soon after their birth. </div><div>Years later, when they happen to be in the same city, what follows is a drama of mistaken identities, confusion, and bafflement. </div><div>The comedy of errors is Shakespeare’s shortest written comedy.</div><div> A sensational farce, this play continues to be staged worldwide, enthralling the public.</div>', '81tSD-JxSeS.jpg', '81mZc0Ug4HS.jpg', '817MPnxxW0L.jpg', 100, 'In Stock', '2021-06-19 07:14:26', NULL),

(12, 4, 12, 'Historical Plays for Children', 'Amice Macdonell', 855, 970, '<div>This book is a reproduction of an important historical work. </div><div>Forgotten Books uses state-of-the-art technology to digitally reconstruct the work, preserving the original format whilst repairing imperfections present in the aged copy. </div><div>In rare cases, an imperfection in the original, such as a blemish or missing page, may be replicated in our edition. </div><div>We do, however, repair the vast majority of imperfections successfully; any imperfections that remain are intentionally left to preserve the state of such historical works.</div>', '71nJWG+OMTL.jpg', '71WWXCRq8eL.jpg', 'uwuzutksf2rpnbfn7upa.jpg', 100, 'In Stock', '2021-06-19 07:15:44', NULL),

(13, 5, 13, 'Problems In MATHEMATICS with Hints and Solutions', 'V. Govorov', 455, 499, '<div>The Classic Texts Series is only one of its kind selections of classic pieces that started off as a bestseller and continues to be the same today as well. </div><div>These classic texts have been designed to work as elementary textbooks, which help the students in building the concepts to prepare for various competitive examinations.</div><div>The newly updated edition of ‘Higher Algebra deals with the modern treatment of various concepts of Higher Algebra, presented in a manner suitable for beginners and junior students. </div><div>Each chapter in the book begins with point wise introduction of the various concepts that are covered under a particular topic, followed by examples to help the competitors in understanding the concepts better.</div>', '51KbD5KnDdL.jpg', '51blZbud6aL.jpg', '61xEKBJjh4L.jpg', 100, 'Out of Stock', '2021-06-19 07:17:08', NULL),

(14, 5, 14, 'Eynt Ace Science In One Big Fat Notebk', 'Inc. Workman Publishing Co.', 599, 699, '<div>Product Description It&amp;;s the revolutionary science study guide just for middle school students from the brains behindBrain Quest Everything You Need to Ace Science . . . takes readers from scientific investigation and the engineering design process to the Periodic Table; forces and motion; forms of energy; outer space and the solar system; to earth sciences, biology, body systems, ecology, and more. The BIG FAT NOTEBOOK&amp;; series is built on a simple and irresistible conceit&amp;borrowing the notes from the smartest kid in class. There are five books in all, and each is the only book you need for each main subject taught in middle school: Math, Science, American History, English Language Arts, and World History. Inside the reader will find every subject&amp;;s key concepts, easily digested and summarized: Critical ideas highlighted in neon colors. Definitions explained. Doodles that illuminate tricky concepts in marker. Mnemonics for memorable shortcuts. And quizzes to recap it all. The BIG FAT NOTEBOOKS meet Common Core State Standards, Next Generation Science Standards, and state history standards, and are vetted by National and State Teacher of the Year Award&amp;;winning teachers. They make learning fun, and are the perfect next step for every kid who grew up onBrain Quest.<br></div>', '91PW1BIyM5L.jpg', '91MtmTwXwuL.jpg', '31dGPstZmFL.jpg', 100, 'In Stock', '2021-06-19 07:18:24', NULL),

(15, 5, 15, 'Mission NDA : Serve At Young Age', 'DDE - Defence Direct Education', 100, 129, '<div>National Defence Academy Entrance Exams are conducted by UPSC. The book is written according to the latest updated syllabus described by UPSC.&nbsp;</div><div>Specific Effort is made to craft the mathematics portion, deconstructing the chapters into threads of solved practice sets divided into multiple difficulty levels. Emphasis is laid to clear concept and fundamentals of every chapter.&nbsp;</div><div>Point to Point Static GK is presented with perspective to save time while providing maximum effectiveness. Undoubtedly, it is a one stop solution to crack NDA Exams.<br></div>', '71LVYlQxqeL.jpg', '71l4Z0xDMQL.jpg', 'ivqfg8sbuzmrpmsgpwsx.jpg', 100, 'In Stock', '2021-06-19 07:19:38', NULL),

(16, 6, 16, 'PAPERBACK OXFORD ENGLISH DICTIONARY 7E', 'Oxford Dictionaries', 120, 149, '<div>This fully updated edition offers over 120,000 words, phrases, and definitions.&nbsp;</div><div>It covers all the words you need for everyday use, carefully selected from the evidence of the Oxford English Corpus, a databank of 21st century English, containing over 2 billion words.</div><div>The Factfinder centre section gives quick-reference entries on topics including famous people, countries, and science.<br></div>', '912oYAdIf2L.jpg', '91iMn5dDylL.jpg', '41BE8e4aaPL.jpg', 29, 'In Stock', '2021-06-19 07:21:44', NULL),

(17, 6, 17, 'Science Knowledge Encyclopedia for Children : Collection of 6 Books (Box Set)', 'Wonder House Books', 239, 249, '<div><div>What is the Theory of Evolution? How do chemical reactions occur? Why is the human eye most receptive to only three colours? Get ready to explore the fascinating world of science in this boxset of six encyclopedias.&nbsp;</div><div>Well-labelled diagrams, and an extensive glossary of difficult words come as happy bonuses in these informative books.</div></div>', '81BsJ9xMzaL.jpg', '81Z8v0Gq6hL.jpg', '91EySb0hy6L.jpg', 100, 'In Stock', '2021-06-19 07:22:54', NULL),

(18, 6, 18, 'Oxford Student Atlas for India', ' Unilever Ltd', 300, 400, '<div>The Oxford Student Atlas for India uses state-of-the-art techniques to produce maps that are accurate and easy to read. Thoroughly researched and up-to-date, this fourth edition of the atlas caters to the needs of the students preparing for competitive examinations conducted by the UPSC, State Public Service Commissions and other examining bodies.<br></div>', '71oHphHM71L.jpg', '81NFQC1VlXL.jpg', '71bOd+FTFrL.jpg', 100, 'In Stock', '2021-07-18 08:23:14', NULL);

-- Table structure for table `userlog`

CREATE TABLE `userlog` (
  `id` int(11) NOT NULL,
  `userEmail` varchar(255) DEFAULT NULL,
  `userip` binary(16) DEFAULT NULL,
  `loginTime` timestamp NULL DEFAULT current_timestamp(),
  `logout` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `contactno` bigint(11) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `shippingAddress` longtext DEFAULT NULL,
  `shippingState` varchar(255) DEFAULT NULL,
  `shippingCity` varchar(255) DEFAULT NULL,
  `shippingPincode` int(11) DEFAULT NULL,
  `billingAddress` longtext DEFAULT NULL,
  `billingState` varchar(255) DEFAULT NULL,
  `billingCity` varchar(255) DEFAULT NULL,
  `billingPincode` int(11) DEFAULT NULL,
  `regDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO `users` (`id`, `name`, `email`, `contactno`, `password`, `regDate`,`updationDate`) VALUES
(4, 'demo', 'demo123@gmail.com', '2132645840','827ccb0eea8a706c4c34a16891f84e7b','2023-01-24 16:21:18', '21-02-2023 08:27:55 PM');

-- --------------------------------------------------------



-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `productId` int(11) DEFAULT NULL,
  `postingDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ordertrackhistory`
--
ALTER TABLE `ordertrackhistory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bookreviews`
--
ALTER TABLE `bookreviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subcategory`
--
ALTER TABLE `subcategory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `userlog`
--
ALTER TABLE `userlog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT for table `ordertrackhistory`
--
ALTER TABLE `ordertrackhistory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT for table `bookreviews`
--
ALTER TABLE `bookreviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `subcategory`
--
ALTER TABLE `subcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `userlog`
--
ALTER TABLE `userlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
