GRANT ALL PRIVILEGES ON *.* TO 'modbus2sql'@'localhost' IDENTIFIED BY 'modicon' WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON *.* TO 'modbus2sql'@'%' IDENTIFIED BY 'modicon' WITH GRANT OPTION;
CREATE DATABASE modbus2sql;
USE modbus2sql;
CREATE TABLE `alarmflags` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `controllertype` varchar(30) NOT NULL,
  `warningregister` int(11) NOT NULL,
  `warningbit` int(11) NOT NULL,
  `shutdownregister` int(11) NOT NULL,
  `shutdownbit` int(11) NOT NULL,
  `tripregister` int(11) NOT NULL,
  `tripbit` int(11) NOT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

CREATE TABLE `alarmlog` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `curdate` date NOT NULL,
  `curtime` time NOT NULL,
  `slaveid` int(11) NOT NULL,
  `slavename` varchar(30) NOT NULL,
  `alarmdesc` varchar(256) NOT NULL,
  `alarmtype` varchar(20) NOT NULL,
  `alarmacknowledged` tinyint(4) NOT NULL,
  `alarmreset` tinyint(4) NOT NULL,
  `alarmnotifications` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`rowid`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

CREATE TABLE `alarmtypes` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `controllertype` varchar(60) NOT NULL,
  `alarmstring` varchar(256) NOT NULL,
  `modbusregister` int(11) NOT NULL,
  `startbit` int(11) NOT NULL,
  `bitqty` int(11) NOT NULL,
  `valuedisabled` int(11) NOT NULL,
  `valuewarning` int(11) NOT NULL,
  `valueshutdown` int(11) NOT NULL,
  `valuetrip` int(11) NOT NULL,
  `valueunimplemented` int(11) NOT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

CREATE TABLE `controllertypes` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `controllertype` varchar(30) NOT NULL,
  `longname` varchar(150) NOT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

CREATE TABLE `registerblocks` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `controllertype` varchar(50) NOT NULL,
  `page` int(11) DEFAULT NULL,
  `registerstart` int(11) DEFAULT NULL,
  `registerend` int(11) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `modbusFunctionType` int(11) NOT NULL DEFAULT '3',
  PRIMARY KEY (`rowid`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

CREATE TABLE `registerdetail` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'AUTO CREATES',
  `controllertype` varchar(50) NOT NULL COMMENT 'Longtext name for controller',
  `page` int(11) DEFAULT NULL COMMENT 'Your Page Number for this Data Block',
  `register` int(11) DEFAULT NULL COMMENT 'Modbus Register No',
  `description` varchar(50) DEFAULT NULL COMMENT 'Long text desctription',
  `bits` int(11) DEFAULT '16' COMMENT '16 or 32',
  `signed` tinyint(1) DEFAULT '0' COMMENT 'Set =1 for Signed Integer',
  `lowbyteregister` int(11) NOT NULL DEFAULT '0' COMMENT 'Contains the Register for the High Bytes in a 32 bit data',
  `scalingfactor` double DEFAULT '1' COMMENT 'Factor to multiply answer to get real value',
  `minimum` double DEFAULT NULL COMMENT 'Minimum Value',
  `maximum` double DEFAULT NULL COMMENT 'Maximum Value',
  `units` varchar(50) DEFAULT NULL COMMENT 'String representation of units eg %, deg C etc',
  `writeable` tinyint(1) DEFAULT NULL COMMENT 'Set=1 for Modbus READ_COILS',
  `unimplemented` int(11) DEFAULT '65535' COMMENT 'Device Return Value for an Unimplemented Feature / Sensor Error' ,
  PRIMARY KEY (`rowid`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=latin1 COMMENT='This table stores the register information';

CREATE TABLE `rs485settings` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `serialport` varchar(50) NOT NULL,
  `baud` int(11) NOT NULL,
  `parity` varchar(5) NOT NULL,
  `databits` int(11) NOT NULL,
  `stopbits` int(11) NOT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

CREATE TABLE `siteinfo` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `sitename` varchar(50) DEFAULT NULL,
  `comments` longtext,
  PRIMARY KEY (`rowid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE `slaves` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `modbusslaveid` int(11) DEFAULT NULL,
  `longname` varchar(150) DEFAULT NULL,
  `controllertype` varchar(15) NOT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

INSERT INTO `modbus2sql`.`rs485settings` (`serialport`, `baud`, `parity`, `databits`, `stopbits`) VALUES ('/dev/ttyUSB0', '9600', 'none', '8', '2');




