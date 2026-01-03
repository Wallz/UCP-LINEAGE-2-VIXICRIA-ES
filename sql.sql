/* Tabela de Itens do Shop do Site */ 

CREATE TABLE IF NOT EXISTS `site_shop_items` ( `id` int(11) NOT NULL AUTO_INCREMENT, `item_id` int(11) NOT NULL, `count` int(11) NOT NULL DEFAULT 1, `name` varchar(255) NOT NULL, `description` text DEFAULT NULL, `price` int(11) NOT NULL, `icon` varchar(255) DEFAULT 'fa-gift', `stock` int(11) NOT NULL DEFAULT -1, /* -1 = Infinito */ `limit_count` int(11) NOT NULL DEFAULT 0, /* 0 = Sem limite */ PRIMARY KEY (`id`) ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

ALTER TABLE site_shop_items ADD COLUMN category VARCHAR(50) NOT NULL DEFAULT 'other';

CREATE TABLE IF NOT EXISTS `site_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(45) NOT NULL,
  `action` varchar(255) NOT NULL,
  `ip` varchar(45) NOT NULL,
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/* Tabela de função de ver item que esta comprando no site */ 
ALTER TABLE site_shop_items ADD COLUMN view_image VARCHAR(255) DEFAULT NULL;

/* Tabela de Histórico de Compras */ 

CREATE TABLE IF NOT EXISTS `site_shop_history` ( `id` int(11) NOT NULL AUTO_INCREMENT, `login` varchar(45) NOT NULL, `item_db_id` int(11) NOT NULL, `count` int(11) NOT NULL, `date` timestamp NOT NULL DEFAULT current_timestamp(), PRIMARY KEY (`id`) ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/* (Opcional) Tabela de Doações - Caso não tenha criado ainda */ 

CREATE TABLE IF NOT EXISTS `donations` ( `id` int(11) NOT NULL AUTO_INCREMENT, `account_name` varchar(45) NOT NULL, `amount` decimal(10,2) NOT NULL, `coins_received` int(11) NOT NULL, `status` varchar(20) DEFAULT 'pending', `payment_id` varchar(100) DEFAULT NULL, `date` timestamp NOT NULL DEFAULT current_timestamp(), PRIMARY KEY (`id`) ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


/* (Opcional) Tabela de Itens do Painel - Caso não tenha criado ainda */ 
CREATE TABLE IF NOT EXISTS `items_delayed` (
  `payment_id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `count` bigint(20) NOT NULL DEFAULT 1,
  `enchant_level` int(11) NOT NULL DEFAULT 0,
  `attribute` int(11) NOT NULL DEFAULT -1,
  `attribute_level` int(11) NOT NULL DEFAULT -1,
  `flags` int(11) NOT NULL DEFAULT 0,
  `payment_status` int(11) NOT NULL DEFAULT 0,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `owner_id` (`owner_id`),
  KEY `payment_status` (`payment_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

UPDATE items_delayed SET count = 2000000000 WHERE payment_id = 20;

-- Tabela de Códigos
CREATE TABLE IF NOT EXISTS `site_bonus_codes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `reward_amount` int(11) NOT NULL DEFAULT '0',
  `item_id` int(11) NOT NULL DEFAULT '0' COMMENT '0 = Balance, Outro ID = Item no jogo',
  `usage_limit` int(11) NOT NULL DEFAULT '1',
  `used_count` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Tabela de Histórico (Para ninguém usar o mesmo código 2x)
CREATE TABLE IF NOT EXISTS `site_bonus_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(45) NOT NULL,
  `code_id` int(11) NOT NULL,
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Inserir um código de teste (Ganhe 100 Coins)
INSERT INTO `site_bonus_codes` (`code`, `reward_amount`, `usage_limit`) VALUES ('WELCOME-AETHER', 100, 9999);
