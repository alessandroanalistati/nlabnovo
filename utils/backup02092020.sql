-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.4.12-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Copiando estrutura do banco de dados para nlab
CREATE DATABASE IF NOT EXISTS `nlab` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `nlab`;

-- Copiando estrutura para tabela nlab.auth_group
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela nlab.auth_group: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;

-- Copiando estrutura para tabela nlab.auth_group_permissions
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela nlab.auth_group_permissions: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;

-- Copiando estrutura para tabela nlab.auth_permission
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela nlab.auth_permission: ~88 rows (aproximadamente)
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
REPLACE INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
	(1, 'Can add log entry', 1, 'add_logentry'),
	(2, 'Can change log entry', 1, 'change_logentry'),
	(3, 'Can delete log entry', 1, 'delete_logentry'),
	(4, 'Can view log entry', 1, 'view_logentry'),
	(5, 'Can add permission', 2, 'add_permission'),
	(6, 'Can change permission', 2, 'change_permission'),
	(7, 'Can delete permission', 2, 'delete_permission'),
	(8, 'Can view permission', 2, 'view_permission'),
	(9, 'Can add group', 3, 'add_group'),
	(10, 'Can change group', 3, 'change_group'),
	(11, 'Can delete group', 3, 'delete_group'),
	(12, 'Can view group', 3, 'view_group'),
	(13, 'Can add user', 4, 'add_user'),
	(14, 'Can change user', 4, 'change_user'),
	(15, 'Can delete user', 4, 'delete_user'),
	(16, 'Can view user', 4, 'view_user'),
	(17, 'Can add content type', 5, 'add_contenttype'),
	(18, 'Can change content type', 5, 'change_contenttype'),
	(19, 'Can delete content type', 5, 'delete_contenttype'),
	(20, 'Can view content type', 5, 'view_contenttype'),
	(21, 'Can add session', 6, 'add_session'),
	(22, 'Can change session', 6, 'change_session'),
	(23, 'Can delete session', 6, 'delete_session'),
	(24, 'Can view session', 6, 'view_session'),
	(25, 'Can add Modelo', 7, 'add_prateleira'),
	(26, 'Can change Modelo', 7, 'change_prateleira'),
	(27, 'Can delete Modelo', 7, 'delete_prateleira'),
	(28, 'Can view Modelo', 7, 'view_prateleira'),
	(29, 'Can add Modelo', 8, 'add_equipamento'),
	(30, 'Can change Modelo', 8, 'change_equipamento'),
	(31, 'Can delete Modelo', 8, 'delete_equipamento'),
	(32, 'Can view Modelo', 8, 'view_equipamento'),
	(33, 'Can add Modelo', 9, 'add_armario'),
	(34, 'Can change Modelo', 9, 'change_armario'),
	(35, 'Can delete Modelo', 9, 'delete_armario'),
	(36, 'Can view Modelo', 9, 'view_armario'),
	(37, 'Can add Modelo', 10, 'add_vidraria'),
	(38, 'Can change Modelo', 10, 'change_vidraria'),
	(39, 'Can delete Modelo', 10, 'delete_vidraria'),
	(40, 'Can view Modelo', 10, 'view_vidraria'),
	(41, 'Can add reagente', 11, 'add_reagente'),
	(42, 'Can change reagente', 11, 'change_reagente'),
	(43, 'Can delete reagente', 11, 'delete_reagente'),
	(44, 'Can view reagente', 11, 'view_reagente'),
	(45, 'Can add Modelo', 12, 'add_unidade'),
	(46, 'Can change Modelo', 12, 'change_unidade'),
	(47, 'Can delete Modelo', 12, 'delete_unidade'),
	(48, 'Can view Modelo', 12, 'view_unidade'),
	(49, 'Can add Modelo', 13, 'add_bancada'),
	(50, 'Can change Modelo', 13, 'change_bancada'),
	(51, 'Can delete Modelo', 13, 'delete_bancada'),
	(52, 'Can view Modelo', 13, 'view_bancada'),
	(53, 'Can add sala', 14, 'add_sala'),
	(54, 'Can change sala', 14, 'change_sala'),
	(55, 'Can delete sala', 14, 'delete_sala'),
	(56, 'Can view sala', 14, 'view_sala'),
	(57, 'Can add diverso', 15, 'add_diverso'),
	(58, 'Can change diverso', 15, 'change_diverso'),
	(59, 'Can delete diverso', 15, 'delete_diverso'),
	(60, 'Can view diverso', 15, 'view_diverso'),
	(61, 'Can add tombo', 16, 'add_tombo'),
	(62, 'Can change tombo', 16, 'change_tombo'),
	(63, 'Can delete tombo', 16, 'delete_tombo'),
	(64, 'Can view tombo', 16, 'view_tombo'),
	(65, 'Can add Modelo', 17, 'add_estante'),
	(66, 'Can change Modelo', 17, 'change_estante'),
	(67, 'Can delete Modelo', 17, 'delete_estante'),
	(68, 'Can view Modelo', 17, 'view_estante'),
	(69, 'Can add Modelo', 18, 'add_gaveta'),
	(70, 'Can change Modelo', 18, 'change_gaveta'),
	(71, 'Can delete Modelo', 18, 'delete_gaveta'),
	(72, 'Can view Modelo', 18, 'view_gaveta'),
	(73, 'Can add Modelo', 19, 'add_marca'),
	(74, 'Can change Modelo', 19, 'change_marca'),
	(75, 'Can delete Modelo', 19, 'delete_marca'),
	(76, 'Can view Modelo', 19, 'view_marca'),
	(77, 'Can add solucao', 20, 'add_solucao'),
	(78, 'Can change solucao', 20, 'change_solucao'),
	(79, 'Can delete solucao', 20, 'delete_solucao'),
	(80, 'Can view solucao', 20, 'view_solucao'),
	(81, 'Can add itens solucao', 21, 'add_itenssolucao'),
	(82, 'Can change itens solucao', 21, 'change_itenssolucao'),
	(83, 'Can delete itens solucao', 21, 'delete_itenssolucao'),
	(84, 'Can view itens solucao', 21, 'view_itenssolucao'),
	(85, 'Can add pedido solucao', 22, 'add_pedidosolucao'),
	(86, 'Can change pedido solucao', 22, 'change_pedidosolucao'),
	(87, 'Can delete pedido solucao', 22, 'delete_pedidosolucao'),
	(88, 'Can view pedido solucao', 22, 'view_pedidosolucao');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;

