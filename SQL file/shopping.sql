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
(1, 1, 'Romance', '2021-06-19 06:41:56', NULL),
(2, 1, 'Mystery', '2021-06-19 06:42:16', NULL),
(3, 1, 'Horror & HANDWASH', '2021-06-19 06:42:34', NULL),
(4, 1, 'Thriller/Suspense', '2021-06-19 06:42:52', NULL),
(5, 2, 'History', '2021-06-19 06:43:11', NULL),
(6, 2, 'Travel', '2021-06-19 06:43:22', NULL),
(7, 2, 'Science/Technology', '2021-06-19 06:43:39', NULL),
(8, 2, 'Self-help', '2021-06-19 06:44:05', NULL),
(9, 3, 'Sonnets', '2021-06-19 06:44:22', NULL),
(10, 3, 'Haiku', '2021-06-19 06:44:44', NULL),
(11, 3, 'Ballads', '2021-06-19 06:44:55', NULL),
(12, 3, 'Epic poetry', '2021-06-19 06:45:08', NULL),
(13, 4, 'Tragedy', '2021-06-19 06:45:25', NULL),
(14, 4, 'Comedy', '2021-06-19 06:45:36', NULL),
(15, 4, 'Historical plays', '2021-06-19 06:45:54', NULL),
(16, 4, 'Radio drama', '2021-06-19 06:46:13', NULL),
(17, 5, 'Mathematics', '2021-06-19 06:46:29', NULL),
(18, 5, 'Science', '2021-06-19 06:46:29', NULL),
(19, 5, 'Social Sciences', '2021-06-19 06:46:43', NULL),
(20, 5, 'Education', '2021-06-19 06:46:43', NULL),
(21, 6, 'Dictionaries', '2021-06-19 06:46:52', NULL),
(22, 6, 'Bibliographies', '2021-06-19 06:46:52', NULL),
(23, 6, 'Encyclopedias', '2021-06-19 07:10:26', NULL),
(24, 6, 'Atlases', '2021-06-19 07:10:26', NULL);

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
-- Table structure for table `productreviews`
--

CREATE TABLE `productreviews` (
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
  `productName` varchar(255) DEFAULT NULL,
  `productCompany` varchar(255) DEFAULT NULL,
  `productPrice` int(11) DEFAULT NULL,
  `productPriceBeforeDiscount` int(11) DEFAULT NULL,
  `productDescription` longtext DEFAULT NULL,
  `productImage1` varchar(255) DEFAULT NULL,
  `productImage2` varchar(255) DEFAULT NULL,
  `productImage3` varchar(255) DEFAULT NULL,
  `shippingCharge` int(11) DEFAULT NULL,
  `productAvailability` varchar(255) DEFAULT NULL,
  `postingDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category`, `subCategory`, `productName`, `productCompany`, `productPrice`, `productPriceBeforeDiscount`, `productDescription`, `productImage1`, `productImage2`, `productImage3`, `shippingCharge`, `productAvailability`, `postingDate`, `updationDate`) VALUES
