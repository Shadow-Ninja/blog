-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 17, 2023 at 11:55 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `codingthunder`
--

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `sno` int(11) NOT NULL,
  `Name` text NOT NULL,
  `email` varchar(30) NOT NULL,
  `phone_num` varchar(30) NOT NULL,
  `mes` text NOT NULL,
  `date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`sno`, `Name`, `email`, `phone_num`, `mes`, `date`) VALUES
(1, 'test1', 'test1@gmail.com', '1012023030', 'test message one.', '2022-12-09 01:22:31'),
(2, 'test2', 'test2@gmail.com', '1234123412', 'asdfasdfas', NULL),
(3, 'test2', 'test2@gmail.com', '1234123412', 'asdfasdfas', NULL),
(4, 'test2', 'test2@gmail.com', '1234123412', 'asdfasdfas', '2022-12-09 02:33:49'),
(5, 'test2', 'test2@gmail.com', '1234123412', 'asdfasdfas', '2022-12-09 02:49:34'),
(6, 'test3', 'test3@gmail.com', '1234123412', 'test3 alkdjflaj', '2022-12-09 02:52:38'),
(7, 'test4', 'rahultanti12@gmail.com', '1234123412', 'You are going to receive a mail soon.', '2022-12-10 03:16:34'),
(8, 'test5', 'ab@ab.com', '1234123443', 'from Coding Thunder', '2022-12-10 17:09:25'),
(9, 'test5', 'rahul@greetings123.ml', '1234123443', 'from Coding Thunder', '2022-12-10 17:10:15');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `sno` int(11) NOT NULL,
  `title` text NOT NULL,
  `tagline` text NOT NULL,
  `slug` varchar(25) NOT NULL,
  `content` text NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `img_file` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`sno`, `title`, `tagline`, `slug`, `content`, `date`, `img_file`) VALUES
(1, 'Lets learn about stocks', 'Stock is gamble or investments', 'first-posts', 'In finances, stock (also capital stock) consists of all the shares by which ownership of a corporation or company is divided.[1] (Especially in American English, the word \"stocks\" is also used to refer to shares.)[1][2] A single share of the stock means fractional ownership of the corporation in proportion to the total number of shares. This typically entitles the shareholder (stockholder) to that fraction of the company\'s earnings, proceeds from liquidation of assets (after discharge of all senior claims such as secured and unsecured debt),[3] or voting power, often dividing these up in proportion to the amount of money each stockholder has invested. Not all stock is necessarily equal, as certain classes of stock may be issued for example without voting rights, with enhanced voting rights, or with a certain priority to receive profits or liquidation proceeds before or after other classes of shareholders.\r\n\r\nStock can be bought and sold privately or on stock exchanges, and such transactions are typically heavily regulated by governments to prevent fraud, protect investors, and benefit the larger economy. The stocks are deposited with the depositories in the electronic format also known as Demat account. As new shares are issued by a company, the ownership and rights of existing shareholders are diluted in return for cash to sustain or grow the business. Companies can also buy back stock, which often lets investors recoup the initial investment plus capital gains from subsequent rises in stock price. Stock options issued by many companies as part of employee compensation do not represent ownership, but represent the right to buy ownership at a future time at a specified price. This would represent a windfall to the employees if the option is exercised when the market price is higher than the promised price, since if they immediately sold the stock they would keep the difference (minus taxes).', '2022-12-31 02:45:56', 'post-bgs.jpg'),
(2, 'My Second post', 'Van Helsing is great', 'second-post', 'When Van Helsing’s mysterious invention goes haywire, Drac and his pals are transformed into humans and Johnny becomes a monster! In their new mismatched bodies, Drac and Johnny must team up to find a cure. With help from Mavis and the Drac Pack, the heat is on to find a way to switch themselves back before their transformations become permanent.', '2022-12-11 19:15:15', 'post-bg.jpg'),
(3, 'Capital stalemate: On the conflict between the Chief Minister and Lieutenant Governor in Delhi', 'Governance is the casualty in the conflict between CM and LG in Delhi', 'third-post', 'The victory of the Aam Aadmi Party in the recent Municipal Corporation of Delhi (MCD) elections has added a fresh backdrop to the unceasing face-off between the Lieutenant Governor of the National Capital Territory and the elected government. Several Governors, who are all too eager to further the Bharatiya Janata Party’s politics, confront elected Chief Ministers from Opposition parties, but Delhi’s case is unique, given the vast executive power at the command of the Lieutenant Governor. The most recent flashpoint between Chief Minister Arvind Kejriwal and Lieutenant Governor Vinai Kumar Saxena came ahead of the January 6 election of the Mayor and Deputy Mayor of the MCD, when Mr. Saxena appointed 10 aldermen and a BJP councillor to preside over the polls. The AAP alleged that Mr. Saxena had bypassed the tradition of appointing the senior-most councillor as the presiding officer. It has alleged that the aldermen appointed by Mr. Saxena were given voting rights in violation of the MCD Act, a question that remains unclarified. The party has pointed out that the Lieutenant Governor is ignoring the Council of Ministers and issuing orders to the bureaucracy directly on all matters, regardless of the division of power established by the Supreme Court between the two entities.\n\nTechnically, the Lieutenant Governor has executive control over only the three reserved subjects of police, public order and land; all other subjects (transferred subjects) lie with the elected government. But by virtue of being in control of the bureaucracy, and exercising the power to transfer, suspend or take any action against any employee of the Delhi government, the Lieutenant Governor’s authority extends beyond those. As its earlier interventions have not settled the dispute between the Lieutenant Governor and the elected government, the Supreme Court is currently examining the question afresh. Meanwhile, the relations between the Chief Minister and the Lieutenant Governor are sliding further. The Lieutenant Governor sought a meeting with the Chief Minister, but then refused to give him time. Till October, the Lieutenant Governor and the Chief Minister used to have weekly meetings. The Supreme Court’s calls for statesmanship and wisdom by actors have not resolved the stalemate, which is seriously impacting governance in the national capital. The heightened political competition between the AAP and the BJP has worsened the situation, but the root of it all is the legal ambiguity that needs to be dispelled.', '2022-12-31 02:54:24', 'img3.jpg'),
(4, 'Winning formula: On BJP’s strategy ', 'While the Bharatiya Janata Party’s strategy works across regions, the Congress needs State-specific tactics', 'fourth-post', 'The Bharatiya Janata Party’s victory in Gujarat eclipses its loss in Himachal Pradesh: not only is Gujarat a bigger State, but the scale of the party’s sweep in the western State also overshadows its narrow loss in the hill State. For the Congress, its victory in Himachal Pradesh is meagre consolation against the backdrop of its decimation in Gujarat where it had to be content with 17 of the 182 Assembly seats, as compared to 77 in 2017. With another five-year term now, the BJP will rule Gujarat for 32 years, almost matching the Left Front’s 34-year rule in West Bengal that ended in 2011. The BJP increased its vote share, from 49% in 2017 to 53% now. AAP finished a distant third in Gujarat, but its furious foray into the State gained it a 13% voteshare, and also national party status. AAP’s entry triangulated the Gujarat contest, which worked to the BJP’s advantage. The BJP made inroads into tribal regions and rural constituencies which constituted patches of the Congress’s strength, after AAP’s generous promise of welfare schemes succeeded in seeding a new kind of class politics in the State. It was Prime Minister Narendra Modi leading the campaign all the way for the BJP, and his popularity, which was unlinked to the performance of the State government, helped power the BJP to a historic victory.', '2022-12-11 19:30:38', ''),
(5, 'Intense engagement: On India-Germany ties', 'India can work with Germany to bring G-20 partners together for global unity ', 'fifth-post', 'German Foreign Minister Annalena Baerbock’s visit to India and talks with External Affairs Minister S. Jaishankar have set the stage for a more updated bilateral relationship. The two sides signed an agreement on mobility and migration that boosts travel for students, researchers and investors and businesses, and the meeting was preceded by Germany’s agreement to fund renewable energy projects worth a billion Euros. The year 2022 has seen intense high-level engagement, as Prime Minister Narendra Modi made two visits to Germany — for the India-Germany Inter-Governmental Consultations with Chancellor Olaf Scholz in Berlin and the G-7 outreach summit in Bavaria. The leaders also met at the G-20 summit in Bali. In 2023, Mr. Scholz is expected to be in Delhi, in spring, and again in September for the G-20 summit in India. On the multilateral stage, Ms. Baerbock, a leader of the German Alliance 90/Green party, made countering climate change an important issue where New Delhi and Berlin can cooperate at the G-20 under India’s presidency. Mr. Jaishankar spoke of the need to keep pushing for UN Security Council reform, where India and Germany have been part of the ‘G-4’ grouping since 2005. Ms. Baerbock also walked back previous controversial comments calling for the “United Nations track” to resolve the Kashmir dispute; she told The Hinduahead of her visit that she believes Kashmir is a “bilateral dispute” to be resolved between India and Pakistan only.', '2022-12-11 19:34:47', ''),
(6, 'Back to the past: On a far-right coup plot in Germany', 'Germany will have to tackle the far-right elements politically ', 'sixth-post', 'READ LATER\r\nA sitting judge, a former elite paratroops commander and a former police officer. They were among the 25 people arrested by the German authorities on Wednesday in a nationwide crackdown on what they called an extremist group that was planning to overthrow the state. While Germany has seen the rise of several far-right networks, their growing influence over serving and retired members of its security agencies and other state branches should be a matter of concern, given its Nazi past. Among those arrested were members of the Reichsbürger, or Citizens of the Reich, a far-right extremist group that has not recognised the post-War German state, as well as those inspired by conspiracy theories spread by QAnon, a U.S.-based far-right community. The authorities say the plan was to attack the Bundestag, bring down the government through a coup and have a new Reich modelled around the pre-First World War imperial state. Heinrich XIII, Prince Reuss, the 71-year-old former paratroops commander who is believed to be the ringleader, was known for his anti-Semitic dog whistles and attacks on the modern German republic, which he once called an illusion. So, irrespective of the actual strength and capabilities of the group, what Germany has seen is the coming together of anti-Semitic extremists from across society, driven by conspiracy theories and an imperial nostalgia, and who are ready to take up arms to overthrow the democratic German state.', '2022-12-11 19:34:47', ''),
(8, 'Peru in peril: On the political crisis in the South American country', 'The government and opposition must agree on an early date for fresh elections', 'sixth-post', 'With the killing of 17 civilians and one police officer on Monday amid anti-government protests, the month-long political crisis in Peru has crossed a bloody threshold and could trigger more waves of violence. The incident shows not only the barbarity of the country’s security personnel in dealing with protests, but also the failure of President Dina Boluarte and of her predecessor Pedro Castillo in uniting and stabilising the country during the periods they have been in power. The crisis is the result of a power struggle between Mr. Castillo and Congress. Mr. Castillo, a former school teacher and a trade unionist, was elected President in 2021 on promises such as ensuring political stability, fighting corruption and addressing chronic inequality. But without any administrative and political experience, Mr. Castillo found it hard to negotiate the maze of Peruvian polity. As he struggled to get a grip on governance, a hostile Congress and the wealthy classes lined up against him. Corruption scandals and alleged links with criminal syndicates weakened Mr. Castillo’s position in Lima. Congress voted to fire him twice, but failed to garner enough support. As a third vote was due in December last year, Mr. Castillo made the drastic announcement of dissolving Congress, which also triggered his impeachment.\r\n\r\nBut if Mr. Castillo, currently in jail, miscalculated the consequences of his decision to dissolve Parliament, his successor and legislators misjudged the leftist leader’s support among the poor. Violent protests broke out in Peru’s highlands demanding Mr. Castillo’s restoration or early elections. Mr. Castillo called Ms. Boluarte “usurper”, while his supporters said the president they voted for was not allowed to complete his legitimate term, which was to expire in 2026. At least 47 people, mostly civilians, have been killed in protests, ever since Mr. Castillo was ousted. As she came under enormous pressure, Ms. Boluarte promised to hold elections by April 2024 (pending approval from Congress), but this was dismissed by Mr. Castillo and his supporters, leaving the country in disarray. Both sides have a hand in the current crisis and should come together to find a way out. Restoring Mr. Castillo may not be practically and constitutionally possible, but Ms. Boluarte’s government could release him from prison in return for peace. To end the current impasse, the government, the opposition and Congress should agree on the earliest possible date for fresh elections. Peru’s political class should also be ready for broader constitutional reforms that allow the presidency and the legislature to function without confrontation.', '2022-12-11 19:34:47', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`sno`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`sno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