-- Copiando estrutura para tabela nlab.auth_user
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela nlab.auth_user: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
REPLACE INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
	(1, 'pbkdf2_sha256$216000$KL0gl9SeECHN$bwewh59oe5asyvyBqWxKsI8qUdKKMj5ki3pzVJjM26Y=', '2020-09-02 19:43:15.198401', 1, 'admin', '', '', 'alessandross100@gmail.com', 1, 1, '2020-08-28 02:29:12.423276'),
	(2, 'pbkdf2_sha256$216000$MDAAC3hFvTm5$IHaPfenkEdB1TB2sG1Y1zs2vCT4eYeLHIgIYJPLkZdA=', NULL, 1, 'flavio', '', '', '', 1, 1, '2020-09-01 01:01:29.000000'),
	(3, 'pbkdf2_sha256$216000$PzNJhThrAEoI$8GW2TrbKrpKm3VXJrQqaYMasOFwWWxj0FV6frqSTq7g=', '2020-09-01 06:27:33.794230', 1, 'lucas', '', '', '', 1, 1, '2020-09-01 01:02:09.000000'),
	(4, 'pbkdf2_sha256$216000$2wmBGjuseZLY$86TusTNygfOlUZaULw3DfuqFtFAOKC8SdbpSJkdH1bo=', NULL, 1, 'marcella', '', '', '', 1, 1, '2020-09-01 01:02:33.000000');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;

-- Copiando estrutura para tabela nlab.auth_user_groups
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela nlab.auth_user_groups: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;

-- Copiando estrutura para tabela nlab.auth_user_user_permissions
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela nlab.auth_user_user_permissions: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;