(1, 1, 1, 'Nasivion Classic Adult 0.05% Nasal Spray  ', 'Merck Ltd', 66, 79, '<div>Information about Nasivion Classic Adult 0.05% Nasal Spray</div><div>Benefits:&nbsp;</div><div>Nasivion Classic Adult Nasal Spray decongests a blocked nose quickly for fast relief. It comes in an easy squeeze bottle – releasing a mist that starts working as fast as 25 seconds and provides relief up to 12 hours. On a blocked nose, nothing works faster than Nasivion</div><div>&nbsp;</div><div>Ingredients:</div><div>Each ml of Nasivion Classic Adult Nasal Spray contains:</div><div>0.5 mg Oxymetazoline Hydrochloride USP (active ingredient) in buffered aqueous solution&nbsp;</div><div>0.3 mg Benzalkonium Chloride Solution 50% IP (as preservative)</div><div>&nbsp;</div><div>Dosage and frequency of use:</div><div>Spray one puff into each nostril 2-3 times per day OR Instil 1-2 drops of the solution into each nostril 2-3 times per day</div><div>&nbsp;</div><div>Storage instructions:</div><div>Preserve in tight containers at a temperature not exceeding 30°C</div><div>Close the cap tightly after use</div><div>Do not use if seal is broken&nbsp;</div><div>Keep out of reach of children&nbsp;</div><div>&nbsp;</div><div>How to use:&nbsp;</div><div>Clean your nose by gently blowing over a handkerchief or tissue&nbsp;</div><div>Insert the nozzle into affected nostril by tilting the head forward in erect posture</div><div>Use the spray by squeezing the bottle once and continue normal breathing inwards (inhalation)</div><div>Release the pressure from the bottle and comfortably remove the nozzle from the nostril&nbsp;</div><div>Repeat the same steps while applying in the other nostril</div><div>Do not forget to replace the cap tightly after use</div>', 'tw0ldub9wtmharc136eb.png', 'tw0ldub9wtmharc136eb.png', 'tw0ldub9wtmharc136eb.png', 29, 'In Stock', '2021-06-19 06:51:59', NULL),
(2, 1, 2, 'Paracip 500 Tablet', 'Cipla Ltd', 39, 45, '<div>BENEFITS OF PARACIP 500 TABLET</div><div>In Pain relief</div><div>Paracip 500 Tablet is a common painkiller used to treat aches and pains. It works by blocking chemical messengers in the brain that tell us we have pain. It is effective in relieving pain caused by headache, migraine, nerve pain, toothache, sore throat, period (menstrual) pains, arthritis, and muscle aches. This medicine is very widely used and very rarely causes side effects if taken at the right dosage. Take it as it is prescribed to get the most benefit. Do not take more or for longer than needed as that can be dangerous. In general, you should take the lowest dose that works, for the shortest possible time. It is also the first choice of painkiller during pregnancy or breastfeeding.</div>', 'edjvqk3zm2vdh1sd0scr.jpg', 'pdczhazhyh21vlipsusb.jpg', 'xtleofc4v0jgebvz6oyn.jpg', 0, 'In Stock', '2021-06-19 06:55:40', NULL),
(3, 1, 3, 'Crocin Pain Relief Tablet', 'GlaxoSmithKline Consumer Healthcare', 49, 59, '<div>USES OF CROCIN TABLET</div><div>Treatment of Headache</div><div>BENEFITS OF CROCIN TABLET</div><div>In Treatment of Headache</div><div>Crocin Pain Relief Tablet is a painkiller used to treat headache. It works by blocking chemical messengers in the brain that tell us we have pain. By treating headache, it can help you carry out your daily activities and have a better quality of life. Take Crocin Pain Relief Tablet as prescribed by the doctor to get the most benefit. Do not take more or for longer than needed as that can be dangerous. In general, you should take the lowest dose that works, for the shortest possible time.</div><div>SIDE EFFECTS OF CROCIN TABLET</div><div>Most side effects do not require any medical attention and disappear as your body adjusts to the medicine. Consult your doctor if they persist or if you’re worried about them</div>', 'onav4rssxbdwvk1pedey.jpg', 'f6ewpyttm6aat6oz08b9.jpg', 'kak1b2o6qll6qpmmx9v3.jpg', 29, 'In Stock', '2021-06-19 06:59:26', NULL),
(4, 1, 4, ' SBL Stobal Cough Syrup SBL Pvt Ltd', 'SBL Pvt Ltd', 75, 89, '<div>Information about SBL Stobal Cough Syrup</div><div>SBL’s Stodal Or Stobal cough syrup with no narcotics helps in facilitating recovery from cough and wheezes and thus, often helps in avoiding usage of antibiotics. Stodal+cough syrup is a safe and effective remedy, and is well suited for all age groups. It has no narcotics. Safe for pregnant women, children and elderly persons.</div><div><br></div><div>INGREDIENTS: SBL’s stodal Or Stobal cough syrup is a clinically proven product and contains well balanced homeopathic ingredients like Pulsatilla nigricans 3, Justicia adhatoda 3x, Rumex crispus 3x, Ipecacuanha 3 etc.</div><div><br></div><div>DOSAGE: Adults: one tablespoon of SBL Stodal Cough Syrup 3-5 time a day. Children: one teaspoon 3-5 times a day or as directed by the physician.</div><div><br></div><div><br></div><div>Manufacturer/Marketer Address</div><div>SBL, House 2 ,Commercial Complex, Shrestah Vihar,Delhi 10092,INDIA</div><div>Country of Origin: India</div><div><br></div><div>Expires on or after: November, 2025</div>', 'sbl-stobal-cough-syrup.jpg', 'zvo5jraqmpp5okczrqas.jpg', 'kklmzlcok1avcxfsyfx8.jpg', 29, 'In Stock', '2021-06-19 07:03:16', NULL),
(5, 2, 5, 'Dr Morepen BG 03 Gluco One Blood Glucose Monitoring System Morepen Laboratories Ltd', 'Morepen Laboratories Ltd', 399, 499, '<div>Information about Dr Morepen BG 03 Gluco One Blood Glucose Monitoring System</div><div>Dr Morepen BG 03 Gluco One Blood Glucose Monitoring System is specially designed to help monitor blood sugar levels in the body. It is useful for those who want to keep a check on the blood glucose level and for those who suffer from diabetes.&nbsp;&nbsp;</div><div><br></div><div>Uses:</div><div>It is designed to monitor blood glucose levels.&nbsp;</div><div>&nbsp;</div><div>Product Specifications and Features:</div><div>It has an ergonomic and sleek design</div><div>This biosensor-based Morepen glucometer features an easily readable large display</div><div>It gives results in five seconds</div><div>It uses biosensor technology</div><div>Can be used in households</div><div><br></div><div>Directions For Use:</div><div>Add 0.5 microlitres blood sample to the strip and get the result quickly on the display.</div>', 's54vor0pifpwddvkgnsa.jpg', 'gcfusenlzy1ke4zaffa5.jpg', 'vszfbrmgd5kgikdiqvuv.jpg', 29, 'In Stock', '2021-06-19 07:04:56', NULL),
(6, 2, 6, 'D- Protin Powder Vanilla British Biologicals', ' British Biologicals', 72, 85, '<div>Information about D- Protin Powder Vanilla</div><div>D-Protin Vanilla powder is a nutritional supplement of proteins, essential vitamins and minerals, which is specially formulated for Diabetics and Pre-Diabetics. D-Protin is indicated in Type 1 Diabetes, Type 2 Diabetes, Gestational Diabetes and Pre-Diabetes. This protein powder supplement also improves the overall health.</div><div>&nbsp;</div><div>Key Nutrients of D-Protin Powder:</div><div>&nbsp;</div><div>Contains 28 essential vitamins and minerals, including PUFA&nbsp; (Polyunsaturated Fatty Acid).</div><div>Enriched with antioxidant properties that prevents oxidative stress and promotes cardiac health.</div><div>Contains heart friendly soy protin&nbsp;</div><div>Complex carbohydrates enhance energy level.</div><div>The micro and macro nutrients, along with other minerals correct nutritional deficiencies.</div><div>&nbsp;</div><div>D-Protin powder can be taken orally as a nutritious snack or supplement. Recommended serving is two tablespoon twice daily with lukewarm milk or water. Stir well until completely resolved.&nbsp;</div><div>&nbsp;</div><div>Use under Medical supervision.</div>', 'qs5ksnx41ohecfra7st1.jpg', 'adjdelruek9oswyxxutx.jpg', 'kj86ogedc8g6f73lxoog.jpg', 29, 'Out of Stock', '2021-06-19 07:06:40', NULL),
(7, 2, 7, 'Colgate Vedshakti Mouth Protect Spray Colgate-Palmolive Company', 'Colgate-Palmolive Company', 75, 89, '<div>3.630 Ratings &amp; 10 Reviews</div><div>Product Highlights</div><div>Helps to control germ build-up in the mouth</div><div>Kills germs in the mouth and also provides long-lasting freshness with its minty saunf flavour</div><div>It helps to eliminate disease-causing germs and bacteria</div>', 'mqzsrbxsumgcv701mbej.jpg', 'jae2ewdnwzgt1v9zoqpq.jpg', 'md7cflmfp3obidjqhwaz.jpg', 29, 'In Stock', '2021-06-19 07:08:04', NULL),
(8, 2, 8, 'Navratna Cool Ayurvedic Oil Emami Ltd', 'Emami Ltd', 70, 75, '<div>Information about Navratna Cool Ayurvedic Oil</div><div>Navratna Oil is a multi-benefit cooling oil that is enriched with herbal extracts. It is used for head and body massage and is effective for both men and women. A massage with Navratna oil relaxes the muscles. It imparts a cooling effect on the scalp and body. It also relieves tension and improves blood circulation. It is easily absorbed by massaging the scalp and provides a soothing effect.</div><div><br></div><div>Key Ingredients:</div><div>Sesame oil</div><div>Menthol</div><div>Amla</div><div>Camphor</div><div>Thyme</div><div>Rosemary oil</div><div><br></div><div>Key Benefits:</div><div>Provides effective relief from stress and tension</div><div>It gives quick relief from headache and sleeplessness</div><div>Contains natural goodness for hair and revitalises the hair tissues</div><div><br></div><div>Directions For Use:</div><div>Use Navratna Oil as directed by the physician.</div>', 'c4awrldwqvctwi9wxntr.jpg', 'zoxluyl54frbiemnlgej.jpg', 'ztccsdybobvctlgwsmis.png', 29, 'In Stock', '2021-06-19 07:09:14', NULL),
(9, 3, 9, 'Carbamide Forte Cold Pressed Flaxseed Oil 1000mg with Omega 3,6 & 9 825mg Softgel Capsule Novus Life Sciences Pvt Ltd', ' Novus Life Sciences Pvt Ltd', 459, 499, '<div>Key Ingredients:</div><div>Organic Flaxseed Oil</div><div><br></div><div>Key Benefits:</div><div>Flaxseed oil offers a cleaner, more sustainable, plant-based source of omega-3 fatty acid 1000mg compared to fish oil supplements</div><div>It helps strengthen the immune system</div><div>It helps in maintaining a healthy digestive and cardiovascular system</div><div>Helps to soothe skin irritation and softens rough skin</div><div>It promotes hair growth and prevents hair fall</div><div><br></div><div>Directions For Use:</div><div>Take one daily with a meal or as directed by your healthcare professional.</div>', 'ahsabasy99euzpvekmbm.jpg', 'bc9ae5e4b7b0117mmlr8.jpg', 'iypdwiswlufoiz9xhdqa.png', 29, 'In Stock', '2021-06-19 07:11:34', NULL),
(10, 3, 10, 'Patanjali Ayurveda Giloy Ghanvati ', 'Patanjali Ayurved Limited', 70, 75, '<div>Key benefits/uses of Patanjali Ayurveda Divya Giloy Ghanvati:</div><div>Used for the treatment of general weakness and common cold</div><div>Can be used to fight chronic constipation with mucus in the stool</div><div>Helps to manage cholesterol level and keep your heart healthy</div><div>Is known to lower your risk of recurrent infections</div><div>Boosts your immune system and prevents immune-deficiency disorders</div><div>Aids in the treatment of liver disorders such as hepatitis, and jaundice</div><div>Acts as supportive therapy for people with autoimmune disorders</div><div>Improves your appetite and aids in overall growth</div><div>Plays a key role in the treatment of skin disorders</div><div>Helps you to deal with urinary problems including urinary tract infections</div><div>Can help you to improve the symptoms and recovery due to dengue and chikungunya</div><div>Directions for use:</div><div>Take this supplement as advised by your doctor. Ideally, adults and children above 12 years of age are advised to take 1 tablet twice daily. For children below 12 years of age, a dose of half a tablet twice daily or as directed by your physician is advised.</div>', 'z5mf6dgjswtyvg7bdbug.jpg', 'ozfuzzxtfvvkfzoyau3h.jpg', 'tlhkwn1zurzopcv4dcor.jpg', 29, 'Out of Stock', '2021-06-19 07:12:52', NULL),
(11, 3, 11, 'Nutrafirst Omega 3 Salmon Fish Oil Capsule', ' Nirvasa Healthcare Pvt Ltd', 89, 99, '<div>Information about Nutrafirst Omega 3 Salmon Fish Oil Capsule</div><div>Nutrafirst Omega 3 Salmon Fish Oil Capsule contains Omega 3 which has various health benefits.It helps in maintaining healthy skin, eyes and cardiovascular system. It has anti-inflammatory properties and also improves blood flow and brain functioning. It is beneficial in reducing blood pressure and also reduces the risk of ailments such as glaucoma and age-related macular degeneration.&nbsp;</div><div><br></div><div>Key Ingredients:</div><div>Fish Oil</div><div>Gelatin Animal Origin</div><div>Sorbitol</div><div>Refined Soyabean Oil</div><div><br></div><div>Key Benefits:</div><div>Helps in maintaining healthy skin and eyes i.e. reduce the risk of having glaucoma and age-related macular degeneration</div><div>Helps in reducing inflammation, cholesterol levels, improve blood flow &amp; brain health</div><div>Reduces the risk of developing glaucoma and age-related macular degeneration</div><div>Helps in stimulating relaxation in blood vessels, reduce blood pressure and also improve blood flow</div><div>Helps in reducing cholesterol levels HDL especially triglycerides and enhances high-density lipoprotein</div><div>Helps in improving cognitive functioning and useful in enhancing immunity</div><div><br></div><div>Directions for Use:</div><div>Take 1 capsule per day preferably with a meal or as directed by the physician</div>', 'ewrqf9trj9ugtpaj0frh.jpg', 'n4xmxnhzj8lzizg0ppo1.jpg', 'k3rcujkm6cvfasdf6nhu.jpg', 0, 'In Stock', '2021-06-19 07:14:26', NULL),
(12, 3, 12, 'Colgate Strong Teeth Toothpaste with Amino Shakti ', 'Colgate-Palmolive Company', 72, 80, '<div>Information about Colgate Strong Teeth Toothpaste with Amino Shakti</div><div>Colgate Strong Teeth Toothpaste is specially formulated to help achieve stronger teeth and this is achieved by restoring the Calcium occurring naturally in the teeth Calcium. It is designed in a way that makes it best for optimal use.</div><div><br></div><div>Key Ingredients:</div><div>Calcium Carbonate</div><div>Sorbitol</div><div>Sodium Lauryl Sulphate</div><div>Silica</div><div>Key Benefits:</div><div>It is useful in adding natural calcium to the teeth</div><div>Accepted by the Indian Dental Association</div><div>The toothpaste is ideal for ever day use</div><div>The sorbitol in it acts as a sweetening agent making it easier to be used daily</div><div><br></div><div>Directions For Use:</div><div>Brush thoroughly or at least twice a day or as directed by a physician.</div>', 'u90vcgly9sgfcvapw2yp.png', 'ocrdwxds2gdrzmc9satb.jpg', 'uwuzutksf2rpnbfn7upa.jpg', 29, 'In Stock', '2021-06-19 07:15:44', NULL),
(13, 4, 13, 'Industryowl Fingertip Pulse Oximeter Blue ', 'Kaor Trading Company', 455, 499, '<div>Information about Industryowl Fingertip Pulse Oximeter Blue</div><div>IndustryOwl Fingertip Pulse Oximeter features an accurate and reliable perfusion index and plethysmograph waveform that will help you to determine the reliability of your reading. The bright OLED display allows use in any environment even in the dark surrounding. It is easy to use and blood oxygen measurement can be done in seconds by pressing the button. The small size of the oximeter makes it easy for you to carry around in your everyday life.</div><div><br></div><div>Uses:</div><div>It is used to take the measurement of the blood oxygen levels (Sp02) and the pulse rate.</div><div><br></div><div>Product Specification and Features:</div><div>Takes the reading and shows results in less than 10 seconds</div><div>30+ hours of continuous monitoring on one set of batteries</div><div>Finger chamber with a smart spring system that can accommodate a wide range of finger sizes</div><div>Pop-up menu to setup alarm limits for SpO2 and Pulse Rate</div><div>Bright, large display for better visibility in daylight with low-battery indicator</div><div>Very easy to operate with single switch operation</div><div>Batteries included: Yes</div>', 'myqhn1qakpkbpgaaenbp.jpg', 'yjr0cfrvkpldj0yhasy4.jpg', 'yepgpztsc9wusciukqey.jpg', 0, 'Out of Stock', '2021-06-19 07:17:08', NULL),
(14, 4, 14, 'Dettol Instant Hand Sanitizer Original ', 'Reckitt Benckiser', 59, 69, '<div>Product Highlights</div><div>Helps to kill 99.9% of germs without the use of soap and water</div><div>Provides total protection and hygiene</div><div>Prevents you from infection</div><div>Keeps your hands sanitized, soft and moisturized</div><div>Dries swiftly and ensures proper hygiene and sanitation</div><div>Key ingredients:</div><div>Alcohol Denat.</div><div><br></div><div>Water</div><div><br></div><div>Propylene Glycol</div><div><br></div><div>Tetrahydroxypropyl Ethylenediamine</div><div><br></div><div>Fragrance</div><div><br></div><div>Limonene</div>', 'mfajn8kf64yuaov7prew.jpg', 'qukgkvgqg6ctmwj8rwsw.png', 'fkrzdgywbsjk1nfiz9lc.png', 0, 'In Stock', '2021-06-19 07:18:24', NULL),
(15, 4, 15, 'Ethiglo Face Wash', ' Ethinext Pharma', 125, 129, '<div>Information about Ethiglo Face Wash</div><div>Ethiglo Face Wash is a creamy skin whitening deep cleansing facial foam. It improves skin tone and texture while making the skin look brighter and younger. It also keeps skin moist and hydrated all day.</div><div><br></div><div><br></div><div>Key Ingredients:</div><div>Aqua</div><div>Stearic acid</div><div>Coco Fatty acid</div><div>Lauric acid globules</div><div>Liquorice extract</div><div>Phenoxyethenol (and) Ethylheyglycerin</div><div>Niacinamide</div><div>Sodium PEG-7 olive oil Carbovylate</div><div>Sodium hydroxide</div><div>Salicylic acid</div><div>Triclosan</div><div>Allantoin</div><div>D- Panthenol</div><div>Disodium EDTA</div><div>Glycolic acid</div><div>Lactic acid</div><div>Vitamin E</div><div>Vitamin C</div><div>Postassium Hydoxide</div><div>Perfume</div><div><br></div><div><br></div><div>Key Benefits:</div><div>It helps in removing dark spots and dead skin</div><div>It is an effective cleanser</div><div>It improves complexion and skin tone</div><div><br></div><div>Directions For Use:</div><div>Moisten face with water</div><div>Take a small quantity of deep cleansing face wash on the palm</div><div>Apply using a gentle circular motion</div><div>Rinse well</div>', 'fkrzdgywbsjk1nfiz9lc.png', 'wbyskbacqv5poopff4i1.jpg', 'ivqfg8sbuzmrpmsgpwsx.jpg', 29, 'In Stock', '2021-06-19 07:19:38', NULL),
(16, 4, 16, 'Sugar Free Gold Low Calorie Sweetener ', 'Zydus Wellness Product Ltd', 120, 149, '<div>Information about Sugar Free Gold Low Calorie Sweetener</div><div>Sugar-Free Gold Low-Calorie Sweetener is a healthier alternative to sugar. It is made from aspartame, a protein derivative. It is a nutritious, safe and ideal low- calorie sugar substitute, giving the sweetness and taste of sugar but with negligible calories. Sugar-Free Gold helps to cut down on excess calories of sugar to keep you fit and healthy.</div><div><br></div><div>Key Ingredients:</div><div>Aspartame</div><div><br></div><div>Key Benefits:</div><div>Helps to provide sweetness without the calories</div><div>Making sugar-free a part of the fitness plan which may help to avoid unwanted calories</div><div>Sugar-Free Gold is made from aspartame, a protein derivative which is 200 times sweeter than sugar</div><div>Have negligible calories thus good for weight-watchers and diabetic people</div><div>It is ideal for adding to beverages&nbsp;</div><div>Direction For Use:</div><div>1 pellet is equivalent in sweetness to 1 teaspoon of sugar.&nbsp;</div><div><br></div><div>Safety Information:</div><div>Read the label carefully before use</div><div>Keep out of reach of the children</div><div>Do not exceed the recommended pellet</div><div>Store in a cool dry place away from direct sunlight</div>', 'bpgstknem0udqzp9p4dm.jpg', 'uggczqgnlmtczew3rezs.jpg', 'ybfzsta71f3dgxhcdljq.png', 29, 'In Stock', '2021-06-19 07:21:44', NULL),
(17, 5, 17, 'Horlicks Health and Nutrition Drink Classic Malt ', 'Hindustan Unilever Ltd', 239, 249, '<div>Information about Horlicks Health and Nutrition Drink Classic Malt</div><div>Horlicks Health And Nutrition Drink is a nourishing beverage which is part of the balanced diet.</div><div><br></div><div>Key Ingredients:</div><div>Malted barley (extracted solids) 39%</div><div>Wheat flour (27%)</div><div>Milk solids (14%)</div><div>Minerals</div><div>Wheat gluten (2%)</div><div>Vitamins</div><div>Protein isolate&nbsp;</div><div>Key Benefits:</div><div>Increases the density of minerals such as calcium in bones to give children bigger and stronger bones</div><div>Horlicks is clinically proven to increase lean tissue, making children stronger</div><div>Helps improve attention and concentration to make the child smarter</div><div>Clinically proven for more hemopoietic nutrients in the blood and to increase fat-free mass, making the child stronger</div><div><br></div><div>Direction For Use:</div><div>As per the requirement or as directed.</div><div>&nbsp;</div><div>Safety Information:</div><div>Read the label carefully before use</div><div>Keep out of reach of the children</div><div>Store in a cool dry place</div><div>Use under medical supervision</div><div><br></div>', 'pw6la0nln2sdeucikajc.png', 'lb6fw6wm5plar7qqogyj.png', 'ynmoxbrswfakfllpjyr7.png', 29, 'In Stock', '2021-06-19 07:22:54', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `userlog`
--

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
-- Indexes for table `productreviews`
--
ALTER TABLE `productreviews`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `ordertrackhistory`
--
ALTER TABLE `ordertrackhistory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `productreviews`
--
ALTER TABLE `productreviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `subcategory`
--
ALTER TABLE `subcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `userlog`
--
ALTER TABLE `userlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
