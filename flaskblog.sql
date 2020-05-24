-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 12, 2020 at 11:08 PM
-- Server version: 5.7.30-0ubuntu0.18.04.1
-- PHP Version: 7.2.24-0ubuntu0.18.04.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `flaskblog`
--

-- --------------------------------------------------------

--
-- Table structure for table `alembic_version`
--

DROP TABLE IF EXISTS `alembic_version`;
CREATE TABLE `alembic_version` (
  `version_num` varchar(32) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `alembic_version`
--

INSERT INTO `alembic_version` (`version_num`) VALUES
('11cdbc138398');

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `id` int(11) NOT NULL,
  `sender_id` int(11) DEFAULT NULL,
  `recipient_id` int(11) DEFAULT NULL,
  `body` varchar(140) COLLATE utf8_bin DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `message`
--

INSERT INTO `message` (`id`, `sender_id`, `recipient_id`, `body`, `timestamp`) VALUES
(1, 1, 5, 'Good Morning Sir;\r\nHere you can find your private inbox. you can send and receive messages.', '2020-05-09 23:10:31'),
(2, 7, 6, 'I will help you, matkhafch\r\n', '2020-05-09 23:18:06'),
(3, 8, 6, 'hello ! nice work ', '2020-05-09 23:20:13'),
(4, 6, 8, 'hello bb', '2020-05-09 23:22:14'),
(5, 6, 5, 'Bonsoir Monsieur', '2020-05-10 00:36:21'),
(6, 9, 6, 'hi', '2020-05-10 15:06:16'),
(7, 5, 1, 'Bonsoir Taha, \r\nBravo.\r\nJe viens de me connecter à la plate forme et je suis entrain de découvrir ces fonctionnalités.\r\n\r\n', '2020-05-11 17:31:19'),
(8, 5, 6, 'Bonsoir Mustapha,\r\nBravo pour la plate forme. je suis entrain de découvrir ses fonctionalités.', '2020-05-11 17:32:11');

-- --------------------------------------------------------

--
-- Table structure for table `message_rel`
--

DROP TABLE IF EXISTS `message_rel`;
CREATE TABLE `message_rel` (
  `id` int(11) NOT NULL,
  `sender_id` int(11) DEFAULT NULL,
  `recipient_id` int(11) DEFAULT NULL,
  `body` varchar(140) COLLATE utf8_bin DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
CREATE TABLE `post` (
  `id` int(11) NOT NULL,
  `title` varchar(100) COLLATE utf8_bin NOT NULL,
  `date_posted` datetime NOT NULL,
  `content` text COLLATE utf8_bin NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`id`, `title`, `date_posted`, `content`, `user_id`) VALUES
(1, 'Web development consultant', '2020-05-09 22:16:58', 'General information\r\nDuration: \r\n2 months\r\nCommitment: \r\nPart-Time\r\nDescription: \r\nLiquid is a PR, design and marketing consultancy with offices in Birmingham, Guernsey,  Jersey and London. Our approach is integrated, with teams from different disciplines working together to deliver high-impact campaigns and projects.\r\n\r\n \r\n\r\nWe are driven by strategic thinking, creative ideas and delivering outstanding results, and strong return on investment, for our clients.\r\n\r\n \r\n\r\nOur in-house digital team manages social media for some of our largest clients. From social media strategy and media planning through to competitor analysis, social media listening and asset creation, our team uses its insight and experience to raise brand awareness using the platforms and channels best suited to the strategy.\r\n\r\n \r\n\r\nCurrently we are looking for new interns to join us and work at Web designing\r\n\r\n department at one of our offices in London.\r\n\r\n \r\n\r\nMain tasks:\r\n\r\nDeveloping content for websites of our clients\r\nfixing bugs on the websites\r\nbasic programming (html & java)\r\nDesigning new website and editing existing one\r\n \r\n\r\nWhy internship with us?\r\n\r\nCasual, friendly atmosphere in our office\r\nInternational environment\r\nProfessional business approach\r\nTraining opportunities in web designing\r\nWork using latest tools and software\r\n \r\n\r\nIdeal candidate?\r\n\r\nProactive, passionate about web designing, willing to help, likes to work in an international team.\r\n\r\n \r\n\r\nTerms and conditions\r\n\r\nInternship for a duration1-  6 months (relatively flexible).\r\nWe are looking for a proactive candidate\r\nEnglish B1 level or higher\r\nCivil Liability, Health & Personal Accident Insurance are covered.\r\n \r\n\r\nAdditional important notes:\r\n\r\nWe offer also smart work.\r\n\r\nPlease apply via the ErasmusIntern.org website. Keep in mind that interviews will be conducted only with selected candidates, so do not hesitate to apply as soon as possible.\r\n\r\nCompensation: \r\nFinancial compensation\r\nSalary\r\nAccommodation\r\nTransportation costs\r\nReimbursement costs\r\nLunch vouchers\r\nHealth Insurance\r\nOther\r\nYears of Experience required: \r\nNo\r\nLink: \r\nhttps://www.weareliquid.com/', 2),
(2, 'Web development consultant', '2020-05-09 22:18:57', 'General information\r\nDuration: \r\n2 months\r\nCommitment: \r\nPart-Time\r\nDescription: \r\nLiquid is a PR, design and marketing consultancy with offices in Birmingham, Guernsey,  Jersey and London. Our approach is integrated, with teams from different disciplines working together to deliver high-impact campaigns and projects.\r\n\r\n \r\n\r\nWe are driven by strategic thinking, creative ideas and delivering outstanding results, and strong return on investment, for our clients.\r\n\r\n \r\n\r\nOur in-house digital team manages social media for some of our largest clients. From social media strategy and media planning through to competitor analysis, social media listening and asset creation, our team uses its insight and experience to raise brand awareness using the platforms and channels best suited to the strategy.\r\n\r\n \r\n\r\nCurrently we are looking for new interns to join us and work at Web designing\r\n\r\n department at one of our offices in London.\r\n\r\n \r\n\r\nMain tasks:\r\n\r\nDeveloping content for websites of our clients\r\nfixing bugs on the websites\r\nbasic programming (html & java)\r\nDesigning new website and editing existing one\r\n \r\n\r\nWhy internship with us?\r\n\r\nCasual, friendly atmosphere in our office\r\nInternational environment\r\nProfessional business approach\r\nTraining opportunities in web designing\r\nWork using latest tools and software\r\n \r\n\r\nIdeal candidate?\r\n\r\nProactive, passionate about web designing, willing to help, likes to work in an international team.\r\n\r\n \r\n\r\nTerms and conditions\r\n\r\nInternship for a duration1-  6 months (relatively flexible).\r\nWe are looking for a proactive candidate\r\nEnglish B1 level or higher\r\nCivil Liability, Health & Personal Accident Insurance are covered.\r\n \r\n\r\nAdditional important notes:\r\n\r\nWe offer also smart work.\r\n\r\nPlease apply via the ErasmusIntern.org website. Keep in mind that interviews will be conducted only with selected candidates, so do not hesitate to apply as soon as possible.\r\n\r\nCompensation: \r\nFinancial compensation\r\nSalary\r\nAccommodation\r\nTransportation costs\r\nReimbursement costs\r\nLunch vouchers\r\nHealth Insurance\r\nOther\r\nYears of Experience required: No\r\nLink: https://www.weareliquid.com/', 2),
(3, 'Chief Financial Officer', '2020-05-09 22:20:25', 'General information\r\nDuration: \r\n12 months\r\nCommitment: \r\nPart-Time\r\nDescription: \r\nWe are looking for a Chief Financial Officer that can lead our current team and expand our business into the european market. The main mission is to increase the valuation of the company and help the CEO make investment decisions. And the main qualification of the intern will be to believe in our vision and have a passion for innovation and sustainability.\r\n\r\nTasks and Responsibilities:\r\n\r\nManage Sibo\'s Global Finances\r\nCreate a financial strategy that helps increase company valuation and decrease long term costs.\r\nManagement of the financial team efforts, and coordinate with accountants.\r\nDevelope cost and revenue strategies for each of our business divisions.\r\nManagement of financial KPI.\r\nManagement of company financial budgets.\r\nFinancial analisys and proyections.\r\nCompany Valuation.\r\nCompensation: \r\nFinancial compensation\r\nReimbursement costs\r\nOther\r\nYears of Experience required: \r\nYes', 2),
(4, 'Hello World!', '2020-05-09 22:21:18', 'Hello everyone;\r\n**DISCLAIMER**\r\nThis post is just an informative post .\r\nWelcome To Cloud Univ, This is a platform created for educational purposes alongside being able to exchange knowledge, experience and to just gather in one place. In this place, you can create a Student account, a Professor account or as a person representing an Entity. \r\nAs a Student, You can post, apply for jobs, projects or internship opportunities. \r\nAs a professor, you can post too, and you can also recommend a student whom you know has certain competences, you can also post job or projects or internship opportunities for students to apply for.\r\nAs an Entity, you can post any of the opportunities mentioned above. You can consult each student profile in your candidates list or send a private message for more communication.\r\nSo, have fun discovering the place.\r\nMade with love again!', 1),
(5, ' Event organizer & PR internship', '2020-05-09 22:21:24', 'General information\r\nDuration: \r\n2 months\r\nCommitment: \r\nPart-Time\r\nDescription: \r\nLiquid is a PR, design and marketing consultancy with offices in Birmingham, Guernsey,  Jersey and London. Our approach is integrated, with teams from different disciplines working together to deliver high-impact campaigns and projects.\r\n\r\n \r\n\r\nWe are driven by strategic thinking, creative ideas and delivering outstanding results, and strong return on investment, for our clients.\r\n\r\n \r\n\r\nOur in-house digital team manages social media for some of our largest clients. From social media strategy and media planning through to competitor analysis, social media listening and asset creation, our team uses its insight and experience to raise brand awareness using the platforms and channels best suited to the strategy.\r\n\r\n \r\n\r\nCurrently we are looking for new interns to join us and work at Event promotion & PR department at one of our offices in London.\r\n\r\n \r\n\r\nMain tasks:\r\n\r\nDeveloping the program of the event\r\nCreating marketing materials\r\nKeeping in touch with our event partners\r\nUpdating database of event participants and speakers\r\nPreparing reports\r\n \r\n\r\nWhy internship with us?\r\n\r\nCasual, friendly atmosphere in our office\r\nInternational environment\r\nProfessional business approach\r\nTraining opportunities in event management\r\nWork using latest tools and software\r\n \r\n\r\nIdeal candidate?\r\n\r\nProactive, passionate about web designing, willing to help, likes to work in an international team.\r\n\r\n \r\n\r\nTerms and conditions\r\n\r\nInternship for a duration1-  6 months (relatively flexible).\r\nWe are looking for a proactive candidate\r\nEnglish B1 level or higher\r\nCivil Liability, Health & Personal Accident Insurance are covered.\r\n \r\n\r\nAdditional important notes:\r\n\r\nWe offer also smart work.\r\n\r\nPlease apply via the ErasmusIntern.org website. Keep in mind that interviews will be conducted only with selected candidates, so do not hesitate to apply as soon as possible.\r\n\r\nCompensation: \r\nFinancial compensation\r\nSalary\r\nAccommodation\r\nTransportation costs\r\nReimbursement costs\r\nLunch vouchers\r\nHealth Insurance\r\nOther\r\nYears of Experience required: \r\nNo\r\nLink: \r\nhttps://www.weareliquid.com/work/', 2),
(6, 'Digital Designer and IT Internship', '2020-05-09 22:22:20', 'General information\r\nDuration: \r\n6 months\r\nCommitment: \r\nFull-time\r\nDescription: \r\nWe are a new business in Sicily. Our goal is to combine organic farming with a unique villa rental. Luxury will meet fair trade and environmental friendliness. The renovation has already started and we are searching for our Graphic Design intern to be part of our social media team.\r\n\r\n \r\n\r\nPosition Description\r\n\r\nWe are looking for a Digital Designer and IT manager, a design Thinker, that is able to execute designs across platforms and channels. You will be working remotely for 3 months ( May - July) and then you will have the chance to stay with us in Sicily for the rest 3 months of the internship (August – October).\r\n\r\n \r\n\r\n \r\n\r\nRequirements\r\n\r\nQualifications\r\n\r\nCreative in Illustrator /Photoshop\r\n\r\nHTML and CSS coding\r\n\r\nJSON\r\n\r\nBasic knowledge of Wordpress\r\n\r\nKnowledge in computer science\r\n\r\nAble to produce higher quality material.\r\n\r\nClear and effective communication skills in English (written and verbal)\r\n\r\nBe ready to pick up this project- own it and champion it\r\n\r\n \r\n\r\nWhat we are looking for\r\n\r\nPassion\r\n\r\nAbility to manage multiple projects\r\n\r\nAttention to detail\r\n\r\nA person that loves what he/she does and wants to evolve in the field\r\n\r\nA combination of a thinker and a doer\r\n\r\nSomeone who likes to challenge him or herself in order to be better at his/her craft\r\n\r\nPositive attitude and quick-learner\r\n\r\n What you‘ll be responsible for\r\n\r\nDevelop pixel perfect design\r\n\r\nProduce designs that are in keeping with the brief, brand and overall strategy\r\n\r\nHTML and CSS coding\r\n\r\nWeb editing and daily tasks in Wordpress\r\n\r\nProgramming\r\n\r\nCommunicate thoughts and expertise to the rest of the team\r\n\r\nBe up-to-date on new technologies and trends in your field and share them with others\r\n\r\nRespect deadlines and adhere to them\r\n\r\n \r\n\r\n \r\n\r\nBenefits\r\n\r\nWhat we offer\r\n\r\nOpportunity to live on a beautiful Italian island\r\n\r\nFreedom for your creative spirit\r\n\r\nExperience in social media strategy and brand creation\r\n\r\nAn opportunity to grow into a very important role\r\n\r\nImprovement of your designing skills with instant feedback\r\n\r\nAdditional experience on your field\r\n\r\nLearn in a challenging and friendly working environment\r\n\r\n \r\n\r\n \r\n\r\nAs financial compensation we participate with Erasmus internship program and we offer you accommodation and food.\r\n\r\n \r\n\r\nAll applications must go through this link below:\r\nhttps://siciliamia.zohorecruit.eu/candidateportal\r\n\r\nCompensation: \r\nFinancial compensation\r\nAccommodation\r\nLunch vouchers', 2),
(7, 'Java Infrastructure Engineer', '2020-05-09 22:25:10', 'Job Description:\r\n\r\nThe application scope revolves around Cassiopae, which is the software tool for back office management dedicated to leasing deals (development based in Romania).\r\n\r\nYour Role in a Nutshell:\r\n* Implement requirements specified by the BA team;\r\n* Write unit testing for new code (and BDDs);\r\n* Code review;\r\n* Provide tools for production management;\r\n* Automate & secure the deployment from dev to production;\r\n* Perform a reporting activity (Daily Meeting) on the product or integrated component;\r\n* Working with Continuous Delivery and Agile methodologies;\r\n* Contribute to production monitoring, incident resolution and troubleshooting;\r\n* Docker (Swarm/Kubernetes) setup & maintenance\r\n\r\nCandidate Requirements:\r\n\r\nA little about You:\r\n* Tools: GIT, IntelliJ, Maven, Oracle SQL Developer, Jira, Jenkins, Sonar, DeployIt (XL Deploy), Autosys;\r\n* Frameworks: Hibernate, Spring;\r\n* Programming language: Java 8;\r\n* Experience with PL/SQL is appreciated;\r\n* Experience with Spring Batch is appreciated;\r\n* Experience with batch jobs is appreciated (Autosys, which is a job scheduler);', 2),
(8, 'Wealth Management Internship', '2020-05-09 22:27:08', 'Job Description:\r\n\r\nA hands-on role as part of our administration/investment operations/client servicing team based in Malta, providing support to our Swiss based consultants and clients. Following a short induction session and meeting your mentor/s, who will be guiding you throughout your time with us, you will be given full responsibility for a set of tasks. This allows you to develop your practical and professional skills while gaining an excellent insight into the business.\r\n\r\nYou will be responsible for:\r\n\r\n• Assisting asset management team with buy-sell execution processes and FX transactions \r\n• Monitoring and re-balancing clients’ portfolios according to their risk-profile parameters\r\n• Creating and reporting monthly trailer commission statements to mutual funds\r\n• Creating financial planning reports\r\n• Reviewing and updating the ‘Investment Universe’ based on high conviction strategies of the firm\r\n• Analysing factsheets and research documents for a variety of mutual funds, ETFs, individual stocks and structured securities\r\n• Monthly and quarterly reporting of macro-economic and financial market indicators\r\n• Modelling and organizing large financial data sets\r\n• Working on business projects, preparing reports and creating presentation materials within the company brand guidelines\r\n• Liaising with different financial institutions and partners of the company\r\n• Perform simple client account administration tasks\r\n• General bookkeeping\r\n• Keeping clients\' records up-to-date in different CRM\'s\r\n• Generating offers in various insurance quotation systems\r\n• Other administrative tasks that may be required. More complex tasks may be given as ability to perform them increases', 2),
(9, 'ALTERNANCE - Data Analyst H/F', '2020-05-09 22:31:46', 'Job Description:\r\n\r\nALTERNANCE - Data Analyst H/F\r\n\r\nConcrètement votre quotidien ?\r\n\r\nEn tant que Data Analyst,\r\n\r\nVotre mission principale consiste à analyser les données qui traduisent l\'activité de l\'ensemble des centres « Servicing et Expertise » et assurer le pilotage des flux en temps réel.\r\n\r\nVous sourcez et requêtez les différentes données,\r\n\r\nVous identifiez et comprenez les écarts par une analyse poussée,\r\n\r\nVous proposez et adaptez le prévisionnel pour contribuer, par un pilotage fin et réactif, à servir au mieux nos clients.\r\n\r\nVous communiquez ces analyses auprès des responsables des entités,\r\nVous établissez établir une veille sur les comportements de production et remontez tout écart\r\n\r\nLes missions c\'est important mais l\'équipe et l\'environnement de travail aussi !\r\n\r\nSitué au 163 Boulevard MAC DONALD dans le 19ème arrondissement de Paris, vous rejoindrez une équipe de 10 collaborateurs dont le savoir-faire et l\'expertise sont des atouts majeurs.\r\n\r\nVous évoluerez dans un environnement à forte technicité\r\n\r\nQuels sont les apports du poste?\r\n\r\nGrace à une formation préalable et continue, vous pourrez allier une approche opérationnelle et une dimension analytique.\r\n\r\nEn fonction des compétences développées dans le poste, plusieurs options peuvent s\'offrir à vous :\r\n\r\n* Evoluer vers des fonctions sur du Data Management\r\n* S\'orienter vers des métiers de Responsable de Projet\r\n\r\nPourquoi rejoindre (COMPANY NAME) ?\r\n\r\nNotre monde change ! Aujourd\'hui, ce qui compte dans un job, c\'est de vivre de véritables expériences, d\'apprendre, de partager objectifs et résultats avec ses collègues. Bref, de tracer son propre chemin, différent, responsable et durable. Chez (COMPANY NAME), nous recrutons nos collaborateurs avec l\'idée qu\'ils nous aideront à concevoir le monde et la banque de demain.\r\n\r\nVous voulez connaître toutes les raisons de nous rejoindre ? Rendez-vous sur : https://gxxxx.xxxxxxxxxx/xxxxxx-xxxxxxxx/xxx-xxxxxxs\r\n\r\nEt la rémunération ?\r\n\r\nEncadrée par la loi, elle sera abordée à l\'issue de votre parcours de recrutement. Elle dépend du type de contrat, votre âge et de votre niveau d\'études.\r\n\r\nÊtes-vous notre prochain Alternant Data Analyst?\r\n\r\nVous préparez un diplôme BAC +4/5 en école de Commerce, en école d\'ingénieur ou un équivalent universitaire avec une spécialisation Informatique et/ou Data\r\n\r\nVous disposez de compétences techniques sur la gestion de base de données et d\'un goût prononcé pour l\'analyse . Votre Capacité à communiquer et votre faculté à collaborer vous permettent de créer des liens de confiance et de vous intégrer dans les environnements où vous évoluez. Ajoutez à cela un esprit organisé, curieux et une capacité à définir des indicateurs de performance pertinents pour finir de nous convaincre.\r\n\r\nVous maitrisez le Pack MS Office, Excel, Access… Les outils de requête, le langage IT VBA et les codes HTML\r\n\r\nEnfin, nous attachons une importance particulière à ce que nos futurs collaborateurs agissent au quotidien avec responsabilité éthique et professionnelle.\r\n\r\nDurée et disponibilité :\r\n\r\nA partir du mois de Septembre 2020, pour une alternance d\'une durée de 24 mois\r\n\r\nRejoignez nos talents en nous adressant votre Curriculum Vitae indiquant la formation que préparez dans, ainsi qu\'une lettre de motivation précisant votre mobilité géographique.\r\n\r\nLieu principal : FR-Île-de-France-PARISType d\'emploi : AlternanceDomaine d\'activité : MARKETINGNiveau d\'études : Master ou équivalent (> 4 ans)Niveau d\'expérience : DébutantHoraires : Temps plein Référence', 2),
(10, 'Java Infrastructure Engineer', '2020-05-09 22:40:40', 'Job Description:\r\n\r\nThe application scope revolves around Cassiopae, which is the software tool for back office management dedicated to leasing deals (development based in Romania).\r\n\r\nYour Role in a Nutshell:\r\n* Implement requirements specified by the BA team;\r\n* Write unit testing for new code (and BDDs);\r\n* Code review;\r\n* Provide tools for production management;\r\n* Automate & secure the deployment from dev to production;\r\n* Perform a reporting activity (Daily Meeting) on the product or integrated component;\r\n* Working with Continuous Delivery and Agile methodologies;\r\n* Contribute to production monitoring, incident resolution and troubleshooting;\r\n* Docker (Swarm/Kubernetes) setup & maintenance\r\n\r\nCandidate Requirements:\r\n\r\nA little about You:\r\n* Tools: GIT, IntelliJ, Maven, Oracle SQL Developer, Jira, Jenkins, Sonar, DeployIt (XL Deploy), Autosys;\r\n* Frameworks: Hibernate, Spring;\r\n* Programming language: Java 8;\r\n* Experience with PL/SQL is appreciated;\r\n* Experience with Spring Batch is appreciated;\r\n* Experience with batch jobs is appreciated (Autosys, which is a job scheduler);\r\n* Fundamental of the Continuous Delivery approach (Agile, Continuous integration, Continuous Improvement).\r\nWe also value:\r\n* Docker experience would be appreciated;\r\n* ElasticSearch knowledge;\r\n* To be able to challenge the solutions provided by the BA team;\r\n* High autonomy and ability to work in a stressful environment, rigor, cooperation and team spirit', 3),
(11, 'Senior Software Engineer - Virtualization', '2020-05-09 22:41:50', 'Primary job responsibilities\r\nWork as part of a distributed team with several remote team members\r\nAssist in design discussions and proposals for new projects and changes in the KVM virtualization stack\r\nDesign and develop new features and fix bugs in open source KVM virtualization projects like QEMU, libvirt, Kata Containers, container native virtualization (CNV), and others\r\nReview patches and provide feedback on the community-oriented enhancements and bug fixes\r\nContribute automated tests to continuous integration (CI) systems\r\nRequired skills\r\nSolid skills in C and relevant coding experience\r\nGood understanding of and experience with Linux system internals and systems engineering, with a particular emphasis on virtualization and containers\r\nInterest in modern programming languages like Rust and Go; proven experience with these languages is a plus\r\nUnderstanding of open source development; active open source contributions are a big plus', 4),
(12, '2nd Line Support Engineer (VM)', '2020-05-09 22:43:20', 'Job Description:\r\n\r\nAbout (COMPANY NAME)\r\n\r\n(COMPANY NAME) is a global leader in digital transformation with 110,000 employees in 73 countries and annual revenue of EUR 12 billion. European number one in Cloud, Cybersecurity and High-Performance Computing, the Group provides end-to-end Orchestrated Hybrid Cloud, Big Data, Business Applications and Digital Workplace solutions. The Group is the Worldwide Information Technology Partner for the Olympic & Paralympic Games and operates under the brands (COMPANY NAME), (COMPANY NAME)|Syntel, and Unify. (COMPANY NAME) is a SE (Societas Europaea), listed on the CAC40 Paris stock index.\r\n\r\nThe purpose of (COMPANY NAME) is to help design the future of the information space. Its expertise and services support the development of knowledge, education and research in a multicultural approach and contribute to the development of scientific and technological excellence. Across the world, the Group enables its customers and employees, and members of societies at large to live, work and develop sustainably, in a safe and secure information space.\r\n\r\nDay-to-day responsibilities:\r\n\r\n* Daily checks of the environmental health\r\n\r\n* Resolving issues, tickets, changes, in the Virtual Workplace infrastructure\r\n\r\n* Participation in operational meetings for ongoing problems\r\n\r\n* Maintaining of the environment state\r\n\r\n* Calls with client / colleagues from supportive teams to bring changes into the configuration\r\n\r\nSigns of success:\r\n\r\nTo be successful on the role, you\'ll have good interpersonal and client handling skills. Troubleshooting and analytical skills are considered an advantage.\r\n\r\nGood conversational English is required.\r\n\r\nEssential skills:\r\n\r\n* A year of documented experience with Desktop Virtualization powered by VMware Horizon components, Connection Server, Composer Server, Security Server/UAG, Enrollment Server;\r\n\r\n* Experience with App Virtualization powered App Volumes and AppStacks management,\r\n\r\n* Experience with VDI storage solution;\r\n\r\n* Understanding of virtualization process with VMware vSphere and network virtualization process with VMware NSX\r\n\r\nSkills we believe are nice-to-have:\r\n\r\n* Citrix XenDesktop, XenApp, StoreFront, Citrix Web Interface\r\n\r\n* Windows Server\r\n\r\n* Active Directory\r\n\r\n* Group Policy Objects\r\n\r\nWhat we offer:\r\n\r\n* Remote work;\r\n\r\n* Excellent remuneration package;\r\n\r\n* Premium health insurance;', 3),
(13, 'Stage - Développement d\'une méthode pour la mesure de tension artérielle', '2020-05-09 22:44:34', 'Job Description:\r\n\r\nFondée en 2008 par Eric Carreel, (COMPANY NAME) a su préserver son agilité et son esprit start-up.\r\nEn quête incessante d\'innovation, nous travaillons chaque jour avec passion et innovation afin d\'ouvrir de nouvelles voies dans le domaine de la santé connectée.\r\nNous croyons en un monde où nous pourrions prévenir plutôt que guérir et ainsi redonner aux individus le contrôle de leur santé.\r\nNotre exigence d\'excellence nous permet de développer des objets connectés et des applications qui permettent à tous de mesurer, de suivre ce qui est important pour leur santé et de prendre les bonnes décisions pour atteindre leurs objectifs :\r\n* Suivre son poids\r\n* Être plus actif\r\n* Mieux dormir\r\n* Surveiller sa tension artérielle\r\n* Surveiller son rythme cardiaque\r\n* Etc\r\nChaque jour, des milliers de produits beaux et au design non intrusifs sortent de nos usines grâce à la collaboration entre nos équipes pluridisciplinaires. Nos balances connectées, nos montres hybrides, nos tensiomètres et nos moniteurs de sommeil sont aujourd\'hui utilisés par des millions d\'utilisateurs à travers le monde.\r\nNos bureaux à Issy les Moulineaux, Boston et Hong Kong nous permettent d\'avoir une vue d\'ensemble du marché des objets connectés en santé et de rester parmi les leaders du secteur.\r\nNotre objectif à moyen terme ? Agrandir notre tribu et travailler tous ensemble pour révolutionner la manière dont on prend soin de notre santé !\r\n\r\nTu hésites ? On te dit pourquoi il faut nous rejoindre :\r\n* Nos équipes sont jeunes, dynamiques et travaillent avec passion\r\n* Nous avons gardé notre esprit start-up et aimons célébrer ensemble chacune de nos réussites !\r\n* L\'agilité et la réactivité sont nos maitres mots\r\n* Tu deviendras beta testeur et tu contribueras directement au développement et à l\'amélioration continue de nos produits\r\n* Nous sommes des mordus de sport et t\'accueillerons avec plaisir dans nos différentes teams\r\n* Nous sommes situés sur la ligne 12 (Porte de Versailles ou Corentin Celton), entourés de plusieurs restaurants (italien, libanais, asiatique, fast-food etc) mais aussi de parcs et de complexes sportifs\r\n* Travailler chez nous, c\'est bien plus qu\'un simple job, c\'est devenir un Withinger à part entière (avec toute la bonne humeur et l\'excellence que cela exige)\r\n\r\nCandidate Requirements:\r\n\r\nL\'équipe Recherche Appliquée recrute !\r\nTes missions :\r\n\r\nL\'étalonnage d\'un tensiomètre numérique commercial repose sur une méthode de référence, l\'écoute des bruits de Korotkoff au stéthoscope analogique, qui comporte plusieurs limitations :\r\n* La non-simultanéité de la référence avec la mesure par l\'appareil à étalonner, problématique du fait de la labilité de la pression artérielle.\r\n* La dépendance au facteur humain.\r\n* L\'utilisation de très peu d\'information dans le signal (utilisation des premiers et derniers bruits de Korotkoff uniquement).\r\nDe plus cette méthode de référence est coûteuse en temps et en argent car elle nécessite deux opérateurs formés et une grande concentration.\r\nNous vous proposons de développer une méthode plus précise et automatisée (sans opérateur humain). Le travail consistera à :\r\n* Se familiariser avec la mesure de la pression artérielle numérique et auscultatoire.\r\n* Effectuer un travail bibliographique.\r\n* Prendre en main les prototypes (précedent stage) capable d\'enregistrer de manière synchrone la pression dans un brassard de tensiomètre et le signal des sons de Korotkoff. Amélioration de ces prototypes.\r\n* Effectuer des campagnes d\'acquisition.\r\n* Écrire un algorithme capable de prédire les pressions systolique et diastolique à partir des signaux enregistrés.\r\n* Une ré-orientation plus ciblée du sujet est possible en fonction des compétences du stagiaire, de l\'avancement du projet et de ses désirs.\r\n\r\nTes compétences :\r\n* Etudiant de cycle ingénieur ou magistère recherche niveau M2\r\n* Tu as un profil de physicien à l\'aise avec l\'expérimentation\r\n* Tu as un intérêt pour l\'expérimentation et la réalisation de dispositifs de mesures impératifs\r\n* Tu connais les traitements du signal et l\'algorithmie : tu as de bonnes connaissance dans les techniques de traitement de signaux temporels\r\n* Tu as des connaissances en électronique analogique et/ou numérique\r\n\r\nTa personnalité :\r\n* Tu es rxxxxxxxx.xe, organisé.e, polyvalent.e et proactif.ve\r\n* Tu as un grand sens de la communication en français et en anglais, aussi bien à l\'écrit qu\'à l\'oral\r\n* Tu aimes travailler dans une ambiance start-up\r\n* Tu es exigeant.e dans ton travail et ne laisses rien passer\r\n\r\nSi tu te reconnais dans cette offre d\'emploi, et que tu souhaites relever de nouveaux challenges, envoie-nous ton CV', 3),
(14, 'IDBOUFKER Noureddine Proposition de Mini-projet NTP', '2020-05-09 22:49:43', 'Chers toutes et tous,\r\n\r\nJ\'espère que vous allez bien.\r\n\r\nY\'a t il un binôme qui se porte volontaire pour nous préparer un atelier de \'Simulation du protocole de synchronisation NTP.\'.\r\n\r\nLa topologie de simulation est en jointure\r\n\r\nA vous ', 5),
(15, 'Proposition de mini-Projet-5', '2020-05-09 22:56:16', 'Chers toutes et tous,\r\n\r\nJ\'espère que vous allez bien.\r\n\r\nY\'a t il un binôme qui se porte volontaire pour nous préparer un atelier de \'VoIP en utilisant la compression d\'en-tête cRTP.\'.\r\n\r\nLa topologie de simulation est en jointure\r\n\r\nA vous ', 5),
(16, 'Proposition de Mini-Projet VoIP en utilisant un IPBX de type Asterisk', '2020-05-09 22:57:05', 'Chers toutes et tous,\r\n\r\nJ\'espère que vous allez bien.\r\n\r\nY\'a t il un binôme qui se porte volontaire pour nous préparer un atelier de \'VoIP en utilisant un IPBX de type Asterisk\'\r\n\r\nA vous ', 5),
(17, 'Proposition de Mini-Projet VoIP en utilisant un IPBX de type 3CX', '2020-05-09 22:57:44', 'Chers toutes et tous,\r\n\r\nJ\'espère que vous allez bien.\r\n\r\nY\'a t il un binôme qui se porte volontaire pour nous préparer un atelier de \'VoIP en utilisant un IPBX de type 3CX\'\r\n\r\nA vous ', 5),
(18, 'Proposition de mini-projet sur la sécurité du service VoIP', '2020-05-09 22:58:21', 'Chers toutes et tous,\r\n\r\nJ\'espère que vous allez bien.\r\n\r\nY\'a t il un binôme qui se porte volontaire pour nous préparer un atelier sur la sécurité du service VoIP.\r\n\r\nA vous ', 5),
(19, 'Ask For Help in my Project.', '2020-05-09 23:17:19', 'I to install Kubernetes in order to orchestrate a web app containers.\r\nIf anyone want to help me to acheive that , please contact me.', 6),
(21, 'Offre de formation ', '2020-05-11 17:32:48', 'Ceci est une offre de formation VoIP', 5);

-- --------------------------------------------------------

--
-- Table structure for table `post_like`
--

DROP TABLE IF EXISTS `post_like`;
CREATE TABLE `post_like` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `post_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `post_like`
--

INSERT INTO `post_like` (`id`, `user_id`, `post_id`) VALUES
(1, 3, 9),
(2, 1, 9),
(3, 3, 11),
(4, 6, 13),
(5, 6, 14),
(6, 6, 17),
(7, 5, 13),
(8, 6, 18),
(9, 7, 19),
(11, 1, 11),
(12, 1, 2),
(13, 1, 19);

-- --------------------------------------------------------

--
-- Table structure for table `recommendation`
--

DROP TABLE IF EXISTS `recommendation`;
CREATE TABLE `recommendation` (
  `id` int(11) NOT NULL,
  `comment` varchar(120) COLLATE utf8_bin NOT NULL,
  `skill` varchar(120) COLLATE utf8_bin NOT NULL,
  `recommender_id` int(11) DEFAULT NULL,
  `recommended_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `recommendation`
--

INSERT INTO `recommendation` (`id`, `comment`, `skill`, `recommender_id`, `recommended_id`) VALUES
(1, 'Good Programer, hard worker and fast learner', 'programing', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `skill`
--

DROP TABLE IF EXISTS `skill`;
CREATE TABLE `skill` (
  `id` int(11) NOT NULL,
  `skill` varchar(120) COLLATE utf8_bin NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `skill`
--

INSERT INTO `skill` (`id`, `skill`, `user_id`) VALUES
(1, 'Python', 1),
(2, 'Deep Learning', 1),
(3, 'Machine Learning', 1),
(4, 'Cloud Computing', 1),
(5, 'Openstack', 1),
(6, 'Flask', 1),
(7, 'C++', 1),
(8, 'System administration', 1),
(9, 'Marketing', 2),
(10, 'Management', 2),
(11, 'Communication', 2),
(12, 'VHDL', 3),
(13, 'XILINX', 3),
(14, 'Grafcet', 3),
(15, 'Python', 6),
(16, 'system administration', 6),
(17, 'Networking', 6),
(18, 'Security basic', 6),
(19, 'Docker ', 6),
(20, 'QoS', 5),
(21, 'Security', 5),
(22, 'Core Networks', 5),
(23, 'IT service management', 5),
(24, 'Governance', 5);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `role` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `firstname` varchar(40) COLLATE utf8_bin NOT NULL,
  `lastname` varchar(40) COLLATE utf8_bin NOT NULL,
  `birthday` datetime NOT NULL,
  `location` varchar(150) COLLATE utf8_bin DEFAULT NULL,
  `departement` varchar(120) COLLATE utf8_bin DEFAULT NULL,
  `about` varchar(150) COLLATE utf8_bin NOT NULL,
  `year` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `company` varchar(150) COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(120) COLLATE utf8_bin NOT NULL,
  `image_file` varchar(20) COLLATE utf8_bin NOT NULL,
  `password` varchar(60) COLLATE utf8_bin NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `last_message_read_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `role`, `firstname`, `lastname`, `birthday`, `location`, `departement`, `about`, `year`, `company`, `email`, `image_file`, `password`, `last_login`, `last_message_read_time`) VALUES
(1, 'Student', 'Taha', 'EL Barbouchi', '1998-06-25 00:00:00', 'Marrakesh', 'Networks & Telecoms Engineering', 'A 4th Year Student engineer in Networks & Telecoms.', '1st Year', NULL, 'taha.day1998@gmail.com', 'b0ecd9360fb63ffe.jpg', '$2b$12$l9CZQLZHethh5W8StUSSKuHqATuGmDB4z6WgUoaxANur8oFgPu0qO', '2020-05-09 22:10:24', '2020-05-12 14:48:05'),
(2, 'Entity', 'Omar', 'SABIL', '1995-08-15 00:00:00', 'Casablance', NULL, 'RH responsible ', NULL, 'DEFCON-S', 'omar@gmail.com', '41a77fc74131a3ea.png', '$2b$12$C6AiMl5RuSkBxiBJHmnTK.lrbwA8PsSGxWlmjLan.gPq0staM6Xf.', '2020-05-09 22:14:20', '2020-05-09 22:14:51'),
(3, 'Professor', 'Reda', 'LAASRI', '1995-08-15 00:00:00', 'eljadida', 'Electrical Engineering', 'My specialization is embded systems', NULL, NULL, 'reda@gmail.com', 'fa42e50229c31fbe.jpg', '$2b$12$Ub/BPCA5pWN80x92I7WUiO.Y23gLmv.rwtUtAONZs8oUm0ICwoCg.', '2020-05-09 22:35:57', NULL),
(4, 'Entity', 'Hata', 'Hakomoro', '1972-05-25 00:00:00', 'Raleigh, North Carolina, United States', NULL, 'Provides open source software products to the enterprise community', NULL, 'RedHat', 'hata@cloud.com', '899940d79697e756.png', '$2b$12$pLYUh4hRcdw.wjtVEDCs4.XCq25p2jGCSoEym4Lie7Ah1VwgENAt2', '2020-05-09 22:37:51', NULL),
(5, 'Professor', 'Noureddine', 'Idboufker', '1980-05-25 00:00:00', 'Marrakesh', 'Networks & Telecoms Engineering', 'Professor at ENSA-M in Networks & Telecoms', NULL, NULL, 'n_idboufker@yahoo.fr', '1db8efa2b442dedc.jpg', '$2b$12$rIp/AgcgygYQRl8iYiuU6eDFiJ0m2YQxDxTlDTyePBNkhJA09W/kq', '2020-05-09 22:47:40', '2020-05-11 17:31:24'),
(6, 'Student', 'Elmustapha', 'ELGARNI', '1995-08-15 00:00:00', 'elkelaa', 'Networks & Telecoms Engineering', 'Passionate , motivated . my goal is to be cloud engineer.', '4th Year', NULL, 'elmustapha.elgarni@gmail.com', '6fa0dc7237edade3.jpg', '$2b$12$FV44n5qPog/b0MYvv/G.2OyAnGI83uMZfxEul171Ju.JV8gjtaovS', '2020-05-09 22:49:14', '2020-05-11 19:17:40'),
(7, 'Student', 'David', 'Keen', '1989-01-23 00:00:00', 'Downtenabbey, Colorado, USA', 'Networks & Telecoms Engineering', 'My Bio', '4th Year', NULL, 'kevin@cloud.com', '0efbf8ce941a48b0.jpg', '$2b$12$Bh.7ehTs7Kq/9smBcOkQ/u0mtyEeOmyxF0yzpTKUCOpmteEeW59Im', '2020-05-09 23:13:13', NULL),
(8, 'Student', 'oumayma', 'souidi', '1999-09-03 00:00:00', 'tanger', 'Networks & Telecoms Engineering', 'My Bio', '1st Year', NULL, 'gstrensa@outlook.fr', 'default.jpg', '$2b$12$RvMWHAw2rhGBog/jjwWN0Ov7QJhjBzTzUVUaYPs4Ugy1dyY65dYg6', '2020-05-09 23:17:40', '2020-05-09 23:31:04'),
(9, 'Entity', 'test', 'test', '1995-08-15 00:00:00', 'lyujbh', NULL, 'My Bio', NULL, 'jv', 'test@yahoo.fr', 'default.jpg', '$2b$12$oA5qydgQKfDC2xfHn8lz2eFGYQwICoGTbr/myUbsUTOzwBZZ3.TlC', '2020-05-10 02:01:21', '2020-05-10 17:21:18');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alembic_version`
--
ALTER TABLE `alembic_version`
  ADD PRIMARY KEY (`version_num`);

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`id`),
  ADD KEY `recipient_id` (`recipient_id`),
  ADD KEY `sender_id` (`sender_id`),
  ADD KEY `ix_message_timestamp` (`timestamp`);

--
-- Indexes for table `message_rel`
--
ALTER TABLE `message_rel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `recipient_id` (`recipient_id`),
  ADD KEY `sender_id` (`sender_id`),
  ADD KEY `ix_message_rel_timestamp` (`timestamp`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `post_like`
--
ALTER TABLE `post_like`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `recommendation`
--
ALTER TABLE `recommendation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `recommended_id` (`recommended_id`),
  ADD KEY `recommender_id` (`recommender_id`);

--
-- Indexes for table `skill`
--
ALTER TABLE `skill`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `message`
--
ALTER TABLE `message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `message_rel`
--
ALTER TABLE `message_rel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `post_like`
--
ALTER TABLE `post_like`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `recommendation`
--
ALTER TABLE `recommendation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `skill`
--
ALTER TABLE `skill`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `message_ibfk_1` FOREIGN KEY (`recipient_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `message_ibfk_2` FOREIGN KEY (`sender_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `message_rel`
--
ALTER TABLE `message_rel`
  ADD CONSTRAINT `message_rel_ibfk_1` FOREIGN KEY (`recipient_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `message_rel_ibfk_2` FOREIGN KEY (`sender_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `post_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `post_like`
--
ALTER TABLE `post_like`
  ADD CONSTRAINT `post_like_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`),
  ADD CONSTRAINT `post_like_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `recommendation`
--
ALTER TABLE `recommendation`
  ADD CONSTRAINT `recommendation_ibfk_1` FOREIGN KEY (`recommended_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `recommendation_ibfk_2` FOREIGN KEY (`recommender_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `skill`
--
ALTER TABLE `skill`
  ADD CONSTRAINT `skill_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