-- Copiando estrutura para tabela nlab.django_admin_log
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela nlab.django_admin_log: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
REPLACE INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
	(1, '2020-09-01 01:01:30.271005', '2', 'flavio', 1, '[{"added": {}}]', 4, 1),
	(2, '2020-09-01 01:01:50.721616', '2', 'flavio', 2, '[{"changed": {"fields": ["Staff status", "Superuser status"]}}]', 4, 1),
	(3, '2020-09-01 01:02:09.562125', '3', 'lucas', 1, '[{"added": {}}]', 4, 1),
	(4, '2020-09-01 01:02:17.540287', '3', 'lucas', 2, '[{"changed": {"fields": ["Staff status", "Superuser status"]}}]', 4, 1),
	(5, '2020-09-01 01:02:33.798039', '4', 'marcella', 1, '[{"added": {}}]', 4, 1),
	(6, '2020-09-01 01:02:40.187466', '4', 'marcella', 2, '[{"changed": {"fields": ["Staff status", "Superuser status"]}}]', 4, 1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;

-- Copiando estrutura para tabela nlab.django_content_type
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela nlab.django_content_type: ~22 rows (aproximadamente)
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
REPLACE INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
	(1, 'admin', 'logentry'),
	(3, 'auth', 'group'),
	(2, 'auth', 'permission'),
	(4, 'auth', 'user'),
	(5, 'contenttypes', 'contenttype'),
	(6, 'sessions', 'session'),
	(9, 'sisnlab', 'armario'),
	(13, 'sisnlab', 'bancada'),
	(15, 'sisnlab', 'diverso'),
	(8, 'sisnlab', 'equipamento'),
	(17, 'sisnlab', 'estante'),
	(18, 'sisnlab', 'gaveta'),
	(21, 'sisnlab', 'itenssolucao'),
	(19, 'sisnlab', 'marca'),
	(22, 'sisnlab', 'pedidosolucao'),
	(7, 'sisnlab', 'prateleira'),
	(11, 'sisnlab', 'reagente'),
	(14, 'sisnlab', 'sala'),
	(20, 'sisnlab', 'solucao'),
	(16, 'sisnlab', 'tombo'),
	(12, 'sisnlab', 'unidade'),
	(10, 'sisnlab', 'vidraria');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;

-- Copiando estrutura para tabela nlab.django_migrations
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela nlab.django_migrations: ~25 rows (aproximadamente)
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
REPLACE INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
	(1, 'contenttypes', '0001_initial', '2020-08-26 11:37:40.278364'),
	(2, 'auth', '0001_initial', '2020-08-26 11:37:40.390762'),
	(3, 'admin', '0001_initial', '2020-08-26 11:37:40.663617'),
	(4, 'admin', '0002_logentry_remove_auto_add', '2020-08-26 11:37:40.732096'),
	(5, 'admin', '0003_logentry_add_action_flag_choices', '2020-08-26 11:37:40.740768'),
	(6, 'contenttypes', '0002_remove_content_type_name', '2020-08-26 11:37:40.785460'),
	(7, 'auth', '0002_alter_permission_name_max_length', '2020-08-26 11:37:40.824037'),
	(8, 'auth', '0003_alter_user_email_max_length', '2020-08-26 11:37:40.837419'),
	(9, 'auth', '0004_alter_user_username_opts', '2020-08-26 11:37:40.849351'),
	(10, 'auth', '0005_alter_user_last_login_null', '2020-08-26 11:37:40.875520'),
	(11, 'auth', '0006_require_contenttypes_0002', '2020-08-26 11:37:40.878225'),
	(12, 'auth', '0007_alter_validators_add_error_messages', '2020-08-26 11:37:40.887981'),
	(13, 'auth', '0008_alter_user_username_max_length', '2020-08-26 11:37:40.900103'),
	(14, 'auth', '0009_alter_user_last_name_max_length', '2020-08-26 11:37:40.912293'),
	(15, 'auth', '0010_alter_group_name_max_length', '2020-08-26 11:37:40.925737'),
	(16, 'auth', '0011_update_proxy_permissions', '2020-08-26 11:37:40.934740'),
	(17, 'auth', '0012_alter_user_first_name_max_length', '2020-08-26 11:37:40.958144'),
	(18, 'sessions', '0001_initial', '2020-08-26 11:37:41.041542'),
	(19, 'sisnlab', '0001_initial', '2020-08-26 11:40:12.324597'),
	(20, 'sisnlab', '0002_auto_20200828_0129', '2020-08-28 04:30:14.888110'),
	(21, 'sisnlab', '0003_solucao', '2020-08-29 02:44:42.431576'),
	(22, 'sisnlab', '0004_auto_20200829_0157', '2020-08-29 04:57:57.582013'),
	(23, 'sisnlab', '0005_auto_20200901_0311', '2020-09-01 06:11:55.394440'),
	(24, 'sisnlab', '0006_pedidosolucao_estoque', '2020-09-02 15:17:29.499765'),
	(25, 'sisnlab', '0007_auto_20200902_1718', '2020-09-02 20:18:47.460657');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;

-- Copiando estrutura para tabela nlab.django_session
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela nlab.django_session: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
REPLACE INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
	('clsdsq82vzi7z7t76xbon1t9vae2dh0x', '.eJxVjMsOwiAQRf-FtSEwMFBcuvcbyAAztmrapI-V8d-1SRe6veec-1KZtrXP28JzHpo6K6tOv1uh-uBxB-1O423SdRrXeSh6V_RBF32dGj8vh_t30NPSf2tfhYLFlghjsSLFWR8dueQDMHdGACrULrqEiMTCAsmgOAgk4I2o9wfmeTfW:1kDYf5:vjbRHV1PSctYyijoBi98aQGL33fdt0SJuabtUY6yUIA', '2020-09-09 19:43:15.246713');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;

-- Copiando estrutura para tabela nlab.sisnlab_armario
CREATE TABLE IF NOT EXISTS `sisnlab_armario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `sigla` varchar(50) DEFAULT NULL,
  `obs` longtext NOT NULL,
  `sala_id` int(11) NOT NULL,
  `tombo_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nome` (`nome`),
  UNIQUE KEY `tombo_id` (`tombo_id`),
  KEY `sisnlab_armario_sala_id_7e76112b_fk_sisnlab_sala_id` (`sala_id`),
  CONSTRAINT `sisnlab_armario_sala_id_7e76112b_fk_sisnlab_sala_id` FOREIGN KEY (`sala_id`) REFERENCES `sisnlab_sala` (`id`),
  CONSTRAINT `sisnlab_armario_tombo_id_40c9ff03_fk_sisnlab_tombo_id` FOREIGN KEY (`tombo_id`) REFERENCES `sisnlab_tombo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela nlab.sisnlab_armario: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `sisnlab_armario` DISABLE KEYS */;
REPLACE INTO `sisnlab_armario` (`id`, `nome`, `sigla`, `obs`, `sala_id`, `tombo_id`) VALUES
	(1, 'ARMARIO 01', 'ARM01', 'COR BRANCA', 1, 6),
	(2, 'Armário_info_02', 'ARM_INFO_01', '', 2, 5);
/*!40000 ALTER TABLE `sisnlab_armario` ENABLE KEYS */;

-- Copiando estrutura para tabela nlab.sisnlab_bancada
CREATE TABLE IF NOT EXISTS `sisnlab_bancada` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `sigla` varchar(50) DEFAULT NULL,
  `obs` longtext NOT NULL,
  `sala_id` int(11) NOT NULL,
  `tombo_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tombo_id` (`tombo_id`),
  KEY `sisnlab_bancada_sala_id_4faff099_fk_sisnlab_sala_id` (`sala_id`),
  CONSTRAINT `sisnlab_bancada_sala_id_4faff099_fk_sisnlab_sala_id` FOREIGN KEY (`sala_id`) REFERENCES `sisnlab_sala` (`id`),
  CONSTRAINT `sisnlab_bancada_tombo_id_401fdc16_fk_sisnlab_tombo_id` FOREIGN KEY (`tombo_id`) REFERENCES `sisnlab_tombo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela nlab.sisnlab_bancada: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `sisnlab_bancada` DISABLE KEYS */;
REPLACE INTO `sisnlab_bancada` (`id`, `nome`, `sigla`, `obs`, `sala_id`, `tombo_id`) VALUES
	(1, 'Bancada lab qui 01', 'BAN_QUI', '', 4, 10);
/*!40000 ALTER TABLE `sisnlab_bancada` ENABLE KEYS */;

-- Copiando estrutura para tabela nlab.sisnlab_diverso
CREATE TABLE IF NOT EXISTS `sisnlab_diverso` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `quantidade` double DEFAULT NULL,
  `origem` varchar(100) NOT NULL,
  `ficha_tec` varchar(100) DEFAULT NULL,
  `obs` longtext NOT NULL,
  `armario_id` int(11) DEFAULT NULL,
  `bancada_id` int(11) DEFAULT NULL,
  `estante_id` int(11) DEFAULT NULL,
  `gaveta_id` int(11) DEFAULT NULL,
  `marca_id` int(11) NOT NULL,
  `prateleira_id` int(11) DEFAULT NULL,
  `sala_id` int(11) NOT NULL,
  `unidade_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sisnlab_diverso_armario_id_3b28d8bb_fk_sisnlab_armario_id` (`armario_id`),
  KEY `sisnlab_diverso_bancada_id_cb6d27a9_fk_sisnlab_bancada_id` (`bancada_id`),
  KEY `sisnlab_diverso_estante_id_6aeff6cf_fk_sisnlab_estante_id` (`estante_id`),
  KEY `sisnlab_diverso_gaveta_id_48c11c4a_fk_sisnlab_gaveta_id` (`gaveta_id`),
  KEY `sisnlab_diverso_marca_id_3a193235_fk_sisnlab_marca_id` (`marca_id`),
  KEY `sisnlab_diverso_prateleira_id_6d6074af_fk_sisnlab_prateleira_id` (`prateleira_id`),
  KEY `sisnlab_diverso_sala_id_b797eda0_fk_sisnlab_sala_id` (`sala_id`),
  KEY `sisnlab_diverso_unidade_id_5c573eaf_fk_sisnlab_unidade_id` (`unidade_id`),
  CONSTRAINT `sisnlab_diverso_armario_id_3b28d8bb_fk_sisnlab_armario_id` FOREIGN KEY (`armario_id`) REFERENCES `sisnlab_armario` (`id`),
  CONSTRAINT `sisnlab_diverso_bancada_id_cb6d27a9_fk_sisnlab_bancada_id` FOREIGN KEY (`bancada_id`) REFERENCES `sisnlab_bancada` (`id`),
  CONSTRAINT `sisnlab_diverso_estante_id_6aeff6cf_fk_sisnlab_estante_id` FOREIGN KEY (`estante_id`) REFERENCES `sisnlab_estante` (`id`),
  CONSTRAINT `sisnlab_diverso_gaveta_id_48c11c4a_fk_sisnlab_gaveta_id` FOREIGN KEY (`gaveta_id`) REFERENCES `sisnlab_gaveta` (`id`),
  CONSTRAINT `sisnlab_diverso_marca_id_3a193235_fk_sisnlab_marca_id` FOREIGN KEY (`marca_id`) REFERENCES `sisnlab_marca` (`id`),
  CONSTRAINT `sisnlab_diverso_prateleira_id_6d6074af_fk_sisnlab_prateleira_id` FOREIGN KEY (`prateleira_id`) REFERENCES `sisnlab_prateleira` (`id`),
  CONSTRAINT `sisnlab_diverso_sala_id_b797eda0_fk_sisnlab_sala_id` FOREIGN KEY (`sala_id`) REFERENCES `sisnlab_sala` (`id`),
  CONSTRAINT `sisnlab_diverso_unidade_id_5c573eaf_fk_sisnlab_unidade_id` FOREIGN KEY (`unidade_id`) REFERENCES `sisnlab_unidade` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela nlab.sisnlab_diverso: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `sisnlab_diverso` DISABLE KEYS */;
REPLACE INTO `sisnlab_diverso` (`id`, `nome`, `quantidade`, `origem`, `ficha_tec`, `obs`, `armario_id`, `bancada_id`, `estante_id`, `gaveta_id`, `marca_id`, `prateleira_id`, `sala_id`, `unidade_id`) VALUES
	(1, 'balde', 5, '', '', 'tudo certo', 1, 1, 1, 1, 1, 2, 4, 4);
/*!40000 ALTER TABLE `sisnlab_diverso` ENABLE KEYS */;

-- Copiando estrutura para tabela nlab.sisnlab_equipamento
CREATE TABLE IF NOT EXISTS `sisnlab_equipamento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `data_compra` datetime(6) NOT NULL,
  `data_ultim_m` datetime(6) NOT NULL,
  `origem` varchar(100) NOT NULL,
  `ficha_tec` varchar(100) NOT NULL,
  `especficacao_t` longtext NOT NULL,
  `calibragem` varchar(3) NOT NULL,
  `obs` longtext NOT NULL,
  `armario_id` int(11) DEFAULT NULL,
  `bancada_id` int(11) DEFAULT NULL,
  `estante_id` int(11) DEFAULT NULL,
  `gaveta_id` int(11) DEFAULT NULL,
  `marca_id` int(11) NOT NULL,
  `prateleira_id` int(11) DEFAULT NULL,
  `sala_id` int(11) NOT NULL,
  `tombo_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tombo_id` (`tombo_id`),
  KEY `sisnlab_equipamento_armario_id_53af82c7_fk_sisnlab_armario_id` (`armario_id`),
  KEY `sisnlab_equipamento_bancada_id_36b14b54_fk_sisnlab_bancada_id` (`bancada_id`),
  KEY `sisnlab_equipamento_estante_id_d15a5117_fk_sisnlab_estante_id` (`estante_id`),
  KEY `sisnlab_equipamento_gaveta_id_0d5aa2f4_fk_sisnlab_gaveta_id` (`gaveta_id`),
  KEY `sisnlab_equipamento_marca_id_09310640_fk_sisnlab_marca_id` (`marca_id`),
  KEY `sisnlab_equipamento_prateleira_id_c3c0453c_fk_sisnlab_p` (`prateleira_id`),
  KEY `sisnlab_equipamento_sala_id_2f7963a1_fk_sisnlab_sala_id` (`sala_id`),
  CONSTRAINT `sisnlab_equipamento_armario_id_53af82c7_fk_sisnlab_armario_id` FOREIGN KEY (`armario_id`) REFERENCES `sisnlab_armario` (`id`),
  CONSTRAINT `sisnlab_equipamento_bancada_id_36b14b54_fk_sisnlab_bancada_id` FOREIGN KEY (`bancada_id`) REFERENCES `sisnlab_bancada` (`id`),
  CONSTRAINT `sisnlab_equipamento_estante_id_d15a5117_fk_sisnlab_estante_id` FOREIGN KEY (`estante_id`) REFERENCES `sisnlab_estante` (`id`),
  CONSTRAINT `sisnlab_equipamento_gaveta_id_0d5aa2f4_fk_sisnlab_gaveta_id` FOREIGN KEY (`gaveta_id`) REFERENCES `sisnlab_gaveta` (`id`),
  CONSTRAINT `sisnlab_equipamento_marca_id_09310640_fk_sisnlab_marca_id` FOREIGN KEY (`marca_id`) REFERENCES `sisnlab_marca` (`id`),
  CONSTRAINT `sisnlab_equipamento_prateleira_id_c3c0453c_fk_sisnlab_p` FOREIGN KEY (`prateleira_id`) REFERENCES `sisnlab_prateleira` (`id`),
  CONSTRAINT `sisnlab_equipamento_sala_id_2f7963a1_fk_sisnlab_sala_id` FOREIGN KEY (`sala_id`) REFERENCES `sisnlab_sala` (`id`),
  CONSTRAINT `sisnlab_equipamento_tombo_id_a2f7a787_fk_sisnlab_tombo_id` FOREIGN KEY (`tombo_id`) REFERENCES `sisnlab_tombo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela nlab.sisnlab_equipamento: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `sisnlab_equipamento` DISABLE KEYS */;
REPLACE INTO `sisnlab_equipamento` (`id`, `nome`, `data_compra`, `data_ultim_m`, `origem`, `ficha_tec`, `especficacao_t`, `calibragem`, `obs`, `armario_id`, `bancada_id`, `estante_id`, `gaveta_id`, `marca_id`, `prateleira_id`, `sala_id`, `tombo_id`) VALUES
	(1, 'Monitor', '2020-08-26 17:36:40.000000', '2020-08-26 17:36:40.000000', '', '', '', 'NAO', '', NULL, 1, NULL, NULL, 3, NULL, 2, 11),
	(2, 'Centrífuga', '2020-08-26 17:41:19.000000', '2020-08-26 17:41:19.000000', '', '', 'SSADF', 'SIM', '', 1, NULL, NULL, NULL, 3, NULL, 3, 9);
/*!40000 ALTER TABLE `sisnlab_equipamento` ENABLE KEYS */;

-- Copiando estrutura para tabela nlab.sisnlab_estante
CREATE TABLE IF NOT EXISTS `sisnlab_estante` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `sigla` varchar(50) DEFAULT NULL,
  `obs` longtext DEFAULT NULL,
  `sala_id` int(11) NOT NULL,
  `tombo_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tombo_id` (`tombo_id`),
  KEY `sisnlab_estante_sala_id_793bdd18_fk_sisnlab_sala_id` (`sala_id`),
  CONSTRAINT `sisnlab_estante_sala_id_793bdd18_fk_sisnlab_sala_id` FOREIGN KEY (`sala_id`) REFERENCES `sisnlab_sala` (`id`),
  CONSTRAINT `sisnlab_estante_tombo_id_2c5ebc7c_fk_sisnlab_tombo_id` FOREIGN KEY (`tombo_id`) REFERENCES `sisnlab_tombo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela nlab.sisnlab_estante: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `sisnlab_estante` DISABLE KEYS */;
REPLACE INTO `sisnlab_estante` (`id`, `nome`, `sigla`, `obs`, `sala_id`, `tombo_id`) VALUES
	(1, 'Estante 01', 'adsf', '', 1, 7);
/*!40000 ALTER TABLE `sisnlab_estante` ENABLE KEYS */;

-- Copiando estrutura para tabela nlab.sisnlab_gaveta
CREATE TABLE IF NOT EXISTS `sisnlab_gaveta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `sigla` varchar(50) DEFAULT NULL,
  `obs` longtext DEFAULT NULL,
  `armario_id` int(11) DEFAULT NULL,
  `bancada_id` int(11) DEFAULT NULL,
  `estante_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sisnlab_gaveta_armario_id_f4809991_fk_sisnlab_armario_id` (`armario_id`),
  KEY `sisnlab_gaveta_bancada_id_dfe818ac_fk_sisnlab_bancada_id` (`bancada_id`),
  KEY `sisnlab_gaveta_estante_id_38389587_fk_sisnlab_estante_id` (`estante_id`),
  CONSTRAINT `sisnlab_gaveta_armario_id_f4809991_fk_sisnlab_armario_id` FOREIGN KEY (`armario_id`) REFERENCES `sisnlab_armario` (`id`),
  CONSTRAINT `sisnlab_gaveta_bancada_id_dfe818ac_fk_sisnlab_bancada_id` FOREIGN KEY (`bancada_id`) REFERENCES `sisnlab_bancada` (`id`),
  CONSTRAINT `sisnlab_gaveta_estante_id_38389587_fk_sisnlab_estante_id` FOREIGN KEY (`estante_id`) REFERENCES `sisnlab_estante` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela nlab.sisnlab_gaveta: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `sisnlab_gaveta` DISABLE KEYS */;
REPLACE INTO `sisnlab_gaveta` (`id`, `nome`, `sigla`, `obs`, `armario_id`, `bancada_id`, `estante_id`) VALUES
	(1, 'GAVETA 01 - ARM LAB INFO 01', 'GAV01 LAB INFO 01', '', 2, NULL, NULL);
/*!40000 ALTER TABLE `sisnlab_gaveta` ENABLE KEYS */;

-- Copiando estrutura para tabela nlab.sisnlab_marca
CREATE TABLE IF NOT EXISTS `sisnlab_marca` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `obs` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela nlab.sisnlab_marca: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `sisnlab_marca` DISABLE KEYS */;
REPLACE INTO `sisnlab_marca` (`id`, `nome`, `obs`) VALUES
	(1, 'HP', ''),
	(2, 'DELL', ''),
	(3, 'Itautec', ''),
	(4, 'Dlink', '');
/*!40000 ALTER TABLE `sisnlab_marca` ENABLE KEYS */;

-- Copiando estrutura para tabela nlab.sisnlab_pedidosolucao
CREATE TABLE IF NOT EXISTS `sisnlab_pedidosolucao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `concentracao` double DEFAULT NULL,
  `data_producao` datetime(6) NOT NULL,
  `quantidade` double DEFAULT NULL,
  `status` varchar(1) NOT NULL,
  `imagem` varchar(100) DEFAULT NULL,
  `obs` longtext NOT NULL,
  `armario_id` int(11) DEFAULT NULL,
  `bancada_id` int(11) DEFAULT NULL,
  `estante_id` int(11) DEFAULT NULL,
  `gaveta_id` int(11) DEFAULT NULL,
  `prateleira_id` int(11) DEFAULT NULL,
  `sala_id` int(11) NOT NULL,
  `unidade_id` int(11) NOT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `estoque` int(10) unsigned CHECK (`estoque` >= 0),
  PRIMARY KEY (`id`),
  KEY `sisnlab_pedidosolucao_armario_id_51893c62_fk_sisnlab_armario_id` (`armario_id`),
  KEY `sisnlab_pedidosolucao_bancada_id_8e1e5682_fk_sisnlab_bancada_id` (`bancada_id`),
  KEY `sisnlab_pedidosolucao_estante_id_a42b6ea6_fk_sisnlab_estante_id` (`estante_id`),
  KEY `sisnlab_pedidosolucao_gaveta_id_d8df6368_fk_sisnlab_gaveta_id` (`gaveta_id`),
  KEY `sisnlab_pedidosoluca_prateleira_id_c401d936_fk_sisnlab_p` (`prateleira_id`),
  KEY `sisnlab_pedidosolucao_sala_id_b91968d7_fk_sisnlab_sala_id` (`sala_id`),
  KEY `sisnlab_pedidosolucao_unidade_id_8dfc570a_fk_sisnlab_unidade_id` (`unidade_id`),
  KEY `sisnlab_pedidosolucao_usuario_id_9f6cb326_fk_auth_user_id` (`usuario_id`),
  CONSTRAINT `sisnlab_pedidosoluca_prateleira_id_c401d936_fk_sisnlab_p` FOREIGN KEY (`prateleira_id`) REFERENCES `sisnlab_prateleira` (`id`),
  CONSTRAINT `sisnlab_pedidosolucao_armario_id_51893c62_fk_sisnlab_armario_id` FOREIGN KEY (`armario_id`) REFERENCES `sisnlab_armario` (`id`),
  CONSTRAINT `sisnlab_pedidosolucao_bancada_id_8e1e5682_fk_sisnlab_bancada_id` FOREIGN KEY (`bancada_id`) REFERENCES `sisnlab_bancada` (`id`),
  CONSTRAINT `sisnlab_pedidosolucao_estante_id_a42b6ea6_fk_sisnlab_estante_id` FOREIGN KEY (`estante_id`) REFERENCES `sisnlab_estante` (`id`),
  CONSTRAINT `sisnlab_pedidosolucao_gaveta_id_d8df6368_fk_sisnlab_gaveta_id` FOREIGN KEY (`gaveta_id`) REFERENCES `sisnlab_gaveta` (`id`),
  CONSTRAINT `sisnlab_pedidosolucao_sala_id_b91968d7_fk_sisnlab_sala_id` FOREIGN KEY (`sala_id`) REFERENCES `sisnlab_sala` (`id`),
  CONSTRAINT `sisnlab_pedidosolucao_unidade_id_8dfc570a_fk_sisnlab_unidade_id` FOREIGN KEY (`unidade_id`) REFERENCES `sisnlab_unidade` (`id`),
  CONSTRAINT `sisnlab_pedidosolucao_usuario_id_9f6cb326_fk_auth_user_id` FOREIGN KEY (`usuario_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela nlab.sisnlab_pedidosolucao: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `sisnlab_pedidosolucao` DISABLE KEYS */;
REPLACE INTO `sisnlab_pedidosolucao` (`id`, `nome`, `concentracao`, `data_producao`, `quantidade`, `status`, `imagem`, `obs`, `armario_id`, `bancada_id`, `estante_id`, `gaveta_id`, `prateleira_id`, `sala_id`, `unidade_id`, `usuario_id`, `estoque`) VALUES
	(31, 'Laborátório 01', 443, '2020-09-02 20:59:23.000000', 45, 'E', 'False', '', NULL, 1, NULL, NULL, NULL, 1, 2, 1, NULL),
	(32, 'Teste 01', 443, '2020-09-02 21:04:18.000000', 77, 'E', 'images/AVIAO11.jpg', '', NULL, 1, NULL, NULL, NULL, 3, 2, 1, NULL);
/*!40000 ALTER TABLE `sisnlab_pedidosolucao` ENABLE KEYS */;

-- Copiando estrutura para tabela nlab.sisnlab_prateleira
CREATE TABLE IF NOT EXISTS `sisnlab_prateleira` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `sigla` varchar(50) DEFAULT NULL,
  `obs` longtext DEFAULT NULL,
  `armario_id` int(11) DEFAULT NULL,
  `bancada_id` int(11) DEFAULT NULL,
  `estante_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sisnlab_prateleira_armario_id_bdd904d6_fk_sisnlab_armario_id` (`armario_id`),
  KEY `sisnlab_prateleira_bancada_id_ce12f446_fk_sisnlab_bancada_id` (`bancada_id`),
  KEY `sisnlab_prateleira_estante_id_beec7b1b_fk_sisnlab_estante_id` (`estante_id`),
  CONSTRAINT `sisnlab_prateleira_armario_id_bdd904d6_fk_sisnlab_armario_id` FOREIGN KEY (`armario_id`) REFERENCES `sisnlab_armario` (`id`),
  CONSTRAINT `sisnlab_prateleira_bancada_id_ce12f446_fk_sisnlab_bancada_id` FOREIGN KEY (`bancada_id`) REFERENCES `sisnlab_bancada` (`id`),
  CONSTRAINT `sisnlab_prateleira_estante_id_beec7b1b_fk_sisnlab_estante_id` FOREIGN KEY (`estante_id`) REFERENCES `sisnlab_estante` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela nlab.sisnlab_prateleira: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `sisnlab_prateleira` DISABLE KEYS */;
REPLACE INTO `sisnlab_prateleira` (`id`, `nome`, `sigla`, `obs`, `armario_id`, `bancada_id`, `estante_id`) VALUES
	(1, 'PRATELEIRA 01', 'PR1', 'ok', 1, NULL, NULL),
	(2, 'PRATELEIRA 02', 'PR2', '', 1, NULL, NULL);
/*!40000 ALTER TABLE `sisnlab_prateleira` ENABLE KEYS */;

-- Copiando estrutura para tabela nlab.sisnlab_reagente
CREATE TABLE IF NOT EXISTS `sisnlab_reagente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `formula_q` varchar(50) NOT NULL,
  `grau_p` double DEFAULT NULL,
  `quantidade` double DEFAULT NULL,
  `data_validade` datetime(6) NOT NULL,
  `controle_pfex` varchar(50) DEFAULT NULL,
  `ficha_tec` varchar(100) DEFAULT NULL,
  `massamolecular` varchar(50) NOT NULL,
  `densidade` varchar(50) NOT NULL,
  `disponibilidade` varchar(3) NOT NULL,
  `obs` longtext NOT NULL,
  `armario_id` int(11) DEFAULT NULL,
  `bancada_id` int(11) DEFAULT NULL,
  `estante_id` int(11) DEFAULT NULL,
  `gaveta_id` int(11) DEFAULT NULL,
  `marca_id` int(11) NOT NULL,
  `prateleira_id` int(11) DEFAULT NULL,
  `sala_id` int(11) NOT NULL,
  `unidade_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sisnlab_reagente_armario_id_b9c146b0_fk_sisnlab_armario_id` (`armario_id`),
  KEY `sisnlab_reagente_bancada_id_29192e9c_fk_sisnlab_bancada_id` (`bancada_id`),
  KEY `sisnlab_reagente_estante_id_e969c71c_fk_sisnlab_estante_id` (`estante_id`),
  KEY `sisnlab_reagente_gaveta_id_8625e89d_fk_sisnlab_gaveta_id` (`gaveta_id`),
  KEY `sisnlab_reagente_marca_id_549386dc_fk_sisnlab_marca_id` (`marca_id`),
  KEY `sisnlab_reagente_prateleira_id_ad41427a_fk_sisnlab_prateleira_id` (`prateleira_id`),
  KEY `sisnlab_reagente_sala_id_04eef050_fk_sisnlab_sala_id` (`sala_id`),
  KEY `sisnlab_reagente_unidade_id_422640f6_fk_sisnlab_unidade_id` (`unidade_id`),
  CONSTRAINT `sisnlab_reagente_armario_id_b9c146b0_fk_sisnlab_armario_id` FOREIGN KEY (`armario_id`) REFERENCES `sisnlab_armario` (`id`),
  CONSTRAINT `sisnlab_reagente_bancada_id_29192e9c_fk_sisnlab_bancada_id` FOREIGN KEY (`bancada_id`) REFERENCES `sisnlab_bancada` (`id`),
  CONSTRAINT `sisnlab_reagente_estante_id_e969c71c_fk_sisnlab_estante_id` FOREIGN KEY (`estante_id`) REFERENCES `sisnlab_estante` (`id`),
  CONSTRAINT `sisnlab_reagente_gaveta_id_8625e89d_fk_sisnlab_gaveta_id` FOREIGN KEY (`gaveta_id`) REFERENCES `sisnlab_gaveta` (`id`),
  CONSTRAINT `sisnlab_reagente_marca_id_549386dc_fk_sisnlab_marca_id` FOREIGN KEY (`marca_id`) REFERENCES `sisnlab_marca` (`id`),
  CONSTRAINT `sisnlab_reagente_prateleira_id_ad41427a_fk_sisnlab_prateleira_id` FOREIGN KEY (`prateleira_id`) REFERENCES `sisnlab_prateleira` (`id`),
  CONSTRAINT `sisnlab_reagente_sala_id_04eef050_fk_sisnlab_sala_id` FOREIGN KEY (`sala_id`) REFERENCES `sisnlab_sala` (`id`),
  CONSTRAINT `sisnlab_reagente_unidade_id_422640f6_fk_sisnlab_unidade_id` FOREIGN KEY (`unidade_id`) REFERENCES `sisnlab_unidade` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela nlab.sisnlab_reagente: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `sisnlab_reagente` DISABLE KEYS */;
REPLACE INTO `sisnlab_reagente` (`id`, `nome`, `formula_q`, `grau_p`, `quantidade`, `data_validade`, `controle_pfex`, `ficha_tec`, `massamolecular`, `densidade`, `disponibilidade`, `obs`, `armario_id`, `bancada_id`, `estante_id`, `gaveta_id`, `marca_id`, `prateleira_id`, `sala_id`, `unidade_id`) VALUES
	(1, 'cloreto de sódio', 'NaCl', 98, 500, '2020-08-26 17:59:28.000000', 'NÃO', '', '58,5', '1', 'SIM', 'tudo certo', 2, 1, 1, 1, 2, 1, 4, 2),
	(2, 'ácido clorídrico PA', 'HCl', 37, 2.5, '2020-08-26 18:04:55.000000', 'sim', '', '36,5', '1,235', 'SIM', '', 1, 1, 1, 1, 4, 2, 4, 1);
/*!40000 ALTER TABLE `sisnlab_reagente` ENABLE KEYS */;

-- Copiando estrutura para tabela nlab.sisnlab_sala
CREATE TABLE IF NOT EXISTS `sisnlab_sala` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(80) NOT NULL,
  `obs` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nome` (`nome`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela nlab.sisnlab_sala: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `sisnlab_sala` DISABLE KEYS */;
REPLACE INTO `sisnlab_sala` (`id`, `nome`, `obs`) VALUES
	(1, 'Laboratório Info 01', ''),
	(2, 'Laboratório info 02', ''),
	(3, 'Laboratório Biologia', ''),
	(4, 'Laboratório Química', '');
/*!40000 ALTER TABLE `sisnlab_sala` ENABLE KEYS */;

-- Copiando estrutura para tabela nlab.sisnlab_tombo
CREATE TABLE IF NOT EXISTS `sisnlab_tombo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numero` varchar(6) NOT NULL,
  `descricao` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `numero` (`numero`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela nlab.sisnlab_tombo: ~11 rows (aproximadamente)
/*!40000 ALTER TABLE `sisnlab_tombo` DISABLE KEYS */;
REPLACE INTO `sisnlab_tombo` (`id`, `numero`, `descricao`) VALUES
	(1, '12345', 'MOUSE COMPUTADOR'),
	(2, '123456', 'ESTABILIZADOR TENSÃO'),
	(3, '28473', 'ROTEADOR WIRELESS DLINK'),
	(4, '487401', 'PROTOBOARD'),
	(5, '39560', 'Armário_02 LAB INFO 124'),
	(6, '456576', 'Armário_01 LAB INFO 118'),
	(7, '987', 'Estante_01 LAB BIO'),
	(8, '2456', 'Estante_01 LAB Química'),
	(9, '66556', 'Bancada_01 LAB BIO'),
	(10, '56788', 'Bancada_01 LAB QUI'),
	(11, '5767', 'Monitor 15" Itautec');
/*!40000 ALTER TABLE `sisnlab_tombo` ENABLE KEYS */;

-- Copiando estrutura para tabela nlab.sisnlab_unidade
CREATE TABLE IF NOT EXISTS `sisnlab_unidade` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `obs` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela nlab.sisnlab_unidade: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `sisnlab_unidade` DISABLE KEYS */;
REPLACE INTO `sisnlab_unidade` (`id`, `nome`, `obs`) VALUES
	(1, 'LITROS', 'L'),
	(2, 'GRAMA', 'g'),
	(3, 'QUILOGRAMA', 'kg'),
	(4, 'UNIDADE', 'und');
/*!40000 ALTER TABLE `sisnlab_unidade` ENABLE KEYS */;

-- Copiando estrutura para tabela nlab.sisnlab_vidraria
CREATE TABLE IF NOT EXISTS `sisnlab_vidraria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `data_compra` datetime(6) NOT NULL,
  `origem` varchar(100) NOT NULL,
  `ficha_tec` varchar(100) NOT NULL,
  `especficacao_t` longtext NOT NULL,
  `quantidade` int(10) unsigned NOT NULL,
  `obs` longtext NOT NULL,
  `armario_id` int(11) DEFAULT NULL,
  `bancada_id` int(11) DEFAULT NULL,
  `estante_id` int(11) DEFAULT NULL,
  `gaveta_id` int(11) DEFAULT NULL,
  `marca_id` int(11) DEFAULT NULL,
  `prateleira_id` int(11) DEFAULT NULL,
  `sala_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sisnlab_vidraria_armario_id_9d9e2f3f_fk_sisnlab_armario_id` (`armario_id`),
  KEY `sisnlab_vidraria_bancada_id_42a47e82_fk_sisnlab_bancada_id` (`bancada_id`),
  KEY `sisnlab_vidraria_estante_id_ed0fa1bd_fk_sisnlab_estante_id` (`estante_id`),
  KEY `sisnlab_vidraria_gaveta_id_49009506_fk_sisnlab_gaveta_id` (`gaveta_id`),
  KEY `sisnlab_vidraria_marca_id_1769f2ae_fk_sisnlab_marca_id` (`marca_id`),
  KEY `sisnlab_vidraria_prateleira_id_94b903f7_fk_sisnlab_prateleira_id` (`prateleira_id`),
  KEY `sisnlab_vidraria_sala_id_f3f0f1a1_fk_sisnlab_sala_id` (`sala_id`),
  CONSTRAINT `sisnlab_vidraria_armario_id_9d9e2f3f_fk_sisnlab_armario_id` FOREIGN KEY (`armario_id`) REFERENCES `sisnlab_armario` (`id`),
  CONSTRAINT `sisnlab_vidraria_bancada_id_42a47e82_fk_sisnlab_bancada_id` FOREIGN KEY (`bancada_id`) REFERENCES `sisnlab_bancada` (`id`),
  CONSTRAINT `sisnlab_vidraria_estante_id_ed0fa1bd_fk_sisnlab_estante_id` FOREIGN KEY (`estante_id`) REFERENCES `sisnlab_estante` (`id`),
  CONSTRAINT `sisnlab_vidraria_gaveta_id_49009506_fk_sisnlab_gaveta_id` FOREIGN KEY (`gaveta_id`) REFERENCES `sisnlab_gaveta` (`id`),
  CONSTRAINT `sisnlab_vidraria_marca_id_1769f2ae_fk_sisnlab_marca_id` FOREIGN KEY (`marca_id`) REFERENCES `sisnlab_marca` (`id`),
  CONSTRAINT `sisnlab_vidraria_prateleira_id_94b903f7_fk_sisnlab_prateleira_id` FOREIGN KEY (`prateleira_id`) REFERENCES `sisnlab_prateleira` (`id`),
  CONSTRAINT `sisnlab_vidraria_sala_id_f3f0f1a1_fk_sisnlab_sala_id` FOREIGN KEY (`sala_id`) REFERENCES `sisnlab_sala` (`id`),
  CONSTRAINT `sisnlab_vidraria_quantidade_64837225_check` CHECK (`quantidade` >= 0)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela nlab.sisnlab_vidraria: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `sisnlab_vidraria` DISABLE KEYS */;
REPLACE INTO `sisnlab_vidraria` (`id`, `nome`, `data_compra`, `origem`, `ficha_tec`, `especficacao_t`, `quantidade`, `obs`, `armario_id`, `bancada_id`, `estante_id`, `gaveta_id`, `marca_id`, `prateleira_id`, `sala_id`) VALUES
	(1, 'frasco', '2020-08-26 17:49:23.000000', '', '', 'padronizada', 45, 'tudo certo', 1, 1, 1, 1, 4, 1, 3),
	(2, 'Teste 01 imagem', '2020-09-02 21:25:42.000000', 'images/8x160.gif', '', '', 1, '', NULL, 1, NULL, NULL, 2, NULL, 1);
/*!40000 ALTER TABLE `sisnlab_vidraria` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
