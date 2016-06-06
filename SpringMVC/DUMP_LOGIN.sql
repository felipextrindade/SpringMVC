CREATE TABLE `LOGIN` (
  `user_id` int(11) AUTO_INCREMENT,
  `usuario` varchar(45),
  `senha` varchar(45),
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8



INSERT INTO LOGIN (usuario, senha)
VALUES ('root','root');