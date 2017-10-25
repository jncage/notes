USE test;

DROP TABLE IF EXISTS notes_tbl;
CREATE TABLE `notes_tbl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(450) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `is_finished` bit(1) DEFAULT b'0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO notes_tbl(name, description, created_date, is_finished) VALUES('note1', 'description1', current_date(), 0),
('note2', 'description2', current_date(), 0),
('note3', 'description3', current_date(), 0),
('note4', 'description4', current_date(), 0),
('note5', 'description5', current_date(), 0),
('note6', 'description6', current_date(), 0),
('note7', 'description7', current_date(), 0),
('note8', 'description8', current_date(), 0),
('note9', 'description9', current_date(), 0),
('note10', 'description10', current_date(), 0),
('note11', 'description11', current_date(), 0),
('note12', 'description12', current_date(), 0),
('note13', 'description13', current_date(), 0),
('note14', 'description14', current_date(), 0),
('note15', 'description15', current_date(), 0),
('note16', 'description16', current_date(), 0),
('note17', 'description17', current_date(), 0),
('note18', 'description18', current_date(), 0),
('note19', 'description19', current_date(), 0),
('note20', 'description20', current_date(), 0),
('note21', 'description21', current_date(), 0),
('note22', 'description22', current_date(), 0),
('note23', 'description23', current_date(), 0);