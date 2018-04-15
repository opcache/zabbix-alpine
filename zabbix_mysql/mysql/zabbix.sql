-- MySQL dump 10.14  Distrib 5.5.56-MariaDB, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: zabbix
-- ------------------------------------------------------
-- Server version	10.1.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `acknowledges`
--

USE mysql;
FLUSH PRIVILEGES;

DROP TABLE IF EXISTS `acknowledges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acknowledges` (
  `acknowledgeid` bigint(20) unsigned NOT NULL,
  `userid` bigint(20) unsigned NOT NULL,
  `eventid` bigint(20) unsigned NOT NULL,
  `clock` int(11) NOT NULL DEFAULT '0',
  `message` varchar(255) NOT NULL DEFAULT '',
  `action` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`acknowledgeid`),
  KEY `acknowledges_1` (`userid`),
  KEY `acknowledges_2` (`eventid`),
  KEY `acknowledges_3` (`clock`),
  CONSTRAINT `c_acknowledges_1` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE CASCADE,
  CONSTRAINT `c_acknowledges_2` FOREIGN KEY (`eventid`) REFERENCES `events` (`eventid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acknowledges`
--

LOCK TABLES `acknowledges` WRITE;
/*!40000 ALTER TABLE `acknowledges` DISABLE KEYS */;
/*!40000 ALTER TABLE `acknowledges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `actions`
--

DROP TABLE IF EXISTS `actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actions` (
  `actionid` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `eventsource` int(11) NOT NULL DEFAULT '0',
  `evaltype` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `esc_period` varchar(255) NOT NULL DEFAULT '1h',
  `def_shortdata` varchar(255) NOT NULL DEFAULT '',
  `def_longdata` text NOT NULL,
  `r_shortdata` varchar(255) NOT NULL DEFAULT '',
  `r_longdata` text NOT NULL,
  `formula` varchar(255) NOT NULL DEFAULT '',
  `maintenance_mode` int(11) NOT NULL DEFAULT '1',
  `ack_shortdata` varchar(255) NOT NULL DEFAULT '',
  `ack_longdata` text NOT NULL,
  PRIMARY KEY (`actionid`),
  UNIQUE KEY `actions_2` (`name`),
  KEY `actions_1` (`eventsource`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actions`
--

LOCK TABLES `actions` WRITE;
/*!40000 ALTER TABLE `actions` DISABLE KEYS */;
INSERT INTO `actions` VALUES (2,'Auto discovery. Linux servers.',1,0,1,'0','','','','','',1,'',''),(3,'Report problems to Zabbix administrators',0,0,1,'1h','{TRIGGER.STATUS}: {TRIGGER.NAME}','Trigger: {TRIGGER.NAME}\r\nTrigger status: {TRIGGER.STATUS}\r\nTrigger severity: {TRIGGER.SEVERITY}\r\nTrigger URL: {TRIGGER.URL}\r\n\r\nItem values:\r\n\r\n1. {ITEM.NAME1} ({HOST.NAME1}:{ITEM.KEY1}): {ITEM.VALUE1}\r\n2. {ITEM.NAME2} ({HOST.NAME2}:{ITEM.KEY2}): {ITEM.VALUE2}\r\n3. {ITEM.NAME3} ({HOST.NAME3}:{ITEM.KEY3}): {ITEM.VALUE3}\r\n\r\nOriginal event ID: {EVENT.ID}','{TRIGGER.STATUS}: {TRIGGER.NAME}','Trigger: {TRIGGER.NAME}\r\nTrigger status: {TRIGGER.STATUS}\r\nTrigger severity: {TRIGGER.SEVERITY}\r\nTrigger URL: {TRIGGER.URL}\r\n\r\nItem values:\r\n\r\n1. {ITEM.NAME1} ({HOST.NAME1}:{ITEM.KEY1}): {ITEM.VALUE1}\r\n2. {ITEM.NAME2} ({HOST.NAME2}:{ITEM.KEY2}): {ITEM.VALUE2}\r\n3. {ITEM.NAME3} ({HOST.NAME3}:{ITEM.KEY3}): {ITEM.VALUE3}\r\n\r\nOriginal event ID: {EVENT.ID}','',1,'Acknowledged: {TRIGGER.NAME}','{USER.FULLNAME} acknowledged problem at {ACK.DATE} {ACK.TIME} with the following message:\r\n{ACK.MESSAGE}\r\n\r\nCurrent problem status is {EVENT.STATUS}'),(4,'Report not supported items',3,0,1,'1h','{ITEM.STATE}: {HOST.NAME}:{ITEM.NAME}','Host: {HOST.NAME}\r\nItem: {ITEM.NAME}\r\nKey: {ITEM.KEY}\r\nState: {ITEM.STATE}','{ITEM.STATE}: {HOST.NAME}:{ITEM.NAME}','Host: {HOST.NAME}\r\nItem: {ITEM.NAME}\r\nKey: {ITEM.KEY}\r\nState: {ITEM.STATE}','',1,'',''),(5,'Report not supported low level discovery rules',3,0,1,'1h','{LLDRULE.STATE}: {HOST.NAME}:{LLDRULE.NAME}','Host: {HOST.NAME}\r\nLow level discovery rule: {LLDRULE.NAME}\r\nKey: {LLDRULE.KEY}\r\nState: {LLDRULE.STATE}','{LLDRULE.STATE}: {HOST.NAME}:{LLDRULE.NAME}','Host: {HOST.NAME}\r\nLow level discovery rule: {LLDRULE.NAME}\r\nKey: {LLDRULE.KEY}\r\nState: {LLDRULE.STATE}','',1,'',''),(6,'Report unknown triggers',3,0,1,'1h','{TRIGGER.STATE}: {TRIGGER.NAME}','Trigger name: {TRIGGER.NAME}\r\nExpression: {TRIGGER.EXPRESSION}\r\nState: {TRIGGER.STATE}','{TRIGGER.STATE}: {TRIGGER.NAME}','Trigger name: {TRIGGER.NAME}\r\nExpression: {TRIGGER.EXPRESSION}\r\nState: {TRIGGER.STATE}','',1,'','');
/*!40000 ALTER TABLE `actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alerts`
--

DROP TABLE IF EXISTS `alerts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alerts` (
  `alertid` bigint(20) unsigned NOT NULL,
  `actionid` bigint(20) unsigned NOT NULL,
  `eventid` bigint(20) unsigned NOT NULL,
  `userid` bigint(20) unsigned DEFAULT NULL,
  `clock` int(11) NOT NULL DEFAULT '0',
  `mediatypeid` bigint(20) unsigned DEFAULT NULL,
  `sendto` varchar(100) NOT NULL DEFAULT '',
  `subject` varchar(255) NOT NULL DEFAULT '',
  `message` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `retries` int(11) NOT NULL DEFAULT '0',
  `error` varchar(2048) NOT NULL DEFAULT '',
  `esc_step` int(11) NOT NULL DEFAULT '0',
  `alerttype` int(11) NOT NULL DEFAULT '0',
  `p_eventid` bigint(20) unsigned DEFAULT NULL,
  `acknowledgeid` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`alertid`),
  KEY `alerts_1` (`actionid`),
  KEY `alerts_2` (`clock`),
  KEY `alerts_3` (`eventid`),
  KEY `alerts_5` (`mediatypeid`),
  KEY `alerts_6` (`userid`),
  KEY `alerts_7` (`p_eventid`),
  KEY `alerts_4` (`status`),
  KEY `c_alerts_6` (`acknowledgeid`),
  CONSTRAINT `c_alerts_1` FOREIGN KEY (`actionid`) REFERENCES `actions` (`actionid`) ON DELETE CASCADE,
  CONSTRAINT `c_alerts_2` FOREIGN KEY (`eventid`) REFERENCES `events` (`eventid`) ON DELETE CASCADE,
  CONSTRAINT `c_alerts_3` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE CASCADE,
  CONSTRAINT `c_alerts_4` FOREIGN KEY (`mediatypeid`) REFERENCES `media_type` (`mediatypeid`) ON DELETE CASCADE,
  CONSTRAINT `c_alerts_5` FOREIGN KEY (`p_eventid`) REFERENCES `events` (`eventid`) ON DELETE CASCADE,
  CONSTRAINT `c_alerts_6` FOREIGN KEY (`acknowledgeid`) REFERENCES `acknowledges` (`acknowledgeid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alerts`
--

LOCK TABLES `alerts` WRITE;
/*!40000 ALTER TABLE `alerts` DISABLE KEYS */;
/*!40000 ALTER TABLE `alerts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `application_discovery`
--

DROP TABLE IF EXISTS `application_discovery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `application_discovery` (
  `application_discoveryid` bigint(20) unsigned NOT NULL,
  `applicationid` bigint(20) unsigned NOT NULL,
  `application_prototypeid` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `lastcheck` int(11) NOT NULL DEFAULT '0',
  `ts_delete` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`application_discoveryid`),
  KEY `application_discovery_1` (`applicationid`),
  KEY `application_discovery_2` (`application_prototypeid`),
  CONSTRAINT `c_application_discovery_1` FOREIGN KEY (`applicationid`) REFERENCES `applications` (`applicationid`) ON DELETE CASCADE,
  CONSTRAINT `c_application_discovery_2` FOREIGN KEY (`application_prototypeid`) REFERENCES `application_prototype` (`application_prototypeid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application_discovery`
--

LOCK TABLES `application_discovery` WRITE;
/*!40000 ALTER TABLE `application_discovery` DISABLE KEYS */;
/*!40000 ALTER TABLE `application_discovery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `application_prototype`
--

DROP TABLE IF EXISTS `application_prototype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `application_prototype` (
  `application_prototypeid` bigint(20) unsigned NOT NULL,
  `itemid` bigint(20) unsigned NOT NULL,
  `templateid` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`application_prototypeid`),
  KEY `application_prototype_1` (`itemid`),
  KEY `application_prototype_2` (`templateid`),
  CONSTRAINT `c_application_prototype_1` FOREIGN KEY (`itemid`) REFERENCES `items` (`itemid`) ON DELETE CASCADE,
  CONSTRAINT `c_application_prototype_2` FOREIGN KEY (`templateid`) REFERENCES `application_prototype` (`application_prototypeid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application_prototype`
--

LOCK TABLES `application_prototype` WRITE;
/*!40000 ALTER TABLE `application_prototype` DISABLE KEYS */;
INSERT INTO `application_prototype` VALUES (1,23665,NULL,'Startup {#SERVICE.STARTUPNAME} services');
/*!40000 ALTER TABLE `application_prototype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `application_template`
--

DROP TABLE IF EXISTS `application_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `application_template` (
  `application_templateid` bigint(20) unsigned NOT NULL,
  `applicationid` bigint(20) unsigned NOT NULL,
  `templateid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`application_templateid`),
  UNIQUE KEY `application_template_1` (`applicationid`,`templateid`),
  KEY `application_template_2` (`templateid`),
  CONSTRAINT `c_application_template_1` FOREIGN KEY (`applicationid`) REFERENCES `applications` (`applicationid`) ON DELETE CASCADE,
  CONSTRAINT `c_application_template_2` FOREIGN KEY (`templateid`) REFERENCES `applications` (`applicationid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application_template`
--

LOCK TABLES `application_template` WRITE;
/*!40000 ALTER TABLE `application_template` DISABLE KEYS */;
INSERT INTO `application_template` VALUES (1,207,206),(2,229,228),(3,230,227),(4,231,228),(5,232,227),(6,235,234),(7,236,234),(8,237,228),(9,238,227),(10,241,240),(11,242,240),(12,252,206),(13,262,206),(14,272,206),(15,282,206),(16,292,206),(17,302,206),(18,329,206),(40,469,206);
/*!40000 ALTER TABLE `application_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `applications`
--

DROP TABLE IF EXISTS `applications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `applications` (
  `applicationid` bigint(20) unsigned NOT NULL,
  `hostid` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `flags` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`applicationid`),
  UNIQUE KEY `applications_2` (`hostid`,`name`),
  CONSTRAINT `c_applications_1` FOREIGN KEY (`hostid`) REFERENCES `hosts` (`hostid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `applications`
--

LOCK TABLES `applications` WRITE;
/*!40000 ALTER TABLE `applications` DISABLE KEYS */;
INSERT INTO `applications` VALUES (1,10001,'OS',0),(5,10001,'Filesystems',0),(7,10001,'Network interfaces',0),(9,10001,'Processes',0),(13,10001,'CPU',0),(15,10001,'Memory',0),(17,10001,'Performance',0),(21,10001,'General',0),(23,10001,'Security',0),(179,10047,'Zabbix server',0),(206,10050,'Zabbix agent',0),(207,10001,'Zabbix agent',0),(227,10060,'Interfaces',0),(228,10065,'General',0),(229,10066,'General',0),(230,10066,'Interfaces',0),(231,10067,'General',0),(232,10067,'Interfaces',0),(234,10068,'Disk partitions',0),(235,10067,'Disk partitions',0),(236,10069,'Disk partitions',0),(237,10069,'General',0),(238,10069,'Interfaces',0),(240,10070,'Processors',0),(241,10069,'Processors',0),(242,10067,'Processors',0),(245,10071,'Voltage',0),(246,10071,'Temperature',0),(247,10071,'Fans',0),(248,10072,'Voltage',0),(249,10072,'Temperature',0),(250,10072,'Fans',0),(251,10073,'MySQL',0),(252,10074,'Zabbix agent',0),(253,10074,'CPU',0),(254,10074,'Filesystems',0),(255,10074,'General',0),(256,10074,'Memory',0),(257,10074,'Network interfaces',0),(258,10074,'OS',0),(259,10074,'Performance',0),(260,10074,'Processes',0),(261,10074,'Security',0),(262,10075,'Zabbix agent',0),(263,10075,'CPU',0),(264,10075,'Filesystems',0),(265,10075,'General',0),(266,10075,'Memory',0),(267,10075,'Network interfaces',0),(268,10075,'OS',0),(269,10075,'Performance',0),(270,10075,'Processes',0),(271,10075,'Security',0),(272,10076,'Zabbix agent',0),(273,10076,'CPU',0),(274,10076,'Filesystems',0),(275,10076,'General',0),(276,10076,'Memory',0),(277,10076,'Network interfaces',0),(278,10076,'OS',0),(279,10076,'Performance',0),(280,10076,'Processes',0),(281,10076,'Security',0),(282,10077,'Zabbix agent',0),(283,10077,'CPU',0),(284,10077,'Filesystems',0),(285,10077,'General',0),(286,10077,'Memory',0),(287,10077,'Network interfaces',0),(288,10077,'OS',0),(289,10077,'Performance',0),(290,10077,'Processes',0),(291,10077,'Security',0),(292,10078,'Zabbix agent',0),(293,10078,'CPU',0),(294,10078,'Filesystems',0),(295,10078,'General',0),(296,10078,'Memory',0),(297,10078,'Network interfaces',0),(298,10078,'OS',0),(299,10078,'Performance',0),(300,10078,'Processes',0),(301,10078,'Security',0),(302,10079,'Zabbix agent',0),(303,10079,'CPU',0),(304,10079,'Filesystems',0),(305,10079,'General',0),(306,10079,'Memory',0),(307,10079,'Network interfaces',0),(308,10079,'OS',0),(309,10079,'Performance',0),(310,10079,'Processes',0),(311,10079,'Security',0),(319,10081,'General',0),(320,10081,'Performance',0),(321,10081,'Services',0),(322,10081,'Filesystems',0),(323,10081,'OS',0),(324,10081,'Processes',0),(325,10081,'CPU',0),(328,10081,'Memory',0),(329,10081,'Zabbix agent',0),(330,10081,'Network interfaces',0),(331,10076,'Logical partitions',0),(332,10082,'Classes',0),(333,10082,'Compilation',0),(334,10082,'Garbage Collector',0),(335,10082,'Memory',0),(336,10082,'Memory Pool',0),(337,10082,'Operating System',0),(338,10082,'Runtime',0),(339,10082,'Threads',0),(340,10083,'http-8080',0),(341,10083,'http-8443',0),(342,10083,'jk-8009',0),(343,10083,'Sessions',0),(344,10083,'Tomcat',0),(356,10048,'Zabbix proxy',0),(408,10089,'CPU',0),(410,10089,'Memory',0),(412,10089,'General',0),(414,10089,'Storage',0),(416,10091,'CPU',0),(418,10091,'General',0),(420,10091,'Hardware',0),(422,10091,'Memory',0),(424,10089,'Filesystems',0),(428,10089,'Network',0),(433,10088,'Log',0),(434,10088,'Clusters',0),(435,10089,'Disks',0),(437,10089,'Interfaces',0),(443,10091,'Network',0),(445,10091,'Datastore',0),(446,10093,'FTP service',0),(447,10094,'HTTP service',0),(448,10095,'HTTPS service',0),(449,10096,'IMAP service',0),(450,10097,'LDAP service',0),(451,10098,'NNTP service',0),(452,10099,'NTP service',0),(453,10100,'POP service',0),(454,10101,'SMTP service',0),(455,10102,'SSH service',0),(456,10103,'Telnet service',0),(457,10104,'ICMP',0),(458,10088,'General',0),(469,10107,'Zabbix agent',0),(470,10107,'CPU',0),(471,10107,'Filesystems',0),(472,10107,'General',0),(473,10107,'Memory',0),(474,10107,'Network interfaces',0),(475,10107,'OS',0),(476,10107,'Performance',0),(477,10107,'Processes',0),(478,10107,'Security',0);
/*!40000 ALTER TABLE `applications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auditlog`
--

DROP TABLE IF EXISTS `auditlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auditlog` (
  `auditid` bigint(20) unsigned NOT NULL,
  `userid` bigint(20) unsigned NOT NULL,
  `clock` int(11) NOT NULL DEFAULT '0',
  `action` int(11) NOT NULL DEFAULT '0',
  `resourcetype` int(11) NOT NULL DEFAULT '0',
  `details` varchar(128) NOT NULL DEFAULT '0',
  `ip` varchar(39) NOT NULL DEFAULT '',
  `resourceid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `resourcename` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`auditid`),
  KEY `auditlog_1` (`userid`,`clock`),
  KEY `auditlog_2` (`clock`),
  CONSTRAINT `c_auditlog_1` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditlog`
--

LOCK TABLES `auditlog` WRITE;
/*!40000 ALTER TABLE `auditlog` DISABLE KEYS */;
INSERT INTO `auditlog` VALUES (347,1,1523779595,4,0,'','192.168.56.1',0,''),(348,2,1523779595,3,0,'','192.168.56.1',0,''),(349,2,1523779595,3,0,'','192.168.56.1',0,''),(350,1,1523779606,3,0,'','192.168.56.1',0,'');
/*!40000 ALTER TABLE `auditlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auditlog_details`
--

DROP TABLE IF EXISTS `auditlog_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auditlog_details` (
  `auditdetailid` bigint(20) unsigned NOT NULL,
  `auditid` bigint(20) unsigned NOT NULL,
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `field_name` varchar(64) NOT NULL DEFAULT '',
  `oldvalue` text NOT NULL,
  `newvalue` text NOT NULL,
  PRIMARY KEY (`auditdetailid`),
  KEY `auditlog_details_1` (`auditid`),
  CONSTRAINT `c_auditlog_details_1` FOREIGN KEY (`auditid`) REFERENCES `auditlog` (`auditid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditlog_details`
--

LOCK TABLES `auditlog_details` WRITE;
/*!40000 ALTER TABLE `auditlog_details` DISABLE KEYS */;
INSERT INTO `auditlog_details` VALUES (1,5,'hosts','status','1','0'),(2,28,'hosts','proxy_hostid','0','10106'),(3,29,'hosts','proxy_hostid','10106','0'),(4,30,'hosts','proxy_hostid','0','10106'),(5,31,'hosts','proxy_hostid','10106','0'),(6,85,'hosts','proxy_hostid','0','10106'),(7,89,'hosts','proxy_hostid','10106','0'),(8,108,'hosts','host','aliyun185a','47.88.155.185'),(9,108,'hosts','name','aliyun185a','47.88.155.185'),(10,149,'hosts','proxy_hostid','10106','0'),(11,337,'users','passwd','********','********');
/*!40000 ALTER TABLE `auditlog_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `autoreg_host`
--

DROP TABLE IF EXISTS `autoreg_host`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `autoreg_host` (
  `autoreg_hostid` bigint(20) unsigned NOT NULL,
  `proxy_hostid` bigint(20) unsigned DEFAULT NULL,
  `host` varchar(64) NOT NULL DEFAULT '',
  `listen_ip` varchar(39) NOT NULL DEFAULT '',
  `listen_port` int(11) NOT NULL DEFAULT '0',
  `listen_dns` varchar(64) NOT NULL DEFAULT '',
  `host_metadata` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`autoreg_hostid`),
  KEY `autoreg_host_1` (`proxy_hostid`,`host`),
  CONSTRAINT `c_autoreg_host_1` FOREIGN KEY (`proxy_hostid`) REFERENCES `hosts` (`hostid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autoreg_host`
--

LOCK TABLES `autoreg_host` WRITE;
/*!40000 ALTER TABLE `autoreg_host` DISABLE KEYS */;
/*!40000 ALTER TABLE `autoreg_host` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conditions`
--

DROP TABLE IF EXISTS `conditions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conditions` (
  `conditionid` bigint(20) unsigned NOT NULL,
  `actionid` bigint(20) unsigned NOT NULL,
  `conditiontype` int(11) NOT NULL DEFAULT '0',
  `operator` int(11) NOT NULL DEFAULT '0',
  `value` varchar(255) NOT NULL DEFAULT '',
  `value2` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`conditionid`),
  KEY `conditions_1` (`actionid`),
  CONSTRAINT `c_conditions_1` FOREIGN KEY (`actionid`) REFERENCES `actions` (`actionid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conditions`
--

LOCK TABLES `conditions` WRITE;
/*!40000 ALTER TABLE `conditions` DISABLE KEYS */;
INSERT INTO `conditions` VALUES (2,2,10,0,'0',''),(3,2,8,0,'9',''),(4,2,12,2,'Linux',''),(6,4,23,0,'0',''),(7,5,23,0,'2',''),(8,6,23,0,'4','');
/*!40000 ALTER TABLE `conditions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config`
--

DROP TABLE IF EXISTS `config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config` (
  `configid` bigint(20) unsigned NOT NULL,
  `refresh_unsupported` varchar(32) NOT NULL DEFAULT '10m',
  `work_period` varchar(255) NOT NULL DEFAULT '1-5,09:00-18:00',
  `alert_usrgrpid` bigint(20) unsigned DEFAULT NULL,
  `event_ack_enable` int(11) NOT NULL DEFAULT '1',
  `event_expire` varchar(32) NOT NULL DEFAULT '1w',
  `event_show_max` int(11) NOT NULL DEFAULT '100',
  `default_theme` varchar(128) NOT NULL DEFAULT 'blue-theme',
  `authentication_type` int(11) NOT NULL DEFAULT '0',
  `ldap_host` varchar(255) NOT NULL DEFAULT '',
  `ldap_port` int(11) NOT NULL DEFAULT '389',
  `ldap_base_dn` varchar(255) NOT NULL DEFAULT '',
  `ldap_bind_dn` varchar(255) NOT NULL DEFAULT '',
  `ldap_bind_password` varchar(128) NOT NULL DEFAULT '',
  `ldap_search_attribute` varchar(128) NOT NULL DEFAULT '',
  `dropdown_first_entry` int(11) NOT NULL DEFAULT '1',
  `dropdown_first_remember` int(11) NOT NULL DEFAULT '1',
  `discovery_groupid` bigint(20) unsigned NOT NULL,
  `max_in_table` int(11) NOT NULL DEFAULT '50',
  `search_limit` int(11) NOT NULL DEFAULT '1000',
  `severity_color_0` varchar(6) NOT NULL DEFAULT '97AAB3',
  `severity_color_1` varchar(6) NOT NULL DEFAULT '7499FF',
  `severity_color_2` varchar(6) NOT NULL DEFAULT 'FFC859',
  `severity_color_3` varchar(6) NOT NULL DEFAULT 'FFA059',
  `severity_color_4` varchar(6) NOT NULL DEFAULT 'E97659',
  `severity_color_5` varchar(6) NOT NULL DEFAULT 'E45959',
  `severity_name_0` varchar(32) NOT NULL DEFAULT 'Not classified',
  `severity_name_1` varchar(32) NOT NULL DEFAULT 'Information',
  `severity_name_2` varchar(32) NOT NULL DEFAULT 'Warning',
  `severity_name_3` varchar(32) NOT NULL DEFAULT 'Average',
  `severity_name_4` varchar(32) NOT NULL DEFAULT 'High',
  `severity_name_5` varchar(32) NOT NULL DEFAULT 'Disaster',
  `ok_period` varchar(32) NOT NULL DEFAULT '30m',
  `blink_period` varchar(32) NOT NULL DEFAULT '30m',
  `problem_unack_color` varchar(6) NOT NULL DEFAULT 'DC0000',
  `problem_ack_color` varchar(6) NOT NULL DEFAULT 'DC0000',
  `ok_unack_color` varchar(6) NOT NULL DEFAULT '00AA00',
  `ok_ack_color` varchar(6) NOT NULL DEFAULT '00AA00',
  `problem_unack_style` int(11) NOT NULL DEFAULT '1',
  `problem_ack_style` int(11) NOT NULL DEFAULT '1',
  `ok_unack_style` int(11) NOT NULL DEFAULT '1',
  `ok_ack_style` int(11) NOT NULL DEFAULT '1',
  `snmptrap_logging` int(11) NOT NULL DEFAULT '1',
  `server_check_interval` int(11) NOT NULL DEFAULT '10',
  `hk_events_mode` int(11) NOT NULL DEFAULT '1',
  `hk_events_trigger` varchar(32) NOT NULL DEFAULT '365d',
  `hk_events_internal` varchar(32) NOT NULL DEFAULT '1d',
  `hk_events_discovery` varchar(32) NOT NULL DEFAULT '1d',
  `hk_events_autoreg` varchar(32) NOT NULL DEFAULT '1d',
  `hk_services_mode` int(11) NOT NULL DEFAULT '1',
  `hk_services` varchar(32) NOT NULL DEFAULT '365d',
  `hk_audit_mode` int(11) NOT NULL DEFAULT '1',
  `hk_audit` varchar(32) NOT NULL DEFAULT '365d',
  `hk_sessions_mode` int(11) NOT NULL DEFAULT '1',
  `hk_sessions` varchar(32) NOT NULL DEFAULT '365d',
  `hk_history_mode` int(11) NOT NULL DEFAULT '1',
  `hk_history_global` int(11) NOT NULL DEFAULT '0',
  `hk_history` varchar(32) NOT NULL DEFAULT '90d',
  `hk_trends_mode` int(11) NOT NULL DEFAULT '1',
  `hk_trends_global` int(11) NOT NULL DEFAULT '0',
  `hk_trends` varchar(32) NOT NULL DEFAULT '365d',
  `default_inventory_mode` int(11) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`configid`),
  KEY `config_1` (`alert_usrgrpid`),
  KEY `config_2` (`discovery_groupid`),
  CONSTRAINT `c_config_1` FOREIGN KEY (`alert_usrgrpid`) REFERENCES `usrgrp` (`usrgrpid`),
  CONSTRAINT `c_config_2` FOREIGN KEY (`discovery_groupid`) REFERENCES `groups` (`groupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config`
--

LOCK TABLES `config` WRITE;
/*!40000 ALTER TABLE `config` DISABLE KEYS */;
INSERT INTO `config` VALUES (1,'10m','1-5,09:00-18:00',7,1,'1w',100,'blue-theme',0,'',389,'','','','',1,1,5,50,1000,'97AAB3','7499FF','FFC859','FFA059','E97659','E45959','Not classified','Information','Warning','Average','High','Disaster','30m','30m','DC0000','DC0000','00AA00','00AA00',1,1,1,1,1,10,1,'365d','365d','365d','365d',1,'365d',1,'365d',1,'365d',1,0,'90d',1,0,'365d',-1);
/*!40000 ALTER TABLE `config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `corr_condition`
--

DROP TABLE IF EXISTS `corr_condition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `corr_condition` (
  `corr_conditionid` bigint(20) unsigned NOT NULL,
  `correlationid` bigint(20) unsigned NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`corr_conditionid`),
  KEY `corr_condition_1` (`correlationid`),
  CONSTRAINT `c_corr_condition_1` FOREIGN KEY (`correlationid`) REFERENCES `correlation` (`correlationid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `corr_condition`
--

LOCK TABLES `corr_condition` WRITE;
/*!40000 ALTER TABLE `corr_condition` DISABLE KEYS */;
/*!40000 ALTER TABLE `corr_condition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `corr_condition_group`
--

DROP TABLE IF EXISTS `corr_condition_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `corr_condition_group` (
  `corr_conditionid` bigint(20) unsigned NOT NULL,
  `operator` int(11) NOT NULL DEFAULT '0',
  `groupid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`corr_conditionid`),
  KEY `corr_condition_group_1` (`groupid`),
  CONSTRAINT `c_corr_condition_group_1` FOREIGN KEY (`corr_conditionid`) REFERENCES `corr_condition` (`corr_conditionid`) ON DELETE CASCADE,
  CONSTRAINT `c_corr_condition_group_2` FOREIGN KEY (`groupid`) REFERENCES `groups` (`groupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `corr_condition_group`
--

LOCK TABLES `corr_condition_group` WRITE;
/*!40000 ALTER TABLE `corr_condition_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `corr_condition_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `corr_condition_tag`
--

DROP TABLE IF EXISTS `corr_condition_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `corr_condition_tag` (
  `corr_conditionid` bigint(20) unsigned NOT NULL,
  `tag` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`corr_conditionid`),
  CONSTRAINT `c_corr_condition_tag_1` FOREIGN KEY (`corr_conditionid`) REFERENCES `corr_condition` (`corr_conditionid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `corr_condition_tag`
--

LOCK TABLES `corr_condition_tag` WRITE;
/*!40000 ALTER TABLE `corr_condition_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `corr_condition_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `corr_condition_tagpair`
--

DROP TABLE IF EXISTS `corr_condition_tagpair`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `corr_condition_tagpair` (
  `corr_conditionid` bigint(20) unsigned NOT NULL,
  `oldtag` varchar(255) NOT NULL DEFAULT '',
  `newtag` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`corr_conditionid`),
  CONSTRAINT `c_corr_condition_tagpair_1` FOREIGN KEY (`corr_conditionid`) REFERENCES `corr_condition` (`corr_conditionid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `corr_condition_tagpair`
--

LOCK TABLES `corr_condition_tagpair` WRITE;
/*!40000 ALTER TABLE `corr_condition_tagpair` DISABLE KEYS */;
/*!40000 ALTER TABLE `corr_condition_tagpair` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `corr_condition_tagvalue`
--

DROP TABLE IF EXISTS `corr_condition_tagvalue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `corr_condition_tagvalue` (
  `corr_conditionid` bigint(20) unsigned NOT NULL,
  `tag` varchar(255) NOT NULL DEFAULT '',
  `operator` int(11) NOT NULL DEFAULT '0',
  `value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`corr_conditionid`),
  CONSTRAINT `c_corr_condition_tagvalue_1` FOREIGN KEY (`corr_conditionid`) REFERENCES `corr_condition` (`corr_conditionid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `corr_condition_tagvalue`
--

LOCK TABLES `corr_condition_tagvalue` WRITE;
/*!40000 ALTER TABLE `corr_condition_tagvalue` DISABLE KEYS */;
/*!40000 ALTER TABLE `corr_condition_tagvalue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `corr_operation`
--

DROP TABLE IF EXISTS `corr_operation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `corr_operation` (
  `corr_operationid` bigint(20) unsigned NOT NULL,
  `correlationid` bigint(20) unsigned NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`corr_operationid`),
  KEY `corr_operation_1` (`correlationid`),
  CONSTRAINT `c_corr_operation_1` FOREIGN KEY (`correlationid`) REFERENCES `correlation` (`correlationid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `corr_operation`
--

LOCK TABLES `corr_operation` WRITE;
/*!40000 ALTER TABLE `corr_operation` DISABLE KEYS */;
/*!40000 ALTER TABLE `corr_operation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `correlation`
--

DROP TABLE IF EXISTS `correlation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `correlation` (
  `correlationid` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `evaltype` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `formula` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`correlationid`),
  UNIQUE KEY `correlation_2` (`name`),
  KEY `correlation_1` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `correlation`
--

LOCK TABLES `correlation` WRITE;
/*!40000 ALTER TABLE `correlation` DISABLE KEYS */;
/*!40000 ALTER TABLE `correlation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard`
--

DROP TABLE IF EXISTS `dashboard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dashboard` (
  `dashboardid` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `userid` bigint(20) unsigned NOT NULL,
  `private` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`dashboardid`),
  KEY `c_dashboard_1` (`userid`),
  CONSTRAINT `c_dashboard_1` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard`
--

LOCK TABLES `dashboard` WRITE;
/*!40000 ALTER TABLE `dashboard` DISABLE KEYS */;
INSERT INTO `dashboard` VALUES (1,'Dashboard',1,0);
/*!40000 ALTER TABLE `dashboard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_user`
--

DROP TABLE IF EXISTS `dashboard_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dashboard_user` (
  `dashboard_userid` bigint(20) unsigned NOT NULL,
  `dashboardid` bigint(20) unsigned NOT NULL,
  `userid` bigint(20) unsigned NOT NULL,
  `permission` int(11) NOT NULL DEFAULT '2',
  PRIMARY KEY (`dashboard_userid`),
  UNIQUE KEY `dashboard_user_1` (`dashboardid`,`userid`),
  KEY `c_dashboard_user_2` (`userid`),
  CONSTRAINT `c_dashboard_user_1` FOREIGN KEY (`dashboardid`) REFERENCES `dashboard` (`dashboardid`) ON DELETE CASCADE,
  CONSTRAINT `c_dashboard_user_2` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_user`
--

LOCK TABLES `dashboard_user` WRITE;
/*!40000 ALTER TABLE `dashboard_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboard_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_usrgrp`
--

DROP TABLE IF EXISTS `dashboard_usrgrp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dashboard_usrgrp` (
  `dashboard_usrgrpid` bigint(20) unsigned NOT NULL,
  `dashboardid` bigint(20) unsigned NOT NULL,
  `usrgrpid` bigint(20) unsigned NOT NULL,
  `permission` int(11) NOT NULL DEFAULT '2',
  PRIMARY KEY (`dashboard_usrgrpid`),
  UNIQUE KEY `dashboard_usrgrp_1` (`dashboardid`,`usrgrpid`),
  KEY `c_dashboard_usrgrp_2` (`usrgrpid`),
  CONSTRAINT `c_dashboard_usrgrp_1` FOREIGN KEY (`dashboardid`) REFERENCES `dashboard` (`dashboardid`) ON DELETE CASCADE,
  CONSTRAINT `c_dashboard_usrgrp_2` FOREIGN KEY (`usrgrpid`) REFERENCES `usrgrp` (`usrgrpid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_usrgrp`
--

LOCK TABLES `dashboard_usrgrp` WRITE;
/*!40000 ALTER TABLE `dashboard_usrgrp` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboard_usrgrp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dbversion`
--

DROP TABLE IF EXISTS `dbversion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dbversion` (
  `mandatory` int(11) NOT NULL DEFAULT '0',
  `optional` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbversion`
--

LOCK TABLES `dbversion` WRITE;
/*!40000 ALTER TABLE `dbversion` DISABLE KEYS */;
INSERT INTO `dbversion` VALUES (3040000,3040007);
/*!40000 ALTER TABLE `dbversion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dchecks`
--

DROP TABLE IF EXISTS `dchecks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dchecks` (
  `dcheckid` bigint(20) unsigned NOT NULL,
  `druleid` bigint(20) unsigned NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  `key_` varchar(512) NOT NULL DEFAULT '',
  `snmp_community` varchar(255) NOT NULL DEFAULT '',
  `ports` varchar(255) NOT NULL DEFAULT '0',
  `snmpv3_securityname` varchar(64) NOT NULL DEFAULT '',
  `snmpv3_securitylevel` int(11) NOT NULL DEFAULT '0',
  `snmpv3_authpassphrase` varchar(64) NOT NULL DEFAULT '',
  `snmpv3_privpassphrase` varchar(64) NOT NULL DEFAULT '',
  `uniq` int(11) NOT NULL DEFAULT '0',
  `snmpv3_authprotocol` int(11) NOT NULL DEFAULT '0',
  `snmpv3_privprotocol` int(11) NOT NULL DEFAULT '0',
  `snmpv3_contextname` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`dcheckid`),
  KEY `dchecks_1` (`druleid`),
  CONSTRAINT `c_dchecks_1` FOREIGN KEY (`druleid`) REFERENCES `drules` (`druleid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dchecks`
--

LOCK TABLES `dchecks` WRITE;
/*!40000 ALTER TABLE `dchecks` DISABLE KEYS */;
/*!40000 ALTER TABLE `dchecks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dhosts`
--

DROP TABLE IF EXISTS `dhosts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dhosts` (
  `dhostid` bigint(20) unsigned NOT NULL,
  `druleid` bigint(20) unsigned NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `lastup` int(11) NOT NULL DEFAULT '0',
  `lastdown` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`dhostid`),
  KEY `dhosts_1` (`druleid`),
  CONSTRAINT `c_dhosts_1` FOREIGN KEY (`druleid`) REFERENCES `drules` (`druleid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dhosts`
--

LOCK TABLES `dhosts` WRITE;
/*!40000 ALTER TABLE `dhosts` DISABLE KEYS */;
/*!40000 ALTER TABLE `dhosts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drules`
--

DROP TABLE IF EXISTS `drules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drules` (
  `druleid` bigint(20) unsigned NOT NULL,
  `proxy_hostid` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `iprange` varchar(2048) NOT NULL DEFAULT '',
  `delay` varchar(255) NOT NULL DEFAULT '1h',
  `nextcheck` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`druleid`),
  UNIQUE KEY `drules_2` (`name`),
  KEY `drules_1` (`proxy_hostid`),
  CONSTRAINT `c_drules_1` FOREIGN KEY (`proxy_hostid`) REFERENCES `hosts` (`hostid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drules`
--

LOCK TABLES `drules` WRITE;
/*!40000 ALTER TABLE `drules` DISABLE KEYS */;
/*!40000 ALTER TABLE `drules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dservices`
--

DROP TABLE IF EXISTS `dservices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dservices` (
  `dserviceid` bigint(20) unsigned NOT NULL,
  `dhostid` bigint(20) unsigned NOT NULL,
  `value` varchar(255) NOT NULL DEFAULT '',
  `port` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `lastup` int(11) NOT NULL DEFAULT '0',
  `lastdown` int(11) NOT NULL DEFAULT '0',
  `dcheckid` bigint(20) unsigned NOT NULL,
  `ip` varchar(39) NOT NULL DEFAULT '',
  `dns` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`dserviceid`),
  UNIQUE KEY `dservices_1` (`dcheckid`,`ip`,`port`),
  KEY `dservices_2` (`dhostid`),
  CONSTRAINT `c_dservices_1` FOREIGN KEY (`dhostid`) REFERENCES `dhosts` (`dhostid`) ON DELETE CASCADE,
  CONSTRAINT `c_dservices_2` FOREIGN KEY (`dcheckid`) REFERENCES `dchecks` (`dcheckid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dservices`
--

LOCK TABLES `dservices` WRITE;
/*!40000 ALTER TABLE `dservices` DISABLE KEYS */;
/*!40000 ALTER TABLE `dservices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `escalations`
--

DROP TABLE IF EXISTS `escalations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `escalations` (
  `escalationid` bigint(20) unsigned NOT NULL,
  `actionid` bigint(20) unsigned NOT NULL,
  `triggerid` bigint(20) unsigned DEFAULT NULL,
  `eventid` bigint(20) unsigned DEFAULT NULL,
  `r_eventid` bigint(20) unsigned DEFAULT NULL,
  `nextcheck` int(11) NOT NULL DEFAULT '0',
  `esc_step` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `itemid` bigint(20) unsigned DEFAULT NULL,
  `acknowledgeid` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`escalationid`),
  UNIQUE KEY `escalations_1` (`actionid`,`triggerid`,`itemid`,`escalationid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `escalations`
--

LOCK TABLES `escalations` WRITE;
/*!40000 ALTER TABLE `escalations` DISABLE KEYS */;
/*!40000 ALTER TABLE `escalations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_recovery`
--

DROP TABLE IF EXISTS `event_recovery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_recovery` (
  `eventid` bigint(20) unsigned NOT NULL,
  `r_eventid` bigint(20) unsigned NOT NULL,
  `c_eventid` bigint(20) unsigned DEFAULT NULL,
  `correlationid` bigint(20) unsigned DEFAULT NULL,
  `userid` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`eventid`),
  KEY `event_recovery_1` (`r_eventid`),
  KEY `event_recovery_2` (`c_eventid`),
  CONSTRAINT `c_event_recovery_1` FOREIGN KEY (`eventid`) REFERENCES `events` (`eventid`) ON DELETE CASCADE,
  CONSTRAINT `c_event_recovery_2` FOREIGN KEY (`r_eventid`) REFERENCES `events` (`eventid`) ON DELETE CASCADE,
  CONSTRAINT `c_event_recovery_3` FOREIGN KEY (`c_eventid`) REFERENCES `events` (`eventid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_recovery`
--

LOCK TABLES `event_recovery` WRITE;
/*!40000 ALTER TABLE `event_recovery` DISABLE KEYS */;
INSERT INTO `event_recovery` VALUES (11712,12222,NULL,NULL,NULL),(12221,12223,NULL,NULL,NULL),(12227,12229,NULL,NULL,NULL),(13246,13767,NULL,NULL,NULL),(13247,13768,NULL,NULL,NULL),(13248,13257,NULL,NULL,NULL),(13249,13769,NULL,NULL,NULL),(13250,116390,NULL,NULL,NULL),(13251,116391,NULL,NULL,NULL),(13253,13770,NULL,NULL,NULL),(13254,13771,NULL,NULL,NULL),(13255,13258,NULL,NULL,NULL),(13256,13772,NULL,NULL,NULL),(116389,116392,NULL,NULL,NULL),(119949,119950,NULL,NULL,NULL),(344487,800555,NULL,NULL,NULL),(344488,800556,NULL,NULL,NULL),(800165,800170,NULL,NULL,NULL),(800166,800389,NULL,NULL,NULL),(800167,800171,NULL,NULL,NULL),(800168,800172,NULL,NULL,NULL),(800169,800173,NULL,NULL,NULL),(800304,800305,NULL,NULL,NULL),(800386,800394,NULL,NULL,NULL),(800387,800390,NULL,NULL,NULL),(800388,800391,NULL,NULL,NULL),(800397,800403,NULL,NULL,NULL),(800398,800404,NULL,NULL,NULL),(800405,800406,NULL,NULL,NULL),(800407,800420,NULL,NULL,NULL),(800408,800416,NULL,NULL,NULL),(800409,800419,NULL,NULL,NULL),(800414,800417,NULL,NULL,NULL),(800415,800418,NULL,NULL,NULL),(800433,800504,NULL,NULL,NULL),(800505,800532,NULL,NULL,NULL),(800506,800515,NULL,NULL,NULL),(800507,800514,NULL,NULL,NULL),(800508,800509,NULL,NULL,NULL),(800516,800519,NULL,NULL,NULL),(800517,800533,NULL,NULL,NULL),(800518,800538,NULL,NULL,NULL),(800520,800529,NULL,NULL,NULL),(800521,800531,NULL,NULL,NULL),(800522,800536,NULL,NULL,NULL),(800523,800530,NULL,NULL,NULL),(800524,800535,NULL,NULL,NULL),(800534,800537,NULL,NULL,NULL),(801915,801924,NULL,NULL,NULL),(801916,801925,NULL,NULL,NULL),(801917,801919,NULL,NULL,NULL),(801918,801926,NULL,NULL,NULL);
/*!40000 ALTER TABLE `event_recovery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_tag`
--

DROP TABLE IF EXISTS `event_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_tag` (
  `eventtagid` bigint(20) unsigned NOT NULL,
  `eventid` bigint(20) unsigned NOT NULL,
  `tag` varchar(255) NOT NULL DEFAULT '',
  `value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`eventtagid`),
  KEY `event_tag_1` (`eventid`),
  CONSTRAINT `c_event_tag_1` FOREIGN KEY (`eventid`) REFERENCES `events` (`eventid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_tag`
--

LOCK TABLES `event_tag` WRITE;
/*!40000 ALTER TABLE `event_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `events` (
  `eventid` bigint(20) unsigned NOT NULL,
  `source` int(11) NOT NULL DEFAULT '0',
  `object` int(11) NOT NULL DEFAULT '0',
  `objectid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `clock` int(11) NOT NULL DEFAULT '0',
  `value` int(11) NOT NULL DEFAULT '0',
  `acknowledged` int(11) NOT NULL DEFAULT '0',
  `ns` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`eventid`),
  KEY `events_1` (`source`,`object`,`objectid`,`clock`),
  KEY `events_2` (`source`,`object`,`clock`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` VALUES (1,0,0,13470,1523778695,1,0,297835203),(2,1,2,1,1523778697,2,0,0),(3,1,2,1,1523778697,0,0,0),(4,1,1,1,1523778697,2,0,0),(5,1,1,1,1523778697,0,0,0),(6,1,2,2,1523778697,2,0,0),(7,1,2,2,1523778697,0,0,0),(8,1,1,2,1523778697,2,0,0),(9,1,1,2,1523778697,0,0,0);
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expressions`
--

DROP TABLE IF EXISTS `expressions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `expressions` (
  `expressionid` bigint(20) unsigned NOT NULL,
  `regexpid` bigint(20) unsigned NOT NULL,
  `expression` varchar(255) NOT NULL DEFAULT '',
  `expression_type` int(11) NOT NULL DEFAULT '0',
  `exp_delimiter` varchar(1) NOT NULL DEFAULT '',
  `case_sensitive` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`expressionid`),
  KEY `expressions_1` (`regexpid`),
  CONSTRAINT `c_expressions_1` FOREIGN KEY (`regexpid`) REFERENCES `regexps` (`regexpid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expressions`
--

LOCK TABLES `expressions` WRITE;
/*!40000 ALTER TABLE `expressions` DISABLE KEYS */;
INSERT INTO `expressions` VALUES (1,1,'^(btrfs|ext2|ext3|ext4|jfs|reiser|xfs|ffs|ufs|jfs|jfs2|vxfs|hfs|refs|ntfs|fat32|zfs)$',3,',',0),(2,2,'^lo$',4,',',1),(3,3,'^(Physical memory|Virtual memory|Memory buffers|Cached memory|Swap space)$',4,',',1),(4,2,'^Software Loopback Interface',4,',',1),(5,4,'^(MMCSS|gupdate|SysmonLog|clr_optimization_v2.0.50727_32|clr_optimization_v4.0.30319_32)$',4,',',1),(6,5,'^(automatic|automatic delayed)$',3,',',1);
/*!40000 ALTER TABLE `expressions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `functions`
--

DROP TABLE IF EXISTS `functions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `functions` (
  `functionid` bigint(20) unsigned NOT NULL,
  `itemid` bigint(20) unsigned NOT NULL,
  `triggerid` bigint(20) unsigned NOT NULL,
  `function` varchar(12) NOT NULL DEFAULT '',
  `parameter` varchar(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`functionid`),
  KEY `functions_1` (`triggerid`),
  KEY `functions_2` (`itemid`,`function`,`parameter`),
  CONSTRAINT `c_functions_1` FOREIGN KEY (`itemid`) REFERENCES `items` (`itemid`) ON DELETE CASCADE,
  CONSTRAINT `c_functions_2` FOREIGN KEY (`triggerid`) REFERENCES `triggers` (`triggerid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `functions`
--

LOCK TABLES `functions` WRITE;
/*!40000 ALTER TABLE `functions` DISABLE KEYS */;
INSERT INTO `functions` VALUES (10199,10019,10016,'diff','0'),(10204,10055,10041,'last','0'),(10207,10058,10044,'diff','0'),(10208,10057,10043,'diff','0'),(12144,22181,13000,'last','0'),(12549,22232,13025,'nodata','5m'),(12550,10020,10047,'nodata','5m'),(12553,10056,10042,'last','0'),(12580,17350,10012,'last','0'),(12583,10025,10021,'change','0'),(12592,22686,13266,'last','0'),(12598,22454,13272,'last','0'),(12641,22189,13015,'min','10m'),(12645,22183,13073,'min','10m'),(12646,22191,13074,'min','10m'),(12649,22185,13019,'min','10m'),(12651,22396,13017,'min','10m'),(12653,22219,13023,'min','10m'),(12671,22704,13287,'diff','0'),(12672,22726,13288,'diff','0'),(12673,22741,13289,'diff','0'),(12675,22757,13291,'last','0'),(12676,22756,13291,'last','0'),(12677,22766,13292,'last','0'),(12678,22764,13292,'last','0'),(12679,22773,13293,'last','0'),(12680,22771,13293,'last','0'),(12681,22785,13294,'diff','0'),(12682,22808,13295,'last','0'),(12683,22808,13296,'last','0'),(12684,22809,13297,'last','0'),(12685,22809,13298,'last','0'),(12686,22810,13299,'last','0'),(12687,22810,13300,'last','0'),(12688,22811,13301,'last','0'),(12689,22811,13302,'last','0'),(12690,22800,13303,'last','0'),(12691,22800,13304,'last','0'),(12692,22801,13305,'last','0'),(12693,22812,13306,'last','0'),(12694,22801,13307,'last','0'),(12695,22812,13308,'last','0'),(12696,22802,13309,'last','0'),(12697,22813,13310,'last','0'),(12698,22802,13311,'last','0'),(12699,22813,13312,'last','0'),(12700,22814,13313,'last','0'),(12701,22803,13314,'last','0'),(12702,22814,13315,'last','0'),(12703,22803,13316,'last','0'),(12704,22804,13317,'last','0'),(12705,22804,13318,'last','0'),(12706,22815,13319,'last','0'),(12707,22815,13320,'last','0'),(12708,22816,13321,'last','0'),(12709,22805,13322,'last','0'),(12710,22817,13323,'last','0'),(12711,22817,13324,'last','0'),(12712,22818,13325,'last','0'),(12713,22818,13326,'last','0'),(12715,22833,13328,'nodata','5m'),(12717,22835,13330,'last','0'),(12718,22836,13331,'last','0'),(12723,22853,13336,'diff','0'),(12724,22856,13337,'last','0'),(12725,22858,13338,'diff','0'),(12726,22859,13339,'change','0'),(12727,22861,13340,'diff','0'),(12728,22862,13341,'last','0'),(12729,22869,13342,'last','0'),(12730,22872,13343,'last','0'),(12731,22873,13344,'nodata','5m'),(12733,22875,13346,'last','0'),(12734,22876,13347,'last','0'),(12739,22893,13352,'diff','0'),(12740,22896,13353,'last','0'),(12741,22898,13354,'diff','0'),(12742,22899,13355,'change','0'),(12743,22901,13356,'diff','0'),(12744,22902,13357,'last','0'),(12745,22909,13358,'last','0'),(12746,22912,13359,'last','0'),(12747,22913,13360,'nodata','5m'),(12755,22933,13368,'diff','0'),(12757,22938,13370,'diff','0'),(12758,22939,13371,'change','0'),(12759,22941,13372,'diff','0'),(12760,22942,13373,'last','0'),(12761,22949,13374,'last','0'),(12762,22952,13375,'last','0'),(12763,22953,13376,'nodata','5m'),(12771,22973,13384,'diff','0'),(12773,22978,13386,'diff','0'),(12775,22981,13388,'diff','0'),(12776,22982,13389,'last','0'),(12777,22989,13390,'last','0'),(12778,22992,13391,'last','0'),(12779,22993,13392,'nodata','5m'),(12782,22996,13395,'last','0'),(12787,23013,13400,'diff','0'),(12788,23016,13401,'last','0'),(12789,23018,13402,'diff','0'),(12790,23019,13403,'change','0'),(12791,23021,13404,'diff','0'),(12792,23022,13405,'last','0'),(12793,23029,13406,'last','0'),(12794,23032,13407,'last','0'),(12795,23033,13408,'nodata','5m'),(12797,23035,13410,'last','0'),(12798,23036,13411,'last','0'),(12803,23053,13416,'diff','0'),(12805,23058,13418,'diff','0'),(12806,23059,13419,'change','0'),(12807,23061,13420,'diff','0'),(12808,23062,13421,'last','0'),(12809,23069,13422,'last','0'),(12810,23072,13423,'last','0'),(12812,23149,13425,'diff','0'),(12815,23150,13428,'change','0'),(12818,23668,13431,'min','10m'),(12820,23158,13433,'last','0'),(12824,23160,13437,'nodata','5m'),(12826,23165,13439,'last','0'),(12830,23226,13442,'last','0'),(12831,23227,13442,'last','0'),(12832,23235,13443,'last','0'),(12833,23236,13443,'last','0'),(12834,23243,13444,'last','0'),(12835,23244,13444,'last','0'),(12836,23193,13445,'last','0'),(12837,23192,13445,'last','0'),(12838,23196,13446,'last','0'),(12839,23195,13446,'last','0'),(12840,23199,13447,'last','0'),(12841,23198,13447,'last','0'),(12842,23202,13448,'last','0'),(12843,23201,13448,'last','0'),(12844,23205,13449,'last','0'),(12845,23204,13449,'last','0'),(12846,23208,13450,'last','0'),(12847,23207,13450,'last','0'),(12848,23211,13451,'last','0'),(12849,23210,13451,'last','0'),(12850,23214,13452,'last','0'),(12851,23213,13452,'last','0'),(12852,23183,13453,'last','0'),(12853,23177,13453,'last','0'),(12854,23179,13454,'last','0'),(12855,23181,13454,'last','0'),(12856,23186,13455,'last','0'),(12857,23187,13455,'last','0'),(12858,23222,13456,'str','off'),(12859,23231,13457,'str','off'),(12860,23191,13458,'last','0'),(12861,23192,13458,'last','0'),(12862,23194,13459,'last','0'),(12863,23195,13459,'last','0'),(12864,23197,13460,'last','0'),(12865,23198,13460,'last','0'),(12866,23200,13461,'last','0'),(12867,23201,13461,'last','0'),(12868,23203,13462,'last','0'),(12869,23204,13462,'last','0'),(12870,23206,13463,'last','0'),(12871,23207,13463,'last','0'),(12872,23209,13464,'last','0'),(12873,23210,13464,'last','0'),(12874,23188,13465,'nodata','5m'),(12926,22231,13026,'diff','0'),(12927,10059,10045,'diff','0'),(12929,22834,13329,'diff','0'),(12930,22874,13345,'diff','0'),(12931,22914,13361,'diff','0'),(12932,22954,13377,'diff','0'),(12933,22994,13393,'diff','0'),(12934,23034,13409,'diff','0'),(12935,23161,13438,'diff','0'),(12936,23318,13507,'diff','0'),(12937,23319,13508,'diff','0'),(12939,23320,13510,'diff','0'),(12940,23321,13511,'diff','0'),(12941,23322,13512,'diff','0'),(12942,23323,13513,'diff','0'),(12943,23324,13514,'diff','0'),(12944,23325,13515,'diff','0'),(12945,23326,13516,'diff','0'),(12946,23357,13517,'min','10m'),(12947,23342,13518,'min','10m'),(12948,23341,13519,'min','10m'),(12949,23359,13520,'min','10m'),(12965,23634,13536,'min','10m'),(12967,23212,13466,'str','Client'),(12968,23637,13538,'last','0'),(12969,23638,13539,'last','0'),(12970,23640,13539,'last','0'),(12971,23642,13540,'last','0'),(12972,23643,13540,'last','0'),(12973,23639,13541,'last','0'),(12974,23640,13541,'last','0'),(12975,23641,13542,'last','0'),(12976,23643,13542,'last','0'),(12977,23636,13543,'str','Server'),(12994,23644,13544,'max','#3'),(12995,23645,13545,'max','#3'),(12996,23646,13546,'max','#3'),(12997,23647,13547,'max','#3'),(12998,23648,13548,'max','#3'),(13068,23115,13367,'avg','5m'),(13069,22922,13366,'avg','5m'),(13070,22918,13365,'avg','5m'),(13071,22917,13364,'avg','5m'),(13072,22882,13350,'avg','5m'),(13073,22878,13349,'avg','5m'),(13074,22877,13348,'avg','5m'),(13075,22962,13382,'avg','5m'),(13078,10010,10010,'avg','5m'),(13080,17362,13243,'avg','5m'),(13082,10009,10190,'avg','5m'),(13084,10013,10011,'avg','5m'),(13086,23042,13414,'avg','5m'),(13087,22842,13334,'avg','5m'),(13088,22838,13333,'avg','5m'),(13089,22837,13332,'avg','5m'),(13090,23007,13399,'avg','5m'),(13091,23002,13398,'avg','5m'),(13092,22998,13397,'avg','5m'),(13093,22997,13396,'avg','5m'),(13094,23143,13435,'avg','5m'),(13095,23140,13430,'avg','5m'),(13096,23655,13554,'max','#3'),(13097,23656,13555,'avg','5m'),(13098,23657,13556,'min','5m'),(13152,23651,13551,'max','#3'),(13154,23649,13549,'max','#3'),(13155,22819,13327,'last','0'),(13156,23650,13550,'max','#3'),(13157,23652,13552,'max','#3'),(13158,23653,13553,'max','#3'),(13159,23654,13285,'max','#3'),(13160,23661,13557,'last',''),(13164,22424,13080,'avg','10m'),(13168,22410,13082,'avg','10m'),(13170,22412,13081,'avg','10m'),(13172,22430,13083,'avg','10m'),(13174,22422,13084,'avg','10m'),(13176,22406,13085,'avg','10m'),(13178,22408,13086,'avg','30m'),(13180,22402,13087,'avg','10m'),(13182,22418,13088,'avg','10m'),(13184,22416,13089,'avg','10m'),(13186,22689,13275,'avg','10m'),(13188,22399,13091,'avg','10m'),(13190,22420,13092,'avg','10m'),(13192,22414,13093,'min','10m'),(13194,23171,13441,'avg','10m'),(13196,23663,13559,'avg','10m'),(13198,22426,13094,'avg','10m'),(13200,22404,13095,'avg','10m'),(13202,22400,13096,'avg','10m'),(13204,22401,13097,'avg','10m'),(13206,23347,13521,'avg','10m'),(13207,23360,13534,'avg','10m'),(13208,23352,13522,'avg','10m'),(13209,23351,13535,'avg','10m'),(13210,23350,13523,'avg','10m'),(13211,23353,13524,'avg','30m'),(13212,23354,13525,'avg','10m'),(13213,23356,13526,'avg','10m'),(13214,23355,13527,'avg','10m'),(13215,23349,13528,'avg','10m'),(13216,23348,13529,'avg','10m'),(13217,23343,13530,'avg','10m'),(13218,23344,13531,'avg','10m'),(13219,23345,13532,'avg','10m'),(13220,23346,13533,'avg','10m'),(13221,23666,13561,'min','#3'),(13245,25426,13585,'diff','0'),(13246,25427,13586,'nodata','5m'),(13247,25428,13587,'diff','0'),(13248,25436,13588,'avg','5m'),(13249,25431,13589,'avg','5m'),(13250,25450,13590,'last','0'),(13251,25455,13591,'diff','0'),(13252,25453,13592,'change','0'),(13253,25430,13593,'last','0'),(13254,25429,13594,'last','0'),(13255,25447,13595,'diff','0'),(13256,25452,13596,'diff','0'),(13257,25432,13597,'avg','5m'),(13258,25456,13598,'last','0'),(13259,25441,13599,'avg','5m'),(13260,25463,13600,'last','0'),(13261,25466,13601,'last','0');
/*!40000 ALTER TABLE `functions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `globalmacro`
--

DROP TABLE IF EXISTS `globalmacro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `globalmacro` (
  `globalmacroid` bigint(20) unsigned NOT NULL,
  `macro` varchar(255) NOT NULL DEFAULT '',
  `value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`globalmacroid`),
  UNIQUE KEY `globalmacro_1` (`macro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `globalmacro`
--

LOCK TABLES `globalmacro` WRITE;
/*!40000 ALTER TABLE `globalmacro` DISABLE KEYS */;
INSERT INTO `globalmacro` VALUES (2,'{$SNMP_COMMUNITY}','public');
/*!40000 ALTER TABLE `globalmacro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `globalvars`
--

DROP TABLE IF EXISTS `globalvars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `globalvars` (
  `globalvarid` bigint(20) unsigned NOT NULL,
  `snmp_lastsize` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`globalvarid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `globalvars`
--

LOCK TABLES `globalvars` WRITE;
/*!40000 ALTER TABLE `globalvars` DISABLE KEYS */;
/*!40000 ALTER TABLE `globalvars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `graph_discovery`
--

DROP TABLE IF EXISTS `graph_discovery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `graph_discovery` (
  `graphid` bigint(20) unsigned NOT NULL,
  `parent_graphid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`graphid`),
  KEY `graph_discovery_1` (`parent_graphid`),
  CONSTRAINT `c_graph_discovery_1` FOREIGN KEY (`graphid`) REFERENCES `graphs` (`graphid`) ON DELETE CASCADE,
  CONSTRAINT `c_graph_discovery_2` FOREIGN KEY (`parent_graphid`) REFERENCES `graphs` (`graphid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `graph_discovery`
--

LOCK TABLES `graph_discovery` WRITE;
/*!40000 ALTER TABLE `graph_discovery` DISABLE KEYS */;
/*!40000 ALTER TABLE `graph_discovery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `graph_theme`
--

DROP TABLE IF EXISTS `graph_theme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `graph_theme` (
  `graphthemeid` bigint(20) unsigned NOT NULL,
  `theme` varchar(64) NOT NULL DEFAULT '',
  `backgroundcolor` varchar(6) NOT NULL DEFAULT '',
  `graphcolor` varchar(6) NOT NULL DEFAULT '',
  `gridcolor` varchar(6) NOT NULL DEFAULT '',
  `maingridcolor` varchar(6) NOT NULL DEFAULT '',
  `gridbordercolor` varchar(6) NOT NULL DEFAULT '',
  `textcolor` varchar(6) NOT NULL DEFAULT '',
  `highlightcolor` varchar(6) NOT NULL DEFAULT '',
  `leftpercentilecolor` varchar(6) NOT NULL DEFAULT '',
  `rightpercentilecolor` varchar(6) NOT NULL DEFAULT '',
  `nonworktimecolor` varchar(6) NOT NULL DEFAULT '',
  PRIMARY KEY (`graphthemeid`),
  UNIQUE KEY `graph_theme_1` (`theme`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `graph_theme`
--

LOCK TABLES `graph_theme` WRITE;
/*!40000 ALTER TABLE `graph_theme` DISABLE KEYS */;
INSERT INTO `graph_theme` VALUES (1,'blue-theme','FFFFFF','FFFFFF','CCD5D9','ACBBC2','ACBBC2','1F2C33','E33734','429E47','E33734','EBEBEB'),(2,'dark-theme','2B2B2B','2B2B2B','454545','4F4F4F','4F4F4F','F2F2F2','E45959','59DB8F','E45959','333333');
/*!40000 ALTER TABLE `graph_theme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `graphs`
--

DROP TABLE IF EXISTS `graphs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `graphs` (
  `graphid` bigint(20) unsigned NOT NULL,
  `name` varchar(128) NOT NULL DEFAULT '',
  `width` int(11) NOT NULL DEFAULT '900',
  `height` int(11) NOT NULL DEFAULT '200',
  `yaxismin` double(16,4) NOT NULL DEFAULT '0.0000',
  `yaxismax` double(16,4) NOT NULL DEFAULT '100.0000',
  `templateid` bigint(20) unsigned DEFAULT NULL,
  `show_work_period` int(11) NOT NULL DEFAULT '1',
  `show_triggers` int(11) NOT NULL DEFAULT '1',
  `graphtype` int(11) NOT NULL DEFAULT '0',
  `show_legend` int(11) NOT NULL DEFAULT '1',
  `show_3d` int(11) NOT NULL DEFAULT '0',
  `percent_left` double(16,4) NOT NULL DEFAULT '0.0000',
  `percent_right` double(16,4) NOT NULL DEFAULT '0.0000',
  `ymin_type` int(11) NOT NULL DEFAULT '0',
  `ymax_type` int(11) NOT NULL DEFAULT '0',
  `ymin_itemid` bigint(20) unsigned DEFAULT NULL,
  `ymax_itemid` bigint(20) unsigned DEFAULT NULL,
  `flags` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`graphid`),
  KEY `graphs_1` (`name`),
  KEY `graphs_2` (`templateid`),
  KEY `graphs_3` (`ymin_itemid`),
  KEY `graphs_4` (`ymax_itemid`),
  CONSTRAINT `c_graphs_1` FOREIGN KEY (`templateid`) REFERENCES `graphs` (`graphid`) ON DELETE CASCADE,
  CONSTRAINT `c_graphs_2` FOREIGN KEY (`ymin_itemid`) REFERENCES `items` (`itemid`),
  CONSTRAINT `c_graphs_3` FOREIGN KEY (`ymax_itemid`) REFERENCES `items` (`itemid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `graphs`
--

LOCK TABLES `graphs` WRITE;
/*!40000 ALTER TABLE `graphs` DISABLE KEYS */;
INSERT INTO `graphs` VALUES (387,'CPU utilization',900,200,0.0000,100.0000,NULL,1,0,1,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(392,'Zabbix server performance',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(404,'Zabbix data gathering process busy %',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(406,'Zabbix internal process busy %',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(410,'Zabbix cache usage, % free',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(420,'Network traffic on {#IFNAME}',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,2),(433,'CPU load',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,0),(436,'Swap usage',600,340,0.0000,100.0000,NULL,0,0,2,1,1,0.0000,0.0000,0,0,NULL,NULL,0),(439,'CPU jumps',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(442,'Disk space usage {#FSNAME}',600,340,0.0000,100.0000,NULL,0,0,2,1,1,0.0000,0.0000,0,0,NULL,NULL,2),(445,'Traffic on interface {#SNMPVALUE}',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,2),(446,'Traffic on interface {#SNMPVALUE}',900,200,0.0000,100.0000,445,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,2),(447,'Traffic on interface {#SNMPVALUE}',900,200,0.0000,100.0000,445,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,2),(449,'Traffic on interface {#SNMPVALUE}',900,200,0.0000,100.0000,445,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,2),(450,'Fan speed and ambient temperature',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(451,'Fan speed and temperature',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(452,'Voltage',900,200,0.0000,5.5000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(453,'Voltage',900,200,0.0000,5.5000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(454,'MySQL operations',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(455,'MySQL bandwidth',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(456,'CPU utilization',900,200,0.0000,100.0000,NULL,1,0,1,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(457,'CPU load',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,0),(458,'Swap usage',600,340,0.0000,100.0000,NULL,0,0,2,1,1,0.0000,0.0000,0,0,NULL,NULL,0),(459,'CPU jumps',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(461,'Disk space usage {#FSNAME}',600,340,0.0000,100.0000,NULL,0,0,2,1,1,0.0000,0.0000,0,0,NULL,NULL,2),(462,'CPU utilization',900,200,0.0000,100.0000,NULL,1,0,1,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(463,'CPU load',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,0),(464,'Swap usage',600,340,0.0000,100.0000,NULL,0,0,2,1,1,0.0000,0.0000,0,0,NULL,NULL,0),(465,'CPU jumps',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(467,'Disk space usage {#FSNAME}',600,340,0.0000,100.0000,NULL,0,0,2,1,1,0.0000,0.0000,0,0,NULL,NULL,2),(469,'CPU load',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,0),(471,'CPU jumps',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(472,'Network traffic on {#IFNAME}',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,2),(473,'Disk space usage {#FSNAME}',600,340,0.0000,100.0000,NULL,0,0,2,1,1,0.0000,0.0000,0,0,NULL,NULL,2),(474,'CPU utilization',900,200,0.0000,100.0000,NULL,1,0,1,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(475,'CPU load',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,0),(478,'Network traffic on {#IFNAME}',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,2),(479,'Disk space usage {#FSNAME}',600,340,0.0000,100.0000,NULL,0,0,2,1,1,0.0000,0.0000,0,0,NULL,NULL,2),(480,'CPU utilization',900,200,0.0000,100.0000,NULL,1,0,1,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(481,'CPU load',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,0),(482,'Swap usage',600,340,0.0000,100.0000,NULL,0,0,2,1,1,0.0000,0.0000,0,0,NULL,NULL,0),(483,'CPU jumps',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(484,'Network traffic on {#IFNAME}',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,2),(485,'Disk space usage {#FSNAME}',600,340,0.0000,100.0000,NULL,0,0,2,1,1,0.0000,0.0000,0,0,NULL,NULL,2),(487,'CPU load',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,0),(491,'Disk space usage {#FSNAME}',600,340,0.0000,100.0000,NULL,0,0,2,1,1,0.0000,0.0000,0,0,NULL,NULL,2),(492,'Network traffic on {#IFNAME}',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,2),(493,'Network traffic on {#IFNAME}',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,2),(494,'Network traffic on en0',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,0),(495,'CPU load',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,0),(496,'Disk space usage {#FSNAME}',600,340,0.0000,100.0000,NULL,0,0,2,1,1,0.0000,0.0000,0,0,NULL,NULL,2),(497,'Network traffic on {#IFNAME}',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,2),(498,'CPU utilization',900,200,0.0000,100.0000,NULL,1,0,1,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(499,'Class Loader',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(500,'File Descriptors',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(501,'Garbage Collector collections per second',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(502,'http-8080 worker threads',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(503,'http-8443 worker threads',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(504,'jk-8009 worker threads',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(505,'Memory Pool CMS Old Gen',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(506,'Memory Pool CMS Perm Gen',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(507,'Memory Pool Code Cache',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(508,'Memory Pool Perm Gen',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(509,'Memory Pool PS Old Gen',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(510,'Memory Pool PS Perm Gen',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(511,'Memory Pool Tenured Gen',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(512,'sessions /',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(513,'Threads',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(514,'Disk space usage {#SNMPVALUE}',600,340,0.0000,100.0000,NULL,0,0,2,1,1,0.0000,0.0000,0,0,NULL,NULL,2),(515,'Disk space usage {#SNMPVALUE}',600,340,0.0000,100.0000,514,0,0,2,1,1,0.0000,0.0000,0,0,NULL,NULL,2),(516,'Disk space usage {#SNMPVALUE}',600,340,0.0000,100.0000,514,0,0,2,1,1,0.0000,0.0000,0,0,NULL,NULL,2),(527,'Value cache effectiveness',900,200,0.0000,100.0000,NULL,1,1,1,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(529,'Zabbix cache usage, % free',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(530,'Zabbix data gathering process busy %',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(531,'Zabbix internal process busy %',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(532,'Zabbix proxy performance',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(533,'Memory usage',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,2,NULL,10026,0),(540,'Memory usage',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,2,NULL,22943,0),(541,'Memory usage',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,2,NULL,22903,0),(542,'Memory usage',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,2,NULL,22983,0),(543,'Memory usage',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,2,NULL,23063,0),(544,'Memory usage',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,2,NULL,22863,0),(545,'Memory usage',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,2,NULL,23023,0),(546,'Memory usage',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,2,NULL,23159,0),(559,'CPU jumps',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(560,'CPU load',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,0),(561,'CPU utilization',900,200,0.0000,100.0000,NULL,1,0,1,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(562,'Swap usage',600,340,0.0000,100.0000,NULL,0,0,2,1,1,0.0000,0.0000,0,0,NULL,NULL,0),(563,'Memory usage',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,2,NULL,25457,0),(564,'Network traffic on {#IFNAME}',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,2),(565,'Disk space usage {#FSNAME}',600,340,0.0000,100.0000,NULL,0,0,2,1,1,0.0000,0.0000,0,0,NULL,NULL,2);
/*!40000 ALTER TABLE `graphs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `graphs_items`
--

DROP TABLE IF EXISTS `graphs_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `graphs_items` (
  `gitemid` bigint(20) unsigned NOT NULL,
  `graphid` bigint(20) unsigned NOT NULL,
  `itemid` bigint(20) unsigned NOT NULL,
  `drawtype` int(11) NOT NULL DEFAULT '0',
  `sortorder` int(11) NOT NULL DEFAULT '0',
  `color` varchar(6) NOT NULL DEFAULT '009600',
  `yaxisside` int(11) NOT NULL DEFAULT '0',
  `calc_fnc` int(11) NOT NULL DEFAULT '2',
  `type` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`gitemid`),
  KEY `graphs_items_1` (`itemid`),
  KEY `graphs_items_2` (`graphid`),
  CONSTRAINT `c_graphs_items_1` FOREIGN KEY (`graphid`) REFERENCES `graphs` (`graphid`) ON DELETE CASCADE,
  CONSTRAINT `c_graphs_items_2` FOREIGN KEY (`itemid`) REFERENCES `items` (`itemid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `graphs_items`
--

LOCK TABLES `graphs_items` WRITE;
/*!40000 ALTER TABLE `graphs_items` DISABLE KEYS */;
INSERT INTO `graphs_items` VALUES (1242,387,22665,1,0,'FF5555',0,2,0),(1243,387,22668,1,1,'55FF55',0,2,0),(1244,387,22671,1,2,'009999',0,2,0),(1245,387,17358,1,3,'990099',0,2,0),(1246,387,17362,1,4,'999900',0,2,0),(1247,387,17360,1,5,'990000',0,2,0),(1248,387,17356,1,6,'000099',0,2,0),(1249,387,17354,1,7,'009900',0,2,0),(1290,439,22680,0,0,'009900',0,2,0),(1291,439,22683,0,1,'000099',0,2,0),(1296,433,10010,0,0,'009900',0,2,0),(1297,433,22674,0,1,'000099',0,2,0),(1298,433,22677,0,2,'990000',0,2,0),(1323,436,10030,0,0,'AA0000',0,2,2),(1324,436,10014,0,1,'00AA00',0,2,0),(1353,420,22446,5,0,'00AA00',0,2,0),(1354,420,22448,5,1,'3333FF',0,2,0),(1411,406,22426,0,0,'00EE00',0,2,0),(1413,406,22422,0,1,'0000EE',0,2,0),(1414,406,22408,0,2,'FFAA00',0,2,0),(1415,406,22424,0,3,'00EEEE',0,2,0),(1416,406,22412,0,4,'990099',0,2,0),(1417,406,22410,0,5,'666600',0,2,0),(1418,406,22406,0,6,'EE0000',0,2,0),(1419,406,22414,0,7,'FF66FF',0,2,0),(1429,410,22185,0,0,'009900',0,2,0),(1430,410,22189,0,1,'DD0000',0,2,0),(1431,410,22396,0,2,'00DDDD',0,2,0),(1432,410,22183,0,3,'3333FF',0,2,0),(1441,392,22187,5,0,'00C800',0,2,0),(1442,392,23251,5,1,'C80000',1,2,0),(1451,445,22701,5,0,'00AA00',0,2,0),(1452,445,22702,5,1,'3333FF',0,2,0),(1453,446,22725,5,0,'00AA00',0,2,0),(1454,446,22728,5,1,'3333FF',0,2,0),(1455,447,22740,5,0,'00AA00',0,2,0),(1456,447,22743,5,1,'3333FF',0,2,0),(1457,449,22784,5,0,'00AA00',0,2,0),(1458,449,22787,5,1,'3333FF',0,2,0),(1459,442,22456,0,0,'C80000',0,2,2),(1460,442,22452,0,1,'00C800',0,2,0),(1461,450,22804,5,0,'EE0000',0,2,0),(1462,450,22807,0,1,'000000',1,2,0),(1463,451,22808,2,1,'EE00EE',0,2,0),(1464,451,22815,2,0,'EE0000',0,2,0),(1465,451,22818,4,3,'000000',1,2,0),(1466,451,22817,0,2,'000000',1,2,0),(1467,452,22803,0,4,'3333FF',0,2,0),(1468,452,22800,0,1,'009900',0,2,0),(1469,452,22801,0,2,'00CCCC',0,2,0),(1470,452,22802,0,3,'000000',0,2,0),(1471,452,22805,2,0,'880000',0,2,0),(1472,452,22806,0,5,'777700',0,2,0),(1473,453,22809,0,1,'009900',0,2,0),(1474,453,22816,2,0,'880000',0,2,0),(1475,453,22813,0,3,'000000',0,2,0),(1476,453,22814,0,4,'3333FF',0,2,0),(1477,453,22812,0,2,'00CCCC',0,2,0),(1478,454,22827,0,0,'C8C800',0,2,0),(1479,454,22826,0,1,'006400',0,2,0),(1480,454,22828,0,2,'C80000',0,2,0),(1481,454,22822,0,3,'0000EE',0,2,0),(1482,454,22825,0,4,'640000',0,2,0),(1483,454,22823,0,5,'00C800',0,2,0),(1484,454,22824,0,6,'C800C8',0,2,0),(1487,455,22830,5,0,'00AA00',0,2,0),(1488,455,22829,5,1,'3333FF',0,2,0),(1491,456,22846,1,0,'009999',0,2,0),(1492,456,22848,1,1,'990099',0,2,0),(1494,456,22851,1,2,'990000',0,2,0),(1495,456,22852,1,3,'000099',0,2,0),(1496,456,22845,1,4,'009900',0,2,0),(1497,457,22842,0,0,'009900',0,2,0),(1498,457,22843,0,1,'000099',0,2,0),(1499,457,22841,0,2,'990000',0,2,0),(1500,458,22857,0,0,'AA0000',0,2,2),(1501,458,22855,0,1,'00AA00',0,2,0),(1502,459,22844,0,0,'009900',0,2,0),(1503,459,22840,0,1,'000099',0,2,0),(1506,461,22870,0,0,'C80000',0,2,2),(1507,461,22868,0,1,'00C800',0,2,0),(1510,462,22886,1,0,'009999',0,2,0),(1511,462,22888,1,1,'990099',0,2,0),(1513,462,22891,1,2,'990000',0,2,0),(1514,462,22892,1,3,'000099',0,2,0),(1515,462,22885,1,4,'009900',0,2,0),(1516,463,22882,0,0,'009900',0,2,0),(1517,463,22883,0,1,'000099',0,2,0),(1518,463,22881,0,2,'990000',0,2,0),(1519,464,22897,0,0,'AA0000',0,2,2),(1520,464,22895,0,1,'00AA00',0,2,0),(1521,465,22884,0,0,'009900',0,2,0),(1522,465,22880,0,1,'000099',0,2,0),(1525,467,22910,0,0,'C80000',0,2,2),(1526,467,22908,0,1,'00C800',0,2,0),(1535,469,22922,0,0,'009900',0,2,0),(1536,469,22923,0,1,'000099',0,2,0),(1537,469,22921,0,2,'990000',0,2,0),(1540,471,22924,0,0,'009900',0,2,0),(1541,471,22920,0,1,'000099',0,2,0),(1542,472,22945,5,0,'00AA00',0,2,0),(1543,472,22946,5,1,'3333FF',0,2,0),(1544,473,22950,0,0,'C80000',0,2,2),(1545,473,22948,0,1,'00C800',0,2,0),(1549,474,22968,1,0,'990099',0,2,0),(1551,474,22971,1,1,'990000',0,2,0),(1552,474,22972,1,2,'000099',0,2,0),(1553,474,22965,1,3,'009900',0,2,0),(1554,475,22962,0,0,'009900',0,2,0),(1555,475,22963,0,1,'000099',0,2,0),(1556,475,22961,0,2,'990000',0,2,0),(1561,478,22985,5,0,'00AA00',0,2,0),(1562,478,22986,5,1,'3333FF',0,2,0),(1563,479,22990,0,0,'C80000',0,2,2),(1564,479,22988,0,1,'00C800',0,2,0),(1569,480,23007,1,0,'999900',0,2,0),(1570,480,23011,1,1,'990000',0,2,0),(1571,480,23012,1,2,'000099',0,2,0),(1572,480,23005,1,3,'009900',0,2,0),(1573,481,23002,0,0,'009900',0,2,0),(1574,481,23003,0,1,'000099',0,2,0),(1575,481,23001,0,2,'990000',0,2,0),(1576,482,23017,0,0,'AA0000',0,2,2),(1577,482,23015,0,1,'00AA00',0,2,0),(1578,483,23004,0,0,'009900',0,2,0),(1579,483,23000,0,1,'000099',0,2,0),(1580,484,23025,5,0,'00AA00',0,2,0),(1581,484,23026,5,1,'3333FF',0,2,0),(1582,485,23030,0,0,'C80000',0,2,2),(1583,485,23028,0,1,'00C800',0,2,0),(1592,487,23042,0,0,'009900',0,2,0),(1593,487,23043,0,1,'000099',0,2,0),(1594,487,23041,0,2,'990000',0,2,0),(1601,491,23070,0,0,'C80000',0,2,2),(1602,491,23068,0,1,'00C800',0,2,0),(1603,492,23073,5,0,'00AA00',0,2,0),(1604,492,23074,5,1,'3333FF',0,2,0),(1607,493,23075,5,0,'00AA00',0,2,0),(1608,493,23076,5,1,'3333FF',0,2,0),(1610,404,22401,0,10,'00FF00',0,2,0),(1611,494,23077,5,0,'00AA00',0,2,0),(1612,494,23078,5,1,'3333FF',0,2,0),(1613,495,23143,0,0,'009900',0,2,0),(1614,495,23145,0,1,'000099',0,2,0),(1615,495,23144,0,2,'990000',0,2,0),(1616,496,23167,0,0,'C80000',0,2,2),(1617,496,23164,0,1,'00C800',0,2,0),(1618,497,23169,5,0,'00AA00',0,2,0),(1619,497,23170,5,1,'3333FF',0,2,0),(1620,498,23109,0,0,'009999',0,2,0),(1621,498,23112,0,1,'990099',0,2,0),(1622,498,23115,0,2,'999900',0,2,0),(1623,498,23113,0,3,'990000',0,2,0),(1624,498,23114,0,4,'000099',0,2,0),(1625,498,23110,0,5,'009900',0,2,0),(1626,404,22404,0,0,'990099',0,2,0),(1627,404,22399,0,1,'990000',0,2,0),(1628,404,22416,0,2,'0000EE',0,2,0),(1629,404,22430,0,3,'FF33FF',0,2,0),(1630,404,22418,0,4,'009600',0,2,0),(1631,404,22402,0,5,'003300',0,2,0),(1632,404,22420,0,6,'CCCC00',0,2,0),(1633,404,22400,0,7,'33FFFF',0,2,0),(1634,404,22689,0,8,'DD0000',0,2,0),(1635,404,23171,0,9,'000099',0,2,0),(1636,499,23174,0,0,'C80000',0,2,0),(1637,499,23175,0,1,'00C800',0,2,0),(1638,499,23173,0,2,'0000C8',0,2,0),(1639,500,23213,0,0,'C80000',0,2,0),(1640,500,23214,0,1,'00C800',0,2,0),(1641,501,23186,0,0,'C80000',0,2,0),(1642,501,23177,0,1,'00C800',0,2,0),(1643,501,23179,0,2,'0000C8',0,2,0),(1644,501,23181,0,3,'C8C800',0,2,0),(1645,501,23187,0,4,'00C8C9',0,2,0),(1646,501,23183,0,5,'C800C8',0,2,0),(1647,502,23227,0,0,'C80000',0,2,0),(1648,502,23226,0,1,'00C800',0,2,0),(1649,502,23225,0,2,'0000C8',0,2,0),(1650,503,23236,0,0,'C80000',0,2,0),(1651,503,23235,0,1,'00C800',0,2,0),(1652,503,23234,0,2,'0000C8',0,2,0),(1653,504,23244,0,0,'C80000',0,2,0),(1654,504,23243,0,1,'00C800',0,2,0),(1655,504,23242,0,2,'0000C8',0,2,0),(1656,505,23191,0,0,'C80000',0,2,0),(1657,505,23192,0,1,'00C800',0,2,0),(1658,505,23193,0,2,'0000C8',0,2,0),(1659,506,23194,0,0,'C80000',0,2,0),(1660,506,23195,0,1,'00C800',0,2,0),(1661,506,23196,0,2,'0000C8',0,2,0),(1662,507,23197,0,0,'C80000',0,2,0),(1663,507,23198,0,1,'00C800',0,2,0),(1664,507,23199,0,2,'0000C8',0,2,0),(1665,508,23200,0,0,'C80000',0,2,0),(1666,508,23201,0,1,'00C800',0,2,0),(1667,508,23202,0,2,'0000C8',0,2,0),(1668,509,23203,0,0,'C80000',0,2,0),(1669,509,23204,0,1,'00C800',0,2,0),(1670,509,23205,0,2,'0000C8',0,2,0),(1671,510,23206,0,0,'0000C8',0,2,0),(1672,510,23207,0,1,'C80000',0,2,0),(1673,510,23208,0,2,'00C800',0,2,0),(1674,511,23209,0,0,'C80000',0,2,0),(1675,511,23210,0,1,'00C800',0,2,0),(1676,511,23211,0,2,'0000C8',0,2,0),(1677,512,23248,0,0,'C80000',0,2,0),(1678,512,23246,0,1,'00C800',0,2,0),(1679,512,23249,0,2,'0000C8',0,2,0),(1680,513,23216,0,0,'C80000',0,2,0),(1681,513,23215,0,1,'00C800',0,2,0),(1682,513,23217,0,2,'0000C8',0,2,0),(1683,514,22758,0,0,'00C800',0,2,2),(1684,514,22759,0,1,'C80000',0,2,0),(1685,515,22763,0,0,'00C800',0,2,2),(1686,515,22765,0,1,'C80000',0,2,0),(1687,516,22770,0,0,'00C800',0,2,2),(1688,516,22772,0,1,'C80000',0,2,0),(1733,410,22191,0,4,'999900',0,2,0),(1735,527,22199,0,0,'C80000',0,2,0),(1736,527,22196,0,1,'00C800',0,2,0),(1739,529,23357,0,0,'DD0000',0,2,0),(1740,529,23341,0,1,'00DDDD',0,2,0),(1741,529,23342,0,2,'3333FF',0,2,0),(1742,530,23345,0,0,'990099',0,2,0),(1743,530,23348,0,1,'990000',0,2,0),(1744,530,23355,0,2,'0000EE',0,2,0),(1745,530,23352,0,3,'FF33FF',0,2,0),(1746,530,23356,0,4,'00EE00',0,2,0),(1747,530,23354,0,5,'003300',0,2,0),(1748,530,23346,0,6,'33FFFF',0,2,0),(1749,530,23349,0,7,'DD0000',0,2,0),(1750,530,23344,0,8,'000099',0,7,0),(1751,531,23353,0,0,'FFAA00',0,2,0),(1752,531,23347,0,1,'990099',0,2,0),(1753,531,23350,0,2,'EE0000',0,2,0),(1754,531,23343,0,3,'FF66FF',0,2,0),(1755,532,23340,5,0,'00C800',0,2,0),(1756,532,23358,5,1,'C80000',1,2,0),(1757,531,23351,0,4,'960000',0,2,0),(1758,531,23360,0,5,'009600',0,2,0),(1759,410,23634,0,5,'00FF00',0,2,0),(1766,533,22181,5,0,'00C800',0,2,0),(1806,540,22942,5,0,'00C800',0,2,0),(1808,541,22902,5,0,'00C800',0,2,0),(1810,542,22982,5,0,'00C800',0,2,0),(1812,543,23062,5,0,'00C800',0,2,0),(1814,544,22862,5,0,'00C800',0,2,0),(1816,545,23022,5,0,'00C800',0,2,0),(1818,546,23158,5,0,'00C800',0,2,0),(1819,406,23663,0,8,'009900',0,2,0),(1851,559,25438,0,0,'009900',0,2,0),(1852,559,25434,0,1,'000099',0,2,0),(1853,560,25436,0,0,'009900',0,2,0),(1854,560,25437,0,1,'000099',0,2,0),(1855,560,25435,0,2,'990000',0,2,0),(1856,561,25444,1,0,'FF5555',0,2,0),(1857,561,25443,1,1,'55FF55',0,2,0),(1858,561,25440,1,2,'009999',0,2,0),(1859,561,25442,1,3,'990099',0,2,0),(1860,561,25441,1,4,'999900',0,2,0),(1861,561,25445,1,5,'990000',0,2,0),(1862,561,25446,1,6,'000099',0,2,0),(1863,561,25439,1,7,'009900',0,2,0),(1864,562,25451,0,0,'AA0000',0,2,2),(1865,562,25449,0,1,'00AA00',0,2,0),(1866,563,25456,5,0,'00C800',0,2,0),(1867,564,25459,5,0,'00AA00',0,2,0),(1868,564,25460,5,1,'3333FF',0,2,0),(1869,565,25464,0,0,'C80000',0,2,2),(1870,565,25462,0,1,'00C800',0,2,0);
/*!40000 ALTER TABLE `graphs_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_discovery`
--

DROP TABLE IF EXISTS `group_discovery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_discovery` (
  `groupid` bigint(20) unsigned NOT NULL,
  `parent_group_prototypeid` bigint(20) unsigned NOT NULL,
  `name` varchar(64) NOT NULL DEFAULT '',
  `lastcheck` int(11) NOT NULL DEFAULT '0',
  `ts_delete` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`groupid`),
  KEY `c_group_discovery_2` (`parent_group_prototypeid`),
  CONSTRAINT `c_group_discovery_1` FOREIGN KEY (`groupid`) REFERENCES `groups` (`groupid`) ON DELETE CASCADE,
  CONSTRAINT `c_group_discovery_2` FOREIGN KEY (`parent_group_prototypeid`) REFERENCES `group_prototype` (`group_prototypeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_discovery`
--

LOCK TABLES `group_discovery` WRITE;
/*!40000 ALTER TABLE `group_discovery` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_discovery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_prototype`
--

DROP TABLE IF EXISTS `group_prototype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_prototype` (
  `group_prototypeid` bigint(20) unsigned NOT NULL,
  `hostid` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `groupid` bigint(20) unsigned DEFAULT NULL,
  `templateid` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`group_prototypeid`),
  KEY `group_prototype_1` (`hostid`),
  KEY `c_group_prototype_2` (`groupid`),
  KEY `c_group_prototype_3` (`templateid`),
  CONSTRAINT `c_group_prototype_1` FOREIGN KEY (`hostid`) REFERENCES `hosts` (`hostid`) ON DELETE CASCADE,
  CONSTRAINT `c_group_prototype_2` FOREIGN KEY (`groupid`) REFERENCES `groups` (`groupid`),
  CONSTRAINT `c_group_prototype_3` FOREIGN KEY (`templateid`) REFERENCES `group_prototype` (`group_prototypeid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_prototype`
--

LOCK TABLES `group_prototype` WRITE;
/*!40000 ALTER TABLE `group_prototype` DISABLE KEYS */;
INSERT INTO `group_prototype` VALUES (1,10090,'{#HV.NAME}',NULL,NULL),(2,10090,'',6,NULL),(4,10092,'',7,NULL),(6,10090,'{#CLUSTER.NAME} (vm)',NULL,NULL),(7,10092,'{#CLUSTER.NAME}',NULL,NULL),(13,10092,'{#DATACENTER.NAME}',NULL,NULL),(15,10090,'{#DATACENTER.NAME} (vm)',NULL,NULL);
/*!40000 ALTER TABLE `group_prototype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups` (
  `groupid` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `internal` int(11) NOT NULL DEFAULT '0',
  `flags` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`groupid`),
  KEY `groups_1` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` VALUES (1,'Templates',0,0),(2,'Linux servers',0,0),(4,'Zabbix servers',0,0),(5,'Discovered hosts',1,0),(6,'Virtual machines',0,0),(7,'Hypervisors',0,0);
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `history`
--

DROP TABLE IF EXISTS `history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `history` (
  `itemid` bigint(20) unsigned NOT NULL,
  `clock` int(11) NOT NULL DEFAULT '0',
  `value` double(16,4) NOT NULL DEFAULT '0.0000',
  `ns` int(11) NOT NULL DEFAULT '0',
  KEY `history_1` (`itemid`,`clock`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history`
--

LOCK TABLES `history` WRITE;
/*!40000 ALTER TABLE `history` DISABLE KEYS */;
INSERT INTO `history` VALUES (23664,1523778684,0.3556,293516687),(23252,1523778692,0.0000,297094574),(23253,1523778693,0.0000,297452401),(23255,1523778695,100.0000,297835203),(23256,1523778696,0.1917,299184862),(23257,1523778697,0.2493,299878889),(23258,1523778698,0.0000,300539573),(23259,1523778699,0.1032,301455169),(23260,1523778700,0.1662,302649024),(23620,1523778700,99.7860,302746309),(23264,1523778704,0.4097,304775490),(23265,1523778705,0.1426,307710073),(23266,1523778706,0.0810,308372131),(23268,1523778708,0.0788,308842976),(23269,1523778709,0.0451,309156011),(23270,1523778710,0.3484,309573257),(23273,1523778713,97.1799,311241224),(23274,1523778714,100.0000,312084325),(23275,1523778715,99.7795,312808853),(23276,1523778716,99.9292,313555417);
/*!40000 ALTER TABLE `history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `history_log`
--

DROP TABLE IF EXISTS `history_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `history_log` (
  `itemid` bigint(20) unsigned NOT NULL,
  `clock` int(11) NOT NULL DEFAULT '0',
  `timestamp` int(11) NOT NULL DEFAULT '0',
  `source` varchar(64) NOT NULL DEFAULT '',
  `severity` int(11) NOT NULL DEFAULT '0',
  `value` text NOT NULL,
  `logeventid` int(11) NOT NULL DEFAULT '0',
  `ns` int(11) NOT NULL DEFAULT '0',
  KEY `history_log_1` (`itemid`,`clock`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history_log`
--

LOCK TABLES `history_log` WRITE;
/*!40000 ALTER TABLE `history_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `history_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `history_str`
--

DROP TABLE IF EXISTS `history_str`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `history_str` (
  `itemid` bigint(20) unsigned NOT NULL,
  `clock` int(11) NOT NULL DEFAULT '0',
  `value` varchar(255) NOT NULL DEFAULT '',
  `ns` int(11) NOT NULL DEFAULT '0',
  KEY `history_str_1` (`itemid`,`clock`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history_str`
--

LOCK TABLES `history_str` WRITE;
/*!40000 ALTER TABLE `history_str` DISABLE KEYS */;
/*!40000 ALTER TABLE `history_str` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `history_text`
--

DROP TABLE IF EXISTS `history_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `history_text` (
  `itemid` bigint(20) unsigned NOT NULL,
  `clock` int(11) NOT NULL DEFAULT '0',
  `value` text NOT NULL,
  `ns` int(11) NOT NULL DEFAULT '0',
  KEY `history_text_1` (`itemid`,`clock`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history_text`
--

LOCK TABLES `history_text` WRITE;
/*!40000 ALTER TABLE `history_text` DISABLE KEYS */;
/*!40000 ALTER TABLE `history_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `history_uint`
--

DROP TABLE IF EXISTS `history_uint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `history_uint` (
  `itemid` bigint(20) unsigned NOT NULL,
  `clock` int(11) NOT NULL DEFAULT '0',
  `value` bigint(20) unsigned NOT NULL DEFAULT '0',
  `ns` int(11) NOT NULL DEFAULT '0',
  KEY `history_uint_1` (`itemid`,`clock`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history_uint`
--

LOCK TABLES `history_uint` WRITE;
/*!40000 ALTER TABLE `history_uint` DISABLE KEYS */;
INSERT INTO `history_uint` VALUES (23662,1523778682,0,292522256);
/*!40000 ALTER TABLE `history_uint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `host_discovery`
--

DROP TABLE IF EXISTS `host_discovery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `host_discovery` (
  `hostid` bigint(20) unsigned NOT NULL,
  `parent_hostid` bigint(20) unsigned DEFAULT NULL,
  `parent_itemid` bigint(20) unsigned DEFAULT NULL,
  `host` varchar(64) NOT NULL DEFAULT '',
  `lastcheck` int(11) NOT NULL DEFAULT '0',
  `ts_delete` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`hostid`),
  KEY `c_host_discovery_2` (`parent_hostid`),
  KEY `c_host_discovery_3` (`parent_itemid`),
  CONSTRAINT `c_host_discovery_1` FOREIGN KEY (`hostid`) REFERENCES `hosts` (`hostid`) ON DELETE CASCADE,
  CONSTRAINT `c_host_discovery_2` FOREIGN KEY (`parent_hostid`) REFERENCES `hosts` (`hostid`),
  CONSTRAINT `c_host_discovery_3` FOREIGN KEY (`parent_itemid`) REFERENCES `items` (`itemid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `host_discovery`
--

LOCK TABLES `host_discovery` WRITE;
/*!40000 ALTER TABLE `host_discovery` DISABLE KEYS */;
INSERT INTO `host_discovery` VALUES (10090,NULL,23542,'',0,0),(10092,NULL,23554,'',0,0);
/*!40000 ALTER TABLE `host_discovery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `host_inventory`
--

DROP TABLE IF EXISTS `host_inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `host_inventory` (
  `hostid` bigint(20) unsigned NOT NULL,
  `inventory_mode` int(11) NOT NULL DEFAULT '0',
  `type` varchar(64) NOT NULL DEFAULT '',
  `type_full` varchar(64) NOT NULL DEFAULT '',
  `name` varchar(64) NOT NULL DEFAULT '',
  `alias` varchar(64) NOT NULL DEFAULT '',
  `os` varchar(64) NOT NULL DEFAULT '',
  `os_full` varchar(255) NOT NULL DEFAULT '',
  `os_short` varchar(64) NOT NULL DEFAULT '',
  `serialno_a` varchar(64) NOT NULL DEFAULT '',
  `serialno_b` varchar(64) NOT NULL DEFAULT '',
  `tag` varchar(64) NOT NULL DEFAULT '',
  `asset_tag` varchar(64) NOT NULL DEFAULT '',
  `macaddress_a` varchar(64) NOT NULL DEFAULT '',
  `macaddress_b` varchar(64) NOT NULL DEFAULT '',
  `hardware` varchar(255) NOT NULL DEFAULT '',
  `hardware_full` text NOT NULL,
  `software` varchar(255) NOT NULL DEFAULT '',
  `software_full` text NOT NULL,
  `software_app_a` varchar(64) NOT NULL DEFAULT '',
  `software_app_b` varchar(64) NOT NULL DEFAULT '',
  `software_app_c` varchar(64) NOT NULL DEFAULT '',
  `software_app_d` varchar(64) NOT NULL DEFAULT '',
  `software_app_e` varchar(64) NOT NULL DEFAULT '',
  `contact` text NOT NULL,
  `location` text NOT NULL,
  `location_lat` varchar(16) NOT NULL DEFAULT '',
  `location_lon` varchar(16) NOT NULL DEFAULT '',
  `notes` text NOT NULL,
  `chassis` varchar(64) NOT NULL DEFAULT '',
  `model` varchar(64) NOT NULL DEFAULT '',
  `hw_arch` varchar(32) NOT NULL DEFAULT '',
  `vendor` varchar(64) NOT NULL DEFAULT '',
  `contract_number` varchar(64) NOT NULL DEFAULT '',
  `installer_name` varchar(64) NOT NULL DEFAULT '',
  `deployment_status` varchar(64) NOT NULL DEFAULT '',
  `url_a` varchar(255) NOT NULL DEFAULT '',
  `url_b` varchar(255) NOT NULL DEFAULT '',
  `url_c` varchar(255) NOT NULL DEFAULT '',
  `host_networks` text NOT NULL,
  `host_netmask` varchar(39) NOT NULL DEFAULT '',
  `host_router` varchar(39) NOT NULL DEFAULT '',
  `oob_ip` varchar(39) NOT NULL DEFAULT '',
  `oob_netmask` varchar(39) NOT NULL DEFAULT '',
  `oob_router` varchar(39) NOT NULL DEFAULT '',
  `date_hw_purchase` varchar(64) NOT NULL DEFAULT '',
  `date_hw_install` varchar(64) NOT NULL DEFAULT '',
  `date_hw_expiry` varchar(64) NOT NULL DEFAULT '',
  `date_hw_decomm` varchar(64) NOT NULL DEFAULT '',
  `site_address_a` varchar(128) NOT NULL DEFAULT '',
  `site_address_b` varchar(128) NOT NULL DEFAULT '',
  `site_address_c` varchar(128) NOT NULL DEFAULT '',
  `site_city` varchar(128) NOT NULL DEFAULT '',
  `site_state` varchar(64) NOT NULL DEFAULT '',
  `site_country` varchar(64) NOT NULL DEFAULT '',
  `site_zip` varchar(64) NOT NULL DEFAULT '',
  `site_rack` varchar(128) NOT NULL DEFAULT '',
  `site_notes` text NOT NULL,
  `poc_1_name` varchar(128) NOT NULL DEFAULT '',
  `poc_1_email` varchar(128) NOT NULL DEFAULT '',
  `poc_1_phone_a` varchar(64) NOT NULL DEFAULT '',
  `poc_1_phone_b` varchar(64) NOT NULL DEFAULT '',
  `poc_1_cell` varchar(64) NOT NULL DEFAULT '',
  `poc_1_screen` varchar(64) NOT NULL DEFAULT '',
  `poc_1_notes` text NOT NULL,
  `poc_2_name` varchar(128) NOT NULL DEFAULT '',
  `poc_2_email` varchar(128) NOT NULL DEFAULT '',
  `poc_2_phone_a` varchar(64) NOT NULL DEFAULT '',
  `poc_2_phone_b` varchar(64) NOT NULL DEFAULT '',
  `poc_2_cell` varchar(64) NOT NULL DEFAULT '',
  `poc_2_screen` varchar(64) NOT NULL DEFAULT '',
  `poc_2_notes` text NOT NULL,
  PRIMARY KEY (`hostid`),
  CONSTRAINT `c_host_inventory_1` FOREIGN KEY (`hostid`) REFERENCES `hosts` (`hostid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `host_inventory`
--

LOCK TABLES `host_inventory` WRITE;
/*!40000 ALTER TABLE `host_inventory` DISABLE KEYS */;
/*!40000 ALTER TABLE `host_inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hostmacro`
--

DROP TABLE IF EXISTS `hostmacro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hostmacro` (
  `hostmacroid` bigint(20) unsigned NOT NULL,
  `hostid` bigint(20) unsigned NOT NULL,
  `macro` varchar(255) NOT NULL DEFAULT '',
  `value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`hostmacroid`),
  UNIQUE KEY `hostmacro_1` (`hostid`,`macro`),
  CONSTRAINT `c_hostmacro_1` FOREIGN KEY (`hostid`) REFERENCES `hosts` (`hostid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hostmacro`
--

LOCK TABLES `hostmacro` WRITE;
/*!40000 ALTER TABLE `hostmacro` DISABLE KEYS */;
/*!40000 ALTER TABLE `hostmacro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hosts`
--

DROP TABLE IF EXISTS `hosts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hosts` (
  `hostid` bigint(20) unsigned NOT NULL,
  `proxy_hostid` bigint(20) unsigned DEFAULT NULL,
  `host` varchar(128) NOT NULL DEFAULT '',
  `status` int(11) NOT NULL DEFAULT '0',
  `disable_until` int(11) NOT NULL DEFAULT '0',
  `error` varchar(2048) NOT NULL DEFAULT '',
  `available` int(11) NOT NULL DEFAULT '0',
  `errors_from` int(11) NOT NULL DEFAULT '0',
  `lastaccess` int(11) NOT NULL DEFAULT '0',
  `ipmi_authtype` int(11) NOT NULL DEFAULT '-1',
  `ipmi_privilege` int(11) NOT NULL DEFAULT '2',
  `ipmi_username` varchar(16) NOT NULL DEFAULT '',
  `ipmi_password` varchar(20) NOT NULL DEFAULT '',
  `ipmi_disable_until` int(11) NOT NULL DEFAULT '0',
  `ipmi_available` int(11) NOT NULL DEFAULT '0',
  `snmp_disable_until` int(11) NOT NULL DEFAULT '0',
  `snmp_available` int(11) NOT NULL DEFAULT '0',
  `maintenanceid` bigint(20) unsigned DEFAULT NULL,
  `maintenance_status` int(11) NOT NULL DEFAULT '0',
  `maintenance_type` int(11) NOT NULL DEFAULT '0',
  `maintenance_from` int(11) NOT NULL DEFAULT '0',
  `ipmi_errors_from` int(11) NOT NULL DEFAULT '0',
  `snmp_errors_from` int(11) NOT NULL DEFAULT '0',
  `ipmi_error` varchar(2048) NOT NULL DEFAULT '',
  `snmp_error` varchar(2048) NOT NULL DEFAULT '',
  `jmx_disable_until` int(11) NOT NULL DEFAULT '0',
  `jmx_available` int(11) NOT NULL DEFAULT '0',
  `jmx_errors_from` int(11) NOT NULL DEFAULT '0',
  `jmx_error` varchar(2048) NOT NULL DEFAULT '',
  `name` varchar(128) NOT NULL DEFAULT '',
  `flags` int(11) NOT NULL DEFAULT '0',
  `templateid` bigint(20) unsigned DEFAULT NULL,
  `description` text NOT NULL,
  `tls_connect` int(11) NOT NULL DEFAULT '1',
  `tls_accept` int(11) NOT NULL DEFAULT '1',
  `tls_issuer` varchar(1024) NOT NULL DEFAULT '',
  `tls_subject` varchar(1024) NOT NULL DEFAULT '',
  `tls_psk_identity` varchar(128) NOT NULL DEFAULT '',
  `tls_psk` varchar(512) NOT NULL DEFAULT '',
  PRIMARY KEY (`hostid`),
  KEY `hosts_1` (`host`),
  KEY `hosts_2` (`status`),
  KEY `hosts_3` (`proxy_hostid`),
  KEY `hosts_4` (`name`),
  KEY `hosts_5` (`maintenanceid`),
  KEY `c_hosts_3` (`templateid`),
  CONSTRAINT `c_hosts_1` FOREIGN KEY (`proxy_hostid`) REFERENCES `hosts` (`hostid`),
  CONSTRAINT `c_hosts_2` FOREIGN KEY (`maintenanceid`) REFERENCES `maintenances` (`maintenanceid`),
  CONSTRAINT `c_hosts_3` FOREIGN KEY (`templateid`) REFERENCES `hosts` (`hostid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hosts`
--

LOCK TABLES `hosts` WRITE;
/*!40000 ALTER TABLE `hosts` DISABLE KEYS */;
INSERT INTO `hosts` VALUES (10001,NULL,'Template OS Linux',3,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template OS Linux',0,NULL,'',1,1,'','','',''),(10047,NULL,'Template App Zabbix Server',3,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template App Zabbix Server',0,NULL,'',1,1,'','','',''),(10048,NULL,'Template App Zabbix Proxy',3,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template App Zabbix Proxy',0,NULL,'',1,1,'','','',''),(10050,NULL,'Template App Zabbix Agent',3,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template App Zabbix Agent',0,NULL,'',1,1,'','','',''),(10060,NULL,'Template SNMP Interfaces',3,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template SNMP Interfaces',0,NULL,'',1,1,'','','',''),(10065,NULL,'Template SNMP Generic',3,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template SNMP Generic',0,NULL,'',1,1,'','','',''),(10066,NULL,'Template SNMP Device',3,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template SNMP Device',0,NULL,'',1,1,'','','',''),(10067,NULL,'Template SNMP OS Windows',3,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template SNMP OS Windows',0,NULL,'',1,1,'','','',''),(10068,NULL,'Template SNMP Disks',3,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template SNMP Disks',0,NULL,'',1,1,'','','',''),(10069,NULL,'Template SNMP OS Linux',3,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template SNMP OS Linux',0,NULL,'',1,1,'','','',''),(10070,NULL,'Template SNMP Processors',3,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template SNMP Processors',0,NULL,'',1,1,'','','',''),(10071,NULL,'Template IPMI Intel SR1530',3,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template IPMI Intel SR1530',0,NULL,'',1,1,'','','',''),(10072,NULL,'Template IPMI Intel SR1630',3,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template IPMI Intel SR1630',0,NULL,'',1,1,'','','',''),(10073,NULL,'Template App MySQL',3,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template App MySQL',0,NULL,'',1,1,'','','',''),(10074,NULL,'Template OS OpenBSD',3,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template OS OpenBSD',0,NULL,'',1,1,'','','',''),(10075,NULL,'Template OS FreeBSD',3,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template OS FreeBSD',0,NULL,'',1,1,'','','',''),(10076,NULL,'Template OS AIX',3,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template OS AIX',0,NULL,'',1,1,'','','',''),(10077,NULL,'Template OS HP-UX',3,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template OS HP-UX',0,NULL,'',1,1,'','','',''),(10078,NULL,'Template OS Solaris',3,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template OS Solaris',0,NULL,'',1,1,'','','',''),(10079,NULL,'Template OS Mac OS X',3,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template OS Mac OS X',0,NULL,'',1,1,'','','',''),(10081,NULL,'Template OS Windows',3,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template OS Windows',0,NULL,'',1,1,'','','',''),(10082,NULL,'Template JMX Generic',3,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template JMX Generic',0,NULL,'',1,1,'','','',''),(10083,NULL,'Template JMX Tomcat',3,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template JMX Tomcat',0,NULL,'',1,1,'','','',''),(10088,NULL,'Template Virt VMware',3,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Virt VMware',0,NULL,'',1,1,'','','',''),(10089,NULL,'Template Virt VMware Guest',3,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Virt VMware Guest',0,NULL,'',1,1,'','','',''),(10090,NULL,'{#VM.UUID}',0,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','{#VM.NAME}',2,NULL,'',1,1,'','','',''),(10091,NULL,'Template Virt VMware Hypervisor',3,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Virt VMware Hypervisor',0,NULL,'',1,1,'','','',''),(10092,NULL,'{#HV.UUID}',0,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','{#HV.NAME}',2,NULL,'',1,1,'','','',''),(10093,NULL,'Template App FTP Service',3,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template App FTP Service',0,NULL,'',1,1,'','','',''),(10094,NULL,'Template App HTTP Service',3,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template App HTTP Service',0,NULL,'',1,1,'','','',''),(10095,NULL,'Template App HTTPS Service',3,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template App HTTPS Service',0,NULL,'',1,1,'','','',''),(10096,NULL,'Template App IMAP Service',3,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template App IMAP Service',0,NULL,'',1,1,'','','',''),(10097,NULL,'Template App LDAP Service',3,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template App LDAP Service',0,NULL,'',1,1,'','','',''),(10098,NULL,'Template App NNTP Service',3,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template App NNTP Service',0,NULL,'',1,1,'','','',''),(10099,NULL,'Template App NTP Service',3,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template App NTP Service',0,NULL,'',1,1,'','','',''),(10100,NULL,'Template App POP Service',3,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template App POP Service',0,NULL,'',1,1,'','','',''),(10101,NULL,'Template App SMTP Service',3,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template App SMTP Service',0,NULL,'',1,1,'','','',''),(10102,NULL,'Template App SSH Service',3,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template App SSH Service',0,NULL,'',1,1,'','','',''),(10103,NULL,'Template App Telnet Service',3,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template App Telnet Service',0,NULL,'',1,1,'','','',''),(10104,NULL,'Template ICMP Ping',3,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template ICMP Ping',0,NULL,'',1,1,'','','',''),(10107,NULL,'Template OS Linux agent',3,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template OS Linux agent',0,NULL,'',1,1,'','','','');
/*!40000 ALTER TABLE `hosts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hosts_groups`
--

DROP TABLE IF EXISTS `hosts_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hosts_groups` (
  `hostgroupid` bigint(20) unsigned NOT NULL,
  `hostid` bigint(20) unsigned NOT NULL,
  `groupid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`hostgroupid`),
  UNIQUE KEY `hosts_groups_1` (`hostid`,`groupid`),
  KEY `hosts_groups_2` (`groupid`),
  CONSTRAINT `c_hosts_groups_1` FOREIGN KEY (`hostid`) REFERENCES `hosts` (`hostid`) ON DELETE CASCADE,
  CONSTRAINT `c_hosts_groups_2` FOREIGN KEY (`groupid`) REFERENCES `groups` (`groupid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hosts_groups`
--

LOCK TABLES `hosts_groups` WRITE;
/*!40000 ALTER TABLE `hosts_groups` DISABLE KEYS */;
INSERT INTO `hosts_groups` VALUES (1,10001,1),(47,10047,1),(98,10048,1),(50,10050,1),(70,10060,1),(73,10065,1),(74,10066,1),(75,10067,1),(76,10068,1),(77,10069,1),(78,10070,1),(79,10071,1),(80,10072,1),(81,10073,1),(82,10074,1),(83,10075,1),(84,10076,1),(85,10077,1),(86,10078,1),(87,10079,1),(89,10081,1),(90,10082,1),(91,10083,1),(95,10088,1),(96,10089,1),(97,10091,1),(99,10093,1),(100,10094,1),(101,10095,1),(102,10096,1),(103,10097,1),(104,10098,1),(105,10099,1),(106,10100,1),(107,10101,1),(108,10102,1),(109,10103,1),(110,10104,1),(112,10107,1);
/*!40000 ALTER TABLE `hosts_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hosts_templates`
--

DROP TABLE IF EXISTS `hosts_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hosts_templates` (
  `hosttemplateid` bigint(20) unsigned NOT NULL,
  `hostid` bigint(20) unsigned NOT NULL,
  `templateid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`hosttemplateid`),
  UNIQUE KEY `hosts_templates_1` (`hostid`,`templateid`),
  KEY `hosts_templates_2` (`templateid`),
  CONSTRAINT `c_hosts_templates_1` FOREIGN KEY (`hostid`) REFERENCES `hosts` (`hostid`) ON DELETE CASCADE,
  CONSTRAINT `c_hosts_templates_2` FOREIGN KEY (`templateid`) REFERENCES `hosts` (`hostid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hosts_templates`
--

LOCK TABLES `hosts_templates` WRITE;
/*!40000 ALTER TABLE `hosts_templates` DISABLE KEYS */;
INSERT INTO `hosts_templates` VALUES (4,10001,10050),(22,10066,10060),(21,10066,10065),(24,10067,10060),(23,10067,10065),(25,10067,10068),(30,10067,10070),(28,10069,10060),(27,10069,10065),(26,10069,10068),(29,10069,10070),(31,10074,10050),(32,10075,10050),(33,10076,10050),(34,10077,10050),(35,10078,10050),(36,10079,10050),(37,10081,10050),(41,10090,10089),(42,10092,10091),(44,10107,10050);
/*!40000 ALTER TABLE `hosts_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `housekeeper`
--

DROP TABLE IF EXISTS `housekeeper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `housekeeper` (
  `housekeeperid` bigint(20) unsigned NOT NULL,
  `tablename` varchar(64) NOT NULL DEFAULT '',
  `field` varchar(64) NOT NULL DEFAULT '',
  `value` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`housekeeperid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `housekeeper`
--

LOCK TABLES `housekeeper` WRITE;
/*!40000 ALTER TABLE `housekeeper` DISABLE KEYS */;
INSERT INTO `housekeeper` VALUES (978,'events','triggerid',13636),(979,'events','triggerid',13637),(980,'events','triggerid',13638),(981,'events','triggerid',13639),(982,'events','triggerid',13657),(983,'events','triggerid',13658),(984,'events','triggerid',13659),(985,'events','triggerid',13660),(986,'events','triggerid',13661),(987,'events','triggerid',13662),(988,'events','triggerid',13680),(989,'events','triggerid',13681),(990,'events','triggerid',13682),(991,'events','triggerid',13683),(992,'events','triggerid',13684),(993,'events','triggerid',13685),(994,'events','triggerid',13703),(995,'events','triggerid',13704),(996,'events','triggerid',13705),(997,'events','triggerid',13706),(998,'events','triggerid',13707),(999,'events','triggerid',13708),(1000,'trends','itemid',25549),(1001,'trends_uint','itemid',25549),(1002,'history_text','itemid',25549),(1003,'history_log','itemid',25549),(1004,'history_uint','itemid',25549),(1005,'history_str','itemid',25549),(1006,'history','itemid',25549),(1007,'events','itemid',25549),(1008,'trends','itemid',25550),(1009,'trends_uint','itemid',25550),(1010,'history_text','itemid',25550),(1011,'history_log','itemid',25550),(1012,'history_uint','itemid',25550),(1013,'history_str','itemid',25550),(1014,'history','itemid',25550),(1015,'events','itemid',25550),(1016,'trends','itemid',25551),(1017,'trends_uint','itemid',25551),(1018,'history_text','itemid',25551),(1019,'history_log','itemid',25551),(1020,'history_uint','itemid',25551),(1021,'history_str','itemid',25551),(1022,'history','itemid',25551),(1023,'events','itemid',25551),(1024,'trends','itemid',25552),(1025,'trends_uint','itemid',25552),(1026,'history_text','itemid',25552),(1027,'history_log','itemid',25552),(1028,'history_uint','itemid',25552),(1029,'history_str','itemid',25552),(1030,'history','itemid',25552),(1031,'events','itemid',25552),(1032,'trends','itemid',25553),(1033,'trends_uint','itemid',25553),(1034,'history_text','itemid',25553),(1035,'history_log','itemid',25553),(1036,'history_uint','itemid',25553),(1037,'history_str','itemid',25553),(1038,'history','itemid',25553),(1039,'events','itemid',25553),(1040,'trends','itemid',25554),(1041,'trends_uint','itemid',25554),(1042,'history_text','itemid',25554),(1043,'history_log','itemid',25554),(1044,'history_uint','itemid',25554),(1045,'history_str','itemid',25554),(1046,'history','itemid',25554),(1047,'events','itemid',25554),(1048,'trends','itemid',25555),(1049,'trends_uint','itemid',25555),(1050,'history_text','itemid',25555),(1051,'history_log','itemid',25555),(1052,'history_uint','itemid',25555),(1053,'history_str','itemid',25555),(1054,'history','itemid',25555),(1055,'events','itemid',25555),(1056,'trends','itemid',25556),(1057,'trends_uint','itemid',25556),(1058,'history_text','itemid',25556),(1059,'history_log','itemid',25556),(1060,'history_uint','itemid',25556),(1061,'history_str','itemid',25556),(1062,'history','itemid',25556),(1063,'events','itemid',25556),(1064,'trends','itemid',25557),(1065,'trends_uint','itemid',25557),(1066,'history_text','itemid',25557),(1067,'history_log','itemid',25557),(1068,'history_uint','itemid',25557),(1069,'history_str','itemid',25557),(1070,'history','itemid',25557),(1071,'events','itemid',25557),(1072,'trends','itemid',25558),(1073,'trends_uint','itemid',25558),(1074,'history_text','itemid',25558),(1075,'history_log','itemid',25558),(1076,'history_uint','itemid',25558),(1077,'history_str','itemid',25558),(1078,'history','itemid',25558),(1079,'events','itemid',25558),(1080,'trends','itemid',25559),(1081,'trends_uint','itemid',25559),(1082,'history_text','itemid',25559),(1083,'history_log','itemid',25559),(1084,'history_uint','itemid',25559),(1085,'history_str','itemid',25559),(1086,'history','itemid',25559),(1087,'events','itemid',25559),(1088,'trends','itemid',25560),(1089,'trends_uint','itemid',25560),(1090,'history_text','itemid',25560),(1091,'history_log','itemid',25560),(1092,'history_uint','itemid',25560),(1093,'history_str','itemid',25560),(1094,'history','itemid',25560),(1095,'events','itemid',25560),(1096,'trends','itemid',25561),(1097,'trends_uint','itemid',25561),(1098,'history_text','itemid',25561),(1099,'history_log','itemid',25561),(1100,'history_uint','itemid',25561),(1101,'history_str','itemid',25561),(1102,'history','itemid',25561),(1103,'events','itemid',25561),(1104,'trends','itemid',25562),(1105,'trends_uint','itemid',25562),(1106,'history_text','itemid',25562),(1107,'history_log','itemid',25562),(1108,'history_uint','itemid',25562),(1109,'history_str','itemid',25562),(1110,'history','itemid',25562),(1111,'events','itemid',25562),(1112,'trends','itemid',25604),(1113,'trends_uint','itemid',25604),(1114,'history_text','itemid',25604),(1115,'history_log','itemid',25604),(1116,'history_uint','itemid',25604),(1117,'history_str','itemid',25604),(1118,'history','itemid',25604),(1119,'events','itemid',25604),(1120,'trends','itemid',25605),(1121,'trends_uint','itemid',25605),(1122,'history_text','itemid',25605),(1123,'history_log','itemid',25605),(1124,'history_uint','itemid',25605),(1125,'history_str','itemid',25605),(1126,'history','itemid',25605),(1127,'events','itemid',25605),(1128,'trends','itemid',25606),(1129,'trends_uint','itemid',25606),(1130,'history_text','itemid',25606),(1131,'history_log','itemid',25606),(1132,'history_uint','itemid',25606),(1133,'history_str','itemid',25606),(1134,'history','itemid',25606),(1135,'events','itemid',25606),(1136,'trends','itemid',25607),(1137,'trends_uint','itemid',25607),(1138,'history_text','itemid',25607),(1139,'history_log','itemid',25607),(1140,'history_uint','itemid',25607),(1141,'history_str','itemid',25607),(1142,'history','itemid',25607),(1143,'events','itemid',25607),(1144,'trends','itemid',25608),(1145,'trends_uint','itemid',25608),(1146,'history_text','itemid',25608),(1147,'history_log','itemid',25608),(1148,'history_uint','itemid',25608),(1149,'history_str','itemid',25608),(1150,'history','itemid',25608),(1151,'events','itemid',25608),(1152,'trends','itemid',25609),(1153,'trends_uint','itemid',25609),(1154,'history_text','itemid',25609),(1155,'history_log','itemid',25609),(1156,'history_uint','itemid',25609),(1157,'history_str','itemid',25609),(1158,'history','itemid',25609),(1159,'events','itemid',25609),(1160,'trends','itemid',25610),(1161,'trends_uint','itemid',25610),(1162,'history_text','itemid',25610),(1163,'history_log','itemid',25610),(1164,'history_uint','itemid',25610),(1165,'history_str','itemid',25610),(1166,'history','itemid',25610),(1167,'events','itemid',25610),(1168,'trends','itemid',25611),(1169,'trends_uint','itemid',25611),(1170,'history_text','itemid',25611),(1171,'history_log','itemid',25611),(1172,'history_uint','itemid',25611),(1173,'history_str','itemid',25611),(1174,'history','itemid',25611),(1175,'events','itemid',25611),(1176,'trends','itemid',25612),(1177,'trends_uint','itemid',25612),(1178,'history_text','itemid',25612),(1179,'history_log','itemid',25612),(1180,'history_uint','itemid',25612),(1181,'history_str','itemid',25612),(1182,'history','itemid',25612),(1183,'events','itemid',25612),(1184,'trends','itemid',25613),(1185,'trends_uint','itemid',25613),(1186,'history_text','itemid',25613),(1187,'history_log','itemid',25613),(1188,'history_uint','itemid',25613),(1189,'history_str','itemid',25613),(1190,'history','itemid',25613),(1191,'events','itemid',25613),(1192,'trends','itemid',25614),(1193,'trends_uint','itemid',25614),(1194,'history_text','itemid',25614),(1195,'history_log','itemid',25614),(1196,'history_uint','itemid',25614),(1197,'history_str','itemid',25614),(1198,'history','itemid',25614),(1199,'events','itemid',25614),(1200,'trends','itemid',25615),(1201,'trends_uint','itemid',25615),(1202,'history_text','itemid',25615),(1203,'history_log','itemid',25615),(1204,'history_uint','itemid',25615),(1205,'history_str','itemid',25615),(1206,'history','itemid',25615),(1207,'events','itemid',25615),(1208,'trends','itemid',25616),(1209,'trends_uint','itemid',25616),(1210,'history_text','itemid',25616),(1211,'history_log','itemid',25616),(1212,'history_uint','itemid',25616),(1213,'history_str','itemid',25616),(1214,'history','itemid',25616),(1215,'events','itemid',25616),(1216,'trends','itemid',25617),(1217,'trends_uint','itemid',25617),(1218,'history_text','itemid',25617),(1219,'history_log','itemid',25617),(1220,'history_uint','itemid',25617),(1221,'history_str','itemid',25617),(1222,'history','itemid',25617),(1223,'events','itemid',25617),(1224,'trends','itemid',25618),(1225,'trends_uint','itemid',25618),(1226,'history_text','itemid',25618),(1227,'history_log','itemid',25618),(1228,'history_uint','itemid',25618),(1229,'history_str','itemid',25618),(1230,'history','itemid',25618),(1231,'events','itemid',25618),(1232,'trends','itemid',25619),(1233,'trends_uint','itemid',25619),(1234,'history_text','itemid',25619),(1235,'history_log','itemid',25619),(1236,'history_uint','itemid',25619),(1237,'history_str','itemid',25619),(1238,'history','itemid',25619),(1239,'events','itemid',25619),(1240,'trends','itemid',25620),(1241,'trends_uint','itemid',25620),(1242,'history_text','itemid',25620),(1243,'history_log','itemid',25620),(1244,'history_uint','itemid',25620),(1245,'history_str','itemid',25620),(1246,'history','itemid',25620),(1247,'events','itemid',25620),(1248,'trends','itemid',25621),(1249,'trends_uint','itemid',25621),(1250,'history_text','itemid',25621),(1251,'history_log','itemid',25621),(1252,'history_uint','itemid',25621),(1253,'history_str','itemid',25621),(1254,'history','itemid',25621),(1255,'events','itemid',25621),(1256,'trends','itemid',25622),(1257,'trends_uint','itemid',25622),(1258,'history_text','itemid',25622),(1259,'history_log','itemid',25622),(1260,'history_uint','itemid',25622),(1261,'history_str','itemid',25622),(1262,'history','itemid',25622),(1263,'events','itemid',25622),(1264,'trends','itemid',25664),(1265,'trends_uint','itemid',25664),(1266,'history_text','itemid',25664),(1267,'history_log','itemid',25664),(1268,'history_uint','itemid',25664),(1269,'history_str','itemid',25664),(1270,'history','itemid',25664),(1271,'events','itemid',25664),(1272,'trends','itemid',25665),(1273,'trends_uint','itemid',25665),(1274,'history_text','itemid',25665),(1275,'history_log','itemid',25665),(1276,'history_uint','itemid',25665),(1277,'history_str','itemid',25665),(1278,'history','itemid',25665),(1279,'events','itemid',25665),(1280,'trends','itemid',25666),(1281,'trends_uint','itemid',25666),(1282,'history_text','itemid',25666),(1283,'history_log','itemid',25666),(1284,'history_uint','itemid',25666),(1285,'history_str','itemid',25666),(1286,'history','itemid',25666),(1287,'events','itemid',25666),(1288,'trends','itemid',25667),(1289,'trends_uint','itemid',25667),(1290,'history_text','itemid',25667),(1291,'history_log','itemid',25667),(1292,'history_uint','itemid',25667),(1293,'history_str','itemid',25667),(1294,'history','itemid',25667),(1295,'events','itemid',25667),(1296,'trends','itemid',25668),(1297,'trends_uint','itemid',25668),(1298,'history_text','itemid',25668),(1299,'history_log','itemid',25668),(1300,'history_uint','itemid',25668),(1301,'history_str','itemid',25668),(1302,'history','itemid',25668),(1303,'events','itemid',25668),(1304,'trends','itemid',25669),(1305,'trends_uint','itemid',25669),(1306,'history_text','itemid',25669),(1307,'history_log','itemid',25669),(1308,'history_uint','itemid',25669),(1309,'history_str','itemid',25669),(1310,'history','itemid',25669),(1311,'events','itemid',25669),(1312,'trends','itemid',25670),(1313,'trends_uint','itemid',25670),(1314,'history_text','itemid',25670),(1315,'history_log','itemid',25670),(1316,'history_uint','itemid',25670),(1317,'history_str','itemid',25670),(1318,'history','itemid',25670),(1319,'events','itemid',25670),(1320,'trends','itemid',25671),(1321,'trends_uint','itemid',25671),(1322,'history_text','itemid',25671),(1323,'history_log','itemid',25671),(1324,'history_uint','itemid',25671),(1325,'history_str','itemid',25671),(1326,'history','itemid',25671),(1327,'events','itemid',25671),(1328,'trends','itemid',25672),(1329,'trends_uint','itemid',25672),(1330,'history_text','itemid',25672),(1331,'history_log','itemid',25672),(1332,'history_uint','itemid',25672),(1333,'history_str','itemid',25672),(1334,'history','itemid',25672),(1335,'events','itemid',25672),(1336,'trends','itemid',25673),(1337,'trends_uint','itemid',25673),(1338,'history_text','itemid',25673),(1339,'history_log','itemid',25673),(1340,'history_uint','itemid',25673),(1341,'history_str','itemid',25673),(1342,'history','itemid',25673),(1343,'events','itemid',25673),(1344,'trends','itemid',25674),(1345,'trends_uint','itemid',25674),(1346,'history_text','itemid',25674),(1347,'history_log','itemid',25674),(1348,'history_uint','itemid',25674),(1349,'history_str','itemid',25674),(1350,'history','itemid',25674),(1351,'events','itemid',25674),(1352,'trends','itemid',25675),(1353,'trends_uint','itemid',25675),(1354,'history_text','itemid',25675),(1355,'history_log','itemid',25675),(1356,'history_uint','itemid',25675),(1357,'history_str','itemid',25675),(1358,'history','itemid',25675),(1359,'events','itemid',25675),(1360,'trends','itemid',25676),(1361,'trends_uint','itemid',25676),(1362,'history_text','itemid',25676),(1363,'history_log','itemid',25676),(1364,'history_uint','itemid',25676),(1365,'history_str','itemid',25676),(1366,'history','itemid',25676),(1367,'events','itemid',25676),(1368,'trends','itemid',25677),(1369,'trends_uint','itemid',25677),(1370,'history_text','itemid',25677),(1371,'history_log','itemid',25677),(1372,'history_uint','itemid',25677),(1373,'history_str','itemid',25677),(1374,'history','itemid',25677),(1375,'events','itemid',25677),(1376,'trends','itemid',25678),(1377,'trends_uint','itemid',25678),(1378,'history_text','itemid',25678),(1379,'history_log','itemid',25678),(1380,'history_uint','itemid',25678),(1381,'history_str','itemid',25678),(1382,'history','itemid',25678),(1383,'events','itemid',25678),(1384,'trends','itemid',25679),(1385,'trends_uint','itemid',25679),(1386,'history_text','itemid',25679),(1387,'history_log','itemid',25679),(1388,'history_uint','itemid',25679),(1389,'history_str','itemid',25679),(1390,'history','itemid',25679),(1391,'events','itemid',25679),(1392,'trends','itemid',25680),(1393,'trends_uint','itemid',25680),(1394,'history_text','itemid',25680),(1395,'history_log','itemid',25680),(1396,'history_uint','itemid',25680),(1397,'history_str','itemid',25680),(1398,'history','itemid',25680),(1399,'events','itemid',25680),(1400,'trends','itemid',25681),(1401,'trends_uint','itemid',25681),(1402,'history_text','itemid',25681),(1403,'history_log','itemid',25681),(1404,'history_uint','itemid',25681),(1405,'history_str','itemid',25681),(1406,'history','itemid',25681),(1407,'events','itemid',25681),(1408,'trends','itemid',25682),(1409,'trends_uint','itemid',25682),(1410,'history_text','itemid',25682),(1411,'history_log','itemid',25682),(1412,'history_uint','itemid',25682),(1413,'history_str','itemid',25682),(1414,'history','itemid',25682),(1415,'events','itemid',25682),(1416,'trends','itemid',25683),(1417,'trends_uint','itemid',25683),(1418,'history_text','itemid',25683),(1419,'history_log','itemid',25683),(1420,'history_uint','itemid',25683),(1421,'history_str','itemid',25683),(1422,'history','itemid',25683),(1423,'events','itemid',25683),(1424,'trends','itemid',25684),(1425,'trends_uint','itemid',25684),(1426,'history_text','itemid',25684),(1427,'history_log','itemid',25684),(1428,'history_uint','itemid',25684),(1429,'history_str','itemid',25684),(1430,'history','itemid',25684),(1431,'events','itemid',25684),(1432,'trends','itemid',25685),(1433,'trends_uint','itemid',25685),(1434,'history_text','itemid',25685),(1435,'history_log','itemid',25685),(1436,'history_uint','itemid',25685),(1437,'history_str','itemid',25685),(1438,'history','itemid',25685),(1439,'events','itemid',25685),(1440,'trends','itemid',25686),(1441,'trends_uint','itemid',25686),(1442,'history_text','itemid',25686),(1443,'history_log','itemid',25686),(1444,'history_uint','itemid',25686),(1445,'history_str','itemid',25686),(1446,'history','itemid',25686),(1447,'events','itemid',25686),(1448,'trends','itemid',25687),(1449,'trends_uint','itemid',25687),(1450,'history_text','itemid',25687),(1451,'history_log','itemid',25687),(1452,'history_uint','itemid',25687),(1453,'history_str','itemid',25687),(1454,'history','itemid',25687),(1455,'events','itemid',25687),(1456,'trends','itemid',25688),(1457,'trends_uint','itemid',25688),(1458,'history_text','itemid',25688),(1459,'history_log','itemid',25688),(1460,'history_uint','itemid',25688),(1461,'history_str','itemid',25688),(1462,'history','itemid',25688),(1463,'events','itemid',25688),(1464,'trends','itemid',25689),(1465,'trends_uint','itemid',25689),(1466,'history_text','itemid',25689),(1467,'history_log','itemid',25689),(1468,'history_uint','itemid',25689),(1469,'history_str','itemid',25689),(1470,'history','itemid',25689),(1471,'events','itemid',25689),(1472,'trends','itemid',25690),(1473,'trends_uint','itemid',25690),(1474,'history_text','itemid',25690),(1475,'history_log','itemid',25690),(1476,'history_uint','itemid',25690),(1477,'history_str','itemid',25690),(1478,'history','itemid',25690),(1479,'events','itemid',25690),(1480,'trends','itemid',25691),(1481,'trends_uint','itemid',25691),(1482,'history_text','itemid',25691),(1483,'history_log','itemid',25691),(1484,'history_uint','itemid',25691),(1485,'history_str','itemid',25691),(1486,'history','itemid',25691),(1487,'events','itemid',25691),(1488,'trends','itemid',25692),(1489,'trends_uint','itemid',25692),(1490,'history_text','itemid',25692),(1491,'history_log','itemid',25692),(1492,'history_uint','itemid',25692),(1493,'history_str','itemid',25692),(1494,'history','itemid',25692),(1495,'events','itemid',25692),(1496,'trends','itemid',25693),(1497,'trends_uint','itemid',25693),(1498,'history_text','itemid',25693),(1499,'history_log','itemid',25693),(1500,'history_uint','itemid',25693),(1501,'history_str','itemid',25693),(1502,'history','itemid',25693),(1503,'events','itemid',25693),(1504,'trends','itemid',25694),(1505,'trends_uint','itemid',25694),(1506,'history_text','itemid',25694),(1507,'history_log','itemid',25694),(1508,'history_uint','itemid',25694),(1509,'history_str','itemid',25694),(1510,'history','itemid',25694),(1511,'events','itemid',25694),(1512,'trends','itemid',25695),(1513,'trends_uint','itemid',25695),(1514,'history_text','itemid',25695),(1515,'history_log','itemid',25695),(1516,'history_uint','itemid',25695),(1517,'history_str','itemid',25695),(1518,'history','itemid',25695),(1519,'events','itemid',25695),(1520,'trends','itemid',25696),(1521,'trends_uint','itemid',25696),(1522,'history_text','itemid',25696),(1523,'history_log','itemid',25696),(1524,'history_uint','itemid',25696),(1525,'history_str','itemid',25696),(1526,'history','itemid',25696),(1527,'events','itemid',25696),(1528,'trends','itemid',25697),(1529,'trends_uint','itemid',25697),(1530,'history_text','itemid',25697),(1531,'history_log','itemid',25697),(1532,'history_uint','itemid',25697),(1533,'history_str','itemid',25697),(1534,'history','itemid',25697),(1535,'events','itemid',25697),(1536,'trends','itemid',25698),(1537,'trends_uint','itemid',25698),(1538,'history_text','itemid',25698),(1539,'history_log','itemid',25698),(1540,'history_uint','itemid',25698),(1541,'history_str','itemid',25698),(1542,'history','itemid',25698),(1543,'events','itemid',25698),(1544,'trends','itemid',25699),(1545,'trends_uint','itemid',25699),(1546,'history_text','itemid',25699),(1547,'history_log','itemid',25699),(1548,'history_uint','itemid',25699),(1549,'history_str','itemid',25699),(1550,'history','itemid',25699),(1551,'events','itemid',25699),(1552,'trends','itemid',25700),(1553,'trends_uint','itemid',25700),(1554,'history_text','itemid',25700),(1555,'history_log','itemid',25700),(1556,'history_uint','itemid',25700),(1557,'history_str','itemid',25700),(1558,'history','itemid',25700),(1559,'events','itemid',25700),(1560,'trends','itemid',25701),(1561,'trends_uint','itemid',25701),(1562,'history_text','itemid',25701),(1563,'history_log','itemid',25701),(1564,'history_uint','itemid',25701),(1565,'history_str','itemid',25701),(1566,'history','itemid',25701),(1567,'events','itemid',25701),(1568,'trends','itemid',25702),(1569,'trends_uint','itemid',25702),(1570,'history_text','itemid',25702),(1571,'history_log','itemid',25702),(1572,'history_uint','itemid',25702),(1573,'history_str','itemid',25702),(1574,'history','itemid',25702),(1575,'events','itemid',25702),(1576,'trends','itemid',25703),(1577,'trends_uint','itemid',25703),(1578,'history_text','itemid',25703),(1579,'history_log','itemid',25703),(1580,'history_uint','itemid',25703),(1581,'history_str','itemid',25703),(1582,'history','itemid',25703),(1583,'events','itemid',25703),(1584,'trends','itemid',25704),(1585,'trends_uint','itemid',25704),(1586,'history_text','itemid',25704),(1587,'history_log','itemid',25704),(1588,'history_uint','itemid',25704),(1589,'history_str','itemid',25704),(1590,'history','itemid',25704),(1591,'events','itemid',25704),(1592,'trends','itemid',25705),(1593,'trends_uint','itemid',25705),(1594,'history_text','itemid',25705),(1595,'history_log','itemid',25705),(1596,'history_uint','itemid',25705),(1597,'history_str','itemid',25705),(1598,'history','itemid',25705),(1599,'events','itemid',25705),(1600,'trends','itemid',25706),(1601,'trends_uint','itemid',25706),(1602,'history_text','itemid',25706),(1603,'history_log','itemid',25706),(1604,'history_uint','itemid',25706),(1605,'history_str','itemid',25706),(1606,'history','itemid',25706),(1607,'events','itemid',25706),(1608,'trends','itemid',25707),(1609,'trends_uint','itemid',25707),(1610,'history_text','itemid',25707),(1611,'history_log','itemid',25707),(1612,'history_uint','itemid',25707),(1613,'history_str','itemid',25707),(1614,'history','itemid',25707),(1615,'events','itemid',25707),(1616,'trends','itemid',25708),(1617,'trends_uint','itemid',25708),(1618,'history_text','itemid',25708),(1619,'history_log','itemid',25708),(1620,'history_uint','itemid',25708),(1621,'history_str','itemid',25708),(1622,'history','itemid',25708),(1623,'events','itemid',25708),(1624,'trends','itemid',25709),(1625,'trends_uint','itemid',25709),(1626,'history_text','itemid',25709),(1627,'history_log','itemid',25709),(1628,'history_uint','itemid',25709),(1629,'history_str','itemid',25709),(1630,'history','itemid',25709),(1631,'events','itemid',25709),(1632,'trends','itemid',25710),(1633,'trends_uint','itemid',25710),(1634,'history_text','itemid',25710),(1635,'history_log','itemid',25710),(1636,'history_uint','itemid',25710),(1637,'history_str','itemid',25710),(1638,'history','itemid',25710),(1639,'events','itemid',25710),(1640,'trends','itemid',25752),(1641,'trends_uint','itemid',25752),(1642,'history_text','itemid',25752),(1643,'history_log','itemid',25752),(1644,'history_uint','itemid',25752),(1645,'history_str','itemid',25752),(1646,'history','itemid',25752),(1647,'events','itemid',25752),(1648,'trends','itemid',25753),(1649,'trends_uint','itemid',25753),(1650,'history_text','itemid',25753),(1651,'history_log','itemid',25753),(1652,'history_uint','itemid',25753),(1653,'history_str','itemid',25753),(1654,'history','itemid',25753),(1655,'events','itemid',25753),(1656,'trends','itemid',25754),(1657,'trends_uint','itemid',25754),(1658,'history_text','itemid',25754),(1659,'history_log','itemid',25754),(1660,'history_uint','itemid',25754),(1661,'history_str','itemid',25754),(1662,'history','itemid',25754),(1663,'events','itemid',25754),(1664,'trends','itemid',25755),(1665,'trends_uint','itemid',25755),(1666,'history_text','itemid',25755),(1667,'history_log','itemid',25755),(1668,'history_uint','itemid',25755),(1669,'history_str','itemid',25755),(1670,'history','itemid',25755),(1671,'events','itemid',25755),(1672,'trends','itemid',25756),(1673,'trends_uint','itemid',25756),(1674,'history_text','itemid',25756),(1675,'history_log','itemid',25756),(1676,'history_uint','itemid',25756),(1677,'history_str','itemid',25756),(1678,'history','itemid',25756),(1679,'events','itemid',25756),(1680,'trends','itemid',25757),(1681,'trends_uint','itemid',25757),(1682,'history_text','itemid',25757),(1683,'history_log','itemid',25757),(1684,'history_uint','itemid',25757),(1685,'history_str','itemid',25757),(1686,'history','itemid',25757),(1687,'events','itemid',25757),(1688,'trends','itemid',25758),(1689,'trends_uint','itemid',25758),(1690,'history_text','itemid',25758),(1691,'history_log','itemid',25758),(1692,'history_uint','itemid',25758),(1693,'history_str','itemid',25758),(1694,'history','itemid',25758),(1695,'events','itemid',25758),(1696,'trends','itemid',25759),(1697,'trends_uint','itemid',25759),(1698,'history_text','itemid',25759),(1699,'history_log','itemid',25759),(1700,'history_uint','itemid',25759),(1701,'history_str','itemid',25759),(1702,'history','itemid',25759),(1703,'events','itemid',25759),(1704,'trends','itemid',25760),(1705,'trends_uint','itemid',25760),(1706,'history_text','itemid',25760),(1707,'history_log','itemid',25760),(1708,'history_uint','itemid',25760),(1709,'history_str','itemid',25760),(1710,'history','itemid',25760),(1711,'events','itemid',25760),(1712,'trends','itemid',25761),(1713,'trends_uint','itemid',25761),(1714,'history_text','itemid',25761),(1715,'history_log','itemid',25761),(1716,'history_uint','itemid',25761),(1717,'history_str','itemid',25761),(1718,'history','itemid',25761),(1719,'events','itemid',25761),(1720,'trends','itemid',25762),(1721,'trends_uint','itemid',25762),(1722,'history_text','itemid',25762),(1723,'history_log','itemid',25762),(1724,'history_uint','itemid',25762),(1725,'history_str','itemid',25762),(1726,'history','itemid',25762),(1727,'events','itemid',25762),(1728,'trends','itemid',25763),(1729,'trends_uint','itemid',25763),(1730,'history_text','itemid',25763),(1731,'history_log','itemid',25763),(1732,'history_uint','itemid',25763),(1733,'history_str','itemid',25763),(1734,'history','itemid',25763),(1735,'events','itemid',25763),(1736,'trends','itemid',25764),(1737,'trends_uint','itemid',25764),(1738,'history_text','itemid',25764),(1739,'history_log','itemid',25764),(1740,'history_uint','itemid',25764),(1741,'history_str','itemid',25764),(1742,'history','itemid',25764),(1743,'events','itemid',25764),(1744,'trends','itemid',25765),(1745,'trends_uint','itemid',25765),(1746,'history_text','itemid',25765),(1747,'history_log','itemid',25765),(1748,'history_uint','itemid',25765),(1749,'history_str','itemid',25765),(1750,'history','itemid',25765),(1751,'events','itemid',25765),(1752,'trends','itemid',25766),(1753,'trends_uint','itemid',25766),(1754,'history_text','itemid',25766),(1755,'history_log','itemid',25766),(1756,'history_uint','itemid',25766),(1757,'history_str','itemid',25766),(1758,'history','itemid',25766),(1759,'events','itemid',25766),(1760,'trends','itemid',25767),(1761,'trends_uint','itemid',25767),(1762,'history_text','itemid',25767),(1763,'history_log','itemid',25767),(1764,'history_uint','itemid',25767),(1765,'history_str','itemid',25767),(1766,'history','itemid',25767),(1767,'events','itemid',25767),(1768,'trends','itemid',25768),(1769,'trends_uint','itemid',25768),(1770,'history_text','itemid',25768),(1771,'history_log','itemid',25768),(1772,'history_uint','itemid',25768),(1773,'history_str','itemid',25768),(1774,'history','itemid',25768),(1775,'events','itemid',25768),(1776,'trends','itemid',25769),(1777,'trends_uint','itemid',25769),(1778,'history_text','itemid',25769),(1779,'history_log','itemid',25769),(1780,'history_uint','itemid',25769),(1781,'history_str','itemid',25769),(1782,'history','itemid',25769),(1783,'events','itemid',25769),(1784,'trends','itemid',25770),(1785,'trends_uint','itemid',25770),(1786,'history_text','itemid',25770),(1787,'history_log','itemid',25770),(1788,'history_uint','itemid',25770),(1789,'history_str','itemid',25770),(1790,'history','itemid',25770),(1791,'events','itemid',25770),(1792,'trends','itemid',25771),(1793,'trends_uint','itemid',25771),(1794,'history_text','itemid',25771),(1795,'history_log','itemid',25771),(1796,'history_uint','itemid',25771),(1797,'history_str','itemid',25771),(1798,'history','itemid',25771),(1799,'events','itemid',25771),(1800,'trends','itemid',25772),(1801,'trends_uint','itemid',25772),(1802,'history_text','itemid',25772),(1803,'history_log','itemid',25772),(1804,'history_uint','itemid',25772),(1805,'history_str','itemid',25772),(1806,'history','itemid',25772),(1807,'events','itemid',25772),(1808,'events','lldruleid',25508),(1809,'events','lldruleid',25509),(1810,'events','lldruleid',25563),(1811,'events','lldruleid',25564),(1812,'events','lldruleid',25623),(1813,'events','lldruleid',25624),(1814,'events','lldruleid',25711),(1815,'events','lldruleid',25712),(1816,'events','triggerid',13075),(1817,'events','triggerid',13486),(1818,'events','triggerid',13487),(1819,'events','triggerid',13488),(1820,'events','triggerid',13489),(1821,'events','triggerid',13490),(1822,'events','triggerid',13537),(1823,'events','triggerid',13558),(1824,'events','triggerid',13467),(1825,'events','triggerid',13469),(1826,'events','triggerid',13468),(1827,'events','triggerid',13470),(1828,'events','triggerid',13471),(1829,'events','triggerid',13472),(1830,'events','triggerid',13473),(1831,'events','triggerid',13474),(1832,'events','triggerid',13475),(1833,'events','triggerid',13476),(1834,'events','triggerid',13477),(1835,'events','triggerid',13479),(1836,'events','triggerid',13480),(1837,'events','triggerid',13481),(1838,'events','triggerid',13482),(1839,'events','triggerid',13560),(1840,'events','triggerid',13483),(1841,'events','triggerid',13484),(1842,'events','triggerid',13485),(1843,'events','triggerid',13436),(1844,'events','triggerid',13619),(1845,'events','triggerid',13620),(1846,'events','triggerid',13621),(1847,'events','triggerid',13622),(1848,'events','triggerid',13623),(1849,'events','triggerid',13624),(1850,'events','triggerid',13625),(1851,'events','triggerid',13626),(1852,'events','triggerid',13627),(1853,'events','triggerid',13628),(1854,'events','triggerid',13629),(1855,'events','triggerid',13630),(1856,'events','triggerid',13631),(1857,'events','triggerid',13632),(1858,'events','triggerid',13633),(1859,'events','triggerid',13640),(1860,'events','triggerid',13641),(1861,'events','triggerid',13642),(1862,'events','triggerid',13643),(1863,'events','triggerid',13644),(1864,'events','triggerid',13645),(1865,'events','triggerid',13646),(1866,'events','triggerid',13647),(1867,'events','triggerid',13648),(1868,'events','triggerid',13649),(1869,'events','triggerid',13650),(1870,'events','triggerid',13651),(1871,'events','triggerid',13652),(1872,'events','triggerid',13653),(1873,'events','triggerid',13654),(1874,'events','triggerid',13663),(1875,'events','triggerid',13664),(1876,'events','triggerid',13665),(1877,'events','triggerid',13666),(1878,'events','triggerid',13667),(1879,'events','triggerid',13668),(1880,'events','triggerid',13669),(1881,'events','triggerid',13670),(1882,'events','triggerid',13671),(1883,'events','triggerid',13672),(1884,'events','triggerid',13673),(1885,'events','triggerid',13674),(1886,'events','triggerid',13675),(1887,'events','triggerid',13676),(1888,'events','triggerid',13677),(1889,'events','triggerid',13686),(1890,'events','triggerid',13687),(1891,'events','triggerid',13688),(1892,'events','triggerid',13689),(1893,'events','triggerid',13690),(1894,'events','triggerid',13691),(1895,'events','triggerid',13692),(1896,'events','triggerid',13693),(1897,'events','triggerid',13694),(1898,'events','triggerid',13695),(1899,'events','triggerid',13696),(1900,'events','triggerid',13697),(1901,'events','triggerid',13698),(1902,'events','triggerid',13699),(1903,'events','triggerid',13700),(1904,'trends','itemid',23252),(1905,'trends_uint','itemid',23252),(1906,'history_text','itemid',23252),(1907,'history_log','itemid',23252),(1908,'history_uint','itemid',23252),(1909,'history_str','itemid',23252),(1910,'history','itemid',23252),(1911,'events','itemid',23252),(1912,'trends','itemid',23253),(1913,'trends_uint','itemid',23253),(1914,'history_text','itemid',23253),(1915,'history_log','itemid',23253),(1916,'history_uint','itemid',23253),(1917,'history_str','itemid',23253),(1918,'history','itemid',23253),(1919,'events','itemid',23253),(1920,'trends','itemid',23254),(1921,'trends_uint','itemid',23254),(1922,'history_text','itemid',23254),(1923,'history_log','itemid',23254),(1924,'history_uint','itemid',23254),(1925,'history_str','itemid',23254),(1926,'history','itemid',23254),(1927,'events','itemid',23254),(1928,'trends','itemid',23255),(1929,'trends_uint','itemid',23255),(1930,'history_text','itemid',23255),(1931,'history_log','itemid',23255),(1932,'history_uint','itemid',23255),(1933,'history_str','itemid',23255),(1934,'history','itemid',23255),(1935,'events','itemid',23255),(1936,'trends','itemid',23256),(1937,'trends_uint','itemid',23256),(1938,'history_text','itemid',23256),(1939,'history_log','itemid',23256),(1940,'history_uint','itemid',23256),(1941,'history_str','itemid',23256),(1942,'history','itemid',23256),(1943,'events','itemid',23256),(1944,'trends','itemid',23257),(1945,'trends_uint','itemid',23257),(1946,'history_text','itemid',23257),(1947,'history_log','itemid',23257),(1948,'history_uint','itemid',23257),(1949,'history_str','itemid',23257),(1950,'history','itemid',23257),(1951,'events','itemid',23257),(1952,'trends','itemid',23258),(1953,'trends_uint','itemid',23258),(1954,'history_text','itemid',23258),(1955,'history_log','itemid',23258),(1956,'history_uint','itemid',23258),(1957,'history_str','itemid',23258),(1958,'history','itemid',23258),(1959,'events','itemid',23258),(1960,'trends','itemid',23259),(1961,'trends_uint','itemid',23259),(1962,'history_text','itemid',23259),(1963,'history_log','itemid',23259),(1964,'history_uint','itemid',23259),(1965,'history_str','itemid',23259),(1966,'history','itemid',23259),(1967,'events','itemid',23259),(1968,'trends','itemid',23260),(1969,'trends_uint','itemid',23260),(1970,'history_text','itemid',23260),(1971,'history_log','itemid',23260),(1972,'history_uint','itemid',23260),(1973,'history_str','itemid',23260),(1974,'history','itemid',23260),(1975,'events','itemid',23260),(1976,'trends','itemid',23261),(1977,'trends_uint','itemid',23261),(1978,'history_text','itemid',23261),(1979,'history_log','itemid',23261),(1980,'history_uint','itemid',23261),(1981,'history_str','itemid',23261),(1982,'history','itemid',23261),(1983,'events','itemid',23261),(1984,'trends','itemid',23262),(1985,'trends_uint','itemid',23262),(1986,'history_text','itemid',23262),(1987,'history_log','itemid',23262),(1988,'history_uint','itemid',23262),(1989,'history_str','itemid',23262),(1990,'history','itemid',23262),(1991,'events','itemid',23262),(1992,'trends','itemid',23264),(1993,'trends_uint','itemid',23264),(1994,'history_text','itemid',23264),(1995,'history_log','itemid',23264),(1996,'history_uint','itemid',23264),(1997,'history_str','itemid',23264),(1998,'history','itemid',23264),(1999,'events','itemid',23264),(2000,'trends','itemid',23265),(2001,'trends_uint','itemid',23265),(2002,'history_text','itemid',23265),(2003,'history_log','itemid',23265),(2004,'history_uint','itemid',23265),(2005,'history_str','itemid',23265),(2006,'history','itemid',23265),(2007,'events','itemid',23265),(2008,'trends','itemid',23266),(2009,'trends_uint','itemid',23266),(2010,'history_text','itemid',23266),(2011,'history_log','itemid',23266),(2012,'history_uint','itemid',23266),(2013,'history_str','itemid',23266),(2014,'history','itemid',23266),(2015,'events','itemid',23266),(2016,'trends','itemid',23267),(2017,'trends_uint','itemid',23267),(2018,'history_text','itemid',23267),(2019,'history_log','itemid',23267),(2020,'history_uint','itemid',23267),(2021,'history_str','itemid',23267),(2022,'history','itemid',23267),(2023,'events','itemid',23267),(2024,'trends','itemid',23268),(2025,'trends_uint','itemid',23268),(2026,'history_text','itemid',23268),(2027,'history_log','itemid',23268),(2028,'history_uint','itemid',23268),(2029,'history_str','itemid',23268),(2030,'history','itemid',23268),(2031,'events','itemid',23268),(2032,'trends','itemid',23269),(2033,'trends_uint','itemid',23269),(2034,'history_text','itemid',23269),(2035,'history_log','itemid',23269),(2036,'history_uint','itemid',23269),(2037,'history_str','itemid',23269),(2038,'history','itemid',23269),(2039,'events','itemid',23269),(2040,'trends','itemid',23270),(2041,'trends_uint','itemid',23270),(2042,'history_text','itemid',23270),(2043,'history_log','itemid',23270),(2044,'history_uint','itemid',23270),(2045,'history_str','itemid',23270),(2046,'history','itemid',23270),(2047,'events','itemid',23270),(2048,'trends','itemid',23271),(2049,'trends_uint','itemid',23271),(2050,'history_text','itemid',23271),(2051,'history_log','itemid',23271),(2052,'history_uint','itemid',23271),(2053,'history_str','itemid',23271),(2054,'history','itemid',23271),(2055,'events','itemid',23271),(2056,'trends','itemid',23272),(2057,'trends_uint','itemid',23272),(2058,'history_text','itemid',23272),(2059,'history_log','itemid',23272),(2060,'history_uint','itemid',23272),(2061,'history_str','itemid',23272),(2062,'history','itemid',23272),(2063,'events','itemid',23272),(2064,'trends','itemid',23273),(2065,'trends_uint','itemid',23273),(2066,'history_text','itemid',23273),(2067,'history_log','itemid',23273),(2068,'history_uint','itemid',23273),(2069,'history_str','itemid',23273),(2070,'history','itemid',23273),(2071,'events','itemid',23273),(2072,'trends','itemid',23274),(2073,'trends_uint','itemid',23274),(2074,'history_text','itemid',23274),(2075,'history_log','itemid',23274),(2076,'history_uint','itemid',23274),(2077,'history_str','itemid',23274),(2078,'history','itemid',23274),(2079,'events','itemid',23274),(2080,'trends','itemid',23275),(2081,'trends_uint','itemid',23275),(2082,'history_text','itemid',23275),(2083,'history_log','itemid',23275),(2084,'history_uint','itemid',23275),(2085,'history_str','itemid',23275),(2086,'history','itemid',23275),(2087,'events','itemid',23275),(2088,'trends','itemid',23276),(2089,'trends_uint','itemid',23276),(2090,'history_text','itemid',23276),(2091,'history_log','itemid',23276),(2092,'history_uint','itemid',23276),(2093,'history_str','itemid',23276),(2094,'history','itemid',23276),(2095,'events','itemid',23276),(2096,'trends','itemid',23277),(2097,'trends_uint','itemid',23277),(2098,'history_text','itemid',23277),(2099,'history_log','itemid',23277),(2100,'history_uint','itemid',23277),(2101,'history_str','itemid',23277),(2102,'history','itemid',23277),(2103,'events','itemid',23277),(2104,'trends','itemid',23328),(2105,'trends_uint','itemid',23328),(2106,'history_text','itemid',23328),(2107,'history_log','itemid',23328),(2108,'history_uint','itemid',23328),(2109,'history_str','itemid',23328),(2110,'history','itemid',23328),(2111,'events','itemid',23328),(2112,'trends','itemid',23620),(2113,'trends_uint','itemid',23620),(2114,'history_text','itemid',23620),(2115,'history_log','itemid',23620),(2116,'history_uint','itemid',23620),(2117,'history_str','itemid',23620),(2118,'history','itemid',23620),(2119,'events','itemid',23620),(2120,'trends','itemid',23625),(2121,'trends_uint','itemid',23625),(2122,'history_text','itemid',23625),(2123,'history_log','itemid',23625),(2124,'history_uint','itemid',23625),(2125,'history_str','itemid',23625),(2126,'history','itemid',23625),(2127,'events','itemid',23625),(2128,'trends','itemid',23628),(2129,'trends_uint','itemid',23628),(2130,'history_text','itemid',23628),(2131,'history_log','itemid',23628),(2132,'history_uint','itemid',23628),(2133,'history_str','itemid',23628),(2134,'history','itemid',23628),(2135,'events','itemid',23628),(2136,'trends','itemid',23635),(2137,'trends_uint','itemid',23635),(2138,'history_text','itemid',23635),(2139,'history_log','itemid',23635),(2140,'history_uint','itemid',23635),(2141,'history_str','itemid',23635),(2142,'history','itemid',23635),(2143,'events','itemid',23635),(2144,'trends','itemid',23662),(2145,'trends_uint','itemid',23662),(2146,'history_text','itemid',23662),(2147,'history_log','itemid',23662),(2148,'history_uint','itemid',23662),(2149,'history_str','itemid',23662),(2150,'history','itemid',23662),(2151,'events','itemid',23662),(2152,'trends','itemid',23664),(2153,'trends_uint','itemid',23664),(2154,'history_text','itemid',23664),(2155,'history_log','itemid',23664),(2156,'history_uint','itemid',23664),(2157,'history_str','itemid',23664),(2158,'history','itemid',23664),(2159,'events','itemid',23664),(2160,'trends','itemid',25517),(2161,'trends_uint','itemid',25517),(2162,'history_text','itemid',25517),(2163,'history_log','itemid',25517),(2164,'history_uint','itemid',25517),(2165,'history_str','itemid',25517),(2166,'history','itemid',25517),(2167,'events','itemid',25517),(2168,'trends','itemid',25518),(2169,'trends_uint','itemid',25518),(2170,'history_text','itemid',25518),(2171,'history_log','itemid',25518),(2172,'history_uint','itemid',25518),(2173,'history_str','itemid',25518),(2174,'history','itemid',25518),(2175,'events','itemid',25518),(2176,'trends','itemid',25519),(2177,'trends_uint','itemid',25519),(2178,'history_text','itemid',25519),(2179,'history_log','itemid',25519),(2180,'history_uint','itemid',25519),(2181,'history_str','itemid',25519),(2182,'history','itemid',25519),(2183,'events','itemid',25519),(2184,'trends','itemid',25520),(2185,'trends_uint','itemid',25520),(2186,'history_text','itemid',25520),(2187,'history_log','itemid',25520),(2188,'history_uint','itemid',25520),(2189,'history_str','itemid',25520),(2190,'history','itemid',25520),(2191,'events','itemid',25520),(2192,'trends','itemid',25521),(2193,'trends_uint','itemid',25521),(2194,'history_text','itemid',25521),(2195,'history_log','itemid',25521),(2196,'history_uint','itemid',25521),(2197,'history_str','itemid',25521),(2198,'history','itemid',25521),(2199,'events','itemid',25521),(2200,'trends','itemid',25522),(2201,'trends_uint','itemid',25522),(2202,'history_text','itemid',25522),(2203,'history_log','itemid',25522),(2204,'history_uint','itemid',25522),(2205,'history_str','itemid',25522),(2206,'history','itemid',25522),(2207,'events','itemid',25522),(2208,'trends','itemid',25523),(2209,'trends_uint','itemid',25523),(2210,'history_text','itemid',25523),(2211,'history_log','itemid',25523),(2212,'history_uint','itemid',25523),(2213,'history_str','itemid',25523),(2214,'history','itemid',25523),(2215,'events','itemid',25523),(2216,'trends','itemid',25524),(2217,'trends_uint','itemid',25524),(2218,'history_text','itemid',25524),(2219,'history_log','itemid',25524),(2220,'history_uint','itemid',25524),(2221,'history_str','itemid',25524),(2222,'history','itemid',25524),(2223,'events','itemid',25524),(2224,'trends','itemid',25525),(2225,'trends_uint','itemid',25525),(2226,'history_text','itemid',25525),(2227,'history_log','itemid',25525),(2228,'history_uint','itemid',25525),(2229,'history_str','itemid',25525),(2230,'history','itemid',25525),(2231,'events','itemid',25525),(2232,'trends','itemid',25526),(2233,'trends_uint','itemid',25526),(2234,'history_text','itemid',25526),(2235,'history_log','itemid',25526),(2236,'history_uint','itemid',25526),(2237,'history_str','itemid',25526),(2238,'history','itemid',25526),(2239,'events','itemid',25526),(2240,'trends','itemid',25527),(2241,'trends_uint','itemid',25527),(2242,'history_text','itemid',25527),(2243,'history_log','itemid',25527),(2244,'history_uint','itemid',25527),(2245,'history_str','itemid',25527),(2246,'history','itemid',25527),(2247,'events','itemid',25527),(2248,'trends','itemid',25528),(2249,'trends_uint','itemid',25528),(2250,'history_text','itemid',25528),(2251,'history_log','itemid',25528),(2252,'history_uint','itemid',25528),(2253,'history_str','itemid',25528),(2254,'history','itemid',25528),(2255,'events','itemid',25528),(2256,'trends','itemid',25529),(2257,'trends_uint','itemid',25529),(2258,'history_text','itemid',25529),(2259,'history_log','itemid',25529),(2260,'history_uint','itemid',25529),(2261,'history_str','itemid',25529),(2262,'history','itemid',25529),(2263,'events','itemid',25529),(2264,'trends','itemid',25530),(2265,'trends_uint','itemid',25530),(2266,'history_text','itemid',25530),(2267,'history_log','itemid',25530),(2268,'history_uint','itemid',25530),(2269,'history_str','itemid',25530),(2270,'history','itemid',25530),(2271,'events','itemid',25530),(2272,'trends','itemid',25531),(2273,'trends_uint','itemid',25531),(2274,'history_text','itemid',25531),(2275,'history_log','itemid',25531),(2276,'history_uint','itemid',25531),(2277,'history_str','itemid',25531),(2278,'history','itemid',25531),(2279,'events','itemid',25531),(2280,'trends','itemid',25532),(2281,'trends_uint','itemid',25532),(2282,'history_text','itemid',25532),(2283,'history_log','itemid',25532),(2284,'history_uint','itemid',25532),(2285,'history_str','itemid',25532),(2286,'history','itemid',25532),(2287,'events','itemid',25532),(2288,'trends','itemid',25533),(2289,'trends_uint','itemid',25533),(2290,'history_text','itemid',25533),(2291,'history_log','itemid',25533),(2292,'history_uint','itemid',25533),(2293,'history_str','itemid',25533),(2294,'history','itemid',25533),(2295,'events','itemid',25533),(2296,'trends','itemid',25534),(2297,'trends_uint','itemid',25534),(2298,'history_text','itemid',25534),(2299,'history_log','itemid',25534),(2300,'history_uint','itemid',25534),(2301,'history_str','itemid',25534),(2302,'history','itemid',25534),(2303,'events','itemid',25534),(2304,'trends','itemid',25535),(2305,'trends_uint','itemid',25535),(2306,'history_text','itemid',25535),(2307,'history_log','itemid',25535),(2308,'history_uint','itemid',25535),(2309,'history_str','itemid',25535),(2310,'history','itemid',25535),(2311,'events','itemid',25535),(2312,'trends','itemid',25536),(2313,'trends_uint','itemid',25536),(2314,'history_text','itemid',25536),(2315,'history_log','itemid',25536),(2316,'history_uint','itemid',25536),(2317,'history_str','itemid',25536),(2318,'history','itemid',25536),(2319,'events','itemid',25536),(2320,'trends','itemid',25537),(2321,'trends_uint','itemid',25537),(2322,'history_text','itemid',25537),(2323,'history_log','itemid',25537),(2324,'history_uint','itemid',25537),(2325,'history_str','itemid',25537),(2326,'history','itemid',25537),(2327,'events','itemid',25537),(2328,'trends','itemid',25538),(2329,'trends_uint','itemid',25538),(2330,'history_text','itemid',25538),(2331,'history_log','itemid',25538),(2332,'history_uint','itemid',25538),(2333,'history_str','itemid',25538),(2334,'history','itemid',25538),(2335,'events','itemid',25538),(2336,'trends','itemid',25539),(2337,'trends_uint','itemid',25539),(2338,'history_text','itemid',25539),(2339,'history_log','itemid',25539),(2340,'history_uint','itemid',25539),(2341,'history_str','itemid',25539),(2342,'history','itemid',25539),(2343,'events','itemid',25539),(2344,'trends','itemid',25540),(2345,'trends_uint','itemid',25540),(2346,'history_text','itemid',25540),(2347,'history_log','itemid',25540),(2348,'history_uint','itemid',25540),(2349,'history_str','itemid',25540),(2350,'history','itemid',25540),(2351,'events','itemid',25540),(2352,'trends','itemid',25541),(2353,'trends_uint','itemid',25541),(2354,'history_text','itemid',25541),(2355,'history_log','itemid',25541),(2356,'history_uint','itemid',25541),(2357,'history_str','itemid',25541),(2358,'history','itemid',25541),(2359,'events','itemid',25541),(2360,'trends','itemid',25542),(2361,'trends_uint','itemid',25542),(2362,'history_text','itemid',25542),(2363,'history_log','itemid',25542),(2364,'history_uint','itemid',25542),(2365,'history_str','itemid',25542),(2366,'history','itemid',25542),(2367,'events','itemid',25542),(2368,'trends','itemid',25543),(2369,'trends_uint','itemid',25543),(2370,'history_text','itemid',25543),(2371,'history_log','itemid',25543),(2372,'history_uint','itemid',25543),(2373,'history_str','itemid',25543),(2374,'history','itemid',25543),(2375,'events','itemid',25543),(2376,'trends','itemid',25544),(2377,'trends_uint','itemid',25544),(2378,'history_text','itemid',25544),(2379,'history_log','itemid',25544),(2380,'history_uint','itemid',25544),(2381,'history_str','itemid',25544),(2382,'history','itemid',25544),(2383,'events','itemid',25544),(2384,'trends','itemid',25545),(2385,'trends_uint','itemid',25545),(2386,'history_text','itemid',25545),(2387,'history_log','itemid',25545),(2388,'history_uint','itemid',25545),(2389,'history_str','itemid',25545),(2390,'history','itemid',25545),(2391,'events','itemid',25545),(2392,'trends','itemid',25546),(2393,'trends_uint','itemid',25546),(2394,'history_text','itemid',25546),(2395,'history_log','itemid',25546),(2396,'history_uint','itemid',25546),(2397,'history_str','itemid',25546),(2398,'history','itemid',25546),(2399,'events','itemid',25546),(2400,'trends','itemid',25547),(2401,'trends_uint','itemid',25547),(2402,'history_text','itemid',25547),(2403,'history_log','itemid',25547),(2404,'history_uint','itemid',25547),(2405,'history_str','itemid',25547),(2406,'history','itemid',25547),(2407,'events','itemid',25547),(2408,'trends','itemid',25548),(2409,'trends_uint','itemid',25548),(2410,'history_text','itemid',25548),(2411,'history_log','itemid',25548),(2412,'history_uint','itemid',25548),(2413,'history_str','itemid',25548),(2414,'history','itemid',25548),(2415,'events','itemid',25548),(2416,'trends','itemid',25572),(2417,'trends_uint','itemid',25572),(2418,'history_text','itemid',25572),(2419,'history_log','itemid',25572),(2420,'history_uint','itemid',25572),(2421,'history_str','itemid',25572),(2422,'history','itemid',25572),(2423,'events','itemid',25572),(2424,'trends','itemid',25573),(2425,'trends_uint','itemid',25573),(2426,'history_text','itemid',25573),(2427,'history_log','itemid',25573),(2428,'history_uint','itemid',25573),(2429,'history_str','itemid',25573),(2430,'history','itemid',25573),(2431,'events','itemid',25573),(2432,'trends','itemid',25574),(2433,'trends_uint','itemid',25574),(2434,'history_text','itemid',25574),(2435,'history_log','itemid',25574),(2436,'history_uint','itemid',25574),(2437,'history_str','itemid',25574),(2438,'history','itemid',25574),(2439,'events','itemid',25574),(2440,'trends','itemid',25575),(2441,'trends_uint','itemid',25575),(2442,'history_text','itemid',25575),(2443,'history_log','itemid',25575),(2444,'history_uint','itemid',25575),(2445,'history_str','itemid',25575),(2446,'history','itemid',25575),(2447,'events','itemid',25575),(2448,'trends','itemid',25576),(2449,'trends_uint','itemid',25576),(2450,'history_text','itemid',25576),(2451,'history_log','itemid',25576),(2452,'history_uint','itemid',25576),(2453,'history_str','itemid',25576),(2454,'history','itemid',25576),(2455,'events','itemid',25576),(2456,'trends','itemid',25577),(2457,'trends_uint','itemid',25577),(2458,'history_text','itemid',25577),(2459,'history_log','itemid',25577),(2460,'history_uint','itemid',25577),(2461,'history_str','itemid',25577),(2462,'history','itemid',25577),(2463,'events','itemid',25577),(2464,'trends','itemid',25578),(2465,'trends_uint','itemid',25578),(2466,'history_text','itemid',25578),(2467,'history_log','itemid',25578),(2468,'history_uint','itemid',25578),(2469,'history_str','itemid',25578),(2470,'history','itemid',25578),(2471,'events','itemid',25578),(2472,'trends','itemid',25579),(2473,'trends_uint','itemid',25579),(2474,'history_text','itemid',25579),(2475,'history_log','itemid',25579),(2476,'history_uint','itemid',25579),(2477,'history_str','itemid',25579),(2478,'history','itemid',25579),(2479,'events','itemid',25579),(2480,'trends','itemid',25580),(2481,'trends_uint','itemid',25580),(2482,'history_text','itemid',25580),(2483,'history_log','itemid',25580),(2484,'history_uint','itemid',25580),(2485,'history_str','itemid',25580),(2486,'history','itemid',25580),(2487,'events','itemid',25580),(2488,'trends','itemid',25581),(2489,'trends_uint','itemid',25581),(2490,'history_text','itemid',25581),(2491,'history_log','itemid',25581),(2492,'history_uint','itemid',25581),(2493,'history_str','itemid',25581),(2494,'history','itemid',25581),(2495,'events','itemid',25581),(2496,'trends','itemid',25582),(2497,'trends_uint','itemid',25582),(2498,'history_text','itemid',25582),(2499,'history_log','itemid',25582),(2500,'history_uint','itemid',25582),(2501,'history_str','itemid',25582),(2502,'history','itemid',25582),(2503,'events','itemid',25582),(2504,'trends','itemid',25583),(2505,'trends_uint','itemid',25583),(2506,'history_text','itemid',25583),(2507,'history_log','itemid',25583),(2508,'history_uint','itemid',25583),(2509,'history_str','itemid',25583),(2510,'history','itemid',25583),(2511,'events','itemid',25583),(2512,'trends','itemid',25584),(2513,'trends_uint','itemid',25584),(2514,'history_text','itemid',25584),(2515,'history_log','itemid',25584),(2516,'history_uint','itemid',25584),(2517,'history_str','itemid',25584),(2518,'history','itemid',25584),(2519,'events','itemid',25584),(2520,'trends','itemid',25585),(2521,'trends_uint','itemid',25585),(2522,'history_text','itemid',25585),(2523,'history_log','itemid',25585),(2524,'history_uint','itemid',25585),(2525,'history_str','itemid',25585),(2526,'history','itemid',25585),(2527,'events','itemid',25585),(2528,'trends','itemid',25586),(2529,'trends_uint','itemid',25586),(2530,'history_text','itemid',25586),(2531,'history_log','itemid',25586),(2532,'history_uint','itemid',25586),(2533,'history_str','itemid',25586),(2534,'history','itemid',25586),(2535,'events','itemid',25586),(2536,'trends','itemid',25587),(2537,'trends_uint','itemid',25587),(2538,'history_text','itemid',25587),(2539,'history_log','itemid',25587),(2540,'history_uint','itemid',25587),(2541,'history_str','itemid',25587),(2542,'history','itemid',25587),(2543,'events','itemid',25587),(2544,'trends','itemid',25588),(2545,'trends_uint','itemid',25588),(2546,'history_text','itemid',25588),(2547,'history_log','itemid',25588),(2548,'history_uint','itemid',25588),(2549,'history_str','itemid',25588),(2550,'history','itemid',25588),(2551,'events','itemid',25588),(2552,'trends','itemid',25589),(2553,'trends_uint','itemid',25589),(2554,'history_text','itemid',25589),(2555,'history_log','itemid',25589),(2556,'history_uint','itemid',25589),(2557,'history_str','itemid',25589),(2558,'history','itemid',25589),(2559,'events','itemid',25589),(2560,'trends','itemid',25590),(2561,'trends_uint','itemid',25590),(2562,'history_text','itemid',25590),(2563,'history_log','itemid',25590),(2564,'history_uint','itemid',25590),(2565,'history_str','itemid',25590),(2566,'history','itemid',25590),(2567,'events','itemid',25590),(2568,'trends','itemid',25591),(2569,'trends_uint','itemid',25591),(2570,'history_text','itemid',25591),(2571,'history_log','itemid',25591),(2572,'history_uint','itemid',25591),(2573,'history_str','itemid',25591),(2574,'history','itemid',25591),(2575,'events','itemid',25591),(2576,'trends','itemid',25592),(2577,'trends_uint','itemid',25592),(2578,'history_text','itemid',25592),(2579,'history_log','itemid',25592),(2580,'history_uint','itemid',25592),(2581,'history_str','itemid',25592),(2582,'history','itemid',25592),(2583,'events','itemid',25592),(2584,'trends','itemid',25593),(2585,'trends_uint','itemid',25593),(2586,'history_text','itemid',25593),(2587,'history_log','itemid',25593),(2588,'history_uint','itemid',25593),(2589,'history_str','itemid',25593),(2590,'history','itemid',25593),(2591,'events','itemid',25593),(2592,'trends','itemid',25594),(2593,'trends_uint','itemid',25594),(2594,'history_text','itemid',25594),(2595,'history_log','itemid',25594),(2596,'history_uint','itemid',25594),(2597,'history_str','itemid',25594),(2598,'history','itemid',25594),(2599,'events','itemid',25594),(2600,'trends','itemid',25595),(2601,'trends_uint','itemid',25595),(2602,'history_text','itemid',25595),(2603,'history_log','itemid',25595),(2604,'history_uint','itemid',25595),(2605,'history_str','itemid',25595),(2606,'history','itemid',25595),(2607,'events','itemid',25595),(2608,'trends','itemid',25596),(2609,'trends_uint','itemid',25596),(2610,'history_text','itemid',25596),(2611,'history_log','itemid',25596),(2612,'history_uint','itemid',25596),(2613,'history_str','itemid',25596),(2614,'history','itemid',25596),(2615,'events','itemid',25596),(2616,'trends','itemid',25597),(2617,'trends_uint','itemid',25597),(2618,'history_text','itemid',25597),(2619,'history_log','itemid',25597),(2620,'history_uint','itemid',25597),(2621,'history_str','itemid',25597),(2622,'history','itemid',25597),(2623,'events','itemid',25597),(2624,'trends','itemid',25598),(2625,'trends_uint','itemid',25598),(2626,'history_text','itemid',25598),(2627,'history_log','itemid',25598),(2628,'history_uint','itemid',25598),(2629,'history_str','itemid',25598),(2630,'history','itemid',25598),(2631,'events','itemid',25598),(2632,'trends','itemid',25599),(2633,'trends_uint','itemid',25599),(2634,'history_text','itemid',25599),(2635,'history_log','itemid',25599),(2636,'history_uint','itemid',25599),(2637,'history_str','itemid',25599),(2638,'history','itemid',25599),(2639,'events','itemid',25599),(2640,'trends','itemid',25600),(2641,'trends_uint','itemid',25600),(2642,'history_text','itemid',25600),(2643,'history_log','itemid',25600),(2644,'history_uint','itemid',25600),(2645,'history_str','itemid',25600),(2646,'history','itemid',25600),(2647,'events','itemid',25600),(2648,'trends','itemid',25601),(2649,'trends_uint','itemid',25601),(2650,'history_text','itemid',25601),(2651,'history_log','itemid',25601),(2652,'history_uint','itemid',25601),(2653,'history_str','itemid',25601),(2654,'history','itemid',25601),(2655,'events','itemid',25601),(2656,'trends','itemid',25602),(2657,'trends_uint','itemid',25602),(2658,'history_text','itemid',25602),(2659,'history_log','itemid',25602),(2660,'history_uint','itemid',25602),(2661,'history_str','itemid',25602),(2662,'history','itemid',25602),(2663,'events','itemid',25602),(2664,'trends','itemid',25603),(2665,'trends_uint','itemid',25603),(2666,'history_text','itemid',25603),(2667,'history_log','itemid',25603),(2668,'history_uint','itemid',25603),(2669,'history_str','itemid',25603),(2670,'history','itemid',25603),(2671,'events','itemid',25603),(2672,'trends','itemid',25632),(2673,'trends_uint','itemid',25632),(2674,'history_text','itemid',25632),(2675,'history_log','itemid',25632),(2676,'history_uint','itemid',25632),(2677,'history_str','itemid',25632),(2678,'history','itemid',25632),(2679,'events','itemid',25632),(2680,'trends','itemid',25633),(2681,'trends_uint','itemid',25633),(2682,'history_text','itemid',25633),(2683,'history_log','itemid',25633),(2684,'history_uint','itemid',25633),(2685,'history_str','itemid',25633),(2686,'history','itemid',25633),(2687,'events','itemid',25633),(2688,'trends','itemid',25634),(2689,'trends_uint','itemid',25634),(2690,'history_text','itemid',25634),(2691,'history_log','itemid',25634),(2692,'history_uint','itemid',25634),(2693,'history_str','itemid',25634),(2694,'history','itemid',25634),(2695,'events','itemid',25634),(2696,'trends','itemid',25635),(2697,'trends_uint','itemid',25635),(2698,'history_text','itemid',25635),(2699,'history_log','itemid',25635),(2700,'history_uint','itemid',25635),(2701,'history_str','itemid',25635),(2702,'history','itemid',25635),(2703,'events','itemid',25635),(2704,'trends','itemid',25636),(2705,'trends_uint','itemid',25636),(2706,'history_text','itemid',25636),(2707,'history_log','itemid',25636),(2708,'history_uint','itemid',25636),(2709,'history_str','itemid',25636),(2710,'history','itemid',25636),(2711,'events','itemid',25636),(2712,'trends','itemid',25637),(2713,'trends_uint','itemid',25637),(2714,'history_text','itemid',25637),(2715,'history_log','itemid',25637),(2716,'history_uint','itemid',25637),(2717,'history_str','itemid',25637),(2718,'history','itemid',25637),(2719,'events','itemid',25637),(2720,'trends','itemid',25638),(2721,'trends_uint','itemid',25638),(2722,'history_text','itemid',25638),(2723,'history_log','itemid',25638),(2724,'history_uint','itemid',25638),(2725,'history_str','itemid',25638),(2726,'history','itemid',25638),(2727,'events','itemid',25638),(2728,'trends','itemid',25639),(2729,'trends_uint','itemid',25639),(2730,'history_text','itemid',25639),(2731,'history_log','itemid',25639),(2732,'history_uint','itemid',25639),(2733,'history_str','itemid',25639),(2734,'history','itemid',25639),(2735,'events','itemid',25639),(2736,'trends','itemid',25640),(2737,'trends_uint','itemid',25640),(2738,'history_text','itemid',25640),(2739,'history_log','itemid',25640),(2740,'history_uint','itemid',25640),(2741,'history_str','itemid',25640),(2742,'history','itemid',25640),(2743,'events','itemid',25640),(2744,'trends','itemid',25641),(2745,'trends_uint','itemid',25641),(2746,'history_text','itemid',25641),(2747,'history_log','itemid',25641),(2748,'history_uint','itemid',25641),(2749,'history_str','itemid',25641),(2750,'history','itemid',25641),(2751,'events','itemid',25641),(2752,'trends','itemid',25642),(2753,'trends_uint','itemid',25642),(2754,'history_text','itemid',25642),(2755,'history_log','itemid',25642),(2756,'history_uint','itemid',25642),(2757,'history_str','itemid',25642),(2758,'history','itemid',25642),(2759,'events','itemid',25642),(2760,'trends','itemid',25643),(2761,'trends_uint','itemid',25643),(2762,'history_text','itemid',25643),(2763,'history_log','itemid',25643),(2764,'history_uint','itemid',25643),(2765,'history_str','itemid',25643),(2766,'history','itemid',25643),(2767,'events','itemid',25643),(2768,'trends','itemid',25644),(2769,'trends_uint','itemid',25644),(2770,'history_text','itemid',25644),(2771,'history_log','itemid',25644),(2772,'history_uint','itemid',25644),(2773,'history_str','itemid',25644),(2774,'history','itemid',25644),(2775,'events','itemid',25644),(2776,'trends','itemid',25645),(2777,'trends_uint','itemid',25645),(2778,'history_text','itemid',25645),(2779,'history_log','itemid',25645),(2780,'history_uint','itemid',25645),(2781,'history_str','itemid',25645),(2782,'history','itemid',25645),(2783,'events','itemid',25645),(2784,'trends','itemid',25646),(2785,'trends_uint','itemid',25646),(2786,'history_text','itemid',25646),(2787,'history_log','itemid',25646),(2788,'history_uint','itemid',25646),(2789,'history_str','itemid',25646),(2790,'history','itemid',25646),(2791,'events','itemid',25646),(2792,'trends','itemid',25647),(2793,'trends_uint','itemid',25647),(2794,'history_text','itemid',25647),(2795,'history_log','itemid',25647),(2796,'history_uint','itemid',25647),(2797,'history_str','itemid',25647),(2798,'history','itemid',25647),(2799,'events','itemid',25647),(2800,'trends','itemid',25648),(2801,'trends_uint','itemid',25648),(2802,'history_text','itemid',25648),(2803,'history_log','itemid',25648),(2804,'history_uint','itemid',25648),(2805,'history_str','itemid',25648),(2806,'history','itemid',25648),(2807,'events','itemid',25648),(2808,'trends','itemid',25649),(2809,'trends_uint','itemid',25649),(2810,'history_text','itemid',25649),(2811,'history_log','itemid',25649),(2812,'history_uint','itemid',25649),(2813,'history_str','itemid',25649),(2814,'history','itemid',25649),(2815,'events','itemid',25649),(2816,'trends','itemid',25650),(2817,'trends_uint','itemid',25650),(2818,'history_text','itemid',25650),(2819,'history_log','itemid',25650),(2820,'history_uint','itemid',25650),(2821,'history_str','itemid',25650),(2822,'history','itemid',25650),(2823,'events','itemid',25650),(2824,'trends','itemid',25651),(2825,'trends_uint','itemid',25651),(2826,'history_text','itemid',25651),(2827,'history_log','itemid',25651),(2828,'history_uint','itemid',25651),(2829,'history_str','itemid',25651),(2830,'history','itemid',25651),(2831,'events','itemid',25651),(2832,'trends','itemid',25652),(2833,'trends_uint','itemid',25652),(2834,'history_text','itemid',25652),(2835,'history_log','itemid',25652),(2836,'history_uint','itemid',25652),(2837,'history_str','itemid',25652),(2838,'history','itemid',25652),(2839,'events','itemid',25652),(2840,'trends','itemid',25653),(2841,'trends_uint','itemid',25653),(2842,'history_text','itemid',25653),(2843,'history_log','itemid',25653),(2844,'history_uint','itemid',25653),(2845,'history_str','itemid',25653),(2846,'history','itemid',25653),(2847,'events','itemid',25653),(2848,'trends','itemid',25654),(2849,'trends_uint','itemid',25654),(2850,'history_text','itemid',25654),(2851,'history_log','itemid',25654),(2852,'history_uint','itemid',25654),(2853,'history_str','itemid',25654),(2854,'history','itemid',25654),(2855,'events','itemid',25654),(2856,'trends','itemid',25655),(2857,'trends_uint','itemid',25655),(2858,'history_text','itemid',25655),(2859,'history_log','itemid',25655),(2860,'history_uint','itemid',25655),(2861,'history_str','itemid',25655),(2862,'history','itemid',25655),(2863,'events','itemid',25655),(2864,'trends','itemid',25656),(2865,'trends_uint','itemid',25656),(2866,'history_text','itemid',25656),(2867,'history_log','itemid',25656),(2868,'history_uint','itemid',25656),(2869,'history_str','itemid',25656),(2870,'history','itemid',25656),(2871,'events','itemid',25656),(2872,'trends','itemid',25657),(2873,'trends_uint','itemid',25657),(2874,'history_text','itemid',25657),(2875,'history_log','itemid',25657),(2876,'history_uint','itemid',25657),(2877,'history_str','itemid',25657),(2878,'history','itemid',25657),(2879,'events','itemid',25657),(2880,'trends','itemid',25658),(2881,'trends_uint','itemid',25658),(2882,'history_text','itemid',25658),(2883,'history_log','itemid',25658),(2884,'history_uint','itemid',25658),(2885,'history_str','itemid',25658),(2886,'history','itemid',25658),(2887,'events','itemid',25658),(2888,'trends','itemid',25659),(2889,'trends_uint','itemid',25659),(2890,'history_text','itemid',25659),(2891,'history_log','itemid',25659),(2892,'history_uint','itemid',25659),(2893,'history_str','itemid',25659),(2894,'history','itemid',25659),(2895,'events','itemid',25659),(2896,'trends','itemid',25660),(2897,'trends_uint','itemid',25660),(2898,'history_text','itemid',25660),(2899,'history_log','itemid',25660),(2900,'history_uint','itemid',25660),(2901,'history_str','itemid',25660),(2902,'history','itemid',25660),(2903,'events','itemid',25660),(2904,'trends','itemid',25661),(2905,'trends_uint','itemid',25661),(2906,'history_text','itemid',25661),(2907,'history_log','itemid',25661),(2908,'history_uint','itemid',25661),(2909,'history_str','itemid',25661),(2910,'history','itemid',25661),(2911,'events','itemid',25661),(2912,'trends','itemid',25662),(2913,'trends_uint','itemid',25662),(2914,'history_text','itemid',25662),(2915,'history_log','itemid',25662),(2916,'history_uint','itemid',25662),(2917,'history_str','itemid',25662),(2918,'history','itemid',25662),(2919,'events','itemid',25662),(2920,'trends','itemid',25663),(2921,'trends_uint','itemid',25663),(2922,'history_text','itemid',25663),(2923,'history_log','itemid',25663),(2924,'history_uint','itemid',25663),(2925,'history_str','itemid',25663),(2926,'history','itemid',25663),(2927,'events','itemid',25663),(2928,'trends','itemid',25720),(2929,'trends_uint','itemid',25720),(2930,'history_text','itemid',25720),(2931,'history_log','itemid',25720),(2932,'history_uint','itemid',25720),(2933,'history_str','itemid',25720),(2934,'history','itemid',25720),(2935,'events','itemid',25720),(2936,'trends','itemid',25721),(2937,'trends_uint','itemid',25721),(2938,'history_text','itemid',25721),(2939,'history_log','itemid',25721),(2940,'history_uint','itemid',25721),(2941,'history_str','itemid',25721),(2942,'history','itemid',25721),(2943,'events','itemid',25721),(2944,'trends','itemid',25722),(2945,'trends_uint','itemid',25722),(2946,'history_text','itemid',25722),(2947,'history_log','itemid',25722),(2948,'history_uint','itemid',25722),(2949,'history_str','itemid',25722),(2950,'history','itemid',25722),(2951,'events','itemid',25722),(2952,'trends','itemid',25723),(2953,'trends_uint','itemid',25723),(2954,'history_text','itemid',25723),(2955,'history_log','itemid',25723),(2956,'history_uint','itemid',25723),(2957,'history_str','itemid',25723),(2958,'history','itemid',25723),(2959,'events','itemid',25723),(2960,'trends','itemid',25724),(2961,'trends_uint','itemid',25724),(2962,'history_text','itemid',25724),(2963,'history_log','itemid',25724),(2964,'history_uint','itemid',25724),(2965,'history_str','itemid',25724),(2966,'history','itemid',25724),(2967,'events','itemid',25724),(2968,'trends','itemid',25725),(2969,'trends_uint','itemid',25725),(2970,'history_text','itemid',25725),(2971,'history_log','itemid',25725),(2972,'history_uint','itemid',25725),(2973,'history_str','itemid',25725),(2974,'history','itemid',25725),(2975,'events','itemid',25725),(2976,'trends','itemid',25726),(2977,'trends_uint','itemid',25726),(2978,'history_text','itemid',25726),(2979,'history_log','itemid',25726),(2980,'history_uint','itemid',25726),(2981,'history_str','itemid',25726),(2982,'history','itemid',25726),(2983,'events','itemid',25726),(2984,'trends','itemid',25727),(2985,'trends_uint','itemid',25727),(2986,'history_text','itemid',25727),(2987,'history_log','itemid',25727),(2988,'history_uint','itemid',25727),(2989,'history_str','itemid',25727),(2990,'history','itemid',25727),(2991,'events','itemid',25727),(2992,'trends','itemid',25728),(2993,'trends_uint','itemid',25728),(2994,'history_text','itemid',25728),(2995,'history_log','itemid',25728),(2996,'history_uint','itemid',25728),(2997,'history_str','itemid',25728),(2998,'history','itemid',25728),(2999,'events','itemid',25728),(3000,'trends','itemid',25729),(3001,'trends_uint','itemid',25729),(3002,'history_text','itemid',25729),(3003,'history_log','itemid',25729),(3004,'history_uint','itemid',25729),(3005,'history_str','itemid',25729),(3006,'history','itemid',25729),(3007,'events','itemid',25729),(3008,'trends','itemid',25730),(3009,'trends_uint','itemid',25730),(3010,'history_text','itemid',25730),(3011,'history_log','itemid',25730),(3012,'history_uint','itemid',25730),(3013,'history_str','itemid',25730),(3014,'history','itemid',25730),(3015,'events','itemid',25730),(3016,'trends','itemid',25731),(3017,'trends_uint','itemid',25731),(3018,'history_text','itemid',25731),(3019,'history_log','itemid',25731),(3020,'history_uint','itemid',25731),(3021,'history_str','itemid',25731),(3022,'history','itemid',25731),(3023,'events','itemid',25731),(3024,'trends','itemid',25732),(3025,'trends_uint','itemid',25732),(3026,'history_text','itemid',25732),(3027,'history_log','itemid',25732),(3028,'history_uint','itemid',25732),(3029,'history_str','itemid',25732),(3030,'history','itemid',25732),(3031,'events','itemid',25732),(3032,'trends','itemid',25733),(3033,'trends_uint','itemid',25733),(3034,'history_text','itemid',25733),(3035,'history_log','itemid',25733),(3036,'history_uint','itemid',25733),(3037,'history_str','itemid',25733),(3038,'history','itemid',25733),(3039,'events','itemid',25733),(3040,'trends','itemid',25734),(3041,'trends_uint','itemid',25734),(3042,'history_text','itemid',25734),(3043,'history_log','itemid',25734),(3044,'history_uint','itemid',25734),(3045,'history_str','itemid',25734),(3046,'history','itemid',25734),(3047,'events','itemid',25734),(3048,'trends','itemid',25735),(3049,'trends_uint','itemid',25735),(3050,'history_text','itemid',25735),(3051,'history_log','itemid',25735),(3052,'history_uint','itemid',25735),(3053,'history_str','itemid',25735),(3054,'history','itemid',25735),(3055,'events','itemid',25735),(3056,'trends','itemid',25736),(3057,'trends_uint','itemid',25736),(3058,'history_text','itemid',25736),(3059,'history_log','itemid',25736),(3060,'history_uint','itemid',25736),(3061,'history_str','itemid',25736),(3062,'history','itemid',25736),(3063,'events','itemid',25736),(3064,'trends','itemid',25737),(3065,'trends_uint','itemid',25737),(3066,'history_text','itemid',25737),(3067,'history_log','itemid',25737),(3068,'history_uint','itemid',25737),(3069,'history_str','itemid',25737),(3070,'history','itemid',25737),(3071,'events','itemid',25737),(3072,'trends','itemid',25738),(3073,'trends_uint','itemid',25738),(3074,'history_text','itemid',25738),(3075,'history_log','itemid',25738),(3076,'history_uint','itemid',25738),(3077,'history_str','itemid',25738),(3078,'history','itemid',25738),(3079,'events','itemid',25738),(3080,'trends','itemid',25739),(3081,'trends_uint','itemid',25739),(3082,'history_text','itemid',25739),(3083,'history_log','itemid',25739),(3084,'history_uint','itemid',25739),(3085,'history_str','itemid',25739),(3086,'history','itemid',25739),(3087,'events','itemid',25739),(3088,'trends','itemid',25740),(3089,'trends_uint','itemid',25740),(3090,'history_text','itemid',25740),(3091,'history_log','itemid',25740),(3092,'history_uint','itemid',25740),(3093,'history_str','itemid',25740),(3094,'history','itemid',25740),(3095,'events','itemid',25740),(3096,'trends','itemid',25741),(3097,'trends_uint','itemid',25741),(3098,'history_text','itemid',25741),(3099,'history_log','itemid',25741),(3100,'history_uint','itemid',25741),(3101,'history_str','itemid',25741),(3102,'history','itemid',25741),(3103,'events','itemid',25741),(3104,'trends','itemid',25742),(3105,'trends_uint','itemid',25742),(3106,'history_text','itemid',25742),(3107,'history_log','itemid',25742),(3108,'history_uint','itemid',25742),(3109,'history_str','itemid',25742),(3110,'history','itemid',25742),(3111,'events','itemid',25742),(3112,'trends','itemid',25743),(3113,'trends_uint','itemid',25743),(3114,'history_text','itemid',25743),(3115,'history_log','itemid',25743),(3116,'history_uint','itemid',25743),(3117,'history_str','itemid',25743),(3118,'history','itemid',25743),(3119,'events','itemid',25743),(3120,'trends','itemid',25744),(3121,'trends_uint','itemid',25744),(3122,'history_text','itemid',25744),(3123,'history_log','itemid',25744),(3124,'history_uint','itemid',25744),(3125,'history_str','itemid',25744),(3126,'history','itemid',25744),(3127,'events','itemid',25744),(3128,'trends','itemid',25745),(3129,'trends_uint','itemid',25745),(3130,'history_text','itemid',25745),(3131,'history_log','itemid',25745),(3132,'history_uint','itemid',25745),(3133,'history_str','itemid',25745),(3134,'history','itemid',25745),(3135,'events','itemid',25745),(3136,'trends','itemid',25746),(3137,'trends_uint','itemid',25746),(3138,'history_text','itemid',25746),(3139,'history_log','itemid',25746),(3140,'history_uint','itemid',25746),(3141,'history_str','itemid',25746),(3142,'history','itemid',25746),(3143,'events','itemid',25746),(3144,'trends','itemid',25747),(3145,'trends_uint','itemid',25747),(3146,'history_text','itemid',25747),(3147,'history_log','itemid',25747),(3148,'history_uint','itemid',25747),(3149,'history_str','itemid',25747),(3150,'history','itemid',25747),(3151,'events','itemid',25747),(3152,'trends','itemid',25748),(3153,'trends_uint','itemid',25748),(3154,'history_text','itemid',25748),(3155,'history_log','itemid',25748),(3156,'history_uint','itemid',25748),(3157,'history_str','itemid',25748),(3158,'history','itemid',25748),(3159,'events','itemid',25748),(3160,'trends','itemid',25749),(3161,'trends_uint','itemid',25749),(3162,'history_text','itemid',25749),(3163,'history_log','itemid',25749),(3164,'history_uint','itemid',25749),(3165,'history_str','itemid',25749),(3166,'history','itemid',25749),(3167,'events','itemid',25749),(3168,'trends','itemid',25750),(3169,'trends_uint','itemid',25750),(3170,'history_text','itemid',25750),(3171,'history_log','itemid',25750),(3172,'history_uint','itemid',25750),(3173,'history_str','itemid',25750),(3174,'history','itemid',25750),(3175,'events','itemid',25750),(3176,'trends','itemid',25751),(3177,'trends_uint','itemid',25751),(3178,'history_text','itemid',25751),(3179,'history_log','itemid',25751),(3180,'history_uint','itemid',25751),(3181,'history_str','itemid',25751),(3182,'history','itemid',25751),(3183,'events','itemid',25751);
/*!40000 ALTER TABLE `housekeeper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `httpstep`
--

DROP TABLE IF EXISTS `httpstep`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `httpstep` (
  `httpstepid` bigint(20) unsigned NOT NULL,
  `httptestid` bigint(20) unsigned NOT NULL,
  `name` varchar(64) NOT NULL DEFAULT '',
  `no` int(11) NOT NULL DEFAULT '0',
  `url` varchar(2048) NOT NULL DEFAULT '',
  `timeout` varchar(255) NOT NULL DEFAULT '15s',
  `posts` text NOT NULL,
  `required` varchar(255) NOT NULL DEFAULT '',
  `status_codes` varchar(255) NOT NULL DEFAULT '',
  `follow_redirects` int(11) NOT NULL DEFAULT '1',
  `retrieve_mode` int(11) NOT NULL DEFAULT '0',
  `post_type` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`httpstepid`),
  KEY `httpstep_1` (`httptestid`),
  CONSTRAINT `c_httpstep_1` FOREIGN KEY (`httptestid`) REFERENCES `httptest` (`httptestid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `httpstep`
--

LOCK TABLES `httpstep` WRITE;
/*!40000 ALTER TABLE `httpstep` DISABLE KEYS */;
/*!40000 ALTER TABLE `httpstep` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `httpstep_field`
--

DROP TABLE IF EXISTS `httpstep_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `httpstep_field` (
  `httpstep_fieldid` bigint(20) unsigned NOT NULL,
  `httpstepid` bigint(20) unsigned NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`httpstep_fieldid`),
  KEY `httpstep_field_1` (`httpstepid`),
  CONSTRAINT `c_httpstep_field_1` FOREIGN KEY (`httpstepid`) REFERENCES `httpstep` (`httpstepid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `httpstep_field`
--

LOCK TABLES `httpstep_field` WRITE;
/*!40000 ALTER TABLE `httpstep_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `httpstep_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `httpstepitem`
--

DROP TABLE IF EXISTS `httpstepitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `httpstepitem` (
  `httpstepitemid` bigint(20) unsigned NOT NULL,
  `httpstepid` bigint(20) unsigned NOT NULL,
  `itemid` bigint(20) unsigned NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`httpstepitemid`),
  UNIQUE KEY `httpstepitem_1` (`httpstepid`,`itemid`),
  KEY `httpstepitem_2` (`itemid`),
  CONSTRAINT `c_httpstepitem_1` FOREIGN KEY (`httpstepid`) REFERENCES `httpstep` (`httpstepid`) ON DELETE CASCADE,
  CONSTRAINT `c_httpstepitem_2` FOREIGN KEY (`itemid`) REFERENCES `items` (`itemid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `httpstepitem`
--

LOCK TABLES `httpstepitem` WRITE;
/*!40000 ALTER TABLE `httpstepitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `httpstepitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `httptest`
--

DROP TABLE IF EXISTS `httptest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `httptest` (
  `httptestid` bigint(20) unsigned NOT NULL,
  `name` varchar(64) NOT NULL DEFAULT '',
  `applicationid` bigint(20) unsigned DEFAULT NULL,
  `nextcheck` int(11) NOT NULL DEFAULT '0',
  `delay` varchar(255) NOT NULL DEFAULT '1m',
  `status` int(11) NOT NULL DEFAULT '0',
  `agent` varchar(255) NOT NULL DEFAULT 'Zabbix',
  `authentication` int(11) NOT NULL DEFAULT '0',
  `http_user` varchar(64) NOT NULL DEFAULT '',
  `http_password` varchar(64) NOT NULL DEFAULT '',
  `hostid` bigint(20) unsigned NOT NULL,
  `templateid` bigint(20) unsigned DEFAULT NULL,
  `http_proxy` varchar(255) NOT NULL DEFAULT '',
  `retries` int(11) NOT NULL DEFAULT '1',
  `ssl_cert_file` varchar(255) NOT NULL DEFAULT '',
  `ssl_key_file` varchar(255) NOT NULL DEFAULT '',
  `ssl_key_password` varchar(64) NOT NULL DEFAULT '',
  `verify_peer` int(11) NOT NULL DEFAULT '0',
  `verify_host` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`httptestid`),
  UNIQUE KEY `httptest_2` (`hostid`,`name`),
  KEY `httptest_1` (`applicationid`),
  KEY `httptest_3` (`status`),
  KEY `httptest_4` (`templateid`),
  CONSTRAINT `c_httptest_1` FOREIGN KEY (`applicationid`) REFERENCES `applications` (`applicationid`),
  CONSTRAINT `c_httptest_2` FOREIGN KEY (`hostid`) REFERENCES `hosts` (`hostid`) ON DELETE CASCADE,
  CONSTRAINT `c_httptest_3` FOREIGN KEY (`templateid`) REFERENCES `httptest` (`httptestid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `httptest`
--

LOCK TABLES `httptest` WRITE;
/*!40000 ALTER TABLE `httptest` DISABLE KEYS */;
/*!40000 ALTER TABLE `httptest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `httptest_field`
--

DROP TABLE IF EXISTS `httptest_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `httptest_field` (
  `httptest_fieldid` bigint(20) unsigned NOT NULL,
  `httptestid` bigint(20) unsigned NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`httptest_fieldid`),
  KEY `httptest_field_1` (`httptestid`),
  CONSTRAINT `c_httptest_field_1` FOREIGN KEY (`httptestid`) REFERENCES `httptest` (`httptestid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `httptest_field`
--

LOCK TABLES `httptest_field` WRITE;
/*!40000 ALTER TABLE `httptest_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `httptest_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `httptestitem`
--

DROP TABLE IF EXISTS `httptestitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `httptestitem` (
  `httptestitemid` bigint(20) unsigned NOT NULL,
  `httptestid` bigint(20) unsigned NOT NULL,
  `itemid` bigint(20) unsigned NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`httptestitemid`),
  UNIQUE KEY `httptestitem_1` (`httptestid`,`itemid`),
  KEY `httptestitem_2` (`itemid`),
  CONSTRAINT `c_httptestitem_1` FOREIGN KEY (`httptestid`) REFERENCES `httptest` (`httptestid`) ON DELETE CASCADE,
  CONSTRAINT `c_httptestitem_2` FOREIGN KEY (`itemid`) REFERENCES `items` (`itemid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `httptestitem`
--

LOCK TABLES `httptestitem` WRITE;
/*!40000 ALTER TABLE `httptestitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `httptestitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `icon_map`
--

DROP TABLE IF EXISTS `icon_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `icon_map` (
  `iconmapid` bigint(20) unsigned NOT NULL,
  `name` varchar(64) NOT NULL DEFAULT '',
  `default_iconid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`iconmapid`),
  UNIQUE KEY `icon_map_1` (`name`),
  KEY `icon_map_2` (`default_iconid`),
  CONSTRAINT `c_icon_map_1` FOREIGN KEY (`default_iconid`) REFERENCES `images` (`imageid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `icon_map`
--

LOCK TABLES `icon_map` WRITE;
/*!40000 ALTER TABLE `icon_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `icon_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `icon_mapping`
--

DROP TABLE IF EXISTS `icon_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `icon_mapping` (
  `iconmappingid` bigint(20) unsigned NOT NULL,
  `iconmapid` bigint(20) unsigned NOT NULL,
  `iconid` bigint(20) unsigned NOT NULL,
  `inventory_link` int(11) NOT NULL DEFAULT '0',
  `expression` varchar(64) NOT NULL DEFAULT '',
  `sortorder` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`iconmappingid`),
  KEY `icon_mapping_1` (`iconmapid`),
  KEY `icon_mapping_2` (`iconid`),
  CONSTRAINT `c_icon_mapping_1` FOREIGN KEY (`iconmapid`) REFERENCES `icon_map` (`iconmapid`) ON DELETE CASCADE,
  CONSTRAINT `c_icon_mapping_2` FOREIGN KEY (`iconid`) REFERENCES `images` (`imageid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `icon_mapping`
--

LOCK TABLES `icon_mapping` WRITE;
/*!40000 ALTER TABLE `icon_mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `icon_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ids`
--

DROP TABLE IF EXISTS `ids`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ids` (
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `field_name` varchar(64) NOT NULL DEFAULT '',
  `nextid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`table_name`,`field_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ids`
--

LOCK TABLES `ids` WRITE;
/*!40000 ALTER TABLE `ids` DISABLE KEYS */;
INSERT INTO `ids` VALUES ('applications','applicationid',528),('application_template','application_templateid',90),('auditlog','auditid',350),('auditlog_details','auditdetailid',11),('dchecks','dcheckid',3),('drules','druleid',3),('functions','functionid',13368),('graphs','graphid',634),('graphs_items','gitemid',2038),('hosts','hostid',10110),('hosts_groups','hostgroupid',115),('hosts_templates','hosttemplateid',49),('housekeeper','housekeeperid',3183),('interface','interfaceid',5),('items','itemid',25772),('items_applications','itemappid',6418),('item_condition','item_conditionid',36),('item_discovery','itemdiscoveryid',391),('item_preproc','item_preprocid',240),('profiles','profileid',325),('screens','screenid',20),('screens_items','screenitemid',81),('triggers','triggerid',13708);
/*!40000 ALTER TABLE `ids` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `images` (
  `imageid` bigint(20) unsigned NOT NULL,
  `imagetype` int(11) NOT NULL DEFAULT '0',
  `name` varchar(64) NOT NULL DEFAULT '0',
  `image` longblob NOT NULL,
  PRIMARY KEY (`imageid`),
  UNIQUE KEY `images_1` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interface`
--

DROP TABLE IF EXISTS `interface`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `interface` (
  `interfaceid` bigint(20) unsigned NOT NULL,
  `hostid` bigint(20) unsigned NOT NULL,
  `main` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '0',
  `useip` int(11) NOT NULL DEFAULT '1',
  `ip` varchar(64) NOT NULL DEFAULT '127.0.0.1',
  `dns` varchar(64) NOT NULL DEFAULT '',
  `port` varchar(64) NOT NULL DEFAULT '10050',
  `bulk` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`interfaceid`),
  KEY `interface_1` (`hostid`,`type`),
  KEY `interface_2` (`ip`,`dns`),
  CONSTRAINT `c_interface_1` FOREIGN KEY (`hostid`) REFERENCES `hosts` (`hostid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interface`
--

LOCK TABLES `interface` WRITE;
/*!40000 ALTER TABLE `interface` DISABLE KEYS */;
/*!40000 ALTER TABLE `interface` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interface_discovery`
--

DROP TABLE IF EXISTS `interface_discovery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `interface_discovery` (
  `interfaceid` bigint(20) unsigned NOT NULL,
  `parent_interfaceid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`interfaceid`),
  KEY `c_interface_discovery_2` (`parent_interfaceid`),
  CONSTRAINT `c_interface_discovery_1` FOREIGN KEY (`interfaceid`) REFERENCES `interface` (`interfaceid`) ON DELETE CASCADE,
  CONSTRAINT `c_interface_discovery_2` FOREIGN KEY (`parent_interfaceid`) REFERENCES `interface` (`interfaceid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interface_discovery`
--

LOCK TABLES `interface_discovery` WRITE;
/*!40000 ALTER TABLE `interface_discovery` DISABLE KEYS */;
/*!40000 ALTER TABLE `interface_discovery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_application_prototype`
--

DROP TABLE IF EXISTS `item_application_prototype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_application_prototype` (
  `item_application_prototypeid` bigint(20) unsigned NOT NULL,
  `application_prototypeid` bigint(20) unsigned NOT NULL,
  `itemid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`item_application_prototypeid`),
  UNIQUE KEY `item_application_prototype_1` (`application_prototypeid`,`itemid`),
  KEY `item_application_prototype_2` (`itemid`),
  CONSTRAINT `c_item_application_prototype_1` FOREIGN KEY (`application_prototypeid`) REFERENCES `application_prototype` (`application_prototypeid`) ON DELETE CASCADE,
  CONSTRAINT `c_item_application_prototype_2` FOREIGN KEY (`itemid`) REFERENCES `items` (`itemid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_application_prototype`
--

LOCK TABLES `item_application_prototype` WRITE;
/*!40000 ALTER TABLE `item_application_prototype` DISABLE KEYS */;
INSERT INTO `item_application_prototype` VALUES (1,1,23666);
/*!40000 ALTER TABLE `item_application_prototype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_condition`
--

DROP TABLE IF EXISTS `item_condition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_condition` (
  `item_conditionid` bigint(20) unsigned NOT NULL,
  `itemid` bigint(20) unsigned NOT NULL,
  `operator` int(11) NOT NULL DEFAULT '8',
  `macro` varchar(64) NOT NULL DEFAULT '',
  `value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`item_conditionid`),
  KEY `item_condition_1` (`itemid`),
  CONSTRAINT `c_item_condition_1` FOREIGN KEY (`itemid`) REFERENCES `items` (`itemid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_condition`
--

LOCK TABLES `item_condition` WRITE;
/*!40000 ALTER TABLE `item_condition` DISABLE KEYS */;
INSERT INTO `item_condition` VALUES (1,22444,8,'{#IFNAME}','@Network interfaces for discovery'),(2,22450,8,'{#FSTYPE}','@File systems for discovery'),(3,22746,8,'{#SNMPVALUE}','@Storage devices for SNMP discovery'),(4,22867,8,'{#FSTYPE}','@File systems for discovery'),(5,22907,8,'{#FSTYPE}','@File systems for discovery'),(6,22944,8,'{#IFNAME}','@Network interfaces for discovery'),(7,22947,8,'{#FSTYPE}','@File systems for discovery'),(8,22984,8,'{#IFNAME}','@Network interfaces for discovery'),(9,22987,8,'{#FSTYPE}','@File systems for discovery'),(10,23024,8,'{#IFNAME}','@Network interfaces for discovery'),(11,23027,8,'{#FSTYPE}','@File systems for discovery'),(12,23067,8,'{#FSTYPE}','@File systems for discovery'),(13,23162,8,'{#FSTYPE}','@File systems for discovery'),(14,23163,8,'{#IFNAME}','@Network interfaces for discovery'),(15,23329,8,'{#IFNAME}','@Network interfaces for discovery'),(16,23540,8,'{#IFNAME}','@Network interfaces for discovery'),(17,22760,8,'{#SNMPVALUE}','@Storage devices for SNMP discovery'),(18,22767,8,'{#SNMPVALUE}','@Storage devices for SNMP discovery'),(21,23665,8,'{#SERVICE.NAME}','@Windows service names for discovery'),(22,23665,8,'{#SERVICE.STARTUPNAME}','@Windows service startup states for discovery'),(25,25458,8,'{#IFNAME}','@Network interfaces for discovery'),(26,25461,8,'{#FSTYPE}','@File systems for discovery');
/*!40000 ALTER TABLE `item_condition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_discovery`
--

DROP TABLE IF EXISTS `item_discovery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_discovery` (
  `itemdiscoveryid` bigint(20) unsigned NOT NULL,
  `itemid` bigint(20) unsigned NOT NULL,
  `parent_itemid` bigint(20) unsigned NOT NULL,
  `key_` varchar(255) NOT NULL DEFAULT '',
  `lastcheck` int(11) NOT NULL DEFAULT '0',
  `ts_delete` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`itemdiscoveryid`),
  UNIQUE KEY `item_discovery_1` (`itemid`,`parent_itemid`),
  KEY `item_discovery_2` (`parent_itemid`),
  CONSTRAINT `c_item_discovery_1` FOREIGN KEY (`itemid`) REFERENCES `items` (`itemid`) ON DELETE CASCADE,
  CONSTRAINT `c_item_discovery_2` FOREIGN KEY (`parent_itemid`) REFERENCES `items` (`itemid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_discovery`
--

LOCK TABLES `item_discovery` WRITE;
/*!40000 ALTER TABLE `item_discovery` DISABLE KEYS */;
INSERT INTO `item_discovery` VALUES (1,22446,22444,'',0,0),(3,22448,22444,'',0,0),(5,22452,22450,'',0,0),(7,22454,22450,'',0,0),(9,22456,22450,'',0,0),(11,22458,22450,'',0,0),(65,22686,22450,'',0,0),(68,22701,22700,'',0,0),(69,22702,22700,'',0,0),(70,22703,22700,'',0,0),(71,22704,22700,'',0,0),(72,22705,22700,'',0,0),(73,22706,22700,'',0,0),(74,22707,22700,'',0,0),(75,22708,22700,'',0,0),(76,22721,22720,'',0,0),(77,22722,22720,'',0,0),(78,22723,22720,'',0,0),(79,22724,22720,'',0,0),(80,22725,22720,'',0,0),(81,22726,22720,'',0,0),(82,22727,22720,'',0,0),(83,22728,22720,'',0,0),(84,22736,22735,'',0,0),(85,22737,22735,'',0,0),(86,22738,22735,'',0,0),(87,22739,22735,'',0,0),(88,22740,22735,'',0,0),(89,22741,22735,'',0,0),(90,22742,22735,'',0,0),(91,22743,22735,'',0,0),(94,22749,22746,'',0,0),(100,22755,22746,'',0,0),(101,22756,22746,'',0,0),(102,22757,22746,'',0,0),(103,22758,22746,'',0,0),(104,22759,22746,'',0,0),(105,22761,22760,'',0,0),(106,22762,22760,'',0,0),(107,22763,22760,'',0,0),(108,22764,22760,'',0,0),(109,22765,22760,'',0,0),(110,22766,22760,'',0,0),(111,22768,22767,'',0,0),(112,22769,22767,'',0,0),(113,22770,22767,'',0,0),(114,22771,22767,'',0,0),(115,22772,22767,'',0,0),(116,22773,22767,'',0,0),(117,22780,22779,'',0,0),(118,22781,22779,'',0,0),(119,22782,22779,'',0,0),(120,22783,22779,'',0,0),(121,22784,22779,'',0,0),(122,22785,22779,'',0,0),(123,22786,22779,'',0,0),(124,22787,22779,'',0,0),(128,22793,22789,'',0,0),(131,22797,22796,'',0,0),(132,22799,22798,'',0,0),(135,22868,22867,'',0,0),(136,22869,22867,'',0,0),(137,22870,22867,'',0,0),(138,22871,22867,'',0,0),(139,22872,22867,'',0,0),(142,22908,22907,'',0,0),(143,22909,22907,'',0,0),(144,22910,22907,'',0,0),(145,22911,22907,'',0,0),(146,22912,22907,'',0,0),(147,22945,22944,'',0,0),(148,22946,22944,'',0,0),(149,22948,22947,'',0,0),(150,22949,22947,'',0,0),(151,22950,22947,'',0,0),(152,22951,22947,'',0,0),(153,22952,22947,'',0,0),(154,22985,22984,'',0,0),(155,22986,22984,'',0,0),(156,22988,22987,'',0,0),(157,22989,22987,'',0,0),(158,22990,22987,'',0,0),(159,22991,22987,'',0,0),(160,22992,22987,'',0,0),(161,23025,23024,'',0,0),(162,23026,23024,'',0,0),(163,23028,23027,'',0,0),(164,23029,23027,'',0,0),(165,23030,23027,'',0,0),(166,23031,23027,'',0,0),(167,23032,23027,'',0,0),(170,23068,23067,'',0,0),(171,23069,23067,'',0,0),(172,23070,23067,'',0,0),(173,23071,23067,'',0,0),(174,23072,23067,'',0,0),(175,23164,23162,'',0,0),(176,23165,23162,'',0,0),(178,23167,23162,'',0,0),(179,23168,23162,'',0,0),(180,23169,23163,'',0,0),(181,23170,23163,'',0,0),(189,23073,23540,'',0,0),(190,23074,23540,'',0,0),(191,23075,23329,'',0,0),(192,23076,23329,'',0,0),(193,23576,23575,'',0,0),(194,23577,23575,'',0,0),(195,23578,23575,'',0,0),(196,23579,23575,'',0,0),(201,23596,23595,'',0,0),(202,23601,23599,'',0,0),(203,23602,23599,'',0,0),(204,23603,23599,'',0,0),(205,23604,23599,'',0,0),(206,23605,23600,'',0,0),(207,23606,23600,'',0,0),(208,23607,23600,'',0,0),(209,23608,23600,'',0,0),(218,23632,23631,'',0,0),(219,23633,23631,'',0,0),(220,23666,23665,'',0,0),(221,23669,23631,'',0,0),(222,23670,23631,'',0,0),(249,25459,25458,'',0,0),(250,25460,25458,'',0,0),(251,25462,25461,'',0,0),(252,25463,25461,'',0,0),(253,25464,25461,'',0,0),(254,25465,25461,'',0,0),(255,25466,25461,'',0,0);
/*!40000 ALTER TABLE `item_discovery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_preproc`
--

DROP TABLE IF EXISTS `item_preproc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_preproc` (
  `item_preprocid` bigint(20) unsigned NOT NULL,
  `itemid` bigint(20) unsigned NOT NULL,
  `step` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '0',
  `params` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`item_preprocid`),
  KEY `item_preproc_1` (`itemid`,`step`),
  CONSTRAINT `c_item_preproc_1` FOREIGN KEY (`itemid`) REFERENCES `items` (`itemid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_preproc`
--

LOCK TABLES `item_preproc` WRITE;
/*!40000 ALTER TABLE `item_preproc` DISABLE KEYS */;
INSERT INTO `item_preproc` VALUES (1,22187,1,10,''),(2,22196,1,10,''),(3,22199,1,10,''),(4,22446,1,10,''),(5,22446,2,1,'8'),(6,22448,1,10,''),(7,22448,2,1,'8'),(8,22680,1,10,''),(9,22683,1,10,''),(10,22701,1,10,''),(11,22701,2,1,'8'),(12,22702,1,10,''),(13,22702,2,1,'8'),(14,22706,1,10,''),(15,22707,1,10,''),(16,22714,1,1,'0.01'),(17,22719,1,1,'0.01'),(18,22724,1,10,''),(19,22725,1,10,''),(20,22725,2,1,'8'),(21,22727,1,10,''),(22,22728,1,10,''),(23,22728,2,1,'8'),(24,22734,1,1,'0.01'),(25,22739,1,10,''),(26,22740,1,10,''),(27,22740,2,1,'8'),(28,22742,1,10,''),(29,22743,1,10,''),(30,22743,2,1,'8'),(31,22778,1,1,'0.01'),(32,22783,1,10,''),(33,22784,1,10,''),(34,22784,2,1,'8'),(35,22786,1,10,''),(36,22787,1,10,''),(37,22787,2,1,'8'),(38,22822,1,10,''),(39,22823,1,10,''),(40,22824,1,10,''),(41,22825,1,10,''),(42,22826,1,10,''),(43,22827,1,10,''),(44,22828,1,10,''),(45,22829,1,10,''),(46,22830,1,10,''),(47,22831,1,10,''),(48,22840,1,10,''),(49,22844,1,10,''),(50,22880,1,10,''),(51,22884,1,10,''),(52,22920,1,10,''),(53,22924,1,10,''),(54,22945,1,10,''),(55,22945,2,1,'8'),(56,22946,1,10,''),(57,22946,2,1,'8'),(58,22985,1,10,''),(59,22985,2,1,'8'),(60,22986,1,10,''),(61,22986,2,1,'8'),(62,23000,1,10,''),(63,23004,1,10,''),(64,23025,1,10,''),(65,23025,2,1,'8'),(66,23026,1,10,''),(67,23026,2,1,'8'),(68,23073,1,10,''),(69,23073,2,1,'8'),(70,23074,1,10,''),(71,23074,2,1,'8'),(72,23075,1,10,''),(73,23075,2,1,'8'),(74,23076,1,10,''),(75,23076,2,1,'8'),(76,23077,1,10,''),(77,23077,2,1,'8'),(78,23078,1,10,''),(79,23078,2,1,'8'),(80,23169,1,10,''),(81,23169,2,1,'8'),(82,23170,1,10,''),(83,23170,2,1,'8'),(84,23172,1,1,'0.001'),(85,23176,1,1,'0.001'),(86,23177,1,10,''),(87,23178,1,1,'0.001'),(88,23179,1,10,''),(89,23180,1,1,'0.001'),(90,23181,1,10,''),(91,23182,1,1,'0.001'),(92,23183,1,10,''),(93,23184,1,1,'0.001'),(94,23185,1,1,'0.001'),(95,23186,1,10,''),(96,23187,1,10,''),(97,23188,1,1,'0.001'),(98,23219,1,10,''),(99,23220,1,10,''),(100,23221,1,10,''),(101,23223,1,1,'0.001'),(102,23224,1,10,''),(103,23228,1,10,''),(104,23229,1,10,''),(105,23230,1,10,''),(106,23232,1,1,'0.001'),(107,23233,1,10,''),(108,23237,1,10,''),(109,23238,1,10,''),(110,23239,1,10,''),(111,23240,1,1,'0.001'),(112,23241,1,10,''),(113,23247,1,10,''),(115,23340,1,10,''),(118,23637,1,1,'100'),(119,25434,1,10,''),(120,25438,1,10,''),(121,25459,1,10,''),(122,25459,2,1,'8'),(123,25460,1,10,''),(124,25460,2,1,'8');
/*!40000 ALTER TABLE `item_preproc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `items` (
  `itemid` bigint(20) unsigned NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  `snmp_community` varchar(64) NOT NULL DEFAULT '',
  `snmp_oid` varchar(512) NOT NULL DEFAULT '',
  `hostid` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `key_` varchar(255) NOT NULL DEFAULT '',
  `delay` varchar(1024) NOT NULL DEFAULT '0',
  `history` varchar(255) NOT NULL DEFAULT '90d',
  `trends` varchar(255) NOT NULL DEFAULT '365d',
  `status` int(11) NOT NULL DEFAULT '0',
  `value_type` int(11) NOT NULL DEFAULT '0',
  `trapper_hosts` varchar(255) NOT NULL DEFAULT '',
  `units` varchar(255) NOT NULL DEFAULT '',
  `snmpv3_securityname` varchar(64) NOT NULL DEFAULT '',
  `snmpv3_securitylevel` int(11) NOT NULL DEFAULT '0',
  `snmpv3_authpassphrase` varchar(64) NOT NULL DEFAULT '',
  `snmpv3_privpassphrase` varchar(64) NOT NULL DEFAULT '',
  `formula` varchar(255) NOT NULL DEFAULT '',
  `error` varchar(2048) NOT NULL DEFAULT '',
  `lastlogsize` bigint(20) unsigned NOT NULL DEFAULT '0',
  `logtimefmt` varchar(64) NOT NULL DEFAULT '',
  `templateid` bigint(20) unsigned DEFAULT NULL,
  `valuemapid` bigint(20) unsigned DEFAULT NULL,
  `params` text NOT NULL,
  `ipmi_sensor` varchar(128) NOT NULL DEFAULT '',
  `authtype` int(11) NOT NULL DEFAULT '0',
  `username` varchar(64) NOT NULL DEFAULT '',
  `password` varchar(64) NOT NULL DEFAULT '',
  `publickey` varchar(64) NOT NULL DEFAULT '',
  `privatekey` varchar(64) NOT NULL DEFAULT '',
  `mtime` int(11) NOT NULL DEFAULT '0',
  `flags` int(11) NOT NULL DEFAULT '0',
  `interfaceid` bigint(20) unsigned DEFAULT NULL,
  `port` varchar(64) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `inventory_link` int(11) NOT NULL DEFAULT '0',
  `lifetime` varchar(255) NOT NULL DEFAULT '30d',
  `snmpv3_authprotocol` int(11) NOT NULL DEFAULT '0',
  `snmpv3_privprotocol` int(11) NOT NULL DEFAULT '0',
  `state` int(11) NOT NULL DEFAULT '0',
  `snmpv3_contextname` varchar(255) NOT NULL DEFAULT '',
  `evaltype` int(11) NOT NULL DEFAULT '0',
  `jmx_endpoint` varchar(255) NOT NULL DEFAULT '',
  `master_itemid` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`itemid`),
  UNIQUE KEY `items_1` (`hostid`,`key_`),
  KEY `items_3` (`status`),
  KEY `items_4` (`templateid`),
  KEY `items_5` (`valuemapid`),
  KEY `items_6` (`interfaceid`),
  KEY `items_7` (`master_itemid`),
  CONSTRAINT `c_items_1` FOREIGN KEY (`hostid`) REFERENCES `hosts` (`hostid`) ON DELETE CASCADE,
  CONSTRAINT `c_items_2` FOREIGN KEY (`templateid`) REFERENCES `items` (`itemid`) ON DELETE CASCADE,
  CONSTRAINT `c_items_3` FOREIGN KEY (`valuemapid`) REFERENCES `valuemaps` (`valuemapid`),
  CONSTRAINT `c_items_4` FOREIGN KEY (`interfaceid`) REFERENCES `interface` (`interfaceid`),
  CONSTRAINT `c_items_5` FOREIGN KEY (`master_itemid`) REFERENCES `items` (`itemid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (10009,0,'','',10001,'Number of processes','proc.num[]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','Total number of processes in any state.',0,'0',0,0,0,'',0,'',NULL),(10010,0,'','',10001,'Processor load (1 min average per core)','system.cpu.load[percpu,avg1]','1m','1w','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The processor load is calculated as system CPU load divided by number of CPU cores.',0,'0',0,0,0,'',0,'',NULL),(10013,0,'','',10001,'Number of running processes','proc.num[,,run]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','Number of processes in running state.',0,'0',0,0,0,'',0,'',NULL),(10014,0,'','',10001,'Free swap space','system.swap.size[,free]','1m','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(10016,0,'','',10001,'Number of logged in users','system.users.num','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','Number of users who are currently logged in.',0,'0',0,0,0,'',0,'',NULL),(10019,0,'','',10001,'Checksum of $1','vfs.file.cksum[/etc/passwd]','1h','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(10020,0,'','',10001,'Agent ping','agent.ping','1m','1w','365d',0,3,'','','',0,'','','','',0,'',22232,10,'','',0,'','','','',0,0,NULL,'','The agent always returns 1 for this item. It could be used in combination with nodata() for availability check.',0,'0',0,0,0,'',0,'',NULL),(10025,0,'','',10001,'System uptime','system.uptime','10m','1w','365d',0,3,'','uptime','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(10026,0,'','',10001,'Total memory','vm.memory.size[total]','1h','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(10030,0,'','',10001,'Total swap space','system.swap.size[,total]','1h','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(10055,0,'','',10001,'Maximum number of processes','kernel.maxproc','1h','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','It could be increased by using sysctrl utility or modifying file /etc/sysctl.conf.',0,'0',0,0,0,'',0,'',NULL),(10056,0,'','',10001,'Maximum number of opened files','kernel.maxfiles','1h','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','It could be increased by using sysctrl utility or modifying file /etc/sysctl.conf.',0,'0',0,0,0,'',0,'',NULL),(10057,0,'','',10001,'Host name','system.hostname','1h','1w','0',0,1,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','System host name.',3,'0',0,0,0,'',0,'',NULL),(10058,0,'','',10001,'System information','system.uname','1h','1w','0',0,1,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The information as normally returned by \'uname -a\'.',5,'0',0,0,0,'',0,'',NULL),(10059,0,'','',10001,'Version of zabbix_agent(d) running','agent.version','1h','1w','0',0,1,'','','',0,'','','','',0,'',22231,NULL,'','',0,'','','','',0,0,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(17318,0,'','',10001,'Host boot time','system.boottime','10m','1w','365d',0,3,'','unixtime','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(17350,0,'','',10001,'Free swap space in %','system.swap.size[,pfree]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(17352,0,'','',10001,'Host local time','system.localtime','1m','1w','365d',0,3,'','unixtime','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(17354,0,'','',10001,'CPU $2 time','system.cpu.util[,idle]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The time the CPU has spent doing nothing.',0,'0',0,0,0,'',0,'',NULL),(17356,0,'','',10001,'CPU $2 time','system.cpu.util[,user]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The time the CPU has spent running users\' processes that are not niced.',0,'0',0,0,0,'',0,'',NULL),(17358,0,'','',10001,'CPU $2 time','system.cpu.util[,nice]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The time the CPU has spent running users\' processes that have been niced.',0,'0',0,0,0,'',0,'',NULL),(17360,0,'','',10001,'CPU $2 time','system.cpu.util[,system]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The time the CPU has spent running the kernel and its processes.',0,'0',0,0,0,'',0,'',NULL),(17362,0,'','',10001,'CPU $2 time','system.cpu.util[,iowait]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','Amount of time the CPU has been waiting for I/O to complete.',0,'0',0,0,0,'',0,'',NULL),(22181,0,'','',10001,'Available memory','vm.memory.size[available]','1m','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','Available memory is defined as free+cached+buffers memory.',0,'0',0,0,0,'',0,'',NULL),(22183,5,'','',10047,'Zabbix $2 write cache, % free','zabbix[wcache,history,pfree]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22185,5,'','',10047,'Zabbix $2 write cache, % free','zabbix[wcache,trend,pfree]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22187,5,'','',10047,'Values processed by Zabbix server per second','zabbix[wcache,values]','1m','1w','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22189,5,'','',10047,'Zabbix configuration cache, % free','zabbix[rcache,buffer,pfree]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22191,5,'','',10047,'Zabbix value cache, % free','zabbix[vcache,buffer,pfree]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22196,5,'','',10047,'Zabbix value cache hits','zabbix[vcache,cache,hits]','1m','1w','365d',0,0,'','vps','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22199,5,'','',10047,'Zabbix value cache misses','zabbix[vcache,cache,misses]','1m','1w','365d',0,0,'','vps','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22219,5,'','',10047,'Zabbix queue over $2','zabbix[queue,10m]','10m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22231,0,'','',10050,'Version of zabbix_agent(d) running','agent.version','1h','1w','0',0,1,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22232,0,'','',10050,'Agent ping','agent.ping','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,10,'','',0,'','','','',0,0,NULL,'','The agent always returns 1 for this item. It could be used in combination with nodata() for availability check.',0,'0',0,0,0,'',0,'',NULL),(22396,5,'','',10047,'Zabbix history index cache, % free','zabbix[wcache,index,pfree]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22399,5,'','',10047,'Zabbix $4 $2 processes, in %','zabbix[process,poller,avg,busy]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22400,5,'','',10047,'Zabbix $4 $2 processes, in %','zabbix[process,unreachable poller,avg,busy]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22401,5,'','',10047,'Zabbix $4 $2 processes, in %','zabbix[process,vmware collector,avg,busy]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22402,5,'','',10047,'Zabbix $4 $2 processes, in %','zabbix[process,http poller,avg,busy]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22404,5,'','',10047,'Zabbix $4 $2 processes, in %','zabbix[process,trapper,avg,busy]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22406,5,'','',10047,'Zabbix $4 $2 processes, in %','zabbix[process,history syncer,avg,busy]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22408,5,'','',10047,'Zabbix $4 $2 processes, in %','zabbix[process,housekeeper,avg,busy]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22410,5,'','',10047,'Zabbix $4 $2 processes, in %','zabbix[process,db watchdog,avg,busy]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22412,5,'','',10047,'Zabbix $4 $2 processes, in %','zabbix[process,configuration syncer,avg,busy]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22414,5,'','',10047,'Zabbix $4 $2 processes, in %','zabbix[process,self-monitoring,avg,busy]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22416,5,'','',10047,'Zabbix $4 $2 processes, in %','zabbix[process,ipmi poller,avg,busy]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22418,5,'','',10047,'Zabbix $4 $2 processes, in %','zabbix[process,icmp pinger,avg,busy]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22420,5,'','',10047,'Zabbix $4 $2 processes, in %','zabbix[process,proxy poller,avg,busy]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22422,5,'','',10047,'Zabbix $4 $2 processes, in %','zabbix[process,escalator,avg,busy]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22424,5,'','',10047,'Zabbix $4 $2 processes, in %','zabbix[process,alerter,avg,busy]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22426,5,'','',10047,'Zabbix $4 $2 processes, in %','zabbix[process,timer,avg,busy]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22430,5,'','',10047,'Zabbix $4 $2 processes, in %','zabbix[process,discoverer,avg,busy]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22444,0,'','',10001,'Network interface discovery','net.if.discovery','1h','90d','0',0,4,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,1,NULL,'','Discovery of network interfaces as defined in global regular expression \"Network interfaces for discovery\".',0,'30d',0,0,0,'',0,'',NULL),(22446,0,'','',10001,'Incoming network traffic on $1','net.if.in[{#IFNAME}]','1m','1w','365d',0,3,'','bps','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22448,0,'','',10001,'Outgoing network traffic on $1','net.if.out[{#IFNAME}]','1m','1w','365d',0,3,'','bps','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22450,0,'','',10001,'Mounted filesystem discovery','vfs.fs.discovery','1h','90d','0',0,4,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,1,NULL,'','Discovery of file systems of different types as defined in global regular expression \"File systems for discovery\".',0,'30d',0,0,0,'',0,'',NULL),(22452,0,'','',10001,'Free disk space on $1','vfs.fs.size[{#FSNAME},free]','1m','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22454,0,'','',10001,'Free inodes on $1 (percentage)','vfs.fs.inode[{#FSNAME},pfree]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22456,0,'','',10001,'Total disk space on $1','vfs.fs.size[{#FSNAME},total]','1h','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22458,0,'','',10001,'Used disk space on $1','vfs.fs.size[{#FSNAME},used]','1m','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22665,0,'','',10001,'CPU $2 time','system.cpu.util[,steal]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The amount of CPU \'stolen\' from this virtual machine by the hypervisor for other tasks (such as running another virtual machine).',0,'0',0,0,0,'',0,'',NULL),(22668,0,'','',10001,'CPU $2 time','system.cpu.util[,softirq]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The amount of time the CPU has been servicing software interrupts.',0,'0',0,0,0,'',0,'',NULL),(22671,0,'','',10001,'CPU $2 time','system.cpu.util[,interrupt]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The amount of time the CPU has been servicing hardware interrupts.',0,'0',0,0,0,'',0,'',NULL),(22674,0,'','',10001,'Processor load (5 min average per core)','system.cpu.load[percpu,avg5]','1m','1w','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The processor load is calculated as system CPU load divided by number of CPU cores.',0,'0',0,0,0,'',0,'',NULL),(22677,0,'','',10001,'Processor load (15 min average per core)','system.cpu.load[percpu,avg15]','1m','1w','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The processor load is calculated as system CPU load divided by number of CPU cores.',0,'0',0,0,0,'',0,'',NULL),(22680,0,'','',10001,'Context switches per second','system.cpu.switches','1m','1w','365d',0,3,'','sps','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22683,0,'','',10001,'Interrupts per second','system.cpu.intr','1m','1w','365d',0,3,'','ips','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22686,0,'','',10001,'Free disk space on $1 (percentage)','vfs.fs.size[{#FSNAME},pfree]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22689,5,'','',10047,'Zabbix $4 $2 processes, in %','zabbix[process,java poller,avg,busy]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22700,4,'{$SNMP_COMMUNITY}','discovery[{#SNMPVALUE},IF-MIB::ifDescr]',10060,'Network interfaces','ifDescr','1h','90d','0',0,4,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,1,NULL,'','You may also consider using IF-MIB::ifType or IF-MIB::ifAlias for discovery depending on your filtering needs.\r\n\r\n{$SNMP_COMMUNITY} is a global macro.',0,'30d',0,0,0,'',0,'',NULL),(22701,4,'{$SNMP_COMMUNITY}','IF-MIB::ifInOctets.{#SNMPINDEX}',10060,'Incoming traffic on interface $1','ifInOctets[{#SNMPVALUE}]','1m','1w','365d',0,3,'','bps','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','The number of octets in valid MAC frames received on this interface, including the MAC header and FCS.',0,'0',0,0,0,'',0,'',NULL),(22702,4,'{$SNMP_COMMUNITY}','IF-MIB::ifOutOctets.{#SNMPINDEX}',10060,'Outgoing traffic on interface $1','ifOutOctets[{#SNMPVALUE}]','1m','1w','365d',0,3,'','bps','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','The number of octets transmitted in MAC frames on this interface, including the MAC header and FCS.',0,'0',0,0,0,'',0,'',NULL),(22703,4,'{$SNMP_COMMUNITY}','IF-MIB::ifDescr.{#SNMPINDEX}',10060,'Description of interface $1','ifDescr[{#SNMPVALUE}]','1h','1w','0',0,1,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','A textual string containing information about the interface.  This string should include the name of the manufacturer, the product name and the version of the interface hardware/software.',0,'0',0,0,0,'',0,'',NULL),(22704,4,'{$SNMP_COMMUNITY}','IF-MIB::ifOperStatus.{#SNMPINDEX}',10060,'Operational status of interface $1','ifOperStatus[{#SNMPVALUE}]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,8,'','',0,'','','','',0,2,NULL,'','The current operational state of the interface.',0,'0',0,0,0,'',0,'',NULL),(22705,4,'{$SNMP_COMMUNITY}','IF-MIB::ifAdminStatus.{#SNMPINDEX}',10060,'Admin status of interface $1','ifAdminStatus[{#SNMPVALUE}]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,11,'','',0,'','','','',0,2,NULL,'','The desired state of the interface.',0,'0',0,0,0,'',0,'',NULL),(22706,4,'{$SNMP_COMMUNITY}','IF-MIB::ifInErrors.{#SNMPINDEX}',10060,'Inbound errors on interface $1','ifInErrors[{#SNMPVALUE}]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','For packet-oriented interfaces, the number of inbound packets that contained errors preventing them from being deliverable to a higher-layer protocol.  For character-oriented or fixed-length interfaces, the number of inbound transmission units that contained errors preventing them from being deliverable to a higher-layer protocol.',0,'0',0,0,0,'',0,'',NULL),(22707,4,'{$SNMP_COMMUNITY}','IF-MIB::ifOutErrors.{#SNMPINDEX}',10060,'Outbound errors on interface $1','ifOutErrors[{#SNMPVALUE}]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','For packet-oriented interfaces, the number of outbound packets that could not be transmitted because of errors. For character-oriented or fixed-length interfaces, the number of outbound transmission units that could not be transmitted because of errors.',0,'0',0,0,0,'',0,'',NULL),(22708,4,'{$SNMP_COMMUNITY}','IF-MIB::ifAlias.{#SNMPINDEX}',10060,'Alias of interface $1','ifAlias[{#SNMPVALUE}]','1h','1w','0',0,1,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22709,4,'{$SNMP_COMMUNITY}','IF-MIB::ifNumber.0',10060,'Number of network interfaces','ifNumber','1h','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The number of network interfaces (regardless of their current state) present on this system.',0,'0',0,0,0,'',0,'',NULL),(22710,4,'{$SNMP_COMMUNITY}','SNMPv2-MIB::sysDescr.0',10065,'Device description','sysDescr','1h','1w','0',0,1,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','A textual description of the entity.  This value should include the full name and version identification of the system\'s hardware type, software operating-system, and networking software.',14,'0',0,0,0,'',0,'',NULL),(22711,4,'{$SNMP_COMMUNITY}','SNMPv2-MIB::sysName.0',10065,'Device name','sysName','1h','1w','0',0,1,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','An administratively-assigned name for this managed node. By convention, this is the node\'s fully-qualified domain name.  If the name is unknown, the value is the zero-length string.',3,'0',0,0,0,'',0,'',NULL),(22712,4,'{$SNMP_COMMUNITY}','SNMPv2-MIB::sysLocation.0',10065,'Device location','sysLocation','1h','1w','0',0,1,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The physical location of this node (e.g., `telephone closet, 3rd floor\').  If the location is unknown, the value is the zero-length string.',24,'0',0,0,0,'',0,'',NULL),(22713,4,'{$SNMP_COMMUNITY}','SNMPv2-MIB::sysContact.0',10065,'Device contact details','sysContact','1h','1w','0',0,1,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The textual identification of the contact person for this managed node, together with information on how to contact this person.  If no contact information is known, the value is the zero-length string.',23,'0',0,0,0,'',0,'',NULL),(22714,4,'{$SNMP_COMMUNITY}','SNMPv2-MIB::sysUpTime.0',10065,'Device uptime','sysUpTime','1m','1w','365d',0,3,'','uptime','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The time since the network management portion of the system was last re-initialized.',0,'0',0,0,0,'',0,'',NULL),(22715,4,'{$SNMP_COMMUNITY}','SNMPv2-MIB::sysContact.0',10066,'Device contact details','sysContact','1h','1w','0',0,1,'','','',0,'','','','',0,'',22713,NULL,'','',0,'','','','',0,0,NULL,'','The textual identification of the contact person for this managed node, together with information on how to contact this person.  If no contact information is known, the value is the zero-length string.',23,'0',0,0,0,'',0,'',NULL),(22716,4,'{$SNMP_COMMUNITY}','SNMPv2-MIB::sysDescr.0',10066,'Device description','sysDescr','1h','1w','0',0,1,'','','',0,'','','','',0,'',22710,NULL,'','',0,'','','','',0,0,NULL,'','A textual description of the entity.  This value should include the full name and version identification of the system\'s hardware type, software operating-system, and networking software.',14,'0',0,0,0,'',0,'',NULL),(22717,4,'{$SNMP_COMMUNITY}','SNMPv2-MIB::sysLocation.0',10066,'Device location','sysLocation','1h','1w','0',0,1,'','','',0,'','','','',0,'',22712,NULL,'','',0,'','','','',0,0,NULL,'','The physical location of this node (e.g., `telephone closet, 3rd floor\').  If the location is unknown, the value is the zero-length string.',24,'0',0,0,0,'',0,'',NULL),(22718,4,'{$SNMP_COMMUNITY}','SNMPv2-MIB::sysName.0',10066,'Device name','sysName','1h','1w','0',0,1,'','','',0,'','','','',0,'',22711,NULL,'','',0,'','','','',0,0,NULL,'','An administratively-assigned name for this managed node. By convention, this is the node\'s fully-qualified domain name.  If the name is unknown, the value is the zero-length string.',3,'0',0,0,0,'',0,'',NULL),(22719,4,'{$SNMP_COMMUNITY}','SNMPv2-MIB::sysUpTime.0',10066,'Device uptime','sysUpTime','1m','1w','365d',0,3,'','uptime','',0,'','','','',0,'',22714,NULL,'','',0,'','','','',0,0,NULL,'','The time since the network management portion of the system was last re-initialized.',0,'0',0,0,0,'',0,'',NULL),(22720,4,'{$SNMP_COMMUNITY}','discovery[{#SNMPVALUE},IF-MIB::ifDescr]',10066,'Network interfaces','ifDescr','1h','90d','0',0,4,'','','',0,'','','','',0,'',22700,NULL,'','',0,'','','','',0,1,NULL,'','You may also consider using IF-MIB::ifType or IF-MIB::ifAlias for discovery depending on your filtering needs.\r\n\r\n{$SNMP_COMMUNITY} is a global macro.',0,'30d',0,0,0,'',0,'',NULL),(22721,4,'{$SNMP_COMMUNITY}','IF-MIB::ifAdminStatus.{#SNMPINDEX}',10066,'Admin status of interface $1','ifAdminStatus[{#SNMPVALUE}]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',22705,11,'','',0,'','','','',0,2,NULL,'','The desired state of the interface.',0,'0',0,0,0,'',0,'',NULL),(22722,4,'{$SNMP_COMMUNITY}','IF-MIB::ifAlias.{#SNMPINDEX}',10066,'Alias of interface $1','ifAlias[{#SNMPVALUE}]','1h','1w','0',0,1,'','','',0,'','','','',0,'',22708,NULL,'','',0,'','','','',0,2,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22723,4,'{$SNMP_COMMUNITY}','IF-MIB::ifDescr.{#SNMPINDEX}',10066,'Description of interface $1','ifDescr[{#SNMPVALUE}]','1h','1w','0',0,1,'','','',0,'','','','',0,'',22703,NULL,'','',0,'','','','',0,2,NULL,'','A textual string containing information about the interface.  This string should include the name of the manufacturer, the product name and the version of the interface hardware/software.',0,'0',0,0,0,'',0,'',NULL),(22724,4,'{$SNMP_COMMUNITY}','IF-MIB::ifInErrors.{#SNMPINDEX}',10066,'Inbound errors on interface $1','ifInErrors[{#SNMPVALUE}]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',22706,NULL,'','',0,'','','','',0,2,NULL,'','For packet-oriented interfaces, the number of inbound packets that contained errors preventing them from being deliverable to a higher-layer protocol.  For character-oriented or fixed-length interfaces, the number of inbound transmission units that contained errors preventing them from being deliverable to a higher-layer protocol.',0,'0',0,0,0,'',0,'',NULL),(22725,4,'{$SNMP_COMMUNITY}','IF-MIB::ifInOctets.{#SNMPINDEX}',10066,'Incoming traffic on interface $1','ifInOctets[{#SNMPVALUE}]','1m','1w','365d',0,3,'','bps','',0,'','','','',0,'',22701,NULL,'','',0,'','','','',0,2,NULL,'','The number of octets in valid MAC frames received on this interface, including the MAC header and FCS.',0,'0',0,0,0,'',0,'',NULL),(22726,4,'{$SNMP_COMMUNITY}','IF-MIB::ifOperStatus.{#SNMPINDEX}',10066,'Operational status of interface $1','ifOperStatus[{#SNMPVALUE}]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',22704,8,'','',0,'','','','',0,2,NULL,'','The current operational state of the interface.',0,'0',0,0,0,'',0,'',NULL),(22727,4,'{$SNMP_COMMUNITY}','IF-MIB::ifOutErrors.{#SNMPINDEX}',10066,'Outbound errors on interface $1','ifOutErrors[{#SNMPVALUE}]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',22707,NULL,'','',0,'','','','',0,2,NULL,'','For packet-oriented interfaces, the number of outbound packets that could not be transmitted because of errors. For character-oriented or fixed-length interfaces, the number of outbound transmission units that could not be transmitted because of errors.',0,'0',0,0,0,'',0,'',NULL),(22728,4,'{$SNMP_COMMUNITY}','IF-MIB::ifOutOctets.{#SNMPINDEX}',10066,'Outgoing traffic on interface $1','ifOutOctets[{#SNMPVALUE}]','1m','1w','365d',0,3,'','bps','',0,'','','','',0,'',22702,NULL,'','',0,'','','','',0,2,NULL,'','The number of octets transmitted in MAC frames on this interface, including the MAC header and FCS.',0,'0',0,0,0,'',0,'',NULL),(22729,4,'{$SNMP_COMMUNITY}','IF-MIB::ifNumber.0',10066,'Number of network interfaces','ifNumber','1h','1w','365d',0,3,'','','',0,'','','','',0,'',22709,NULL,'','',0,'','','','',0,0,NULL,'','The number of network interfaces (regardless of their current state) present on this system.',0,'0',0,0,0,'',0,'',NULL),(22730,4,'{$SNMP_COMMUNITY}','SNMPv2-MIB::sysContact.0',10067,'Device contact details','sysContact','1h','1w','0',0,1,'','','',0,'','','','',0,'',22713,NULL,'','',0,'','','','',0,0,NULL,'','The textual identification of the contact person for this managed node, together with information on how to contact this person.  If no contact information is known, the value is the zero-length string.',23,'0',0,0,0,'',0,'',NULL),(22731,4,'{$SNMP_COMMUNITY}','SNMPv2-MIB::sysDescr.0',10067,'Device description','sysDescr','1h','1w','0',0,1,'','','',0,'','','','',0,'',22710,NULL,'','',0,'','','','',0,0,NULL,'','A textual description of the entity.  This value should include the full name and version identification of the system\'s hardware type, software operating-system, and networking software.',14,'0',0,0,0,'',0,'',NULL),(22732,4,'{$SNMP_COMMUNITY}','SNMPv2-MIB::sysLocation.0',10067,'Device location','sysLocation','1h','1w','0',0,1,'','','',0,'','','','',0,'',22712,NULL,'','',0,'','','','',0,0,NULL,'','The physical location of this node (e.g., `telephone closet, 3rd floor\').  If the location is unknown, the value is the zero-length string.',24,'0',0,0,0,'',0,'',NULL),(22733,4,'{$SNMP_COMMUNITY}','SNMPv2-MIB::sysName.0',10067,'Device name','sysName','1h','1w','0',0,1,'','','',0,'','','','',0,'',22711,NULL,'','',0,'','','','',0,0,NULL,'','An administratively-assigned name for this managed node. By convention, this is the node\'s fully-qualified domain name.  If the name is unknown, the value is the zero-length string.',3,'0',0,0,0,'',0,'',NULL),(22734,4,'{$SNMP_COMMUNITY}','SNMPv2-MIB::sysUpTime.0',10067,'Device uptime','sysUpTime','1m','1w','365d',0,3,'','uptime','',0,'','','','',0,'',22714,NULL,'','',0,'','','','',0,0,NULL,'','The time since the network management portion of the system was last re-initialized.',0,'0',0,0,0,'',0,'',NULL),(22735,4,'{$SNMP_COMMUNITY}','discovery[{#SNMPVALUE},IF-MIB::ifDescr]',10067,'Network interfaces','ifDescr','1h','90d','0',0,4,'','','',0,'','','','',0,'',22700,NULL,'','',0,'','','','',0,1,NULL,'','You may also consider using IF-MIB::ifType or IF-MIB::ifAlias for discovery depending on your filtering needs.\r\n\r\n{$SNMP_COMMUNITY} is a global macro.',0,'30d',0,0,0,'',0,'',NULL),(22736,4,'{$SNMP_COMMUNITY}','IF-MIB::ifAdminStatus.{#SNMPINDEX}',10067,'Admin status of interface $1','ifAdminStatus[{#SNMPVALUE}]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',22705,11,'','',0,'','','','',0,2,NULL,'','The desired state of the interface.',0,'0',0,0,0,'',0,'',NULL),(22737,4,'{$SNMP_COMMUNITY}','IF-MIB::ifAlias.{#SNMPINDEX}',10067,'Alias of interface $1','ifAlias[{#SNMPVALUE}]','1h','1w','0',0,1,'','','',0,'','','','',0,'',22708,NULL,'','',0,'','','','',0,2,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22738,4,'{$SNMP_COMMUNITY}','IF-MIB::ifDescr.{#SNMPINDEX}',10067,'Description of interface $1','ifDescr[{#SNMPVALUE}]','1h','1w','0',0,1,'','','',0,'','','','',0,'',22703,NULL,'','',0,'','','','',0,2,NULL,'','A textual string containing information about the interface.  This string should include the name of the manufacturer, the product name and the version of the interface hardware/software.',0,'0',0,0,0,'',0,'',NULL),(22739,4,'{$SNMP_COMMUNITY}','IF-MIB::ifInErrors.{#SNMPINDEX}',10067,'Inbound errors on interface $1','ifInErrors[{#SNMPVALUE}]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',22706,NULL,'','',0,'','','','',0,2,NULL,'','For packet-oriented interfaces, the number of inbound packets that contained errors preventing them from being deliverable to a higher-layer protocol.  For character-oriented or fixed-length interfaces, the number of inbound transmission units that contained errors preventing them from being deliverable to a higher-layer protocol.',0,'0',0,0,0,'',0,'',NULL),(22740,4,'{$SNMP_COMMUNITY}','IF-MIB::ifInOctets.{#SNMPINDEX}',10067,'Incoming traffic on interface $1','ifInOctets[{#SNMPVALUE}]','1m','1w','365d',0,3,'','bps','',0,'','','','',0,'',22701,NULL,'','',0,'','','','',0,2,NULL,'','The number of octets in valid MAC frames received on this interface, including the MAC header and FCS.',0,'0',0,0,0,'',0,'',NULL),(22741,4,'{$SNMP_COMMUNITY}','IF-MIB::ifOperStatus.{#SNMPINDEX}',10067,'Operational status of interface $1','ifOperStatus[{#SNMPVALUE}]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',22704,8,'','',0,'','','','',0,2,NULL,'','The current operational state of the interface.',0,'0',0,0,0,'',0,'',NULL),(22742,4,'{$SNMP_COMMUNITY}','IF-MIB::ifOutErrors.{#SNMPINDEX}',10067,'Outbound errors on interface $1','ifOutErrors[{#SNMPVALUE}]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',22707,NULL,'','',0,'','','','',0,2,NULL,'','For packet-oriented interfaces, the number of outbound packets that could not be transmitted because of errors. For character-oriented or fixed-length interfaces, the number of outbound transmission units that could not be transmitted because of errors.',0,'0',0,0,0,'',0,'',NULL),(22743,4,'{$SNMP_COMMUNITY}','IF-MIB::ifOutOctets.{#SNMPINDEX}',10067,'Outgoing traffic on interface $1','ifOutOctets[{#SNMPVALUE}]','1m','1w','365d',0,3,'','bps','',0,'','','','',0,'',22702,NULL,'','',0,'','','','',0,2,NULL,'','The number of octets transmitted in MAC frames on this interface, including the MAC header and FCS.',0,'0',0,0,0,'',0,'',NULL),(22744,4,'{$SNMP_COMMUNITY}','IF-MIB::ifNumber.0',10067,'Number of network interfaces','ifNumber','1h','1w','365d',0,3,'','','',0,'','','','',0,'',22709,NULL,'','',0,'','','','',0,0,NULL,'','The number of network interfaces (regardless of their current state) present on this system.',0,'0',0,0,0,'',0,'',NULL),(22746,4,'{$SNMP_COMMUNITY}','discovery[{#SNMPVALUE},HOST-RESOURCES-MIB::hrStorageDescr]',10068,'Disk partitions','hrStorageDescr','1h','90d','0',0,4,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,1,NULL,'','The rule will discover all disk partitions matching the global regexp \"Storage devices for SNMP discovery\".\r\n\r\n{$SNMP_COMMUNITY} is a global macro.',0,'30d',0,0,0,'',0,'',NULL),(22749,4,'{$SNMP_COMMUNITY}','HOST-RESOURCES-MIB::hrStorageDescr.{#SNMPINDEX}',10068,'Description of storage $1','hrStorageDescr[{#SNMPVALUE}]','1h','1w','0',0,1,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','A description of the type and instance of the storage described by this entry.',0,'0',0,0,0,'',0,'',NULL),(22755,4,'{$SNMP_COMMUNITY}','HOST-RESOURCES-MIB::hrStorageAllocationUnits.{#SNMPINDEX}',10068,'Allocation units for storage $1','hrStorageAllocationUnits[{#SNMPVALUE}]','1h','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','The size, in bytes, of the data objects allocated from this pool.  If this entry is monitoring sectors, blocks, buffers, or packets, for example, this number will commonly be greater than one.  Otherwise this number will typically be one.',0,'0',0,0,0,'',0,'',NULL),(22756,4,'{$SNMP_COMMUNITY}','HOST-RESOURCES-MIB::hrStorageSize.{#SNMPINDEX}',10068,'Total disk space on $1 in units','hrStorageSize[{#SNMPVALUE}]','1h','1w','365d',0,3,'','units','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','The size of the storage represented by this entry, in units of hrStorageAllocationUnits. This object is writable to allow remote configuration of the size of the storage area in those cases where such an operation makes sense and is possible on the underlying system. For example, the amount of main memory allocated to a buffer pool might be modified or the amount of disk space allocated to virtual memory might be modified.',0,'0',0,0,0,'',0,'',NULL),(22757,4,'{$SNMP_COMMUNITY}','HOST-RESOURCES-MIB::hrStorageUsed.{#SNMPINDEX}',10068,'Used disk space on $1 in units','hrStorageUsed[{#SNMPVALUE}]','1m','1w','365d',0,3,'','units','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','The amount of the storage represented by this entry that is allocated, in units of hrStorageAllocationUnits.',0,'0',0,0,0,'',0,'',NULL),(22758,15,'','',10068,'Total disk space on $1','hrStorageSizeInBytes[{#SNMPVALUE}]','1h','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'last(\"hrStorageSize[{#SNMPVALUE}]\") * last(\"hrStorageAllocationUnits[{#SNMPVALUE}]\")','',0,'','','','',0,2,NULL,'','This is a calculated item, we need it to get total disk space in bytes.',0,'0',0,0,0,'',0,'',NULL),(22759,15,'','',10068,'Used disk space on $1','hrStorageUsedInBytes[{#SNMPVALUE}]','1m','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'last(\"hrStorageUsed[{#SNMPVALUE}]\") * last(\"hrStorageAllocationUnits[{#SNMPVALUE}]\")','',0,'','','','',0,2,NULL,'','This is a calculated item, we need it to get used disk space in bytes.',0,'0',0,0,0,'',0,'',NULL),(22760,4,'{$SNMP_COMMUNITY}','discovery[{#SNMPVALUE},HOST-RESOURCES-MIB::hrStorageDescr]',10067,'Disk partitions','hrStorageDescr','1h','90d','0',0,4,'','','',0,'','','','',0,'',22746,NULL,'','',0,'','','','',0,1,NULL,'','The rule will discover all disk partitions matching the global regexp \"Storage devices for SNMP discovery\".\r\n\r\n{$SNMP_COMMUNITY} is a global macro.',0,'30d',0,0,0,'',0,'',NULL),(22761,4,'{$SNMP_COMMUNITY}','HOST-RESOURCES-MIB::hrStorageAllocationUnits.{#SNMPINDEX}',10067,'Allocation units for storage $1','hrStorageAllocationUnits[{#SNMPVALUE}]','1h','1w','365d',0,3,'','B','',0,'','','','',0,'',22755,NULL,'','',0,'','','','',0,2,NULL,'','The size, in bytes, of the data objects allocated from this pool.  If this entry is monitoring sectors, blocks, buffers, or packets, for example, this number will commonly be greater than one.  Otherwise this number will typically be one.',0,'0',0,0,0,'',0,'',NULL),(22762,4,'{$SNMP_COMMUNITY}','HOST-RESOURCES-MIB::hrStorageDescr.{#SNMPINDEX}',10067,'Description of storage $1','hrStorageDescr[{#SNMPVALUE}]','1h','1w','0',0,1,'','','',0,'','','','',0,'',22749,NULL,'','',0,'','','','',0,2,NULL,'','A description of the type and instance of the storage described by this entry.',0,'0',0,0,0,'',0,'',NULL),(22763,15,'','',10067,'Total disk space on $1','hrStorageSizeInBytes[{#SNMPVALUE}]','1h','1w','365d',0,3,'','B','',0,'','','','',0,'',22758,NULL,'last(\"hrStorageSize[{#SNMPVALUE}]\") * last(\"hrStorageAllocationUnits[{#SNMPVALUE}]\")','',0,'','','','',0,2,NULL,'','This is a calculated item, we need it to get total disk space in bytes.',0,'0',0,0,0,'',0,'',NULL),(22764,4,'{$SNMP_COMMUNITY}','HOST-RESOURCES-MIB::hrStorageSize.{#SNMPINDEX}',10067,'Total disk space on $1 in units','hrStorageSize[{#SNMPVALUE}]','1h','1w','365d',0,3,'','units','',0,'','','','',0,'',22756,NULL,'','',0,'','','','',0,2,NULL,'','The size of the storage represented by this entry, in units of hrStorageAllocationUnits. This object is writable to allow remote configuration of the size of the storage area in those cases where such an operation makes sense and is possible on the underlying system. For example, the amount of main memory allocated to a buffer pool might be modified or the amount of disk space allocated to virtual memory might be modified.',0,'0',0,0,0,'',0,'',NULL),(22765,15,'','',10067,'Used disk space on $1','hrStorageUsedInBytes[{#SNMPVALUE}]','1m','1w','365d',0,3,'','B','',0,'','','','',0,'',22759,NULL,'last(\"hrStorageUsed[{#SNMPVALUE}]\") * last(\"hrStorageAllocationUnits[{#SNMPVALUE}]\")','',0,'','','','',0,2,NULL,'','This is a calculated item, we need it to get used disk space in bytes.',0,'0',0,0,0,'',0,'',NULL),(22766,4,'{$SNMP_COMMUNITY}','HOST-RESOURCES-MIB::hrStorageUsed.{#SNMPINDEX}',10067,'Used disk space on $1 in units','hrStorageUsed[{#SNMPVALUE}]','1m','1w','365d',0,3,'','units','',0,'','','','',0,'',22757,NULL,'','',0,'','','','',0,2,NULL,'','The amount of the storage represented by this entry that is allocated, in units of hrStorageAllocationUnits.',0,'0',0,0,0,'',0,'',NULL),(22767,4,'{$SNMP_COMMUNITY}','discovery[{#SNMPVALUE},HOST-RESOURCES-MIB::hrStorageDescr]',10069,'Disk partitions','hrStorageDescr','1h','90d','0',0,4,'','','',0,'','','','',0,'',22746,NULL,'','',0,'','','','',0,1,NULL,'','The rule will discover all disk partitions matching the global regexp \"Storage devices for SNMP discovery\".\r\n\r\n{$SNMP_COMMUNITY} is a global macro.',0,'30d',0,0,0,'',0,'',NULL),(22768,4,'{$SNMP_COMMUNITY}','HOST-RESOURCES-MIB::hrStorageAllocationUnits.{#SNMPINDEX}',10069,'Allocation units for storage $1','hrStorageAllocationUnits[{#SNMPVALUE}]','1h','1w','365d',0,3,'','B','',0,'','','','',0,'',22755,NULL,'','',0,'','','','',0,2,NULL,'','The size, in bytes, of the data objects allocated from this pool.  If this entry is monitoring sectors, blocks, buffers, or packets, for example, this number will commonly be greater than one.  Otherwise this number will typically be one.',0,'0',0,0,0,'',0,'',NULL),(22769,4,'{$SNMP_COMMUNITY}','HOST-RESOURCES-MIB::hrStorageDescr.{#SNMPINDEX}',10069,'Description of storage $1','hrStorageDescr[{#SNMPVALUE}]','1h','1w','0',0,1,'','','',0,'','','','',0,'',22749,NULL,'','',0,'','','','',0,2,NULL,'','A description of the type and instance of the storage described by this entry.',0,'0',0,0,0,'',0,'',NULL),(22770,15,'','',10069,'Total disk space on $1','hrStorageSizeInBytes[{#SNMPVALUE}]','1h','1w','365d',0,3,'','B','',0,'','','','',0,'',22758,NULL,'last(\"hrStorageSize[{#SNMPVALUE}]\") * last(\"hrStorageAllocationUnits[{#SNMPVALUE}]\")','',0,'','','','',0,2,NULL,'','This is a calculated item, we need it to get total disk space in bytes.',0,'0',0,0,0,'',0,'',NULL),(22771,4,'{$SNMP_COMMUNITY}','HOST-RESOURCES-MIB::hrStorageSize.{#SNMPINDEX}',10069,'Total disk space on $1 in units','hrStorageSize[{#SNMPVALUE}]','1h','1w','365d',0,3,'','units','',0,'','','','',0,'',22756,NULL,'','',0,'','','','',0,2,NULL,'','The size of the storage represented by this entry, in units of hrStorageAllocationUnits. This object is writable to allow remote configuration of the size of the storage area in those cases where such an operation makes sense and is possible on the underlying system. For example, the amount of main memory allocated to a buffer pool might be modified or the amount of disk space allocated to virtual memory might be modified.',0,'0',0,0,0,'',0,'',NULL),(22772,15,'','',10069,'Used disk space on $1','hrStorageUsedInBytes[{#SNMPVALUE}]','1m','1w','365d',0,3,'','B','',0,'','','','',0,'',22759,NULL,'last(\"hrStorageUsed[{#SNMPVALUE}]\") * last(\"hrStorageAllocationUnits[{#SNMPVALUE}]\")','',0,'','','','',0,2,NULL,'','This is a calculated item, we need it to get used disk space in bytes.',0,'0',0,0,0,'',0,'',NULL),(22773,4,'{$SNMP_COMMUNITY}','HOST-RESOURCES-MIB::hrStorageUsed.{#SNMPINDEX}',10069,'Used disk space on $1 in units','hrStorageUsed[{#SNMPVALUE}]','1m','1w','365d',0,3,'','units','',0,'','','','',0,'',22757,NULL,'','',0,'','','','',0,2,NULL,'','The amount of the storage represented by this entry that is allocated, in units of hrStorageAllocationUnits.',0,'0',0,0,0,'',0,'',NULL),(22774,4,'{$SNMP_COMMUNITY}','SNMPv2-MIB::sysContact.0',10069,'Device contact details','sysContact','1h','1w','0',0,1,'','','',0,'','','','',0,'',22713,NULL,'','',0,'','','','',0,0,NULL,'','The textual identification of the contact person for this managed node, together with information on how to contact this person.  If no contact information is known, the value is the zero-length string.',23,'0',0,0,0,'',0,'',NULL),(22775,4,'{$SNMP_COMMUNITY}','SNMPv2-MIB::sysDescr.0',10069,'Device description','sysDescr','1h','1w','0',0,1,'','','',0,'','','','',0,'',22710,NULL,'','',0,'','','','',0,0,NULL,'','A textual description of the entity.  This value should include the full name and version identification of the system\'s hardware type, software operating-system, and networking software.',14,'0',0,0,0,'',0,'',NULL),(22776,4,'{$SNMP_COMMUNITY}','SNMPv2-MIB::sysLocation.0',10069,'Device location','sysLocation','1h','1w','0',0,1,'','','',0,'','','','',0,'',22712,NULL,'','',0,'','','','',0,0,NULL,'','The physical location of this node (e.g., `telephone closet, 3rd floor\').  If the location is unknown, the value is the zero-length string.',24,'0',0,0,0,'',0,'',NULL),(22777,4,'{$SNMP_COMMUNITY}','SNMPv2-MIB::sysName.0',10069,'Device name','sysName','1h','1w','0',0,1,'','','',0,'','','','',0,'',22711,NULL,'','',0,'','','','',0,0,NULL,'','An administratively-assigned name for this managed node. By convention, this is the node\'s fully-qualified domain name.  If the name is unknown, the value is the zero-length string.',3,'0',0,0,0,'',0,'',NULL),(22778,4,'{$SNMP_COMMUNITY}','SNMPv2-MIB::sysUpTime.0',10069,'Device uptime','sysUpTime','1m','1w','365d',0,3,'','uptime','',0,'','','','',0,'',22714,NULL,'','',0,'','','','',0,0,NULL,'','The time since the network management portion of the system was last re-initialized.',0,'0',0,0,0,'',0,'',NULL),(22779,4,'{$SNMP_COMMUNITY}','discovery[{#SNMPVALUE},IF-MIB::ifDescr]',10069,'Network interfaces','ifDescr','1h','90d','0',0,4,'','','',0,'','','','',0,'',22700,NULL,'','',0,'','','','',0,1,NULL,'','You may also consider using IF-MIB::ifType or IF-MIB::ifAlias for discovery depending on your filtering needs.\r\n\r\n{$SNMP_COMMUNITY} is a global macro.',0,'30d',0,0,0,'',0,'',NULL),(22780,4,'{$SNMP_COMMUNITY}','IF-MIB::ifAdminStatus.{#SNMPINDEX}',10069,'Admin status of interface $1','ifAdminStatus[{#SNMPVALUE}]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',22705,11,'','',0,'','','','',0,2,NULL,'','The desired state of the interface.',0,'0',0,0,0,'',0,'',NULL),(22781,4,'{$SNMP_COMMUNITY}','IF-MIB::ifAlias.{#SNMPINDEX}',10069,'Alias of interface $1','ifAlias[{#SNMPVALUE}]','1h','1w','0',0,1,'','','',0,'','','','',0,'',22708,NULL,'','',0,'','','','',0,2,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22782,4,'{$SNMP_COMMUNITY}','IF-MIB::ifDescr.{#SNMPINDEX}',10069,'Description of interface $1','ifDescr[{#SNMPVALUE}]','1h','1w','0',0,1,'','','',0,'','','','',0,'',22703,NULL,'','',0,'','','','',0,2,NULL,'','A textual string containing information about the interface.  This string should include the name of the manufacturer, the product name and the version of the interface hardware/software.',0,'0',0,0,0,'',0,'',NULL),(22783,4,'{$SNMP_COMMUNITY}','IF-MIB::ifInErrors.{#SNMPINDEX}',10069,'Inbound errors on interface $1','ifInErrors[{#SNMPVALUE}]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',22706,NULL,'','',0,'','','','',0,2,NULL,'','For packet-oriented interfaces, the number of inbound packets that contained errors preventing them from being deliverable to a higher-layer protocol.  For character-oriented or fixed-length interfaces, the number of inbound transmission units that contained errors preventing them from being deliverable to a higher-layer protocol.',0,'0',0,0,0,'',0,'',NULL),(22784,4,'{$SNMP_COMMUNITY}','IF-MIB::ifInOctets.{#SNMPINDEX}',10069,'Incoming traffic on interface $1','ifInOctets[{#SNMPVALUE}]','1m','1w','365d',0,3,'','bps','',0,'','','','',0,'',22701,NULL,'','',0,'','','','',0,2,NULL,'','The number of octets in valid MAC frames received on this interface, including the MAC header and FCS.',0,'0',0,0,0,'',0,'',NULL),(22785,4,'{$SNMP_COMMUNITY}','IF-MIB::ifOperStatus.{#SNMPINDEX}',10069,'Operational status of interface $1','ifOperStatus[{#SNMPVALUE}]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',22704,8,'','',0,'','','','',0,2,NULL,'','The current operational state of the interface.',0,'0',0,0,0,'',0,'',NULL),(22786,4,'{$SNMP_COMMUNITY}','IF-MIB::ifOutErrors.{#SNMPINDEX}',10069,'Outbound errors on interface $1','ifOutErrors[{#SNMPVALUE}]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',22707,NULL,'','',0,'','','','',0,2,NULL,'','For packet-oriented interfaces, the number of outbound packets that could not be transmitted because of errors. For character-oriented or fixed-length interfaces, the number of outbound transmission units that could not be transmitted because of errors.',0,'0',0,0,0,'',0,'',NULL),(22787,4,'{$SNMP_COMMUNITY}','IF-MIB::ifOutOctets.{#SNMPINDEX}',10069,'Outgoing traffic on interface $1','ifOutOctets[{#SNMPVALUE}]','1m','1w','365d',0,3,'','bps','',0,'','','','',0,'',22702,NULL,'','',0,'','','','',0,2,NULL,'','The number of octets transmitted in MAC frames on this interface, including the MAC header and FCS.',0,'0',0,0,0,'',0,'',NULL),(22788,4,'{$SNMP_COMMUNITY}','IF-MIB::ifNumber.0',10069,'Number of network interfaces','ifNumber','1h','1w','365d',0,3,'','','',0,'','','','',0,'',22709,NULL,'','',0,'','','','',0,0,NULL,'','The number of network interfaces (regardless of their current state) present on this system.',0,'0',0,0,0,'',0,'',NULL),(22789,4,'{$SNMP_COMMUNITY}','discovery[{#SNMPVALUE},HOST-RESOURCES-MIB::hrProcessorLoad]',10070,'Processors','hrProcessorLoad','1h','90d','0',0,4,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,1,NULL,'','{$SNMP_COMMUNITY} is a global macro.',0,'30d',0,0,0,'',0,'',NULL),(22793,4,'{$SNMP_COMMUNITY}','HOST-RESOURCES-MIB::hrProcessorLoad.{#SNMPINDEX}',10070,'Utilization of processor #$1','hrProcessorLoad[{#SNMPINDEX}]','1m','1w','365d',0,3,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','The average, over the last minute, of the percentage of time that this processor was not idle. Implementations may approximate this one minute smoothing period if necessary.',0,'0',0,0,0,'',0,'',NULL),(22796,4,'{$SNMP_COMMUNITY}','discovery[{#SNMPVALUE},HOST-RESOURCES-MIB::hrProcessorLoad]',10069,'Processors','hrProcessorLoad','1h','90d','0',0,4,'','','',0,'','','','',0,'',22789,NULL,'','',0,'','','','',0,1,NULL,'','{$SNMP_COMMUNITY} is a global macro.',0,'30d',0,0,0,'',0,'',NULL),(22797,4,'{$SNMP_COMMUNITY}','HOST-RESOURCES-MIB::hrProcessorLoad.{#SNMPINDEX}',10069,'Utilization of processor #$1','hrProcessorLoad[{#SNMPINDEX}]','1m','1w','365d',0,3,'','%','',0,'','','','',0,'',22793,NULL,'','',0,'','','','',0,2,NULL,'','The average, over the last minute, of the percentage of time that this processor was not idle. Implementations may approximate this one minute smoothing period if necessary.',0,'0',0,0,0,'',0,'',NULL),(22798,4,'{$SNMP_COMMUNITY}','discovery[{#SNMPVALUE},HOST-RESOURCES-MIB::hrProcessorLoad]',10067,'Processors','hrProcessorLoad','1h','90d','0',0,4,'','','',0,'','','','',0,'',22789,NULL,'','',0,'','','','',0,1,NULL,'','{$SNMP_COMMUNITY} is a global macro.',0,'30d',0,0,0,'',0,'',NULL),(22799,4,'{$SNMP_COMMUNITY}','HOST-RESOURCES-MIB::hrProcessorLoad.{#SNMPINDEX}',10067,'Utilization of processor #$1','hrProcessorLoad[{#SNMPINDEX}]','1m','1w','365d',0,3,'','%','',0,'','','','',0,'',22793,NULL,'','',0,'','','','',0,2,NULL,'','The average, over the last minute, of the percentage of time that this processor was not idle. Implementations may approximate this one minute smoothing period if necessary.',0,'0',0,0,0,'',0,'',NULL),(22800,12,'','',10071,'BB +1.8V SM','bb_1.8v_sm','1m','1w','365d',0,0,'','V','',0,'','','','',0,'',NULL,NULL,'','BB +1.8V SM',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(22801,12,'','',10071,'BB +3.3V','bb_3.3v','1m','1w','365d',0,0,'','V','',0,'','','','',0,'',NULL,NULL,'','BB +3.3V',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(22802,12,'','',10071,'BB +3.3V STBY','bb_3.3v_stby','1m','1w','365d',0,0,'','V','',0,'','','','',0,'',NULL,NULL,'','BB +3.3V STBY',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(22803,12,'','',10071,'BB +5.0V','bb_5.0v','1m','1w','365d',0,0,'','V','',0,'','','','',0,'',NULL,NULL,'','BB +5.0V',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(22804,12,'','',10071,'BB Ambient Temp','bb_ambient_temp','1m','1w','365d',0,0,'','C','',0,'','','','',0,'',NULL,NULL,'','BB Ambient Temp',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(22805,12,'','',10071,'Power','power','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','power',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(22806,12,'','',10071,'Processor Vcc','processor_vcc','1m','1w','365d',0,0,'','V','',0,'','','','',0,'',NULL,NULL,'','Processor Vcc',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(22807,12,'','',10071,'System Fan 3','system_fan_3','1m','1w','365d',0,0,'','RPM','',0,'','','','',0,'',NULL,NULL,'','System Fan 3',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(22808,12,'','',10072,'Baseboard Temp','baseboard_temp','1m','1w','365d',0,0,'','C','',0,'','','','',0,'',NULL,NULL,'','Baseboard Temp',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(22809,12,'','',10072,'BB +1.05V PCH','bb_1.05v_pch','1m','1w','365d',0,0,'','V','',0,'','','','',0,'',NULL,NULL,'','BB +1.05V PCH',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(22810,12,'','',10072,'BB +1.1V P1 Vccp','bb_1.1v_p1_vccp','1m','1w','365d',0,0,'','V','',0,'','','','',0,'',NULL,NULL,'','BB +1.1V P1 Vccp',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(22811,12,'','',10072,'BB +1.5V P1 DDR3','bb_1.5v_p1_ddr3','1m','1w','365d',0,0,'','V','',0,'','','','',0,'',NULL,NULL,'','BB +1.5V P1 DDR3',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(22812,12,'','',10072,'BB +3.3V','bb_3.3v','1m','1w','365d',0,0,'','V','',0,'','','','',0,'',NULL,NULL,'','BB +3.3V',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(22813,12,'','',10072,'BB +3.3V STBY','bb_3.3v_stby','1m','1w','365d',0,0,'','V','',0,'','','','',0,'',NULL,NULL,'','BB +3.3V STBY',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(22814,12,'','',10072,'BB +5.0V','bb_5.0v','1m','1w','365d',0,0,'','V','',0,'','','','',0,'',NULL,NULL,'','BB +5.0V',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(22815,12,'','',10072,'Front Panel Temp','front_panel_temp','1m','1w','365d',0,0,'','C','',0,'','','','',0,'',NULL,NULL,'','Front Panel Temp',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(22816,12,'','',10072,'Power','power','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','power',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(22817,12,'','',10072,'System Fan 2','system_fan_2','1m','1w','365d',0,0,'','RPM','',0,'','','','',0,'',NULL,NULL,'','System Fan 2',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(22818,12,'','',10072,'System Fan 3','system_fan_3','1m','1w','365d',0,0,'','RPM','',0,'','','','',0,'',NULL,NULL,'','System Fan 3',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(22819,0,'','',10073,'MySQL status','mysql.ping','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,1,'','',0,'','','','',0,0,NULL,'','It requires user parameter mysql.ping, which is defined in userparameter_mysql.conf.\r\n\r\n0 - MySQL server is down\r\n1 - MySQL server is up',0,'30d',0,0,0,'',0,'',NULL),(22820,0,'','',10073,'MySQL uptime','mysql.status[Uptime]','1m','1w','365d',0,3,'','uptime','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','It requires user parameter mysql.status[*], which is defined in userparameter_mysql.conf.',0,'30d',0,0,0,'',0,'',NULL),(22821,0,'','',10073,'MySQL version','mysql.version','1h','1w','0',0,1,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','It requires user parameter mysql.version, which is defined in userparameter_mysql.conf.',0,'30d',0,0,0,'',0,'',NULL),(22822,0,'','',10073,'MySQL insert operations per second','mysql.status[Com_insert]','1m','1w','365d',0,0,'','qps','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','It requires user parameter mysql.status[*], which is defined in userparameter_mysql.conf.',0,'30d',0,0,0,'',0,'',NULL),(22823,0,'','',10073,'MySQL select operations per second','mysql.status[Com_select]','1m','1w','365d',0,0,'','qps','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','It requires user parameter mysql.status[*], which is defined in userparameter_mysql.conf.',0,'30d',0,0,0,'',0,'',NULL),(22824,0,'','',10073,'MySQL update operations per second','mysql.status[Com_update]','1m','1w','365d',0,0,'','qps','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','It requires user parameter mysql.status[*], which is defined in userparameter_mysql.conf.',0,'30d',0,0,0,'',0,'',NULL),(22825,0,'','',10073,'MySQL rollback operations per second','mysql.status[Com_rollback]','1m','1w','365d',0,0,'','qps','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','It requires user parameter mysql.status[*], which is defined in userparameter_mysql.conf.',0,'30d',0,0,0,'',0,'',NULL),(22826,0,'','',10073,'MySQL commit operations per second','mysql.status[Com_commit]','1m','1w','365d',0,0,'','qps','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','It requires user parameter mysql.status[*], which is defined in userparameter_mysql.conf.',0,'30d',0,0,0,'',0,'',NULL),(22827,0,'','',10073,'MySQL begin operations per second','mysql.status[Com_begin]','1m','1w','365d',0,0,'','qps','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','It requires user parameter mysql.status[*], which is defined in userparameter_mysql.conf.',0,'30d',0,0,0,'',0,'',NULL),(22828,0,'','',10073,'MySQL delete operations per second','mysql.status[Com_delete]','1m','1w','365d',0,0,'','qps','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','It requires user parameter mysql.status[*], which is defined in userparameter_mysql.conf.',0,'30d',0,0,0,'',0,'',NULL),(22829,0,'','',10073,'MySQL bytes sent per second','mysql.status[Bytes_sent]','1m','1w','365d',0,0,'','Bps','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The number of bytes sent to all clients.\r\n\r\nIt requires user parameter mysql.status[*], which is defined in userparameter_mysql.conf.',0,'30d',0,0,0,'',0,'',NULL),(22830,0,'','',10073,'MySQL bytes received per second','mysql.status[Bytes_received]','1m','1w','365d',0,0,'','Bps','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The number of bytes received from all clients. \r\n\r\nIt requires user parameter mysql.status[*], which is defined in \r\nuserparameter_mysql.conf.',0,'30d',0,0,0,'',0,'',NULL),(22831,0,'','',10073,'MySQL queries per second','mysql.status[Questions]','1m','1w','365d',0,0,'','qps','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','It requires user parameter mysql.status[*], which is defined in userparameter_mysql.conf.',0,'30d',0,0,0,'',0,'',NULL),(22832,0,'','',10073,'MySQL slow queries','mysql.status[Slow_queries]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','It requires user parameter mysql.status[*], which is defined in userparameter_mysql.conf.',0,'30d',0,0,0,'',0,'',NULL),(22833,0,'','',10074,'Agent ping','agent.ping','1m','1w','365d',0,3,'','','',0,'','','','',0,'',22232,10,'','',0,'','','','',0,0,NULL,'','The agent always returns 1 for this item. It could be used in combination with nodata() for availability check.',0,'0',0,0,0,'',0,'',NULL),(22834,0,'','',10074,'Version of zabbix_agent(d) running','agent.version','1h','1w','0',0,1,'','','',0,'','','','',0,'',22231,NULL,'','',0,'','','','',0,0,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22835,0,'','',10074,'Maximum number of opened files','kernel.maxfiles','1h','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','It could be increased by using sysctrl utility or modifying file /etc/sysctl.conf.',0,'30d',0,0,0,'',0,'',NULL),(22836,0,'','',10074,'Maximum number of processes','kernel.maxproc','1h','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','It could be increased by using sysctrl utility or modifying file /etc/sysctl.conf.',0,'30d',0,0,0,'',0,'',NULL),(22837,0,'','',10074,'Number of running processes','proc.num[,,run]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','Number of processes in running state.',0,'30d',0,0,0,'',0,'',NULL),(22838,0,'','',10074,'Number of processes','proc.num[]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','Total number of processes in any state.',0,'30d',0,0,0,'',0,'',NULL),(22839,0,'','',10074,'Host boot time','system.boottime','10m','1w','365d',0,3,'','unixtime','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(22840,0,'','',10074,'Interrupts per second','system.cpu.intr','1m','1w','365d',0,3,'','ips','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(22841,0,'','',10074,'Processor load (15 min average per core)','system.cpu.load[percpu,avg15]','1m','1w','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The processor load is calculated as system CPU load divided by number of CPU cores.',0,'30d',0,0,0,'',0,'',NULL),(22842,0,'','',10074,'Processor load (1 min average per core)','system.cpu.load[percpu,avg1]','1m','1w','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The processor load is calculated as system CPU load divided by number of CPU cores.',0,'30d',0,0,0,'',0,'',NULL),(22843,0,'','',10074,'Processor load (5 min average per core)','system.cpu.load[percpu,avg5]','1m','1w','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The processor load is calculated as system CPU load divided by number of CPU cores.',0,'30d',0,0,0,'',0,'',NULL),(22844,0,'','',10074,'Context switches per second','system.cpu.switches','1m','1w','365d',0,3,'','sps','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(22845,0,'','',10074,'CPU $2 time','system.cpu.util[,idle]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The time the CPU has spent doing nothing.',0,'30d',0,0,0,'',0,'',NULL),(22846,0,'','',10074,'CPU $2 time','system.cpu.util[,interrupt]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The amount of time the CPU has been servicing hardware interrupts.',0,'30d',0,0,0,'',0,'',NULL),(22848,0,'','',10074,'CPU $2 time','system.cpu.util[,nice]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The time the CPU has spent running users\' processes that have been niced.',0,'30d',0,0,0,'',0,'',NULL),(22851,0,'','',10074,'CPU $2 time','system.cpu.util[,system]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The time the CPU has spent running the kernel and its processes.',0,'30d',0,0,0,'',0,'',NULL),(22852,0,'','',10074,'CPU $2 time','system.cpu.util[,user]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The time the CPU has spent running users\' processes that are not niced.',0,'30d',0,0,0,'',0,'',NULL),(22853,0,'','',10074,'Host name','system.hostname','1h','1w','0',0,1,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','System host name.',3,'30d',0,0,0,'',0,'',NULL),(22854,0,'','',10074,'Host local time','system.localtime','1m','1w','365d',0,3,'','unixtime','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(22855,0,'','',10074,'Free swap space','system.swap.size[,free]','1m','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(22856,0,'','',10074,'Free swap space in %','system.swap.size[,pfree]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(22857,0,'','',10074,'Total swap space','system.swap.size[,total]','1h','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(22858,0,'','',10074,'System information','system.uname','1h','1w','0',0,1,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The information as normally returned by \'uname -a\'.',5,'30d',0,0,0,'',0,'',NULL),(22859,0,'','',10074,'System uptime','system.uptime','10m','1w','365d',0,3,'','uptime','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(22860,0,'','',10074,'Number of logged in users','system.users.num','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','Number of users who are currently logged in.',0,'30d',0,0,0,'',0,'',NULL),(22861,0,'','',10074,'Checksum of $1','vfs.file.cksum[/etc/passwd]','1h','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(22862,0,'','',10074,'Available memory','vm.memory.size[available]','1m','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','Available memory is defined as free+cached+buffers memory.',0,'30d',0,0,0,'',0,'',NULL),(22863,0,'','',10074,'Total memory','vm.memory.size[total]','1h','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(22867,0,'','',10074,'Mounted filesystem discovery','vfs.fs.discovery','1h','90d','0',0,4,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,1,NULL,'','Discovery of file systems of different types as defined in global regular expression \"File systems for discovery\".',0,'30d',0,0,0,'',0,'',NULL),(22868,0,'','',10074,'Free disk space on $1','vfs.fs.size[{#FSNAME},free]','1m','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22869,0,'','',10074,'Free inodes on $1 (percentage)','vfs.fs.inode[{#FSNAME},pfree]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22870,0,'','',10074,'Total disk space on $1','vfs.fs.size[{#FSNAME},total]','1h','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22871,0,'','',10074,'Used disk space on $1','vfs.fs.size[{#FSNAME},used]','1m','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22872,0,'','',10074,'Free disk space on $1 (percentage)','vfs.fs.size[{#FSNAME},pfree]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22873,0,'','',10075,'Agent ping','agent.ping','1m','1w','365d',0,3,'','','',0,'','','','',0,'',22232,10,'','',0,'','','','',0,0,NULL,'','The agent always returns 1 for this item. It could be used in combination with nodata() for availability check.',0,'0',0,0,0,'',0,'',NULL),(22874,0,'','',10075,'Version of zabbix_agent(d) running','agent.version','1h','1w','0',0,1,'','','',0,'','','','',0,'',22231,NULL,'','',0,'','','','',0,0,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22875,0,'','',10075,'Maximum number of opened files','kernel.maxfiles','1h','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','It could be increased by using sysctrl utility or modifying file /etc/sysctl.conf.',0,'30d',0,0,0,'',0,'',NULL),(22876,0,'','',10075,'Maximum number of processes','kernel.maxproc','1h','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','It could be increased by using sysctrl utility or modifying file /etc/sysctl.conf.',0,'30d',0,0,0,'',0,'',NULL),(22877,0,'','',10075,'Number of running processes','proc.num[,,run]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','Number of processes in running state.',0,'30d',0,0,0,'',0,'',NULL),(22878,0,'','',10075,'Number of processes','proc.num[]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','Total number of processes in any state.',0,'30d',0,0,0,'',0,'',NULL),(22879,0,'','',10075,'Host boot time','system.boottime','10m','1w','365d',0,3,'','unixtime','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(22880,0,'','',10075,'Interrupts per second','system.cpu.intr','1m','1w','365d',0,3,'','ips','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(22881,0,'','',10075,'Processor load (15 min average per core)','system.cpu.load[percpu,avg15]','1m','1w','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The processor load is calculated as system CPU load divided by number of CPU cores.',0,'30d',0,0,0,'',0,'',NULL),(22882,0,'','',10075,'Processor load (1 min average per core)','system.cpu.load[percpu,avg1]','1m','1w','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The processor load is calculated as system CPU load divided by number of CPU cores.',0,'30d',0,0,0,'',0,'',NULL),(22883,0,'','',10075,'Processor load (5 min average per core)','system.cpu.load[percpu,avg5]','1m','1w','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The processor load is calculated as system CPU load divided by number of CPU cores.',0,'30d',0,0,0,'',0,'',NULL),(22884,0,'','',10075,'Context switches per second','system.cpu.switches','1m','1w','365d',0,3,'','sps','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(22885,0,'','',10075,'CPU $2 time','system.cpu.util[,idle]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The time the CPU has spent doing nothing.',0,'30d',0,0,0,'',0,'',NULL),(22886,0,'','',10075,'CPU $2 time','system.cpu.util[,interrupt]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The amount of time the CPU has been servicing hardware interrupts.',0,'30d',0,0,0,'',0,'',NULL),(22888,0,'','',10075,'CPU $2 time','system.cpu.util[,nice]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The time the CPU has spent running users\' processes that have been niced.',0,'30d',0,0,0,'',0,'',NULL),(22891,0,'','',10075,'CPU $2 time','system.cpu.util[,system]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The time the CPU has spent running the kernel and its processes.',0,'30d',0,0,0,'',0,'',NULL),(22892,0,'','',10075,'CPU $2 time','system.cpu.util[,user]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The time the CPU has spent running users\' processes that are not niced.',0,'30d',0,0,0,'',0,'',NULL),(22893,0,'','',10075,'Host name','system.hostname','1h','1w','0',0,1,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','System host name.',3,'30d',0,0,0,'',0,'',NULL),(22894,0,'','',10075,'Host local time','system.localtime','1m','1w','365d',0,3,'','unixtime','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(22895,0,'','',10075,'Free swap space','system.swap.size[,free]','1m','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(22896,0,'','',10075,'Free swap space in %','system.swap.size[,pfree]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(22897,0,'','',10075,'Total swap space','system.swap.size[,total]','1h','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(22898,0,'','',10075,'System information','system.uname','1h','1w','0',0,1,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The information as normally returned by \'uname -a\'.',5,'30d',0,0,0,'',0,'',NULL),(22899,0,'','',10075,'System uptime','system.uptime','10m','1w','365d',0,3,'','uptime','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(22900,0,'','',10075,'Number of logged in users','system.users.num','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','Number of users who are currently logged in.',0,'30d',0,0,0,'',0,'',NULL),(22901,0,'','',10075,'Checksum of $1','vfs.file.cksum[/etc/passwd]','1h','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(22902,0,'','',10075,'Available memory','vm.memory.size[available]','1m','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','Available memory is defined as free+cached+buffers memory.',0,'30d',0,0,0,'',0,'',NULL),(22903,0,'','',10075,'Total memory','vm.memory.size[total]','1h','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(22907,0,'','',10075,'Mounted filesystem discovery','vfs.fs.discovery','1h','90d','0',0,4,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,1,NULL,'','Discovery of file systems of different types as defined in global regular expression \"File systems for discovery\".',0,'30d',0,0,0,'',0,'',NULL),(22908,0,'','',10075,'Free disk space on $1','vfs.fs.size[{#FSNAME},free]','1m','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22909,0,'','',10075,'Free inodes on $1 (percentage)','vfs.fs.inode[{#FSNAME},pfree]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22910,0,'','',10075,'Total disk space on $1','vfs.fs.size[{#FSNAME},total]','1h','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22911,0,'','',10075,'Used disk space on $1','vfs.fs.size[{#FSNAME},used]','1m','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22912,0,'','',10075,'Free disk space on $1 (percentage)','vfs.fs.size[{#FSNAME},pfree]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22913,0,'','',10076,'Agent ping','agent.ping','1m','1w','365d',0,3,'','','',0,'','','','',0,'',22232,10,'','',0,'','','','',0,0,NULL,'','The agent always returns 1 for this item. It could be used in combination with nodata() for availability check.',0,'0',0,0,0,'',0,'',NULL),(22914,0,'','',10076,'Version of zabbix_agent(d) running','agent.version','1h','1w','0',0,1,'','','',0,'','','','',0,'',22231,NULL,'','',0,'','','','',0,0,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22917,0,'','',10076,'Number of running processes','proc.num[,,run]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','Number of processes in running state.',0,'30d',0,0,0,'',0,'',NULL),(22918,0,'','',10076,'Number of processes','proc.num[]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','Total number of processes in any state.',0,'30d',0,0,0,'',0,'',NULL),(22920,0,'','',10076,'Interrupts per second','system.cpu.intr','1m','1w','365d',0,3,'','ips','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(22921,0,'','',10076,'Processor load (15 min average per core)','system.cpu.load[percpu,avg15]','1m','1w','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The processor load is calculated as system CPU load divided by number of CPU cores.',0,'30d',0,0,0,'',0,'',NULL),(22922,0,'','',10076,'Processor load (1 min average per core)','system.cpu.load[percpu,avg1]','1m','1w','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The processor load is calculated as system CPU load divided by number of CPU cores.',0,'30d',0,0,0,'',0,'',NULL),(22923,0,'','',10076,'Processor load (5 min average per core)','system.cpu.load[percpu,avg5]','1m','1w','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The processor load is calculated as system CPU load divided by number of CPU cores.',0,'30d',0,0,0,'',0,'',NULL),(22924,0,'','',10076,'Context switches per second','system.cpu.switches','1m','1w','365d',0,3,'','sps','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(22933,0,'','',10076,'Host name','system.hostname','1h','1w','0',0,1,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','System host name.',3,'30d',0,0,0,'',0,'',NULL),(22934,0,'','',10076,'Host local time','system.localtime','1m','1w','365d',0,3,'','unixtime','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(22938,0,'','',10076,'System information','system.uname','1h','1w','0',0,1,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The information as normally returned by \'uname -a\'.',5,'30d',0,0,0,'',0,'',NULL),(22939,0,'','',10076,'System uptime','system.uptime','10m','1w','365d',0,3,'','uptime','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(22940,0,'','',10076,'Number of logged in users','system.users.num','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','Number of users who are currently logged in.',0,'30d',0,0,0,'',0,'',NULL),(22941,0,'','',10076,'Checksum of $1','vfs.file.cksum[/etc/passwd]','1h','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(22942,0,'','',10076,'Available memory','vm.memory.size[available]','1m','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','Available memory is defined as free+cached+buffers memory.',0,'30d',0,0,0,'',0,'',NULL),(22943,0,'','',10076,'Total memory','vm.memory.size[total]','1h','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(22944,0,'','',10076,'Network interface discovery','net.if.discovery','1h','90d','0',0,4,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,1,NULL,'','Discovery of network interfaces as defined in global regular expression \"Network interfaces for discovery\".',0,'30d',0,0,0,'',0,'',NULL),(22945,0,'','',10076,'Incoming network traffic on $1','net.if.in[{#IFNAME}]','1m','1w','365d',0,3,'','bps','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22946,0,'','',10076,'Outgoing network traffic on $1','net.if.out[{#IFNAME}]','1m','1w','365d',0,3,'','bps','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22947,0,'','',10076,'Mounted filesystem discovery','vfs.fs.discovery','1h','90d','0',0,4,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,1,NULL,'','Discovery of file systems of different types as defined in global regular expression \"File systems for discovery\".',0,'30d',0,0,0,'',0,'',NULL),(22948,0,'','',10076,'Free disk space on $1','vfs.fs.size[{#FSNAME},free]','1m','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22949,0,'','',10076,'Free inodes on $1 (percentage)','vfs.fs.inode[{#FSNAME},pfree]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22950,0,'','',10076,'Total disk space on $1','vfs.fs.size[{#FSNAME},total]','1h','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22951,0,'','',10076,'Used disk space on $1','vfs.fs.size[{#FSNAME},used]','1m','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22952,0,'','',10076,'Free disk space on $1 (percentage)','vfs.fs.size[{#FSNAME},pfree]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22953,0,'','',10077,'Agent ping','agent.ping','1m','1w','365d',0,3,'','','',0,'','','','',0,'',22232,10,'','',0,'','','','',0,0,NULL,'','The agent always returns 1 for this item. It could be used in combination with nodata() for availability check.',0,'0',0,0,0,'',0,'',NULL),(22954,0,'','',10077,'Version of zabbix_agent(d) running','agent.version','1h','1w','0',0,1,'','','',0,'','','','',0,'',22231,NULL,'','',0,'','','','',0,0,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22961,0,'','',10077,'Processor load (15 min average per core)','system.cpu.load[percpu,avg15]','1m','1w','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The processor load is calculated as system CPU load divided by number of CPU cores.',0,'30d',0,0,0,'',0,'',NULL),(22962,0,'','',10077,'Processor load (1 min average per core)','system.cpu.load[percpu,avg1]','1m','1w','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The processor load is calculated as system CPU load divided by number of CPU cores.',0,'30d',0,0,0,'',0,'',NULL),(22963,0,'','',10077,'Processor load (5 min average per core)','system.cpu.load[percpu,avg5]','1m','1w','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The processor load is calculated as system CPU load divided by number of CPU cores.',0,'30d',0,0,0,'',0,'',NULL),(22965,0,'','',10077,'CPU $2 time','system.cpu.util[,idle]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The time the CPU has spent doing nothing.',0,'30d',0,0,0,'',0,'',NULL),(22968,0,'','',10077,'CPU $2 time','system.cpu.util[,nice]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The time the CPU has spent running users\' processes that have been niced.',0,'30d',0,0,0,'',0,'',NULL),(22971,0,'','',10077,'CPU $2 time','system.cpu.util[,system]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The time the CPU has spent running the kernel and its processes.',0,'30d',0,0,0,'',0,'',NULL),(22972,0,'','',10077,'CPU $2 time','system.cpu.util[,user]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The time the CPU has spent running users\' processes that are not niced.',0,'30d',0,0,0,'',0,'',NULL),(22973,0,'','',10077,'Host name','system.hostname','1h','1w','0',0,1,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','System host name.',3,'30d',0,0,0,'',0,'',NULL),(22974,0,'','',10077,'Host local time','system.localtime','1m','1w','365d',0,3,'','unixtime','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(22978,0,'','',10077,'System information','system.uname','1h','1w','0',0,1,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The information as normally returned by \'uname -a\'.',5,'30d',0,0,0,'',0,'',NULL),(22980,0,'','',10077,'Number of logged in users','system.users.num','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','Number of users who are currently logged in.',0,'30d',0,0,0,'',0,'',NULL),(22981,0,'','',10077,'Checksum of $1','vfs.file.cksum[/etc/passwd]','1h','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(22982,0,'','',10077,'Available memory','vm.memory.size[available]','1m','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','Available memory is defined as free+cached+buffers memory.',0,'30d',0,0,0,'',0,'',NULL),(22983,0,'','',10077,'Total memory','vm.memory.size[total]','1h','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(22984,0,'','',10077,'Network interface discovery','net.if.discovery','1h','90d','0',0,4,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,1,NULL,'','Discovery of network interfaces as defined in global regular expression \"Network interfaces for discovery\".',0,'30d',0,0,0,'',0,'',NULL),(22985,0,'','',10077,'Incoming network traffic on $1','net.if.in[{#IFNAME}]','1m','1w','365d',0,3,'','bps','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22986,0,'','',10077,'Outgoing network traffic on $1','net.if.out[{#IFNAME}]','1m','1w','365d',0,3,'','bps','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22987,0,'','',10077,'Mounted filesystem discovery','vfs.fs.discovery','1h','90d','0',0,4,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,1,NULL,'','Discovery of file systems of different types as defined in global regular expression \"File systems for discovery\".',0,'30d',0,0,0,'',0,'',NULL),(22988,0,'','',10077,'Free disk space on $1','vfs.fs.size[{#FSNAME},free]','1m','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22989,0,'','',10077,'Free inodes on $1 (percentage)','vfs.fs.inode[{#FSNAME},pfree]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22990,0,'','',10077,'Total disk space on $1','vfs.fs.size[{#FSNAME},total]','1h','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22991,0,'','',10077,'Used disk space on $1','vfs.fs.size[{#FSNAME},used]','1m','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22992,0,'','',10077,'Free disk space on $1 (percentage)','vfs.fs.size[{#FSNAME},pfree]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22993,0,'','',10078,'Agent ping','agent.ping','1m','1w','365d',0,3,'','','',0,'','','','',0,'',22232,10,'','',0,'','','','',0,0,NULL,'','The agent always returns 1 for this item. It could be used in combination with nodata() for availability check.',0,'0',0,0,0,'',0,'',NULL),(22994,0,'','',10078,'Version of zabbix_agent(d) running','agent.version','1h','1w','0',0,1,'','','',0,'','','','',0,'',22231,NULL,'','',0,'','','','',0,0,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(22996,0,'','',10078,'Maximum number of processes','kernel.maxproc','1h','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','It could be increased by using sysctrl utility or modifying file /etc/sysctl.conf.',0,'30d',0,0,0,'',0,'',NULL),(22997,0,'','',10078,'Number of running processes','proc.num[,,run]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','Number of processes in running state.',0,'30d',0,0,0,'',0,'',NULL),(22998,0,'','',10078,'Number of processes','proc.num[]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','Total number of processes in any state.',0,'30d',0,0,0,'',0,'',NULL),(22999,0,'','',10078,'Host boot time','system.boottime','10m','1w','365d',0,3,'','unixtime','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23000,0,'','',10078,'Interrupts per second','system.cpu.intr','1m','1w','365d',0,3,'','ips','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23001,0,'','',10078,'Processor load (15 min average per core)','system.cpu.load[percpu,avg15]','1m','1w','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The processor load is calculated as system CPU load divided by number of CPU cores.',0,'30d',0,0,0,'',0,'',NULL),(23002,0,'','',10078,'Processor load (1 min average per core)','system.cpu.load[percpu,avg1]','1m','1w','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The processor load is calculated as system CPU load divided by number of CPU cores.',0,'30d',0,0,0,'',0,'',NULL),(23003,0,'','',10078,'Processor load (5 min average per core)','system.cpu.load[percpu,avg5]','1m','1w','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The processor load is calculated as system CPU load divided by number of CPU cores.',0,'30d',0,0,0,'',0,'',NULL),(23004,0,'','',10078,'Context switches per second','system.cpu.switches','1m','1w','365d',0,3,'','sps','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23005,0,'','',10078,'CPU $2 time','system.cpu.util[,idle]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The time the CPU has spent doing nothing.',0,'30d',0,0,0,'',0,'',NULL),(23007,0,'','',10078,'CPU $2 time','system.cpu.util[,iowait]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','Amount of time the CPU has been waiting for I/O to complete.',0,'30d',0,0,0,'',0,'',NULL),(23011,0,'','',10078,'CPU $2 time','system.cpu.util[,system]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The time the CPU has spent running the kernel and its processes.',0,'30d',0,0,0,'',0,'',NULL),(23012,0,'','',10078,'CPU $2 time','system.cpu.util[,user]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The time the CPU has spent running users\' processes that are not niced.',0,'30d',0,0,0,'',0,'',NULL),(23013,0,'','',10078,'Host name','system.hostname','1h','1w','0',0,1,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','System host name.',3,'30d',0,0,0,'',0,'',NULL),(23014,0,'','',10078,'Host local time','system.localtime','1m','1w','365d',0,3,'','unixtime','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23015,0,'','',10078,'Free swap space','system.swap.size[,free]','1m','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23016,0,'','',10078,'Free swap space in %','system.swap.size[,pfree]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23017,0,'','',10078,'Total swap space','system.swap.size[,total]','1h','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23018,0,'','',10078,'System information','system.uname','1h','1w','0',0,1,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The information as normally returned by \'uname -a\'.',5,'30d',0,0,0,'',0,'',NULL),(23019,0,'','',10078,'System uptime','system.uptime','10m','1w','365d',0,3,'','uptime','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23020,0,'','',10078,'Number of logged in users','system.users.num','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','Number of users who are currently logged in.',0,'30d',0,0,0,'',0,'',NULL),(23021,0,'','',10078,'Checksum of $1','vfs.file.cksum[/etc/passwd]','1h','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23022,0,'','',10078,'Available memory','vm.memory.size[available]','1m','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','Available memory is defined as free+cached+buffers memory.',0,'30d',0,0,0,'',0,'',NULL),(23023,0,'','',10078,'Total memory','vm.memory.size[total]','1h','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23024,0,'','',10078,'Network interface discovery','net.if.discovery','1h','90d','0',0,4,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,1,NULL,'','Discovery of network interfaces as defined in global regular expression \"Network interfaces for discovery\".',0,'30d',0,0,0,'',0,'',NULL),(23025,0,'','',10078,'Incoming network traffic on $1','net.if.in[{#IFNAME}]','1m','1w','365d',0,3,'','bps','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(23026,0,'','',10078,'Outgoing network traffic on $1','net.if.out[{#IFNAME}]','1m','1w','365d',0,3,'','bps','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(23027,0,'','',10078,'Mounted filesystem discovery','vfs.fs.discovery','1h','90d','0',0,4,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,1,NULL,'','Discovery of file systems of different types as defined in global regular expression \"File systems for discovery\".',0,'30d',0,0,0,'',0,'',NULL),(23028,0,'','',10078,'Free disk space on $1','vfs.fs.size[{#FSNAME},free]','1m','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(23029,0,'','',10078,'Free inodes on $1 (percentage)','vfs.fs.inode[{#FSNAME},pfree]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(23030,0,'','',10078,'Total disk space on $1','vfs.fs.size[{#FSNAME},total]','1h','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(23031,0,'','',10078,'Used disk space on $1','vfs.fs.size[{#FSNAME},used]','1m','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(23032,0,'','',10078,'Free disk space on $1 (percentage)','vfs.fs.size[{#FSNAME},pfree]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(23033,0,'','',10079,'Agent ping','agent.ping','1m','1w','365d',0,3,'','','',0,'','','','',0,'',22232,10,'','',0,'','','','',0,0,NULL,'','The agent always returns 1 for this item. It could be used in combination with nodata() for availability check.',0,'0',0,0,0,'',0,'',NULL),(23034,0,'','',10079,'Version of zabbix_agent(d) running','agent.version','1h','1w','0',0,1,'','','',0,'','','','',0,'',22231,NULL,'','',0,'','','','',0,0,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(23035,0,'','',10079,'Maximum number of opened files','kernel.maxfiles','1h','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','It could be increased by using sysctrl utility or modifying file /etc/sysctl.conf.',0,'30d',0,0,0,'',0,'',NULL),(23036,0,'','',10079,'Maximum number of processes','kernel.maxproc','1h','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','It could be increased by using sysctrl utility or modifying file /etc/sysctl.conf.',0,'30d',0,0,0,'',0,'',NULL),(23039,0,'','',10079,'Host boot time','system.boottime','10m','1w','365d',0,3,'','unixtime','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23041,0,'','',10079,'Processor load (15 min average per core)','system.cpu.load[percpu,avg15]','1m','1w','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The processor load is calculated as system CPU load divided by number of CPU cores.',0,'30d',0,0,0,'',0,'',NULL),(23042,0,'','',10079,'Processor load (1 min average per core)','system.cpu.load[percpu,avg1]','1m','1w','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The processor load is calculated as system CPU load divided by number of CPU cores.',0,'30d',0,0,0,'',0,'',NULL),(23043,0,'','',10079,'Processor load (5 min average per core)','system.cpu.load[percpu,avg5]','1m','1w','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The processor load is calculated as system CPU load divided by number of CPU cores.',0,'30d',0,0,0,'',0,'',NULL),(23053,0,'','',10079,'Host name','system.hostname','1h','1w','0',0,1,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','System host name.',3,'30d',0,0,0,'',0,'',NULL),(23054,0,'','',10079,'Host local time','system.localtime','1m','1w','365d',0,3,'','unixtime','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23058,0,'','',10079,'System information','system.uname','1h','1w','0',0,1,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The information as normally returned by \'uname -a\'.',5,'30d',0,0,0,'',0,'',NULL),(23059,0,'','',10079,'System uptime','system.uptime','10m','1w','365d',0,3,'','uptime','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23060,0,'','',10079,'Number of logged in users','system.users.num','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','Number of users who are currently logged in.',0,'30d',0,0,0,'',0,'',NULL),(23061,0,'','',10079,'Checksum of $1','vfs.file.cksum[/etc/passwd]','1h','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23062,0,'','',10079,'Available memory','vm.memory.size[available]','1m','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','Available memory is defined as free+cached+buffers memory.',0,'30d',0,0,0,'',0,'',NULL),(23063,0,'','',10079,'Total memory','vm.memory.size[total]','1h','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23067,0,'','',10079,'Mounted filesystem discovery','vfs.fs.discovery','1h','90d','0',0,4,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,1,NULL,'','Discovery of file systems of different types as defined in global regular expression \"File systems for discovery\".',0,'30d',0,0,0,'',0,'',NULL),(23068,0,'','',10079,'Free disk space on $1','vfs.fs.size[{#FSNAME},free]','1m','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(23069,0,'','',10079,'Free inodes on $1 (percentage)','vfs.fs.inode[{#FSNAME},pfree]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(23070,0,'','',10079,'Total disk space on $1','vfs.fs.size[{#FSNAME},total]','1h','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(23071,0,'','',10079,'Used disk space on $1','vfs.fs.size[{#FSNAME},used]','1m','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(23072,0,'','',10079,'Free disk space on $1 (percentage)','vfs.fs.size[{#FSNAME},pfree]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(23073,0,'','',10075,'Incoming network traffic on $1','net.if.in[{#IFNAME}]','1m','1w','365d',0,3,'','bps','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(23074,0,'','',10075,'Outgoing network traffic on $1','net.if.out[{#IFNAME}]','1m','1w','365d',0,3,'','bps','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(23075,0,'','',10074,'Incoming network traffic on $1','net.if.in[{#IFNAME}]','1m','1w','365d',0,3,'','bps','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(23076,0,'','',10074,'Outgoing network traffic on $1','net.if.out[{#IFNAME}]','1m','1w','365d',0,3,'','bps','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(23077,0,'','',10079,'Incoming network traffic on $1','net.if.in[en0]','1m','1w','365d',0,3,'','bps','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23078,0,'','',10079,'Outgoing network traffic on $1','net.if.out[en0]','1m','1w','365d',0,3,'','bps','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23108,0,'','',10076,'CPU available physical processors in the shared pool','system.stat[cpu,app]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23109,0,'','',10076,'CPU entitled capacity consumed','system.stat[cpu,ec]','1m','1w','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23110,0,'','',10076,'CPU idle time','system.stat[cpu,id]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23111,0,'','',10076,'CPU logical processor utilization','system.stat[cpu,lbusy]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23112,0,'','',10076,'CPU number of physical processors consumed','system.stat[cpu,pc]','1m','1w','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23113,0,'','',10076,'CPU system time','system.stat[cpu,sy]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23114,0,'','',10076,'CPU user time','system.stat[cpu,us]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23115,0,'','',10076,'CPU iowait time','system.stat[cpu,wa]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23116,0,'','',10076,'Amount of data transferred','system.stat[disk,bps]','1m','1w','365d',0,0,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23117,0,'','',10076,'Number of transfers','system.stat[disk,tps]','1m','1w','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23118,0,'','',10076,'Processor units is entitled to receive','system.stat[ent]','1h','1w','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23119,0,'','',10076,'Kernel thread context switches','system.stat[faults,cs]','1m','1w','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23120,0,'','',10076,'Device interrupts','system.stat[faults,in]','1m','1w','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23121,0,'','',10076,'System calls','system.stat[faults,sy]','1m','1w','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23122,0,'','',10076,'Length of the swap queue','system.stat[kthr,b]','1m','1w','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23123,0,'','',10076,'Length of the run queue','system.stat[kthr,r]','1m','1w','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23124,0,'','',10076,'Active virtual pages','system.stat[memory,avm]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23125,0,'','',10076,'Free real memory','system.stat[memory,fre]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23126,0,'','',10076,'File page-ins per second','system.stat[page,fi]','1m','1w','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23127,0,'','',10076,'File page-outs per second','system.stat[page,fo]','1m','1w','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23128,0,'','',10076,'Pages freed (page replacement)','system.stat[page,fr]','1m','1w','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23129,0,'','',10076,'Pages paged in from paging space','system.stat[page,pi]','1m','1w','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23130,0,'','',10076,'Pages paged out to paging space','system.stat[page,po]','1m','1w','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23131,0,'','',10076,'Pages scanned by page-replacement algorithm','system.stat[page,sr]','1m','1w','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23134,0,'','',10081,'Average disk read queue length','perf_counter[\\234(_Total)\\1402]','1m','1w','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','Full counter name: \\PhysicalDisk(_Total)\\Avg. Disk Read Queue Length',0,'30d',0,0,0,'',0,'',NULL),(23135,0,'','',10081,'Average disk write queue length','perf_counter[\\234(_Total)\\1404]','1m','1w','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','Full counter name: \\PhysicalDisk(_Total)\\Avg. Disk Write Queue Length',0,'30d',0,0,0,'',0,'',NULL),(23136,0,'','',10081,'File read bytes per second','perf_counter[\\2\\16]','1m','1w','365d',0,0,'','Bps','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','Full counter name: \\System\\File Read Bytes/sec',0,'30d',0,0,0,'',0,'',NULL),(23137,0,'','',10081,'File write bytes per second','perf_counter[\\2\\18]','1m','1w','365d',0,0,'','Bps','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','Full counter name: \\System\\File Write Bytes/sec',0,'30d',0,0,0,'',0,'',NULL),(23138,0,'','',10081,'Number of threads','perf_counter[\\2\\250]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','Full counter name: \\System\\Threads',0,'30d',0,0,0,'',0,'',NULL),(23140,0,'','',10081,'Number of processes','proc.num[]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23143,0,'','',10081,'Processor load (1 min average)','system.cpu.load[percpu,avg1]','1m','1w','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23144,0,'','',10081,'Processor load (15 min average)','system.cpu.load[percpu,avg15]','1m','1w','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23145,0,'','',10081,'Processor load (5 min average)','system.cpu.load[percpu,avg5]','1m','1w','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23147,0,'','',10081,'Free swap space','system.swap.size[,free]','1m','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23148,0,'','',10081,'Total swap space','system.swap.size[,total]','1h','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23149,0,'','',10081,'System information','system.uname','1h','1w','0',0,1,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',5,'30d',0,0,0,'',0,'',NULL),(23150,0,'','',10081,'System uptime','system.uptime','1m','1w','365d',0,3,'','uptime','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23158,0,'','',10081,'Free memory','vm.memory.size[free]','1m','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23159,0,'','',10081,'Total memory','vm.memory.size[total]','1h','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23160,0,'','',10081,'Agent ping','agent.ping','1m','1w','365d',0,3,'','','',0,'','','','',0,'',22232,10,'','',0,'','','','',0,0,NULL,'','The agent always returns 1 for this item. It could be used in combination with nodata() for availability check.',0,'0',0,0,0,'',0,'',NULL),(23161,0,'','',10081,'Version of zabbix_agent(d) running','agent.version','1h','1w','0',0,1,'','','',0,'','','','',0,'',22231,NULL,'','',0,'','','','',0,0,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(23162,0,'','',10081,'Mounted filesystem discovery','vfs.fs.discovery','1h','90d','0',0,4,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,1,NULL,'','Discovery of file systems of different types as defined in global regular expression \"File systems for discovery\".',0,'30d',0,0,0,'',0,'',NULL),(23163,0,'','',10081,'Network interface discovery','net.if.discovery','1h','90d','0',0,4,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,1,NULL,'','Discovery of network interfaces as defined in global regular expression \"Network interfaces for discovery\".',0,'30d',0,0,0,'',0,'',NULL),(23164,0,'','',10081,'Free disk space on $1','vfs.fs.size[{#FSNAME},free]','1m','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23165,0,'','',10081,'Free disk space on $1 (percentage)','vfs.fs.size[{#FSNAME},pfree]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23167,0,'','',10081,'Total disk space on $1','vfs.fs.size[{#FSNAME},total]','1h','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23168,0,'','',10081,'Used disk space on $1','vfs.fs.size[{#FSNAME},used]','1m','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23169,0,'','',10081,'Incoming network traffic on $1','net.if.in[{#IFNAME}]','1m','1w','365d',0,3,'','bps','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23170,0,'','',10081,'Outgoing network traffic on $1','net.if.out[{#IFNAME}]','1m','1w','365d',0,3,'','bps','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23171,5,'','',10047,'Zabbix $4 $2 processes, in %','zabbix[process,snmp trapper,avg,busy]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23172,16,'','',10082,'comp Accumulated time spent in compilation','jmx[\"java.lang:type=Compilation\",TotalCompilationTime]','1m','1w','365d',0,0,'','s','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23173,16,'','',10082,'cl Loaded Class Count','jmx[\"java.lang:type=ClassLoading\",LoadedClassCount]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23174,16,'','',10082,'cl Total Loaded Class Count','jmx[\"java.lang:type=ClassLoading\",TotalLoadedClassCount]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23175,16,'','',10082,'cl Unloaded Class Count','jmx[\"java.lang:type=ClassLoading\",UnloadedClassCount]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23176,16,'','',10082,'gc ConcurrentMarkSweep accumulated time spent in collection','jmx[\"java.lang:type=GarbageCollector,name=ConcurrentMarkSweep\",CollectionTime]','1m','1w','365d',0,0,'','s','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23177,16,'','',10082,'gc ConcurrentMarkSweep number of collections per second','jmx[\"java.lang:type=GarbageCollector,name=ConcurrentMarkSweep\",CollectionCount]','1m','1w','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23178,16,'','',10082,'gc Copy accumulated time spent in collection','jmx[\"java.lang:type=GarbageCollector,name=Copy\",CollectionTime]','1m','1w','365d',0,0,'','s','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23179,16,'','',10082,'gc Copy number of collections per second','jmx[\"java.lang:type=GarbageCollector,name=Copy\",CollectionCount]','1m','1w','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23180,16,'','',10082,'gc MarkSweepCompact accumulated time spent in collection','jmx[\"java.lang:type=GarbageCollector,name=MarkSweepCompact\",CollectionTime]','1m','1w','365d',0,0,'','s','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23181,16,'','',10082,'gc MarkSweepCompact number of collections per second','jmx[\"java.lang:type=GarbageCollector,name=MarkSweepCompact\",CollectionCount]','1m','1w','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23182,16,'','',10082,'gc ParNew accumulated time spent in collection','jmx[\"java.lang:type=GarbageCollector,name=ParNew\",CollectionTime]','1m','1w','365d',0,0,'','s','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23183,16,'','',10082,'gc ParNew number of collections per second','jmx[\"java.lang:type=GarbageCollector,name=ParNew\",CollectionCount]','1m','1w','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23184,16,'','',10082,'gc PS MarkSweep accumulated time spent in collection','jmx[\"java.lang:type=GarbageCollector,name=PS MarkSweep\",CollectionTime]','1m','1w','365d',0,0,'','s','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23185,16,'','',10082,'gc PS Scavenge accumulated time spent in collection','jmx[\"java.lang:type=GarbageCollector,name=PS Scavenge\",CollectionTime]','1m','1w','365d',0,0,'','s','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23186,16,'','',10082,'gc PS Scavenge number of collections per second','jmx[\"java.lang:type=GarbageCollector,name=PS Scavenge\",CollectionCount]','1m','1w','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23187,16,'','',10082,'gc PS MarkSweep number of collections per second','jmx[\"java.lang:type=GarbageCollector,name=PS MarkSweep\",CollectionCount]','1m','1w','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23188,16,'','',10082,'jvm Uptime','jmx[\"java.lang:type=Runtime\",Uptime]','1m','1w','365d',0,3,'','uptime','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23189,16,'','',10082,'jvm Version','jmx[\"java.lang:type=Runtime\",VmVersion]','1h','1w','0',0,1,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23190,16,'','',10082,'mem Object Pending Finalization Count','jmx[\"java.lang:type=Memory\",ObjectPendingFinalizationCount]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23191,16,'','',10082,'mp CMS Old Gen committed','jmx[\"java.lang:type=MemoryPool,name=CMS Old Gen\",Usage.committed]','1m','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23192,16,'','',10082,'mp CMS Old Gen max','jmx[\"java.lang:type=MemoryPool,name=CMS Old Gen\",Usage.max]','1h','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23193,16,'','',10082,'mp CMS Old Gen used','jmx[\"java.lang:type=MemoryPool,name=CMS Old Gen\",Usage.used]','1m','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23194,16,'','',10082,'mp CMS Perm Gen committed','jmx[\"java.lang:type=MemoryPool,name=CMS Perm Gen\",Usage.committed]','1m','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23195,16,'','',10082,'mp CMS Perm Gen max','jmx[\"java.lang:type=MemoryPool,name=CMS Perm Gen\",Usage.max]','1h','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23196,16,'','',10082,'mp CMS Perm Gen used','jmx[\"java.lang:type=MemoryPool,name=CMS Perm Gen\",Usage.used]','1m','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23197,16,'','',10082,'mp Code Cache committed','jmx[\"java.lang:type=MemoryPool,name=Code Cache\",Usage.committed]','1m','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23198,16,'','',10082,'mp Code Cache max','jmx[\"java.lang:type=MemoryPool,name=Code Cache\",Usage.max]','1h','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23199,16,'','',10082,'mp Code Cache used','jmx[\"java.lang:type=MemoryPool,name=Code Cache\",Usage.used]','1m','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23200,16,'','',10082,'mp Perm Gen committed','jmx[\"java.lang:type=MemoryPool,name=Perm Gen\",Usage.committed]','1m','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23201,16,'','',10082,'mp Perm Gen max','jmx[\"java.lang:type=MemoryPool,name=Perm Gen\",Usage.max]','1h','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23202,16,'','',10082,'mp Perm Gen used','jmx[\"java.lang:type=MemoryPool,name=Perm Gen\",Usage.used]','1m','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23203,16,'','',10082,'mp PS Old Gen committed','jmx[\"java.lang:type=MemoryPool,name=PS Old Gen\",Usage.committed]','1m','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23204,16,'','',10082,'mp PS Old Gen max','jmx[\"java.lang:type=MemoryPool,name=PS Old Gen\",Usage.max]','1h','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23205,16,'','',10082,'mp PS Old Gen used','jmx[\"java.lang:type=MemoryPool,name=PS Old Gen\",Usage.used]','1m','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23206,16,'','',10082,'mp PS Perm Gen committed','jmx[\"java.lang:type=MemoryPool,name=PS Perm Gen\",Usage.committed]','1m','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23207,16,'','',10082,'mp PS Perm Gen max','jmx[\"java.lang:type=MemoryPool,name=PS Perm Gen\",Usage.max]','1h','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23208,16,'','',10082,'mp PS Perm Gen used','jmx[\"java.lang:type=MemoryPool,name=PS Perm Gen\",Usage.used]','1m','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23209,16,'','',10082,'mp Tenured Gen committed','jmx[\"java.lang:type=MemoryPool,name=Tenured Gen\",Usage.committed]','1m','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23210,16,'','',10082,'mp Tenured Gen max','jmx[\"java.lang:type=MemoryPool,name=Tenured Gen\",Usage.max]','1h','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23211,16,'','',10082,'mp Tenured Gen used','jmx[\"java.lang:type=MemoryPool,name=Tenured Gen\",Usage.used]','1m','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23212,16,'','',10082,'comp Name of the current JIT compiler','jmx[\"java.lang:type=Compilation\",Name]','1h','1w','0',0,1,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23213,16,'','',10082,'os Max File Descriptor Count','jmx[\"java.lang:type=OperatingSystem\",MaxFileDescriptorCount]','1h','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23214,16,'','',10082,'os Open File Descriptor Count','jmx[\"java.lang:type=OperatingSystem\",OpenFileDescriptorCount]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23215,16,'','',10082,'th Daemon Thread Count','jmx[\"java.lang:type=Threading\",DaemonThreadCount]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23216,16,'','',10082,'th Peak Thread Count','jmx[\"java.lang:type=Threading\",PeakThreadCount]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23217,16,'','',10082,'th Thread Count','jmx[\"java.lang:type=Threading\",ThreadCount]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23218,16,'','',10082,'th Total Started Thread Count','jmx[\"java.lang:type=Threading\",TotalStartedThreadCount]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23219,16,'','',10083,'http-8080 bytes received per second','jmx[\"Catalina:type=GlobalRequestProcessor,name=http-8080\",bytesReceived]','1m','1w','365d',0,0,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23220,16,'','',10083,'http-8080 bytes sent per second','jmx[\"Catalina:type=GlobalRequestProcessor,name=http-8080\",bytesSent]','1m','1w','365d',0,0,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23221,16,'','',10083,'http-8080 errors per second','jmx[\"Catalina:type=GlobalRequestProcessor,name=http-8080\",errorCount]','1m','1w','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23222,16,'','',10083,'http-8080 gzip compression','jmx[\"Catalina:type=ProtocolHandler,port=8080\",compression]','1h','1w','0',0,1,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23223,16,'','',10083,'http-8080 request processing time','jmx[\"Catalina:type=GlobalRequestProcessor,name=http-8080\",processingTime]','1m','1w','365d',0,0,'','s','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23224,16,'','',10083,'http-8080 requests per second','jmx[\"Catalina:type=GlobalRequestProcessor,name=http-8080\",requestCount]','1m','1w','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23225,16,'','',10083,'http-8080 threads allocated','jmx[\"Catalina:type=ThreadPool,name=http-8080\",currentThreadCount]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23226,16,'','',10083,'http-8080 threads busy','jmx[\"Catalina:type=ThreadPool,name=http-8080\",currentThreadsBusy]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23227,16,'','',10083,'http-8080 threads max','jmx[\"Catalina:type=ThreadPool,name=http-8080\",maxThreads]','1h','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23228,16,'','',10083,'http-8443 bytes received per second','jmx[\"Catalina:type=GlobalRequestProcessor,name=http-8443\",bytesReceived]','1m','1w','365d',0,0,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23229,16,'','',10083,'http-8443 bytes sent per second','jmx[\"Catalina:type=GlobalRequestProcessor,name=http-8443\", bytesSent]','1m','1w','365d',0,0,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23230,16,'','',10083,'http-8443 errors per second','jmx[\"Catalina:type=GlobalRequestProcessor,name=http-8443\",errorCount]','1m','1w','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23231,16,'','',10083,'http-8443 gzip compression','jmx[\"Catalina:type=ProtocolHandler,port=8443\",compression]','1h','1w','0',0,1,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23232,16,'','',10083,'http-8443 request processing time','jmx[\"Catalina:type=GlobalRequestProcessor,name=http-8443\",processingTime]','1m','1w','365d',0,0,'','s','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23233,16,'','',10083,'http-8443 requests per second','jmx[\"Catalina:type=GlobalRequestProcessor,name=http-8443\",requestCount]','1m','1w','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23234,16,'','',10083,'http-8443 threads allocated','jmx[\"Catalina:type=ThreadPool,name=http-8443\",currentThreadCount]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23235,16,'','',10083,'http-8443 threads busy','jmx[\"Catalina:type=ThreadPool,name=http-8443\",currentThreadsBusy]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23236,16,'','',10083,'http-8443 threads max','jmx[\"Catalina:type=ThreadPool,name=http-8443\",maxThreads]','1h','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23237,16,'','',10083,'jk-8009 bytes received per second','jmx[\"Catalina:type=GlobalRequestProcessor,name=jk-8009\", bytesReceived]','1m','1w','365d',0,0,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23238,16,'','',10083,'jk-8009 bytes sent per second','jmx[\"Catalina:type=GlobalRequestProcessor,name=jk-8009\",bytesSent]','1m','1w','365d',0,0,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23239,16,'','',10083,'jk-8009 errors per second','jmx[\"Catalina:type=GlobalRequestProcessor,name=jk-8009\",errorCount]','1m','1w','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23240,16,'','',10083,'jk-8009 request processing time','jmx[\"Catalina:type=GlobalRequestProcessor,name=jk-8009\",processingTime]','1m','1w','365d',0,0,'','s','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23241,16,'','',10083,'jk-8009 requests per second','jmx[\"Catalina:type=GlobalRequestProcessor,name=jk-8009\",requestCount]','1m','1w','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23242,16,'','',10083,'jk-8009 threads allocated','jmx[\"Catalina:type=ThreadPool,name=jk-8009\",currentThreadCount]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23243,16,'','',10083,'jk-8009 threads busy','jmx[\"Catalina:type=ThreadPool,name=jk-8009\",currentThreadsBusy]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23244,16,'','',10083,'jk-8009 threads max','jmx[\"Catalina:type=ThreadPool,name=jk-8009\",maxThreads]','1h','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23245,16,'','',10083,'Maximum number of active sessions so far','jmx[\"Catalina:type=Manager,path=/,host=localhost\",maxActive]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23246,16,'','',10083,'Number of active sessions at this moment','jmx[\"Catalina:type=Manager,path=/,host=localhost\",activeSessions]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23247,16,'','',10083,'Number of sessions created by this manager per second','jmx[\"Catalina:type=Manager,path=/,host=localhost\",sessionCounter]','1m','1w','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23248,16,'','',10083,'Number of sessions we rejected due to maxActive being reached','jmx[\"Catalina:type=Manager,path=/,host=localhost\",rejectedSessions]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23249,16,'','',10083,'The maximum number of active Sessions allowed, or -1 for no limit','jmx[\"Catalina:type=Manager,path=/,host=localhost\",maxActiveSessions]','1h','1w','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23250,16,'','',10083,'Tomcat version','jmx[\"Catalina:type=Server\",serverInfo]','1h','1w','0',0,1,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23251,5,'','',10047,'Zabbix queue','zabbix[queue]','10m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23318,0,'','',10050,'Host name of zabbix_agentd running','agent.hostname','1h','1w','0',0,1,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23319,0,'','',10001,'Host name of zabbix_agentd running','agent.hostname','1h','1w','0',0,1,'','','',0,'','','','',0,'',23318,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23320,0,'','',10074,'Host name of zabbix_agentd running','agent.hostname','1h','1w','0',0,1,'','','',0,'','','','',0,'',23318,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23321,0,'','',10075,'Host name of zabbix_agentd running','agent.hostname','1h','1w','0',0,1,'','','',0,'','','','',0,'',23318,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23322,0,'','',10076,'Host name of zabbix_agentd running','agent.hostname','1h','1w','0',0,1,'','','',0,'','','','',0,'',23318,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23323,0,'','',10077,'Host name of zabbix_agentd running','agent.hostname','1h','1w','0',0,1,'','','',0,'','','','',0,'',23318,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23324,0,'','',10078,'Host name of zabbix_agentd running','agent.hostname','1h','1w','0',0,1,'','','',0,'','','','',0,'',23318,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23325,0,'','',10079,'Host name of zabbix_agentd running','agent.hostname','1h','1w','0',0,1,'','','',0,'','','','',0,'',23318,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23326,0,'','',10081,'Host name of zabbix_agentd running','agent.hostname','1h','1w','0',0,1,'','','',0,'','','','',0,'',23318,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23329,0,'','',10074,'Network interface discovery','net.if.discovery','1h','90d','0',0,4,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,1,NULL,'','Discovery of network interfaces as defined in global regular expression \"Network interfaces for discovery\".',0,'30d',0,0,0,'',0,'',NULL),(23340,5,'','',10048,'Values processed by Zabbix proxy per second','zabbix[wcache,values]','1m','1w','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23341,5,'','',10048,'Zabbix history index cache, % free','zabbix[wcache,index,pfree]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23342,5,'','',10048,'Zabbix $2 write cache, % free','zabbix[wcache,history,pfree]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23343,5,'','',10048,'Zabbix $4 $2 processes, in %','zabbix[process,self-monitoring,avg,busy]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23344,5,'','',10048,'Zabbix $4 $2 processes, in %','zabbix[process,snmp trapper,avg,busy]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23345,5,'','',10048,'Zabbix $4 $2 processes, in %','zabbix[process,trapper,avg,busy]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23346,5,'','',10048,'Zabbix $4 $2 processes, in %','zabbix[process,unreachable poller,avg,busy]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23347,5,'','',10048,'Zabbix $4 $2 processes, in %','zabbix[process,configuration syncer,avg,busy]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23348,5,'','',10048,'Zabbix $4 $2 processes, in %','zabbix[process,poller,avg,busy]','1m','1w','365d',0,0,'localhost','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23349,5,'','',10048,'Zabbix $4 $2 processes, in %','zabbix[process,java poller,avg,busy]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23350,5,'','',10048,'Zabbix $4 $2 processes, in %','zabbix[process,history syncer,avg,busy]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23351,5,'','',10048,'Zabbix $4 $2 processes, in %','zabbix[process,heartbeat sender,avg,busy]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23352,5,'','',10048,'Zabbix $4 $2 processes, in %','zabbix[process,discoverer,avg,busy]','1m','1w','365d',0,0,'localhost','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23353,5,'','',10048,'Zabbix $4 $2 processes, in %','zabbix[process,housekeeper,avg,busy]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23354,5,'','',10048,'Zabbix $4 $2 processes, in %','zabbix[process,http poller,avg,busy]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23355,5,'','',10048,'Zabbix $4 $2 processes, in %','zabbix[process,ipmi poller,avg,busy]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23356,5,'','',10048,'Zabbix $4 $2 processes, in %','zabbix[process,icmp pinger,avg,busy]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23357,5,'','',10048,'Zabbix configuration cache, % free','zabbix[rcache,buffer,pfree]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23358,5,'','',10048,'Zabbix queue','zabbix[queue]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23359,5,'','',10048,'Zabbix queue over $2','zabbix[queue,10m]','10m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23360,5,'','',10048,'Zabbix $4 $2 processes, in %','zabbix[process,data sender,avg,busy]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23540,0,'','',10075,'Network interface discovery','net.if.discovery','1h','90d','0',0,4,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,1,NULL,'','Discovery of network interfaces as defined in global regular expression \"Network interfaces for discovery\".',0,'30d',0,0,0,'',0,'',NULL),(23542,3,'','',10088,'Discover VMware VMs','vmware.vm.discovery[{$URL}]','1h','90d','0',0,4,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,1,NULL,'','Discovery of guest virtual machines.',0,'30d',0,0,0,'',0,'',NULL),(23543,3,'','',10089,'Ballooned memory','vmware.vm.memory.size.ballooned[{$URL},{HOST.HOST}]','1m','90d','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,0,NULL,'','The amount of guest physical memory that is currently reclaimed through the balloon driver.',0,'30d',0,0,0,'',0,'',NULL),(23544,3,'','',10089,'Compressed memory','vmware.vm.memory.size.compressed[{$URL},{HOST.HOST}]','1m','90d','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,0,NULL,'','The amount of memory currently in the compression cache for this VM.',0,'30d',0,0,0,'',0,'',NULL),(23545,3,'','',10089,'Memory size','vmware.vm.memory.size[{$URL},{HOST.HOST}]','1m','90d','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,0,NULL,'','Total size of configured memory.',0,'30d',0,0,0,'',0,'',NULL),(23546,3,'','',10089,'Swapped memory','vmware.vm.memory.size.swapped[{$URL},{HOST.HOST}]','1m','90d','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,0,NULL,'','The amount of guest physical memory swapped out to the VM\'s swap device by ESX.',0,'30d',0,0,0,'',0,'',NULL),(23547,3,'','',10089,'Committed storage space','vmware.vm.storage.committed[{$URL},{HOST.HOST}]','1m','90d','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,0,NULL,'','Total storage space, in bytes, committed to this virtual machine across all datastores.',0,'30d',0,0,0,'',0,'',NULL),(23548,3,'','',10089,'Uncommitted storage space','vmware.vm.storage.uncommitted[{$URL},{HOST.HOST}]','1m','90d','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,0,NULL,'','Additional storage space, in bytes, potentially used by this virtual machine on all datastores.',0,'30d',0,0,0,'',0,'',NULL),(23549,3,'','',10089,'Unshared storage space','vmware.vm.storage.unshared[{$URL},{HOST.HOST}]','1m','90d','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,0,NULL,'','Total storage space, in bytes, occupied by the virtual machine across all datastores, that is not shared with any other virtual machine.',0,'30d',0,0,0,'',0,'',NULL),(23550,3,'','',10089,'CPU usage','vmware.vm.cpu.usage[{$URL},{HOST.HOST}]','1m','90d','365d',0,3,'','Hz','',0,'','','','',0,'',NULL,NULL,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,0,NULL,'','Current upper-bound on CPU usage. The upper-bound is based on the host the virtual machine is current running on, as well as limits configured on the virtual machine itself or any parent resource pool. Valid while the virtual machine is running.',0,'30d',0,0,0,'',0,'',NULL),(23551,3,'','',10089,'Number of virtual CPUs','vmware.vm.cpu.num[{$URL},{HOST.HOST}]','1m','90d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,0,NULL,'','Number of virtual CPUs assigned to the guest.',0,'30d',0,0,0,'',0,'',NULL),(23552,3,'','',10089,'Power state','vmware.vm.powerstate[{$URL},{HOST.HOST}]','1m','90d','365d',0,3,'','','',0,'','','','',0,'',NULL,12,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,0,NULL,'','The current power state of the virtual machine.',0,'30d',0,0,0,'',0,'',NULL),(23553,3,'','',10089,'Uptime','vmware.vm.uptime[{$URL},{HOST.HOST}]','1m','90d','365d',0,3,'','uptime','',0,'','','','',0,'',NULL,NULL,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,0,NULL,'','System uptime.',0,'30d',0,0,0,'',0,'',NULL),(23554,3,'','',10088,'Discover VMware hypervisors','vmware.hv.discovery[{$URL}]','1h','90d','0',0,4,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,1,NULL,'','Discovery of hypervisors.',0,'30d',0,0,0,'',0,'',NULL),(23555,3,'','',10091,'Bios UUID','vmware.hv.hw.uuid[{$URL},{HOST.HOST}]','1h','90d','0',0,1,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,0,NULL,'','The hardware BIOS identification.',0,'30d',0,0,0,'',0,'',NULL),(23556,3,'','',10091,'CPU cores','vmware.hv.hw.cpu.num[{$URL},{HOST.HOST}]','1h','90d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,0,NULL,'','Number of physical CPU cores on the host. Physical CPU cores are the processors contained by a CPU package.',0,'30d',0,0,0,'',0,'',NULL),(23557,3,'','',10091,'CPU frequency','vmware.hv.hw.cpu.freq[{$URL},{HOST.HOST}]','1h','90d','365d',0,3,'','Hz','',0,'','','','',0,'',NULL,NULL,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,0,NULL,'','The speed of the CPU cores. This is an average value if there are multiple speeds. The product of CPU frequency and number of cores is approximately equal to the sum of the MHz for all the individual cores on the host.',0,'30d',0,0,0,'',0,'',NULL),(23558,3,'','',10091,'CPU model','vmware.hv.hw.cpu.model[{$URL},{HOST.HOST}]','1h','90d','0',0,1,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,0,NULL,'','The CPU model.',0,'30d',0,0,0,'',0,'',NULL),(23559,3,'','',10091,'CPU threads','vmware.hv.hw.cpu.threads[{$URL},{HOST.HOST}]','1h','90d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,0,NULL,'','Number of physical CPU threads on the host.',0,'30d',0,0,0,'',0,'',NULL),(23560,3,'','',10091,'CPU usage','vmware.hv.cpu.usage[{$URL},{HOST.HOST}]','1m','90d','365d',0,3,'','Hz','',0,'','','','',0,'',NULL,NULL,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,0,NULL,'','Aggregated CPU usage across all cores on the host in Hz. This is only available if the host is connected.',0,'30d',0,0,0,'',0,'',NULL),(23561,3,'','',10091,'Full name','vmware.hv.fullname[{$URL},{HOST.HOST}]','1h','90d','0',0,1,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,0,NULL,'','The complete product name, including the version information.',0,'30d',0,0,0,'',0,'',NULL),(23562,3,'','',10091,'Model','vmware.hv.hw.model[{$URL},{HOST.HOST}]','1h','90d','0',0,1,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,0,NULL,'','The system model identification.',0,'30d',0,0,0,'',0,'',NULL),(23563,3,'','',10091,'Overall status','vmware.hv.status[{$URL},{HOST.HOST}]','1m','90d','365d',0,3,'','','',0,'','','','',0,'',NULL,13,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,0,NULL,'','The overall alarm status of the host: gray - unknown, ok, red - it has a problem, yellow - it might have a problem.',0,'30d',0,0,0,'',0,'',NULL),(23564,3,'','',10091,'Total memory','vmware.hv.hw.memory[{$URL},{HOST.HOST}]','1h','90d','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,0,NULL,'','The physical memory size.',0,'30d',0,0,0,'',0,'',NULL),(23565,3,'','',10091,'Uptime','vmware.hv.uptime[{$URL},{HOST.HOST}]','1h','90d','365d',0,3,'','uptime','',0,'','','','',0,'',NULL,NULL,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,0,NULL,'','System uptime.',0,'30d',0,0,0,'',0,'',NULL),(23566,3,'','',10091,'Used memory','vmware.hv.memory.used[{$URL},{HOST.HOST}]','1m','90d','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,0,NULL,'','Physical memory usage on the host.',0,'30d',0,0,0,'',0,'',NULL),(23567,3,'','',10091,'Vendor','vmware.hv.hw.vendor[{$URL},{HOST.HOST}]','1h','90d','0',0,1,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,0,NULL,'','The hardware vendor identification.',0,'30d',0,0,0,'',0,'',NULL),(23568,3,'','',10091,'Version','vmware.hv.version[{$URL},{HOST.HOST}]','1h','90d','0',0,1,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,0,NULL,'','Dot-separated version string.',0,'30d',0,0,0,'',0,'',NULL),(23569,3,'','',10091,'Number of guest VMs','vmware.hv.vm.num[{$URL},{HOST.HOST}]','1h','90d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,0,NULL,'','Number of guest virtual machines.',0,'30d',0,0,0,'',0,'',NULL),(23572,3,'','',10091,'Ballooned memory','vmware.hv.memory.size.ballooned[{$URL},{HOST.HOST}]','1m','90d','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,0,NULL,'','The amount of guest physical memory that is currently reclaimed through the balloon driver. Sum of all guest VMs.',0,'30d',0,0,0,'',0,'',NULL),(23573,3,'','',10089,'Hypervisor name','vmware.vm.hv.name[{$URL},{HOST.HOST}]','1h','90d','0',0,1,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,0,NULL,'','Hypervisor name of the guest VM.',0,'30d',0,0,0,'',0,'',NULL),(23575,3,'','',10089,'Mounted filesystem discovery','vmware.vm.vfs.fs.discovery[{$URL},{HOST.HOST}]','1h','90d','0',0,4,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,1,NULL,'','Discovery of all guest file systems.',0,'30d',0,0,0,'',0,'',NULL),(23576,3,'','',10089,'Free disk space on {#FSNAME}','vmware.vm.vfs.fs.size[{$URL},{HOST.HOST},{#FSNAME},free]','1m','90d','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23577,3,'','',10089,'Free disk space on {#FSNAME} (percentage)','vmware.vm.vfs.fs.size[{$URL},{HOST.HOST},{#FSNAME},pfree]','1m','90d','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23578,3,'','',10089,'Total disk space on {#FSNAME}','vmware.vm.vfs.fs.size[{$URL},{HOST.HOST},{#FSNAME},total]','1h','90d','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23579,3,'','',10089,'Used disk space on {#FSNAME}','vmware.vm.vfs.fs.size[{$URL},{HOST.HOST},{#FSNAME},used]','1m','90d','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23585,3,'','',10089,'Guest memory usage','vmware.vm.memory.size.usage.guest[{$URL},{HOST.HOST}]','1m','90d','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,0,NULL,'','The amount of guest physical memory that is being used by the VM.',0,'30d',0,0,0,'',0,'',NULL),(23586,3,'','',10089,'Host memory usage','vmware.vm.memory.size.usage.host[{$URL},{HOST.HOST}]','1m','90d','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,0,NULL,'','The amount of host physical memory allocated to the VM, accounting for saving from memory sharing with other VMs.',0,'30d',0,0,0,'',0,'',NULL),(23587,3,'','',10089,'Private memory','vmware.vm.memory.size.private[{$URL},{HOST.HOST}]','1m','90d','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,0,NULL,'','Amount of memory backed by host memory and not being shared.',0,'30d',0,0,0,'',0,'',NULL),(23588,3,'','',10089,'Shared memory','vmware.vm.memory.size.shared[{$URL},{HOST.HOST}]','1m','90d','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,0,NULL,'','The amount of guest physical memory shared through transparent page sharing.',0,'30d',0,0,0,'',0,'',NULL),(23593,3,'','',10088,'Event log','vmware.eventlog[{$URL}]','1m','90d','0',0,2,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23595,3,'','',10088,'Discover VMware clusters','vmware.cluster.discovery[{$URL}]','1h','90d','0',0,4,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,1,NULL,'','Discovery of clusters',0,'30d',0,0,0,'',0,'',NULL),(23596,3,'','',10088,'Status of \"$2\" cluster','vmware.cluster.status[{$URL},{#CLUSTER.NAME}]','1m','90d','365d',0,3,'','','',0,'','','','',0,'',NULL,13,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23597,3,'','',10089,'Cluster name','vmware.vm.cluster.name[{$URL},{HOST.HOST}]','1h','90d','0',0,1,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,0,NULL,'','Cluster name of the guest VM.',0,'30d',0,0,0,'',0,'',NULL),(23598,3,'','',10091,'Cluster name','vmware.hv.cluster.name[{$URL},{HOST.HOST}]','1h','90d','0',0,1,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,0,NULL,'','Cluster name of the guest VM.',0,'30d',0,0,0,'',0,'',NULL),(23599,3,'','',10089,'Disk device discovery','vmware.vm.vfs.dev.discovery[{$URL},{HOST.HOST}]','1h','90d','0',0,4,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,1,NULL,'','Discovery of all disk devices.',0,'30d',0,0,0,'',0,'',NULL),(23600,3,'','',10089,'Network device discovery','vmware.vm.net.if.discovery[{$URL},{HOST.HOST}]','1h','90d','0',0,4,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,1,NULL,'','Discovery of all network devices.',0,'30d',0,0,0,'',0,'',NULL),(23601,3,'','',10089,'Average number of bytes read from the disk {#DISKDESC}','vmware.vm.vfs.dev.read[{$URL},{HOST.HOST},{#DISKNAME},bps]','1m','90d','365d',0,3,'','Bps','',0,'','','','',0,'',NULL,NULL,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23602,3,'','',10089,'Average number of bytes written to the disk {#DISKDESC}','vmware.vm.vfs.dev.write[{$URL},{HOST.HOST},{#DISKNAME},bps]','1m','90d','365d',0,3,'','Bps','',0,'','','','',0,'',NULL,NULL,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23603,3,'','',10089,'Average number of reads from the disk {#DISKDESC}','vmware.vm.vfs.dev.read[{$URL},{HOST.HOST},{#DISKNAME},ops]','1m','90d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23604,3,'','',10089,'Average number of writes to the disk {#DISKDESC}','vmware.vm.vfs.dev.write[{$URL},{HOST.HOST},{#DISKNAME},ops]','1m','90d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23605,3,'','',10089,'Number of packets received on interface {#IFDESC}','vmware.vm.net.if.in[{$URL},{HOST.HOST},{#IFNAME},pps]','1m','90d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23606,3,'','',10089,'Number of packets transmitted on interface {#IFDESC}','vmware.vm.net.if.out[{$URL},{HOST.HOST},{#IFNAME},pps]','1m','90d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23607,3,'','',10089,'Number of bytes received on interface {#IFDESC}','vmware.vm.net.if.in[{$URL},{HOST.HOST},{#IFNAME},bps]','1m','90d','365d',0,3,'','Bps','',0,'','','','',0,'',NULL,NULL,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23608,3,'','',10089,'Number of bytes transmitted on interface {#IFDESC}','vmware.vm.net.if.out[{$URL},{HOST.HOST},{#IFNAME},bps]','1m','90d','365d',0,3,'','Bps','',0,'','','','',0,'',NULL,NULL,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23629,3,'','',10091,'Number of bytes received','vmware.hv.network.in[{$URL},{HOST.HOST},bps]','1m','90d','365d',0,3,'','Bps','',0,'','','','',0,'',NULL,NULL,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23630,3,'','',10091,'Number of bytes transmitted','vmware.hv.network.out[{$URL},{HOST.HOST},bps]','1m','90d','365d',0,3,'','Bps','',0,'','','','',0,'',NULL,NULL,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23631,3,'','',10091,'Datastore discovery','vmware.hv.datastore.discovery[{$URL},{HOST.HOST}]','1h','90d','0',0,4,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,1,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23632,3,'','',10091,'Average read latency of the datastore $3','vmware.hv.datastore.read[{$URL},{HOST.HOST},{#DATASTORE},latency]','1m','90d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23633,3,'','',10091,'Average write latency of the datastore $3','vmware.hv.datastore.write[{$URL},{HOST.HOST},{#DATASTORE},latency]','1m','90d','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23634,5,'','',10047,'Zabbix vmware cache, % free','zabbix[vmware,buffer,pfree]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23636,16,'','',10082,'jvm Name','jmx[\"java.lang:type=Runtime\",VmName]','1h','1w','0',0,1,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23637,16,'','',10082,'os Process CPU Load','jmx[\"java.lang:type=OperatingSystem\",ProcessCpuLoad]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23638,16,'','',10082,'mem Heap Memory used','jmx[\"java.lang:type=Memory\",HeapMemoryUsage.used]','1m','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23639,16,'','',10082,'mem Heap Memory committed','jmx[\"java.lang:type=Memory\",HeapMemoryUsage.committed]','1m','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23640,16,'','',10082,'mem Heap Memory max','jmx[\"java.lang:type=Memory\",HeapMemoryUsage.max]','1h','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23641,16,'','',10082,'mem Non-Heap Memory committed','jmx[\"java.lang:type=Memory\",NonHeapMemoryUsage.committed]','1m','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23642,16,'','',10082,'mem Non-Heap Memory used','jmx[\"java.lang:type=Memory\",NonHeapMemoryUsage.used]','1m','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23643,16,'','',10082,'mem Non-Heap Memory max','jmx[\"java.lang:type=Memory\",NonHeapMemoryUsage.max]','1h','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'service:jmx:rmi:///jndi/rmi://{HOST.CONN}:{HOST.PORT}/jmxrmi',NULL),(23644,3,'','',10093,'FTP service is running','net.tcp.service[ftp]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,1,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23645,3,'','',10094,'HTTP service is running','net.tcp.service[http]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,1,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23646,3,'','',10095,'HTTPS service is running','net.tcp.service[https]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,1,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23647,3,'','',10096,'IMAP service is running','net.tcp.service[imap]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,1,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23648,3,'','',10097,'LDAP service is running','net.tcp.service[ldap]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,1,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23649,3,'','',10098,'NNTP service is running','net.tcp.service[nntp]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,1,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23650,3,'','',10099,'NTP service is running','net.udp.service[ntp]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,1,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23651,3,'','',10100,'POP service is running','net.tcp.service[pop]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,1,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23652,3,'','',10101,'SMTP service is running','net.tcp.service[smtp]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,1,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23653,3,'','',10102,'SSH service is running','net.tcp.service[ssh]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,1,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23654,3,'','',10103,'Telnet service is running','net.tcp.service[telnet]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,1,'','',0,'','','','',0,0,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(23655,3,'','',10104,'ICMP ping','icmpping','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,1,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23656,3,'','',10104,'ICMP response time','icmppingsec','1m','1w','365d',0,0,'','s','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23657,3,'','',10104,'ICMP loss','icmppingloss','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23658,3,'','',10088,'Full name','vmware.fullname[{$URL}]','1h','90d','0',0,1,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23659,3,'','',10088,'Version','vmware.version[{$URL}]','1h','90d','0',0,1,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23660,3,'','',10089,'CPU ready','vmware.vm.cpu.ready[{$URL},{HOST.HOST}]','1m','90d','365d',0,3,'','ms','',0,'','','','',0,'',NULL,NULL,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,0,NULL,'','Time that the virtual machine was ready, but could not get scheduled to run on the physical CPU during last measurement interval (VMware vCenter/ESXi Server performance counter sampling interval - 20 seconds)',0,'30d',0,0,0,'',0,'',NULL),(23661,5,'','',10047,'Zabbix value cache operating mode','zabbix[vcache,cache,mode]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,15,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23663,5,'','',10047,'Zabbix $4 $2 processes, in %','zabbix[process,task manager,avg,busy]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23665,0,'','',10081,'Windows service discovery','service.discovery','1h','90d','0',0,4,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,1,NULL,'','Discovery of Windows services of different types as defined in global regular expressions \"Windows service names for discovery\" and \"Windows service startup states for discovery\".',0,'30d',0,0,0,'',0,'',NULL),(23666,0,'','',10081,'State of service \"{#SERVICE.NAME}\" ({#SERVICE.DISPLAYNAME})','service.info[{#SERVICE.NAME},state]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,3,'','',0,'','','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23667,3,'','',10091,'Health state rollup','vmware.hv.sensor.health.state[{$URL},{HOST.HOST}]','1m','90d','365d',0,3,'','','',0,'','','','',0,'',NULL,13,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,0,NULL,'','The host health state rollup sensor value: gray - unknown, ok, red - it has a problem, yellow - it might have a problem.',0,'30d',0,0,0,'',0,'',NULL),(23668,0,'','',10081,'Free virtual memory, in %','vm.vmemory.size[pavailable]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23669,3,'','',10091,'Total size of datastore $3','vmware.hv.datastore.size[{$URL},{HOST.HOST},{#DATASTORE}]','1m','90d','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(23670,3,'','',10091,'Free space on datastore $3 (percentage)','vmware.hv.datastore.size[{$URL},{HOST.HOST},{#DATASTORE},pfree]','1m','90d','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(25330,3,'','',10089,'Datacenter name','vmware.vm.datacenter.name[{$URL},{HOST.HOST}]','1m','90d','0',0,1,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,0,NULL,'','Datacenter name of the guest VM.',0,'30d',0,0,0,'',0,'',NULL),(25365,3,'','',10091,'Datacenter name','vmware.hv.datacenter.name[{$URL},{HOST.HOST}]','1m','90d','0',0,1,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'{$USERNAME}','{$PASSWORD}','','',0,0,NULL,'','Datacenter name of the hypervisor.',0,'30d',0,0,0,'',0,'',NULL),(25426,0,'','',10107,'Host name of zabbix_agentd running','agent.hostname','1h','1w','0',1,1,'','','',0,'','','','',0,'',23318,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(25427,0,'','',10107,'Agent ping','agent.ping','1m','1w','365d',1,3,'','','',0,'','','','',0,'',22232,10,'','',0,'','','','',0,0,NULL,'','The agent always returns 1 for this item. It could be used in combination with nodata() for availability check.',0,'0',0,0,0,'',0,'',NULL),(25428,0,'','',10107,'Version of zabbix_agent(d) running','agent.version','1h','1w','0',1,1,'','','',0,'','','','',0,'',22231,NULL,'','',0,'','','','',0,0,NULL,'','',0,'0',0,0,0,'',0,'',NULL),(25429,7,'','',10107,'Maximum number of opened files','kernel.maxfiles','1h','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','It could be increased by using sysctrl utility or modifying file /etc/sysctl.conf.',0,'30d',0,0,0,'',0,'',NULL),(25430,7,'','',10107,'Maximum number of processes','kernel.maxproc','1h','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','It could be increased by using sysctrl utility or modifying file /etc/sysctl.conf.',0,'30d',0,0,0,'',0,'',NULL),(25431,7,'','',10107,'Number of running processes','proc.num[,,run]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','Number of processes in running state.',0,'30d',0,0,0,'',0,'',NULL),(25432,7,'','',10107,'Number of processes','proc.num[]','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','Total number of processes in any state.',0,'30d',0,0,0,'',0,'',NULL),(25433,7,'','',10107,'Host boot time','system.boottime','10m','1w','365d',0,3,'','unixtime','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(25434,7,'','',10107,'Interrupts per second','system.cpu.intr','1m','1w','365d',0,3,'','ips','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(25435,7,'','',10107,'Processor load (15 min average per core)','system.cpu.load[percpu,avg15]','1m','1w','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The processor load is calculated as system CPU load divided by number of CPU cores.',0,'30d',0,0,0,'',0,'',NULL),(25436,7,'','',10107,'Processor load (1 min average per core)','system.cpu.load[percpu,avg1]','1m','1w','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The processor load is calculated as system CPU load divided by number of CPU cores.',0,'30d',0,0,0,'',0,'',NULL),(25437,7,'','',10107,'Processor load (5 min average per core)','system.cpu.load[percpu,avg5]','1m','1w','365d',0,0,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The processor load is calculated as system CPU load divided by number of CPU cores.',0,'30d',0,0,0,'',0,'',NULL),(25438,7,'','',10107,'Context switches per second','system.cpu.switches','1m','1w','365d',0,3,'','sps','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(25439,7,'','',10107,'CPU $2 time','system.cpu.util[,idle]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The time the CPU has spent doing nothing.',0,'30d',0,0,0,'',0,'',NULL),(25440,7,'','',10107,'CPU $2 time','system.cpu.util[,interrupt]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The amount of time the CPU has been servicing hardware interrupts.',0,'30d',0,0,0,'',0,'',NULL),(25441,7,'','',10107,'CPU $2 time','system.cpu.util[,iowait]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','Amount of time the CPU has been waiting for I/O to complete.',0,'30d',0,0,0,'',0,'',NULL),(25442,7,'','',10107,'CPU $2 time','system.cpu.util[,nice]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The time the CPU has spent running users\' processes that have been niced.',0,'30d',0,0,0,'',0,'',NULL),(25443,7,'','',10107,'CPU $2 time','system.cpu.util[,softirq]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The amount of time the CPU has been servicing software interrupts.',0,'30d',0,0,0,'',0,'',NULL),(25444,7,'','',10107,'CPU $2 time','system.cpu.util[,steal]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The amount of CPU \'stolen\' from this virtual machine by the hypervisor for other tasks (such as running another virtual machine).',0,'30d',0,0,0,'',0,'',NULL),(25445,7,'','',10107,'CPU $2 time','system.cpu.util[,system]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The time the CPU has spent running the kernel and its processes.',0,'30d',0,0,0,'',0,'',NULL),(25446,7,'','',10107,'CPU $2 time','system.cpu.util[,user]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The time the CPU has spent running users\' processes that are not niced.',0,'30d',0,0,0,'',0,'',NULL),(25447,7,'','',10107,'Host name','system.hostname','1h','1w','0',0,1,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','System host name.',3,'30d',0,0,0,'',0,'',NULL),(25448,7,'','',10107,'Host local time','system.localtime','1m','1w','365d',0,3,'','unixtime','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(25449,7,'','',10107,'Free swap space','system.swap.size[,free]','1m','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(25450,7,'','',10107,'Free swap space in %','system.swap.size[,pfree]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(25451,7,'','',10107,'Total swap space','system.swap.size[,total]','1h','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(25452,7,'','',10107,'System information','system.uname','1h','1w','0',0,1,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','The information as normally returned by \'uname -a\'.',5,'30d',0,0,0,'',0,'',NULL),(25453,7,'','',10107,'System uptime','system.uptime','10m','1w','365d',0,3,'','uptime','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(25454,7,'','',10107,'Number of logged in users','system.users.num','1m','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','Number of users who are currently logged in.',0,'30d',0,0,0,'',0,'',NULL),(25455,7,'','',10107,'Checksum of $1','vfs.file.cksum[/etc/passwd]','1h','1w','365d',0,3,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(25456,7,'','',10107,'Available memory','vm.memory.size[available]','1m','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','Available memory is defined as free+cached+buffers memory.',0,'30d',0,0,0,'',0,'',NULL),(25457,7,'','',10107,'Total memory','vm.memory.size[total]','1h','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,0,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(25458,7,'','',10107,'Network interface discovery','net.if.discovery','1h','90d','0',0,4,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,1,NULL,'','Discovery of network interfaces as defined in global regular expression \"Network interfaces for discovery\".',0,'30d',0,0,0,'',0,'',NULL),(25459,7,'','',10107,'Incoming network traffic on $1','net.if.in[{#IFNAME}]','1m','1w','365d',0,3,'','bps','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(25460,7,'','',10107,'Outgoing network traffic on $1','net.if.out[{#IFNAME}]','1m','1w','365d',0,3,'','bps','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(25461,7,'','',10107,'Mounted filesystem discovery','vfs.fs.discovery','1h','90d','0',0,4,'','','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,1,NULL,'','Discovery of file systems of different types as defined in global regular expression \"File systems for discovery\".',0,'30d',0,0,0,'',0,'',NULL),(25462,7,'','',10107,'Free disk space on $1','vfs.fs.size[{#FSNAME},free]','1m','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(25463,7,'','',10107,'Free inodes on $1 (percentage)','vfs.fs.inode[{#FSNAME},pfree]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(25464,7,'','',10107,'Total disk space on $1','vfs.fs.size[{#FSNAME},total]','1h','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(25465,7,'','',10107,'Used disk space on $1','vfs.fs.size[{#FSNAME},used]','1m','1w','365d',0,3,'','B','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL),(25466,7,'','',10107,'Free disk space on $1 (percentage)','vfs.fs.size[{#FSNAME},pfree]','1m','1w','365d',0,0,'','%','',0,'','','','',0,'',NULL,NULL,'','',0,'','','','',0,2,NULL,'','',0,'30d',0,0,0,'',0,'',NULL);
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items_applications`
--

DROP TABLE IF EXISTS `items_applications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `items_applications` (
  `itemappid` bigint(20) unsigned NOT NULL,
  `applicationid` bigint(20) unsigned NOT NULL,
  `itemid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`itemappid`),
  UNIQUE KEY `items_applications_1` (`applicationid`,`itemid`),
  KEY `items_applications_2` (`itemid`),
  CONSTRAINT `c_items_applications_1` FOREIGN KEY (`applicationid`) REFERENCES `applications` (`applicationid`) ON DELETE CASCADE,
  CONSTRAINT `c_items_applications_2` FOREIGN KEY (`itemid`) REFERENCES `items` (`itemid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items_applications`
--

LOCK TABLES `items_applications` WRITE;
/*!40000 ALTER TABLE `items_applications` DISABLE KEYS */;
INSERT INTO `items_applications` VALUES (4653,1,10016),(694,1,10025),(636,1,10055),(634,1,10056),(448,1,10057),(444,1,10058),(646,1,17318),(642,1,17352),(4462,5,22452),(4464,5,22454),(4466,5,22456),(4468,5,22458),(4704,5,22686),(4458,7,22446),(4460,7,22448),(600,9,10009),(804,9,10013),(587,13,10010),(689,13,17354),(671,13,17356),(675,13,17358),(679,13,17360),(683,13,17362),(4659,13,22665),(4665,13,22668),(4671,13,22671),(4677,13,22674),(4683,13,22677),(4692,13,22680),(4698,13,22683),(4587,15,10014),(4593,15,10026),(4595,15,10030),(4589,15,17350),(4583,15,22181),(588,17,10010),(690,17,17354),(672,17,17356),(676,17,17358),(680,17,17360),(684,17,17362),(4660,17,22665),(4666,17,22668),(4672,17,22671),(4678,17,22674),(4684,17,22677),(4693,17,22680),(4699,17,22683),(693,21,10025),(447,21,10057),(443,21,10058),(645,21,17318),(641,21,17352),(4654,23,10016),(654,23,10019),(4447,179,22183),(4443,179,22185),(4441,179,22187),(4097,179,22189),(5813,179,22191),(5814,179,22196),(5815,179,22199),(4451,179,22219),(4445,179,22396),(4398,179,22399),(4400,179,22400),(4401,179,22401),(4402,179,22402),(4404,179,22404),(4406,179,22406),(4408,179,22408),(4410,179,22410),(4412,179,22412),(4414,179,22414),(4416,179,22416),(4418,179,22418),(4420,179,22420),(4422,179,22422),(4424,179,22424),(4426,179,22426),(4430,179,22430),(4707,179,22689),(5341,179,23171),(5421,179,23251),(5849,179,23634),(5883,179,23661),(5885,179,23663),(4548,206,22231),(4544,206,22232),(5514,206,23318),(4545,207,10020),(4549,207,10059),(5515,207,23319),(4719,227,22701),(4720,227,22702),(4721,227,22703),(4722,227,22704),(4723,227,22705),(4724,227,22706),(4725,227,22707),(4726,227,22708),(4762,227,22709),(4727,228,22710),(4728,228,22711),(4729,228,22712),(4730,228,22713),(4731,228,22714),(4732,229,22715),(4733,229,22716),(4734,229,22717),(4735,229,22718),(4736,229,22719),(4737,230,22721),(4738,230,22722),(4739,230,22723),(4740,230,22724),(4741,230,22725),(4742,230,22726),(4743,230,22727),(4744,230,22728),(4763,230,22729),(4745,231,22730),(4746,231,22731),(4747,231,22732),(4748,231,22733),(4749,231,22734),(4750,232,22736),(4751,232,22737),(4752,232,22738),(4753,232,22739),(4754,232,22740),(4755,232,22741),(4756,232,22742),(4757,232,22743),(4764,232,22744),(4758,234,22749),(4759,234,22755),(4760,234,22756),(4761,234,22757),(4765,234,22758),(4766,234,22759),(4767,235,22761),(4768,235,22762),(4769,235,22763),(4770,235,22764),(4771,235,22765),(4772,235,22766),(4773,236,22768),(4774,236,22769),(4775,236,22770),(4776,236,22771),(4777,236,22772),(4778,236,22773),(4779,237,22774),(4780,237,22775),(4781,237,22776),(4782,237,22777),(4783,237,22778),(4784,238,22780),(4785,238,22781),(4786,238,22782),(4787,238,22783),(4788,238,22784),(4789,238,22785),(4790,238,22786),(4791,238,22787),(4792,238,22788),(4793,240,22793),(4794,241,22797),(4795,242,22799),(4817,245,22800),(4818,245,22801),(4819,245,22802),(4820,245,22803),(4821,245,22805),(4823,245,22806),(4822,246,22804),(4824,247,22807),(4825,248,22809),(4826,248,22810),(4827,248,22811),(4828,248,22812),(4829,248,22813),(4830,248,22814),(4831,248,22816),(4832,249,22808),(4833,249,22815),(4834,250,22817),(4835,250,22818),(4836,251,22819),(4837,251,22820),(4838,251,22821),(4839,251,22822),(4840,251,22823),(4841,251,22824),(4842,251,22825),(4843,251,22826),(4844,251,22827),(4845,251,22828),(4846,251,22829),(4847,251,22830),(4848,251,22831),(4849,251,22832),(4850,252,22833),(4851,252,22834),(5516,252,23320),(4858,253,22840),(4860,253,22841),(4862,253,22842),(4864,253,22843),(4866,253,22844),(4868,253,22845),(4870,253,22846),(4874,253,22848),(4880,253,22851),(4882,253,22852),(5276,254,22868),(5278,254,22869),(5279,254,22870),(5280,254,22871),(5277,254,22872),(4857,255,22839),(4885,255,22853),(4887,255,22854),(4892,255,22858),(4894,255,22859),(4888,256,22855),(4889,256,22856),(4890,256,22857),(4898,256,22862),(4899,256,22863),(5152,257,23075),(5153,257,23076),(4852,258,22835),(4853,258,22836),(4856,258,22839),(4884,258,22853),(4886,258,22854),(4891,258,22858),(4893,258,22859),(4895,258,22860),(4859,259,22840),(4861,259,22841),(4863,259,22842),(4865,259,22843),(4867,259,22844),(4869,259,22845),(4871,259,22846),(4875,259,22848),(4881,259,22851),(4883,259,22852),(4854,260,22837),(4855,260,22838),(4896,261,22860),(4897,261,22861),(4900,262,22873),(4901,262,22874),(5517,262,23321),(4908,263,22880),(4910,263,22881),(4912,263,22882),(4914,263,22883),(4916,263,22884),(4918,263,22885),(4920,263,22886),(4924,263,22888),(4930,263,22891),(4932,263,22892),(5256,264,22908),(5258,264,22909),(5259,264,22910),(5260,264,22911),(5257,264,22912),(4907,265,22879),(4935,265,22893),(4937,265,22894),(4942,265,22898),(4944,265,22899),(4938,266,22895),(4939,266,22896),(4940,266,22897),(4948,266,22902),(4949,266,22903),(5150,267,23073),(5151,267,23074),(4902,268,22875),(4903,268,22876),(4906,268,22879),(4934,268,22893),(4936,268,22894),(4941,268,22898),(4943,268,22899),(4945,268,22900),(4909,269,22880),(4911,269,22881),(4913,269,22882),(4915,269,22883),(4917,269,22884),(4919,269,22885),(4921,269,22886),(4925,269,22888),(4931,269,22891),(4933,269,22892),(4904,270,22877),(4905,270,22878),(4946,271,22900),(4947,271,22901),(4950,272,22913),(4951,272,22914),(5518,272,23322),(4958,273,22920),(4960,273,22921),(4962,273,22922),(4964,273,22923),(4966,273,22924),(5310,273,23108),(5307,273,23109),(5290,273,23110),(5313,273,23111),(5304,273,23112),(5296,273,23113),(5292,273,23114),(5294,273,23115),(5330,273,23118),(5332,273,23119),(5334,273,23120),(5336,273,23121),(5877,273,23123),(5248,274,22948),(5250,274,22949),(5251,274,22950),(5252,274,22951),(5249,274,22952),(5323,274,23116),(5326,274,23117),(5512,275,22933),(4987,275,22934),(4992,275,22938),(4994,275,22939),(4998,276,22942),(4999,276,22943),(5879,276,23122),(5193,276,23124),(5194,276,23125),(5319,276,23126),(5321,276,23127),(5322,276,23128),(5316,276,23129),(5317,276,23130),(5325,276,23131),(5254,277,22945),(5255,277,22946),(5513,278,22933),(4986,278,22934),(4991,278,22938),(4993,278,22939),(4995,278,22940),(4959,279,22920),(4961,279,22921),(4963,279,22922),(4965,279,22923),(4967,279,22924),(5312,279,23108),(5309,279,23109),(5291,279,23110),(5315,279,23111),(5305,279,23112),(5297,279,23113),(5293,279,23114),(5295,279,23115),(5324,279,23116),(5327,279,23117),(5333,279,23119),(5335,279,23120),(5337,279,23121),(5880,279,23122),(5878,279,23123),(4954,280,22917),(4955,280,22918),(4996,281,22940),(4997,281,22941),(5000,282,22953),(5001,282,22954),(5519,282,23323),(5010,283,22961),(5012,283,22962),(5014,283,22963),(5018,283,22965),(5024,283,22968),(5030,283,22971),(5032,283,22972),(5262,284,22988),(5264,284,22989),(5265,284,22990),(5267,284,22991),(5263,284,22992),(5035,285,22973),(5037,285,22974),(5042,285,22978),(5048,286,22982),(5049,286,22983),(5268,287,22985),(5269,287,22986),(5034,288,22973),(5036,288,22974),(5041,288,22978),(5045,288,22980),(5011,289,22961),(5013,289,22962),(5015,289,22963),(5019,289,22965),(5025,289,22968),(5031,289,22971),(5033,289,22972),(5046,291,22980),(5047,291,22981),(5050,292,22993),(5051,292,22994),(5520,292,23324),(5058,293,23000),(5060,293,23001),(5062,293,23002),(5064,293,23003),(5066,293,23004),(5068,293,23005),(5072,293,23007),(5080,293,23011),(5082,293,23012),(5281,294,23028),(5284,294,23029),(5285,294,23030),(5286,294,23031),(5283,294,23032),(5057,295,22999),(5085,295,23013),(5087,295,23014),(5092,295,23018),(5094,295,23019),(5088,296,23015),(5089,296,23016),(5090,296,23017),(5098,296,23022),(5099,296,23023),(5287,297,23025),(5288,297,23026),(5053,298,22996),(5056,298,22999),(5084,298,23013),(5086,298,23014),(5091,298,23018),(5093,298,23019),(5095,298,23020),(5059,299,23000),(5061,299,23001),(5063,299,23002),(5065,299,23003),(5067,299,23004),(5069,299,23005),(5073,299,23007),(5081,299,23011),(5083,299,23012),(5054,300,22997),(5055,300,22998),(5096,301,23020),(5097,301,23021),(5100,302,23033),(5101,302,23034),(5521,302,23325),(5110,303,23041),(5112,303,23042),(5114,303,23043),(5271,304,23068),(5273,304,23069),(5274,304,23070),(5275,304,23071),(5272,304,23072),(5107,305,23039),(5135,305,23053),(5137,305,23054),(5142,305,23058),(5144,305,23059),(5148,306,23062),(5149,306,23063),(5154,307,23077),(5155,307,23078),(5102,308,23035),(5103,308,23036),(5106,308,23039),(5134,308,23053),(5136,308,23054),(5141,308,23058),(5143,308,23059),(5145,308,23060),(5111,309,23041),(5113,309,23042),(5115,309,23043),(5146,311,23060),(5147,311,23061),(5510,319,23149),(5217,319,23150),(5229,320,23134),(5231,320,23135),(5424,320,23136),(5426,320,23137),(5233,320,23143),(5246,320,23144),(5244,320,23145),(5236,321,23666),(5228,322,23134),(5230,322,23135),(5423,322,23136),(5425,322,23137),(5247,322,23164),(5253,322,23165),(5266,322,23167),(5270,322,23168),(5204,323,23138),(5511,323,23149),(5206,324,23140),(5232,325,23143),(5245,325,23144),(5243,325,23145),(5234,328,23147),(5235,328,23148),(5226,328,23158),(5240,328,23159),(5890,328,23668),(5241,329,23160),(5242,329,23161),(5522,329,23326),(5282,330,23169),(5289,330,23170),(5311,331,23108),(5308,331,23109),(5314,331,23111),(5306,331,23112),(5331,331,23118),(5343,332,23173),(5344,332,23174),(5345,332,23175),(5342,333,23172),(5382,333,23212),(5346,334,23176),(5347,334,23177),(5348,334,23178),(5349,334,23179),(5350,334,23180),(5351,334,23181),(5352,334,23182),(5353,334,23183),(5354,334,23184),(5355,334,23185),(5356,334,23186),(5357,334,23187),(5360,335,23190),(5853,335,23638),(5854,335,23639),(5855,335,23640),(5856,335,23641),(5857,335,23642),(5858,335,23643),(5361,336,23191),(5362,336,23192),(5363,336,23193),(5364,336,23194),(5365,336,23195),(5366,336,23196),(5367,336,23197),(5368,336,23198),(5369,336,23199),(5370,336,23200),(5371,336,23201),(5372,336,23202),(5373,336,23203),(5374,336,23204),(5375,336,23205),(5376,336,23206),(5377,336,23207),(5378,336,23208),(5379,336,23209),(5380,336,23210),(5381,336,23211),(5383,337,23213),(5384,337,23214),(5852,337,23637),(5358,338,23188),(5359,338,23189),(5851,338,23636),(5385,339,23215),(5386,339,23216),(5387,339,23217),(5388,339,23218),(5389,340,23219),(5390,340,23220),(5391,340,23221),(5392,340,23222),(5393,340,23223),(5394,340,23224),(5395,340,23225),(5396,340,23226),(5397,340,23227),(5398,341,23228),(5399,341,23229),(5400,341,23230),(5401,341,23231),(5402,341,23232),(5403,341,23233),(5404,341,23234),(5405,341,23235),(5406,341,23236),(5407,342,23237),(5408,342,23238),(5409,342,23239),(5410,342,23240),(5411,342,23241),(5412,342,23242),(5413,342,23243),(5414,342,23244),(5415,343,23245),(5416,343,23246),(5417,343,23247),(5418,343,23248),(5419,343,23249),(5420,344,23250),(5816,356,23340),(5817,356,23341),(5818,356,23342),(5819,356,23343),(5820,356,23344),(5821,356,23345),(5822,356,23346),(5823,356,23347),(5824,356,23348),(5825,356,23349),(5826,356,23350),(5827,356,23351),(5828,356,23352),(5829,356,23353),(5830,356,23354),(5831,356,23355),(5832,356,23356),(5833,356,23357),(5834,356,23358),(5835,356,23359),(5836,356,23360),(5747,408,23550),(5748,408,23551),(5875,408,23660),(5740,410,23543),(5741,410,23544),(5742,410,23545),(5743,410,23546),(5841,410,23585),(5842,410,23586),(5843,410,23587),(5844,410,23588),(5749,412,23552),(5750,412,23553),(5774,412,23573),(5795,412,23597),(5887,412,25330),(5744,414,23547),(5745,414,23548),(5746,414,23549),(5752,416,23556),(5754,416,23557),(5756,416,23558),(5758,416,23559),(5760,416,23560),(5761,418,23561),(5763,418,23563),(5766,418,23565),(5769,418,23568),(5770,418,23569),(5796,418,23598),(5889,418,23667),(5888,418,25365),(5751,420,23555),(5753,420,23556),(5755,420,23557),(5757,420,23558),(5759,420,23559),(5762,420,23562),(5764,420,23564),(5768,420,23567),(5765,422,23564),(5767,422,23566),(5773,422,23572),(5776,424,23576),(5777,424,23577),(5778,424,23578),(5779,424,23579),(5793,433,23593),(5794,434,23596),(5797,435,23601),(5798,435,23602),(5799,435,23603),(5800,435,23604),(5801,437,23605),(5802,437,23606),(5803,437,23607),(5804,437,23608),(5845,443,23629),(5846,443,23630),(5847,445,23632),(5848,445,23633),(5891,445,23669),(5892,445,23670),(5859,446,23644),(5860,447,23645),(5861,448,23646),(5862,449,23647),(5863,450,23648),(5864,451,23649),(5865,452,23650),(5866,453,23651),(5867,454,23652),(5868,455,23653),(5869,456,23654),(5870,457,23655),(5871,457,23656),(5872,457,23657),(5873,458,23658),(5874,458,23659),(5970,469,25426),(5971,469,25427),(5972,469,25428),(5979,470,25434),(5981,470,25435),(5983,470,25436),(5985,470,25437),(5987,470,25438),(5989,470,25439),(5991,470,25440),(5993,470,25441),(5995,470,25442),(5997,470,25443),(5999,470,25444),(6001,470,25445),(6003,470,25446),(6023,471,25462),(6024,471,25463),(6025,471,25464),(6026,471,25465),(6027,471,25466),(5978,472,25433),(6006,472,25447),(6008,472,25448),(6013,472,25452),(6015,472,25453),(6009,473,25449),(6010,473,25450),(6011,473,25451),(6019,473,25456),(6020,473,25457),(6021,474,25459),(6022,474,25460),(5973,475,25429),(5974,475,25430),(5977,475,25433),(6005,475,25447),(6007,475,25448),(6012,475,25452),(6014,475,25453),(6016,475,25454),(5980,476,25434),(5982,476,25435),(5984,476,25436),(5986,476,25437),(5988,476,25438),(5990,476,25439),(5992,476,25440),(5994,476,25441),(5996,476,25442),(5998,476,25443),(6000,476,25444),(6002,476,25445),(6004,476,25446),(5975,477,25431),(5976,477,25432),(6017,478,25454),(6018,478,25455);
/*!40000 ALTER TABLE `items_applications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maintenances`
--

DROP TABLE IF EXISTS `maintenances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maintenances` (
  `maintenanceid` bigint(20) unsigned NOT NULL,
  `name` varchar(128) NOT NULL DEFAULT '',
  `maintenance_type` int(11) NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `active_since` int(11) NOT NULL DEFAULT '0',
  `active_till` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`maintenanceid`),
  UNIQUE KEY `maintenances_2` (`name`),
  KEY `maintenances_1` (`active_since`,`active_till`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintenances`
--

LOCK TABLES `maintenances` WRITE;
/*!40000 ALTER TABLE `maintenances` DISABLE KEYS */;
/*!40000 ALTER TABLE `maintenances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maintenances_groups`
--

DROP TABLE IF EXISTS `maintenances_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maintenances_groups` (
  `maintenance_groupid` bigint(20) unsigned NOT NULL,
  `maintenanceid` bigint(20) unsigned NOT NULL,
  `groupid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`maintenance_groupid`),
  UNIQUE KEY `maintenances_groups_1` (`maintenanceid`,`groupid`),
  KEY `maintenances_groups_2` (`groupid`),
  CONSTRAINT `c_maintenances_groups_1` FOREIGN KEY (`maintenanceid`) REFERENCES `maintenances` (`maintenanceid`) ON DELETE CASCADE,
  CONSTRAINT `c_maintenances_groups_2` FOREIGN KEY (`groupid`) REFERENCES `groups` (`groupid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintenances_groups`
--

LOCK TABLES `maintenances_groups` WRITE;
/*!40000 ALTER TABLE `maintenances_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `maintenances_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maintenances_hosts`
--

DROP TABLE IF EXISTS `maintenances_hosts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maintenances_hosts` (
  `maintenance_hostid` bigint(20) unsigned NOT NULL,
  `maintenanceid` bigint(20) unsigned NOT NULL,
  `hostid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`maintenance_hostid`),
  UNIQUE KEY `maintenances_hosts_1` (`maintenanceid`,`hostid`),
  KEY `maintenances_hosts_2` (`hostid`),
  CONSTRAINT `c_maintenances_hosts_1` FOREIGN KEY (`maintenanceid`) REFERENCES `maintenances` (`maintenanceid`) ON DELETE CASCADE,
  CONSTRAINT `c_maintenances_hosts_2` FOREIGN KEY (`hostid`) REFERENCES `hosts` (`hostid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintenances_hosts`
--

LOCK TABLES `maintenances_hosts` WRITE;
/*!40000 ALTER TABLE `maintenances_hosts` DISABLE KEYS */;
/*!40000 ALTER TABLE `maintenances_hosts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maintenances_windows`
--

DROP TABLE IF EXISTS `maintenances_windows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maintenances_windows` (
  `maintenance_timeperiodid` bigint(20) unsigned NOT NULL,
  `maintenanceid` bigint(20) unsigned NOT NULL,
  `timeperiodid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`maintenance_timeperiodid`),
  UNIQUE KEY `maintenances_windows_1` (`maintenanceid`,`timeperiodid`),
  KEY `maintenances_windows_2` (`timeperiodid`),
  CONSTRAINT `c_maintenances_windows_1` FOREIGN KEY (`maintenanceid`) REFERENCES `maintenances` (`maintenanceid`) ON DELETE CASCADE,
  CONSTRAINT `c_maintenances_windows_2` FOREIGN KEY (`timeperiodid`) REFERENCES `timeperiods` (`timeperiodid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintenances_windows`
--

LOCK TABLES `maintenances_windows` WRITE;
/*!40000 ALTER TABLE `maintenances_windows` DISABLE KEYS */;
/*!40000 ALTER TABLE `maintenances_windows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mappings`
--

DROP TABLE IF EXISTS `mappings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mappings` (
  `mappingid` bigint(20) unsigned NOT NULL,
  `valuemapid` bigint(20) unsigned NOT NULL,
  `value` varchar(64) NOT NULL DEFAULT '',
  `newvalue` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`mappingid`),
  KEY `mappings_1` (`valuemapid`),
  CONSTRAINT `c_mappings_1` FOREIGN KEY (`valuemapid`) REFERENCES `valuemaps` (`valuemapid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mappings`
--

LOCK TABLES `mappings` WRITE;
/*!40000 ALTER TABLE `mappings` DISABLE KEYS */;
INSERT INTO `mappings` VALUES (1,1,'0','Down'),(2,1,'1','Up'),(3,2,'0','not available'),(4,2,'1','available'),(5,2,'2','unknown'),(13,6,'1','Other'),(14,6,'2','OK'),(15,6,'3','Degraded'),(17,7,'1','Other'),(18,7,'2','Unknown'),(19,7,'3','OK'),(20,7,'4','NonCritical'),(21,7,'5','Critical'),(22,7,'6','NonRecoverable'),(23,5,'1','unknown'),(24,5,'2','batteryNormal'),(25,5,'3','batteryLow'),(26,4,'1','unknown'),(27,4,'2','notInstalled'),(28,4,'3','ok'),(29,4,'4','failed'),(30,4,'5','highTemperature'),(31,4,'6','replaceImmediately'),(32,4,'7','lowCapacity'),(33,3,'0','Running'),(34,3,'1','Paused'),(35,3,'3','Pause pending'),(36,3,'4','Continue pending'),(37,3,'5','Stop pending'),(38,3,'6','Stopped'),(39,3,'7','Unknown'),(40,3,'255','No such service'),(41,3,'2','Start pending'),(49,9,'1','unknown'),(50,9,'2','running'),(51,9,'3','warning'),(52,9,'4','testing'),(53,9,'5','down'),(61,8,'1','up'),(62,8,'2','down'),(63,8,'3','testing'),(64,8,'4','unknown'),(65,8,'5','dormant'),(66,8,'6','notPresent'),(67,8,'7','lowerLayerDown'),(68,10,'1','Up'),(69,11,'1','up'),(70,11,'2','down'),(71,11,'3','testing'),(72,12,'0','poweredOff'),(73,12,'1','poweredOn'),(74,12,'2','suspended'),(75,13,'0','gray'),(76,13,'1','green'),(77,13,'2','yellow'),(78,13,'3','red'),(79,14,'0','normal'),(80,14,'1','in maintenance'),(81,14,'2','no data collection'),(82,15,'0','Normal'),(83,15,'1','Low memory'),(84,16,'0','Automatic'),(85,16,'1','Automatic delayed'),(86,16,'2','Manual'),(87,16,'3','Disabled'),(88,16,'4','Unknown'),(89,17,'100','Continue'),(90,17,'101','Switching Protocols'),(91,17,'102','Processing'),(92,17,'200','OK'),(93,17,'201','Created'),(94,17,'202','Accepted'),(95,17,'203','Non-Authoritative Information'),(96,17,'204','No Content'),(97,17,'205','Reset Content'),(98,17,'206','Partial Content'),(99,17,'207','Multi-Status'),(100,17,'208','Already Reported'),(101,17,'226','IM Used'),(102,17,'300','Multiple Choices'),(103,17,'301','Moved Permanently'),(104,17,'302','Found'),(105,17,'303','See Other'),(106,17,'304','Not Modified'),(107,17,'305','Use Proxy'),(108,17,'306','Switch Proxy'),(109,17,'307','Temporary Redirect'),(110,17,'308','Permanent Redirect/Resume Incomplete'),(111,17,'400','Bad Request'),(112,17,'401','Unauthorized'),(113,17,'402','Payment Required'),(114,17,'403','Forbidden'),(115,17,'404','Not Found'),(116,17,'405','Method Not Allowed'),(117,17,'406','Not Acceptable'),(118,17,'407','Proxy Authentication Required'),(119,17,'408','Request Timeout'),(120,17,'409','Conflict'),(121,17,'410','Gone'),(122,17,'411','Length Required'),(123,17,'412','Precondition Failed'),(124,17,'413','Payload Too Large'),(125,17,'414','Request-URI Too Long'),(126,17,'415','Unsupported Media Type'),(127,17,'416','Requested Range Not Satisfiable'),(128,17,'417','Expectation Failed'),(129,17,'418','I\'m a Teapot'),(130,17,'419','Authentication Timeout'),(131,17,'420','Method Failure/Enhance Your Calm'),(132,17,'421','Misdirected Request'),(133,17,'422','Unprocessable Entity'),(134,17,'423','Locked'),(135,17,'424','Failed Dependency'),(136,17,'426','Upgrade Required'),(137,17,'428','Precondition Required'),(138,17,'429','Too Many Requests'),(139,17,'431','Request Header Fields Too Large'),(140,17,'440','Login Timeout'),(141,17,'444','No Response'),(142,17,'449','Retry With'),(143,17,'450','Blocked by Windows Parental Controls'),(144,17,'451','Unavailable for Legal Reasons/Redirect'),(145,17,'494','Request Header Too Large'),(146,17,'495','Cert Error'),(147,17,'496','No Cert'),(148,17,'497','HTTP to HTTPS'),(149,17,'498','Token Expired/Invalid'),(150,17,'499','Client Closed Request/Token Required'),(151,17,'500','Internal Server Error'),(152,17,'501','Not Implemented'),(153,17,'502','Bad Gateway'),(154,17,'503','Service Unavailable'),(155,17,'504','Gateway Timeout'),(156,17,'505','HTTP Version Not Supported'),(157,17,'506','Variant Also Negotiates'),(158,17,'507','Insufficient Storage'),(159,17,'508','Loop Detected'),(160,17,'509','Bandwidth Limit Exceeded'),(161,17,'510','Not Extended'),(162,17,'511','Network Authentication Required'),(163,17,'520','Unknown Error'),(164,17,'598','Network Read Timeout Error'),(165,17,'599','Network Connect Timeout Error');
/*!40000 ALTER TABLE `mappings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media` (
  `mediaid` bigint(20) unsigned NOT NULL,
  `userid` bigint(20) unsigned NOT NULL,
  `mediatypeid` bigint(20) unsigned NOT NULL,
  `sendto` varchar(100) NOT NULL DEFAULT '',
  `active` int(11) NOT NULL DEFAULT '0',
  `severity` int(11) NOT NULL DEFAULT '63',
  `period` varchar(1024) NOT NULL DEFAULT '1-7,00:00-24:00',
  PRIMARY KEY (`mediaid`),
  KEY `media_1` (`userid`),
  KEY `media_2` (`mediatypeid`),
  CONSTRAINT `c_media_1` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE CASCADE,
  CONSTRAINT `c_media_2` FOREIGN KEY (`mediatypeid`) REFERENCES `media_type` (`mediatypeid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_type`
--

DROP TABLE IF EXISTS `media_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media_type` (
  `mediatypeid` bigint(20) unsigned NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  `description` varchar(100) NOT NULL DEFAULT '',
  `smtp_server` varchar(255) NOT NULL DEFAULT '',
  `smtp_helo` varchar(255) NOT NULL DEFAULT '',
  `smtp_email` varchar(255) NOT NULL DEFAULT '',
  `exec_path` varchar(255) NOT NULL DEFAULT '',
  `gsm_modem` varchar(255) NOT NULL DEFAULT '',
  `username` varchar(255) NOT NULL DEFAULT '',
  `passwd` varchar(255) NOT NULL DEFAULT '',
  `status` int(11) NOT NULL DEFAULT '0',
  `smtp_port` int(11) NOT NULL DEFAULT '25',
  `smtp_security` int(11) NOT NULL DEFAULT '0',
  `smtp_verify_peer` int(11) NOT NULL DEFAULT '0',
  `smtp_verify_host` int(11) NOT NULL DEFAULT '0',
  `smtp_authentication` int(11) NOT NULL DEFAULT '0',
  `exec_params` varchar(255) NOT NULL DEFAULT '',
  `maxsessions` int(11) NOT NULL DEFAULT '1',
  `maxattempts` int(11) NOT NULL DEFAULT '3',
  `attempt_interval` varchar(32) NOT NULL DEFAULT '10s',
  PRIMARY KEY (`mediatypeid`),
  UNIQUE KEY `media_type_1` (`description`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_type`
--

LOCK TABLES `media_type` WRITE;
/*!40000 ALTER TABLE `media_type` DISABLE KEYS */;
INSERT INTO `media_type` VALUES (1,0,'Email','mail.company.com','company.com','zabbix@company.com','','','','',0,25,0,0,0,0,'',1,3,'10s'),(2,3,'Jabber','','','','','','jabber@company.com','zabbix',0,25,0,0,0,0,'',1,3,'10s'),(3,2,'SMS','','','','','/dev/ttyS0','','',0,25,0,0,0,0,'',1,3,'10s');
/*!40000 ALTER TABLE `media_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opcommand`
--

DROP TABLE IF EXISTS `opcommand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opcommand` (
  `operationid` bigint(20) unsigned NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  `scriptid` bigint(20) unsigned DEFAULT NULL,
  `execute_on` int(11) NOT NULL DEFAULT '0',
  `port` varchar(64) NOT NULL DEFAULT '',
  `authtype` int(11) NOT NULL DEFAULT '0',
  `username` varchar(64) NOT NULL DEFAULT '',
  `password` varchar(64) NOT NULL DEFAULT '',
  `publickey` varchar(64) NOT NULL DEFAULT '',
  `privatekey` varchar(64) NOT NULL DEFAULT '',
  `command` text NOT NULL,
  PRIMARY KEY (`operationid`),
  KEY `opcommand_1` (`scriptid`),
  CONSTRAINT `c_opcommand_1` FOREIGN KEY (`operationid`) REFERENCES `operations` (`operationid`) ON DELETE CASCADE,
  CONSTRAINT `c_opcommand_2` FOREIGN KEY (`scriptid`) REFERENCES `scripts` (`scriptid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opcommand`
--

LOCK TABLES `opcommand` WRITE;
/*!40000 ALTER TABLE `opcommand` DISABLE KEYS */;
/*!40000 ALTER TABLE `opcommand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opcommand_grp`
--

DROP TABLE IF EXISTS `opcommand_grp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opcommand_grp` (
  `opcommand_grpid` bigint(20) unsigned NOT NULL,
  `operationid` bigint(20) unsigned NOT NULL,
  `groupid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`opcommand_grpid`),
  KEY `opcommand_grp_1` (`operationid`),
  KEY `opcommand_grp_2` (`groupid`),
  CONSTRAINT `c_opcommand_grp_1` FOREIGN KEY (`operationid`) REFERENCES `operations` (`operationid`) ON DELETE CASCADE,
  CONSTRAINT `c_opcommand_grp_2` FOREIGN KEY (`groupid`) REFERENCES `groups` (`groupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opcommand_grp`
--

LOCK TABLES `opcommand_grp` WRITE;
/*!40000 ALTER TABLE `opcommand_grp` DISABLE KEYS */;
/*!40000 ALTER TABLE `opcommand_grp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opcommand_hst`
--

DROP TABLE IF EXISTS `opcommand_hst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opcommand_hst` (
  `opcommand_hstid` bigint(20) unsigned NOT NULL,
  `operationid` bigint(20) unsigned NOT NULL,
  `hostid` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`opcommand_hstid`),
  KEY `opcommand_hst_1` (`operationid`),
  KEY `opcommand_hst_2` (`hostid`),
  CONSTRAINT `c_opcommand_hst_1` FOREIGN KEY (`operationid`) REFERENCES `operations` (`operationid`) ON DELETE CASCADE,
  CONSTRAINT `c_opcommand_hst_2` FOREIGN KEY (`hostid`) REFERENCES `hosts` (`hostid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opcommand_hst`
--

LOCK TABLES `opcommand_hst` WRITE;
/*!40000 ALTER TABLE `opcommand_hst` DISABLE KEYS */;
/*!40000 ALTER TABLE `opcommand_hst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opconditions`
--

DROP TABLE IF EXISTS `opconditions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opconditions` (
  `opconditionid` bigint(20) unsigned NOT NULL,
  `operationid` bigint(20) unsigned NOT NULL,
  `conditiontype` int(11) NOT NULL DEFAULT '0',
  `operator` int(11) NOT NULL DEFAULT '0',
  `value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`opconditionid`),
  KEY `opconditions_1` (`operationid`),
  CONSTRAINT `c_opconditions_1` FOREIGN KEY (`operationid`) REFERENCES `operations` (`operationid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opconditions`
--

LOCK TABLES `opconditions` WRITE;
/*!40000 ALTER TABLE `opconditions` DISABLE KEYS */;
/*!40000 ALTER TABLE `opconditions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operations`
--

DROP TABLE IF EXISTS `operations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operations` (
  `operationid` bigint(20) unsigned NOT NULL,
  `actionid` bigint(20) unsigned NOT NULL,
  `operationtype` int(11) NOT NULL DEFAULT '0',
  `esc_period` varchar(255) NOT NULL DEFAULT '0',
  `esc_step_from` int(11) NOT NULL DEFAULT '1',
  `esc_step_to` int(11) NOT NULL DEFAULT '1',
  `evaltype` int(11) NOT NULL DEFAULT '0',
  `recovery` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`operationid`),
  KEY `operations_1` (`actionid`),
  CONSTRAINT `c_operations_1` FOREIGN KEY (`actionid`) REFERENCES `actions` (`actionid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operations`
--

LOCK TABLES `operations` WRITE;
/*!40000 ALTER TABLE `operations` DISABLE KEYS */;
INSERT INTO `operations` VALUES (1,2,6,'0',1,1,0,0),(2,2,4,'0',1,1,0,0),(3,3,0,'0',1,1,0,0),(4,4,0,'0',1,1,0,0),(5,5,0,'0',1,1,0,0),(6,6,0,'0',1,1,0,0),(7,3,11,'0',1,1,0,1),(8,4,11,'0',1,1,0,1),(9,5,11,'0',1,1,0,1),(10,6,11,'0',1,1,0,1);
/*!40000 ALTER TABLE `operations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opgroup`
--

DROP TABLE IF EXISTS `opgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opgroup` (
  `opgroupid` bigint(20) unsigned NOT NULL,
  `operationid` bigint(20) unsigned NOT NULL,
  `groupid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`opgroupid`),
  UNIQUE KEY `opgroup_1` (`operationid`,`groupid`),
  KEY `opgroup_2` (`groupid`),
  CONSTRAINT `c_opgroup_1` FOREIGN KEY (`operationid`) REFERENCES `operations` (`operationid`) ON DELETE CASCADE,
  CONSTRAINT `c_opgroup_2` FOREIGN KEY (`groupid`) REFERENCES `groups` (`groupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opgroup`
--

LOCK TABLES `opgroup` WRITE;
/*!40000 ALTER TABLE `opgroup` DISABLE KEYS */;
INSERT INTO `opgroup` VALUES (1,2,2);
/*!40000 ALTER TABLE `opgroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opinventory`
--

DROP TABLE IF EXISTS `opinventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opinventory` (
  `operationid` bigint(20) unsigned NOT NULL,
  `inventory_mode` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`operationid`),
  CONSTRAINT `c_opinventory_1` FOREIGN KEY (`operationid`) REFERENCES `operations` (`operationid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opinventory`
--

LOCK TABLES `opinventory` WRITE;
/*!40000 ALTER TABLE `opinventory` DISABLE KEYS */;
/*!40000 ALTER TABLE `opinventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opmessage`
--

DROP TABLE IF EXISTS `opmessage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opmessage` (
  `operationid` bigint(20) unsigned NOT NULL,
  `default_msg` int(11) NOT NULL DEFAULT '0',
  `subject` varchar(255) NOT NULL DEFAULT '',
  `message` text NOT NULL,
  `mediatypeid` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`operationid`),
  KEY `opmessage_1` (`mediatypeid`),
  CONSTRAINT `c_opmessage_1` FOREIGN KEY (`operationid`) REFERENCES `operations` (`operationid`) ON DELETE CASCADE,
  CONSTRAINT `c_opmessage_2` FOREIGN KEY (`mediatypeid`) REFERENCES `media_type` (`mediatypeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opmessage`
--

LOCK TABLES `opmessage` WRITE;
/*!40000 ALTER TABLE `opmessage` DISABLE KEYS */;
INSERT INTO `opmessage` VALUES (3,1,'{TRIGGER.STATUS}: {TRIGGER.NAME}','Trigger: {TRIGGER.NAME}\r\nTrigger status: {TRIGGER.STATUS}\r\nTrigger severity: {TRIGGER.SEVERITY}\r\nTrigger URL: {TRIGGER.URL}\r\n\r\nItem values:\r\n\r\n1. {ITEM.NAME1} ({HOST.NAME1}:{ITEM.KEY1}): {ITEM.VALUE1}\r\n2. {ITEM.NAME2} ({HOST.NAME2}:{ITEM.KEY2}): {ITEM.VALUE2}\r\n3. {ITEM.NAME3} ({HOST.NAME3}:{ITEM.KEY3}): {ITEM.VALUE3}',NULL),(4,1,'','',NULL),(5,1,'','',NULL),(6,1,'','',NULL),(7,1,'{TRIGGER.STATUS}: {TRIGGER.NAME}','Trigger: {TRIGGER.NAME}\r\nTrigger status: {TRIGGER.STATUS}\r\nTrigger severity: {TRIGGER.SEVERITY}\r\nTrigger URL: {TRIGGER.URL}\r\n\r\nItem values:\r\n\r\n1. {ITEM.NAME1} ({HOST.NAME1}:{ITEM.KEY1}): {ITEM.VALUE1}\r\n2. {ITEM.NAME2} ({HOST.NAME2}:{ITEM.KEY2}): {ITEM.VALUE2}\r\n3. {ITEM.NAME3} ({HOST.NAME3}:{ITEM.KEY3}): {ITEM.VALUE3}\r\n\r\nOriginal event ID: {EVENT.ID}',NULL),(8,1,'{ITEM.STATE}: {HOST.NAME}:{ITEM.NAME}','Host: {HOST.NAME}\r\nItem: {ITEM.NAME}\r\nKey: {ITEM.KEY}\r\nState: {ITEM.STATE}',NULL),(9,1,'{LLDRULE.STATE}: {HOST.NAME}:{LLDRULE.NAME}','Host: {HOST.NAME}\r\nLow level discovery rule: {LLDRULE.NAME}\r\nKey: {LLDRULE.KEY}\r\nState: {LLDRULE.STATE}',NULL),(10,1,'{TRIGGER.STATE}: {TRIGGER.NAME}','Trigger name: {TRIGGER.NAME}\r\nExpression: {TRIGGER.EXPRESSION}\r\nState: {TRIGGER.STATE}',NULL);
/*!40000 ALTER TABLE `opmessage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opmessage_grp`
--

DROP TABLE IF EXISTS `opmessage_grp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opmessage_grp` (
  `opmessage_grpid` bigint(20) unsigned NOT NULL,
  `operationid` bigint(20) unsigned NOT NULL,
  `usrgrpid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`opmessage_grpid`),
  UNIQUE KEY `opmessage_grp_1` (`operationid`,`usrgrpid`),
  KEY `opmessage_grp_2` (`usrgrpid`),
  CONSTRAINT `c_opmessage_grp_1` FOREIGN KEY (`operationid`) REFERENCES `operations` (`operationid`) ON DELETE CASCADE,
  CONSTRAINT `c_opmessage_grp_2` FOREIGN KEY (`usrgrpid`) REFERENCES `usrgrp` (`usrgrpid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opmessage_grp`
--

LOCK TABLES `opmessage_grp` WRITE;
/*!40000 ALTER TABLE `opmessage_grp` DISABLE KEYS */;
INSERT INTO `opmessage_grp` VALUES (1,3,7),(2,4,7),(3,5,7),(4,6,7);
/*!40000 ALTER TABLE `opmessage_grp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opmessage_usr`
--

DROP TABLE IF EXISTS `opmessage_usr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opmessage_usr` (
  `opmessage_usrid` bigint(20) unsigned NOT NULL,
  `operationid` bigint(20) unsigned NOT NULL,
  `userid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`opmessage_usrid`),
  UNIQUE KEY `opmessage_usr_1` (`operationid`,`userid`),
  KEY `opmessage_usr_2` (`userid`),
  CONSTRAINT `c_opmessage_usr_1` FOREIGN KEY (`operationid`) REFERENCES `operations` (`operationid`) ON DELETE CASCADE,
  CONSTRAINT `c_opmessage_usr_2` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opmessage_usr`
--

LOCK TABLES `opmessage_usr` WRITE;
/*!40000 ALTER TABLE `opmessage_usr` DISABLE KEYS */;
/*!40000 ALTER TABLE `opmessage_usr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `optemplate`
--

DROP TABLE IF EXISTS `optemplate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `optemplate` (
  `optemplateid` bigint(20) unsigned NOT NULL,
  `operationid` bigint(20) unsigned NOT NULL,
  `templateid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`optemplateid`),
  UNIQUE KEY `optemplate_1` (`operationid`,`templateid`),
  KEY `optemplate_2` (`templateid`),
  CONSTRAINT `c_optemplate_1` FOREIGN KEY (`operationid`) REFERENCES `operations` (`operationid`) ON DELETE CASCADE,
  CONSTRAINT `c_optemplate_2` FOREIGN KEY (`templateid`) REFERENCES `hosts` (`hostid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `optemplate`
--

LOCK TABLES `optemplate` WRITE;
/*!40000 ALTER TABLE `optemplate` DISABLE KEYS */;
INSERT INTO `optemplate` VALUES (1,1,10001);
/*!40000 ALTER TABLE `optemplate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `problem`
--

DROP TABLE IF EXISTS `problem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `problem` (
  `eventid` bigint(20) unsigned NOT NULL,
  `source` int(11) NOT NULL DEFAULT '0',
  `object` int(11) NOT NULL DEFAULT '0',
  `objectid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `clock` int(11) NOT NULL DEFAULT '0',
  `ns` int(11) NOT NULL DEFAULT '0',
  `r_eventid` bigint(20) unsigned DEFAULT NULL,
  `r_clock` int(11) NOT NULL DEFAULT '0',
  `r_ns` int(11) NOT NULL DEFAULT '0',
  `correlationid` bigint(20) unsigned DEFAULT NULL,
  `userid` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`eventid`),
  KEY `problem_1` (`source`,`object`,`objectid`),
  KEY `problem_2` (`r_clock`),
  KEY `problem_3` (`r_eventid`),
  CONSTRAINT `c_problem_1` FOREIGN KEY (`eventid`) REFERENCES `events` (`eventid`) ON DELETE CASCADE,
  CONSTRAINT `c_problem_2` FOREIGN KEY (`r_eventid`) REFERENCES `events` (`eventid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `problem`
--

LOCK TABLES `problem` WRITE;
/*!40000 ALTER TABLE `problem` DISABLE KEYS */;
INSERT INTO `problem` VALUES (1,0,0,13470,1523778695,297835203,NULL,0,0,NULL,NULL),(13252,3,4,25600,1516546505,403741338,NULL,0,0,NULL,NULL),(800202,3,4,25683,1522146014,89649900,NULL,0,0,NULL,NULL),(800203,3,4,25684,1522146014,89819319,NULL,0,0,NULL,NULL),(800392,3,4,25687,1522308868,593242011,NULL,0,0,NULL,NULL),(800393,3,4,25688,1522308867,590188396,NULL,0,0,NULL,NULL),(800395,3,4,25685,1522309741,106284000,NULL,0,0,NULL,NULL),(800396,3,4,25686,1522309741,106328756,NULL,0,0,NULL,NULL),(800502,3,4,25689,1522388178,599982649,NULL,0,0,NULL,NULL),(800503,3,4,25690,1522388178,609824972,NULL,0,0,NULL,NULL),(801689,3,4,25691,1523429831,192265090,NULL,0,0,NULL,NULL),(801690,3,4,25692,1523429831,192219531,NULL,0,0,NULL,NULL),(801699,3,4,25693,1523435360,325814700,NULL,0,0,NULL,NULL),(801700,3,4,25694,1523435360,325861224,NULL,0,0,NULL,NULL),(801789,3,4,25695,1523515880,308206619,NULL,0,0,NULL,NULL),(801790,3,4,25696,1523515880,308256811,NULL,0,0,NULL,NULL),(801795,3,4,25697,1523518466,530428704,NULL,0,0,NULL,NULL),(801796,3,4,25698,1523518466,530384836,NULL,0,0,NULL,NULL),(801797,3,4,25699,1523520571,524001434,NULL,0,0,NULL,NULL),(801798,3,4,25700,1523520571,524063098,NULL,0,0,NULL,NULL),(801803,3,4,25701,1523523394,136647367,NULL,0,0,NULL,NULL),(801804,3,4,25702,1523523394,136784468,NULL,0,0,NULL,NULL),(801809,0,0,13638,1523524958,120231489,NULL,0,0,NULL,NULL),(801810,0,0,13639,1523524958,120995168,NULL,0,0,NULL,NULL),(801815,3,4,25703,1523531388,36010867,NULL,0,0,NULL,NULL),(801816,3,4,25704,1523531388,36060381,NULL,0,0,NULL,NULL),(801893,3,4,25705,1523598587,691710918,NULL,0,0,NULL,NULL),(801894,3,4,25706,1523598587,691590376,NULL,0,0,NULL,NULL),(801899,3,4,25707,1523602792,756981844,NULL,0,0,NULL,NULL),(801900,3,4,25708,1523602792,757137154,NULL,0,0,NULL,NULL),(801913,3,4,25709,1523611390,124986469,NULL,0,0,NULL,NULL),(801914,3,4,25710,1523611390,125033770,NULL,0,0,NULL,NULL),(802095,3,4,23254,1523768974,210875602,NULL,0,0,NULL,NULL),(802096,3,0,13469,1523768974,210875602,NULL,0,0,NULL,NULL),(802097,0,0,13486,1523770071,484005086,NULL,0,0,NULL,NULL);
/*!40000 ALTER TABLE `problem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `problem_tag`
--

DROP TABLE IF EXISTS `problem_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `problem_tag` (
  `problemtagid` bigint(20) unsigned NOT NULL,
  `eventid` bigint(20) unsigned NOT NULL,
  `tag` varchar(255) NOT NULL DEFAULT '',
  `value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`problemtagid`),
  KEY `problem_tag_1` (`eventid`),
  KEY `problem_tag_2` (`tag`,`value`),
  CONSTRAINT `c_problem_tag_1` FOREIGN KEY (`eventid`) REFERENCES `problem` (`eventid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `problem_tag`
--

LOCK TABLES `problem_tag` WRITE;
/*!40000 ALTER TABLE `problem_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `problem_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profiles`
--

DROP TABLE IF EXISTS `profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profiles` (
  `profileid` bigint(20) unsigned NOT NULL,
  `userid` bigint(20) unsigned NOT NULL,
  `idx` varchar(96) NOT NULL DEFAULT '',
  `idx2` bigint(20) unsigned NOT NULL DEFAULT '0',
  `value_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `value_int` int(11) NOT NULL DEFAULT '0',
  `value_str` varchar(255) NOT NULL DEFAULT '',
  `source` varchar(96) NOT NULL DEFAULT '',
  `type` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`profileid`),
  KEY `profiles_1` (`userid`,`idx`,`idx2`),
  KEY `profiles_2` (`userid`,`profileid`),
  CONSTRAINT `c_profiles_1` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profiles`
--

LOCK TABLES `profiles` WRITE;
/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
INSERT INTO `profiles` VALUES (1,1,'web.problem.sort',0,0,0,'clock','',3),(2,1,'web.problem.sortorder',0,0,0,'DESC','',3),(3,1,'web.discovery.php.sort',0,0,0,'ip','',3),(4,1,'web.discovery.php.sortorder',0,0,0,'ASC','',3),(5,1,'web..druleid',0,0,0,'','',1),(6,1,'web.latest.druleid',0,0,0,'','',1),(7,1,'web.menu.login.last',0,0,0,'index.php','',3),(8,1,'web.messages',0,0,0,'0','enabled',3),(9,1,'web.messages',0,0,0,'0','triggers.recovery',3),(10,1,'web.messages',0,0,0,'a:0:{}','triggers.severities',3),(11,1,'web.menu.config.last',0,0,0,'hostgroups.php','',3),(12,1,'web.discoveryconf.php.sort',0,0,0,'name','',3),(13,1,'web.discoveryconf.php.sortorder',0,0,0,'ASC','',3),(14,1,'web.paging.lastpage',0,0,0,'hostgroups.php','',3),(15,1,'web.menu.cm.last',0,0,0,'hostinventories.php','',3),(16,1,'web.hostinventories.php.sort',0,0,0,'name','',3),(17,1,'web.hostinventories.php.sortorder',0,0,0,'ASC','',3),(18,1,'web.cm.groupid',0,0,0,'','',1),(19,1,'web.latest.groupid',0,0,0,'','',1),(20,1,'web.hostinventoriesoverview.php.sort',0,0,0,'host_count','',3),(21,1,'web.hostinventoriesoverview.php.sortorder',0,0,0,'DESC','',3),(22,1,'web.hostgroups.php.sort',0,0,0,'name','',3),(23,1,'web.hostgroups.php.sortorder',0,0,0,'ASC','',3),(24,1,'web.config.groupid',0,0,0,'','',1),(25,1,'web.hosts.php.sort',0,0,0,'name','',3),(26,1,'web.hosts.php.sortorder',0,0,0,'ASC','',3),(27,1,'web.menu.view.last',0,0,0,'latest.php','',3),(28,1,'web.view.groupid',0,0,0,'','',1),(29,1,'web.view.hostid',0,10108,0,'','',1),(30,1,'web.latest.hostid',0,10108,0,'','',1),(31,1,'web.view.graphid',0,580,0,'','',1),(32,1,'web.latest.graphid',0,580,0,'','',1),(33,1,'web.screens.period',524,0,21600,'','',2),(34,1,'web.screens.stime',524,0,0,'20180121163733','',3),(35,1,'web.screens.isnow',524,0,1,'','',2),(36,1,'web.screens.graphid',0,580,0,'','',1),(37,1,'web.screens.period',525,0,3600,'','',2),(38,1,'web.screens.stime',525,0,0,'20180121204855','',3),(39,1,'web.screens.isnow',525,0,1,'','',2),(40,1,'web.screenconf.config',0,0,0,'','',2),(41,1,'web.screenconf.php.sort',0,0,0,'name','',3),(42,1,'web.screenconf.php.sortorder',0,0,0,'ASC','',3),(43,1,'web.menu.reports.last',0,0,0,'report4.php','',3),(44,1,'web.avail_report.mode',0,0,0,'','',2),(45,1,'web.avail_report.0.groupid',0,0,0,'','',1),(46,1,'web.avail_report.0.timesince',0,0,0,'0','',3),(47,1,'web.avail_report.0.timetill',0,0,0,'0','',3),(48,1,'web.avail_report.0.hostid',0,0,0,'','',1),(49,1,'web.correlation.php.sort',0,0,0,'name','',3),(50,1,'web.correlation.php.sortorder',0,0,0,'ASC','',3),(51,1,'web.screens.period',523,0,3600,'','',2),(52,1,'web.screens.stime',523,0,0,'20180121211445','',3),(53,1,'web.screens.isnow',523,0,1,'','',2),(54,1,'web.sysmaps.php.sort',0,0,0,'name','',3),(55,1,'web.sysmaps.php.sortorder',0,0,0,'ASC','',3),(56,1,'web.screens.period',534,0,7200,'','',2),(57,1,'web.screens.stime',534,0,0,'20180121090521','',3),(58,1,'web.screens.isnow',534,0,1,'','',2),(59,1,'web.tr_status.php.sort',0,0,0,'lastchange','',3),(60,1,'web.tr_status.php.sortorder',0,0,0,'DESC','',3),(61,1,'web.latest.php.sort',0,0,0,'name','',3),(62,1,'web.latest.php.sortorder',0,0,0,'ASC','',3),(63,1,'web.actionconf.php.sort',0,0,0,'name','',3),(64,1,'web.actionconf.php.sortorder',0,0,0,'ASC','',3),(65,1,'web.maintenance.php.sort',0,0,0,'name','',3),(66,1,'web.maintenance.php.sortorder',0,0,0,'ASC','',3),(67,1,'web.screens.period',526,0,3600,'','',2),(68,1,'web.screens.stime',526,0,0,'20180121100539','',3),(69,1,'web.screens.isnow',526,0,1,'','',2),(70,1,'web.httpmon.php.sort',0,0,0,'name','',3),(71,1,'web.httpmon.php.sortorder',0,0,0,'ASC','',3),(72,1,'web..groupid',0,0,0,'','',1),(73,1,'web.maps.sysmapid',0,1,0,'','',1),(74,1,'web.screens.period',519,0,3600,'','',2),(75,1,'web.screens.stime',519,0,0,'20180121080558','',3),(76,1,'web.screens.isnow',519,0,1,'','',2),(77,1,'web.screens.period',518,0,3600,'','',2),(78,1,'web.screens.stime',518,0,0,'20180120214355','',3),(79,1,'web.screens.isnow',518,0,1,'','',2),(80,1,'web.screens.period',517,0,3600,'','',2),(81,1,'web.screens.stime',517,0,0,'20180121080553','',3),(82,1,'web.screens.isnow',517,0,1,'','',2),(83,1,'web.scripts.php.sort',0,0,0,'name','',3),(84,1,'web.scripts.php.sortorder',0,0,0,'ASC','',3),(85,1,'web.media_type.php.sort',0,0,0,'description','',3),(86,1,'web.media_types.php.sortorder',0,0,0,'ASC','',3),(87,1,'web.menu.admin.last',0,0,0,'queue.php','',3),(88,1,'web.usergrps.php.sort',0,0,0,'name','',3),(89,1,'web.usergrps.php.sortorder',0,0,0,'ASC','',3),(90,1,'web.proxies.php.sort',0,0,0,'host','',3),(91,1,'web.proxies.php.sortorder',0,0,0,'ASC','',3),(92,1,'web.screens.period',548,0,3600,'','',2),(93,1,'web.screens.stime',548,0,0,'20180121100929','',3),(94,1,'web.screens.isnow',548,0,1,'','',2),(95,1,'web.screens.period',547,0,43200,'','',2),(96,1,'web.screens.stime',547,0,0,'20180121095112','',3),(97,1,'web.screens.isnow',547,0,1,'','',2),(98,1,'web.users.filter.usrgrpid',0,0,0,'','',1),(99,1,'web.users.php.sort',0,0,0,'alias','',3),(100,1,'web.users.php.sortorder',0,0,0,'ASC','',3),(101,1,'web.screens.period',528,0,3600,'','',2),(102,1,'web.screens.stime',528,0,0,'20180312124745','',3),(103,1,'web.screens.isnow',528,0,1,'','',2),(104,1,'web.screens.period',520,0,3600,'','',2),(105,1,'web.screens.stime',520,0,0,'20180413164637','',3),(106,1,'web.screens.isnow',520,0,1,'','',2),(107,1,'web.screens.period',550,0,3600,'','',2),(108,1,'web.screens.stime',550,0,0,'20180121211443','',3),(109,1,'web.screens.isnow',550,0,1,'','',2),(110,1,'web.screens.period',551,0,3600,'','',2),(111,1,'web.screens.stime',551,0,0,'20180121205110','',3),(112,1,'web.screens.isnow',551,0,1,'','',2),(113,1,'web.screens.period',549,0,3600,'','',2),(114,1,'web.screens.stime',549,0,0,'20180121100949','',3),(115,1,'web.screens.isnow',549,0,1,'','',2),(116,1,'web.templates.php.groupid',0,0,0,'','',1),(117,1,'web.templates.php.sort',0,0,0,'name','',3),(118,1,'web.templates.php.sortorder',0,0,0,'ASC','',3),(119,1,'web.host_discovery.php.sort',0,0,0,'name','',3),(120,1,'web.host_discovery.php.sortorder',0,0,0,'ASC','',3),(121,1,'web.reports.groupid',0,1,0,'','',1),(122,1,'web.screens.period',555,0,3600,'','',2),(123,1,'web.screens.stime',555,0,0,'20180121205906','',3),(124,1,'web.screens.isnow',555,0,1,'','',2),(125,1,'web.screens.period',556,0,3600,'','',2),(126,1,'web.screens.stime',556,0,0,'20180121205559','',3),(127,1,'web.screens.isnow',556,0,1,'','',2),(128,1,'web.config.hostid',0,10105,0,'','',1),(129,1,'web.graphs.php.sort',0,0,0,'name','',3),(130,1,'web.graphs.php.sortorder',0,0,0,'ASC','',3),(131,1,'web.items.filter_groupid',0,0,0,'','',1),(132,1,'web.items.filter_hostid',0,10108,0,'','',1),(133,1,'web.items.filter_application',0,0,0,'','',3),(134,1,'web.items.filter_name',0,0,0,'','',3),(135,1,'web.items.filter_type',0,0,-1,'','',2),(136,1,'web.items.filter_key',0,0,0,'','',3),(137,1,'web.items.filter_snmp_community',0,0,0,'','',3),(138,1,'web.items.filter_snmpv3_securityname',0,0,0,'','',3),(139,1,'web.items.filter_snmp_oid',0,0,0,'','',3),(140,1,'web.items.filter_port',0,0,0,'','',3),(141,1,'web.items.filter_value_type',0,0,-1,'','',2),(142,1,'web.items.filter_data_type',0,0,-1,'','',2),(146,1,'web.items.filter_status',0,0,-1,'','',2),(147,1,'web.items.filter_state',0,0,-1,'','',2),(148,1,'web.items.filter_templated_items',0,0,-1,'','',2),(149,1,'web.items.filter_with_triggers',0,0,-1,'','',2),(150,1,'web.items.filter_ipmi_sensor',0,0,0,'','',3),(151,1,'web.items.subfilter_apps',0,0,0,'','',3),(152,1,'web.items.subfilter_types',0,0,0,'','',3),(153,1,'web.items.subfilter_value_types',0,0,0,'','',3),(154,1,'web.items.subfilter_status',0,0,0,'','',3),(155,1,'web.items.subfilter_state',0,0,0,'','',3),(156,1,'web.items.subfilter_templated_items',0,0,0,'','',3),(157,1,'web.items.subfilter_with_triggers',0,0,0,'','',3),(158,1,'web.items.subfilter_hosts',0,0,0,'','',3),(162,1,'web.items.php.sort',0,0,0,'name','',3),(163,1,'web.items.php.sortorder',0,0,0,'ASC','',3),(164,1,'web.screens.period',554,0,3600,'','',2),(165,1,'web.screens.stime',554,0,0,'20180121205903','',3),(166,1,'web.screens.isnow',554,0,1,'','',2),(167,1,'web.screens.period',557,0,3600,'','',2),(168,1,'web.screens.stime',557,0,0,'20180121203447','',3),(169,1,'web.screens.isnow',557,0,1,'','',2),(170,1,'web.screens.period',558,0,3600,'','',2),(171,1,'web.screens.stime',558,0,0,'20180121203452','',3),(172,1,'web.screens.isnow',558,0,1,'','',2),(173,1,'web.applications.php.sort',0,0,0,'name','',3),(174,1,'web.applications.php.sortorder',0,0,0,'ASC','',3),(175,1,'web.screens.period',569,0,3600,'','',2),(176,1,'web.screens.stime',569,0,0,'20180307084025','',3),(177,1,'web.screens.isnow',569,0,1,'','',2),(178,1,'web.screens.period',568,0,3600,'','',2),(179,1,'web.screens.stime',568,0,0,'20180308103124','',3),(180,1,'web.screens.isnow',568,0,1,'','',2),(181,1,'web.triggers.php.sort',0,0,0,'description','',3),(182,1,'web.triggers.php.sortorder',0,0,0,'ASC','',3),(183,1,'web.screens.period',570,0,3600,'','',2),(184,1,'web.screens.stime',570,0,0,'20180307084030','',3),(185,1,'web.screens.isnow',570,0,1,'','',2),(186,1,'web.screens.period',572,0,21600,'','',2),(187,1,'web.screens.stime',572,0,0,'20180121163751','',3),(188,1,'web.screens.isnow',572,0,1,'','',2),(189,1,'web.disc_prototypes.php.sort',0,0,0,'name','',3),(190,1,'web.disc_prototypes.php.sortorder',0,0,0,'ASC','',3),(191,1,'web.screens.period',571,0,3600,'','',2),(192,1,'web.screens.stime',571,0,0,'20180307084028','',3),(193,1,'web.screens.isnow',571,0,1,'','',2),(194,1,'web.screens.period',578,0,3600,'','',2),(195,1,'web.screens.stime',578,0,0,'20180129085620','',3),(196,1,'web.screens.isnow',578,0,1,'','',2),(197,1,'web.screens.period',575,0,3600,'','',2),(198,1,'web.screens.stime',575,0,0,'20180327104200','',3),(199,1,'web.screens.isnow',575,0,1,'','',2),(200,1,'web.screens.period',576,0,21600,'','',2),(201,1,'web.screens.stime',576,0,0,'20180413050237','',3),(202,1,'web.screens.isnow',576,0,1,'','',2),(203,1,'web.screens.period',577,0,3600,'','',2),(204,1,'web.screens.stime',577,0,0,'20180328094847','',3),(205,1,'web.screens.isnow',577,0,1,'','',2),(206,1,'web.paging.page',0,0,1,'','',2),(207,1,'web.screens.period',580,0,86400,'','',2),(208,1,'web.screens.stime',580,0,0,'20180413070036','',3),(209,1,'web.screens.isnow',580,0,1,'','',2),(210,1,'web.screens.period',582,0,3600,'','',2),(211,1,'web.screens.stime',582,0,0,'20180129214346','',3),(212,1,'web.screens.isnow',582,0,1,'','',2),(213,1,'web.screens.period',581,0,3600,'','',2),(214,1,'web.screens.stime',581,0,0,'20180207165643','',3),(215,1,'web.screens.isnow',581,0,1,'','',2),(216,1,'web.screens.period',589,0,3600,'','',2),(217,1,'web.screens.stime',589,0,0,'20180413164647','',3),(218,1,'web.screens.isnow',589,0,1,'','',2),(219,1,'web.screens.period',587,0,21600,'','',2),(220,1,'web.screens.stime',587,0,0,'20180413122346','',3),(221,1,'web.screens.isnow',587,0,1,'','',2),(222,1,'web.screens.period',591,0,10800,'','',2),(223,1,'web.screens.stime',591,0,0,'20180415073107','',3),(224,1,'web.screens.isnow',591,0,1,'','',2),(225,1,'web.screens.period',590,0,3600,'','',2),(226,1,'web.screens.stime',590,0,0,'20180413164459','',3),(227,1,'web.screens.isnow',590,0,1,'','',2),(228,1,'web.screens.period',588,0,3600,'','',2),(229,1,'web.screens.stime',588,0,0,'20180307084045','',3),(230,1,'web.screens.isnow',588,0,1,'','',2),(231,1,'web.queue.config',0,0,0,'','',2),(232,1,'web.screens.period',583,0,3600,'','',2),(233,1,'web.screens.stime',583,0,0,'20180122085551','',3),(234,1,'web.screens.isnow',583,0,1,'','',2),(235,1,'web.screens.period',592,0,3600,'','',2),(236,1,'web.screens.stime',592,0,0,'20180307084050','',3),(237,1,'web.screens.isnow',592,0,1,'','',2),(238,1,'web.screens.period',595,0,3600,'','',2),(239,1,'web.screens.stime',595,0,0,'20180326101520','',3),(240,1,'web.screens.isnow',595,0,1,'','',2),(241,1,'web.screens.period',598,0,3600,'','',2),(242,1,'web.screens.stime',598,0,0,'20180330150012','',3),(243,1,'web.screens.isnow',598,0,1,'','',2),(244,1,'web.screens.period',603,0,10800,'','',2),(245,1,'web.screens.stime',603,0,0,'20180414043755','',3),(246,1,'web.screens.isnow',603,0,1,'','',2),(247,1,'web.screens.period',599,0,10800,'','',2),(248,1,'web.screens.stime',599,0,0,'20180405052554','',3),(249,1,'web.screens.isnow',599,0,1,'','',2),(250,1,'web.screens.period',604,0,3600,'','',2),(251,1,'web.screens.stime',604,0,0,'20180328091128','',3),(252,1,'web.screens.isnow',604,0,1,'','',2),(253,1,'web.screens.period',600,0,3600,'','',2),(254,1,'web.screens.stime',600,0,0,'20180330150016','',3),(255,1,'web.screens.isnow',600,0,1,'','',2),(256,1,'web.screens.period',602,0,3600,'','',2),(257,1,'web.screens.stime',602,0,0,'20180327130552','',3),(258,1,'web.screens.isnow',602,0,1,'','',2),(259,1,'web.screens.period',606,0,3600,'','',2),(260,1,'web.screens.stime',606,0,0,'20180327104319','',3),(261,1,'web.screens.isnow',606,0,1,'','',2),(262,1,'web.screens.period',605,0,10800,'','',2),(263,1,'web.screens.stime',605,0,0,'20180327121841','',3),(264,1,'web.screens.isnow',605,0,1,'','',2),(265,1,'web.screens.period',608,0,3600,'','',2),(266,1,'web.screens.stime',608,0,0,'20180328091144','',3),(267,1,'web.screens.isnow',608,0,1,'','',2),(268,1,'web.screens.period',611,0,3600,'','',2),(269,1,'web.screens.stime',611,0,0,'20180330125148','',3),(270,1,'web.screens.isnow',611,0,1,'','',2),(271,1,'web.screens.period',610,0,3600,'','',2),(272,1,'web.screens.stime',610,0,0,'20180330125152','',3),(273,1,'web.screens.isnow',610,0,1,'','',2),(274,1,'web.login.attempt.failed',0,0,0,'','',2),(275,1,'web.login.attempt.ip',0,0,0,'192.168.56.1','',3),(276,1,'web.login.attempt.clock',0,0,1523768958,'','',2),(277,1,'web.screens.period',579,0,3600,'','',2),(278,1,'web.screens.stime',579,0,0,'20180413164326','',3),(279,1,'web.screens.isnow',579,0,1,'','',2),(280,1,'web.screens.period',614,0,3600,'','',2),(281,1,'web.screens.stime',614,0,0,'20180413145719','',3),(282,1,'web.screens.isnow',614,0,1,'','',2),(283,1,'web.screens.period',601,0,3600,'','',2),(284,1,'web.screens.stime',601,0,0,'20180413164649','',3),(285,1,'web.screens.isnow',601,0,1,'','',2),(286,1,'web.screens.period',625,0,21600,'','',2),(287,1,'web.screens.stime',625,0,0,'20180414065009','',3),(288,1,'web.screens.isnow',625,0,1,'','',2),(289,1,'web.screens.period',630,0,10800,'','',2),(290,1,'web.screens.stime',630,0,0,'20180415072314','',3),(291,1,'web.screens.isnow',630,0,1,'','',2),(292,1,'web.screens.period',627,0,3600,'','',2),(293,1,'web.screens.stime',627,0,0,'20180413165514','',3),(294,1,'web.screens.isnow',627,0,1,'','',2),(295,1,'web.screens.period',626,0,3600,'','',2),(296,1,'web.screens.stime',626,0,0,'20180413193847','',3),(297,1,'web.screens.isnow',626,0,1,'','',2),(298,1,'web.screens.period',631,0,3600,'','',2),(299,1,'web.screens.stime',631,0,0,'20180413192038','',3),(300,1,'web.screens.isnow',631,0,1,'','',2),(301,1,'web.screens.period',624,0,3600,'','',2),(302,1,'web.screens.stime',624,0,0,'20180413172320','',3),(303,1,'web.screens.isnow',624,0,1,'','',2),(304,1,'web.screens.period',20,0,10800,'','',2),(305,1,'web.screens.stime',20,0,0,'20180413151441','',3),(306,1,'web.screens.isnow',20,0,1,'','',2),(307,1,'web.screens.period',628,0,3600,'','',2),(308,1,'web.screens.stime',628,0,0,'20180413202416','',3),(309,1,'web.screens.isnow',628,0,1,'','',2),(310,1,'web.dashbrd.dashboardid',0,1,0,'','',1),(311,1,'web.dashbrd.period',1,0,3600,'','',2),(312,1,'web.dashbrd.stime',1,0,0,'20180415150646','',3),(313,1,'web.dashbrd.isnow',1,0,1,'','',2),(314,1,'web.graphs.period',580,0,604800,'','',2),(315,1,'web.graphs.stime',580,0,0,'20180408131243','',3),(316,1,'web.graphs.isnow',580,0,1,'','',2),(317,1,'web.auditacts.timeline.period',0,0,63072000,'','',2),(318,1,'web.auditacts.timeline.stime',0,0,0,'20160415155813','',3),(319,1,'web.auditacts.timeline.isnow',0,0,1,'','',2),(320,1,'web.auditlogs.timeline.period',0,0,7321405,'','',2),(321,1,'web.auditlogs.timeline.stime',0,0,0,'20180120221117','',3),(322,1,'web.auditlogs.timeline.isnow',0,0,1,'','',2),(323,1,'web.auditlogs.filter.alias',0,0,0,'Admin','',3),(324,1,'web.auditlogs.filter.action',0,0,-1,'','',2),(325,1,'web.auditlogs.filter.resourcetype',0,0,-1,'','',2);
/*!40000 ALTER TABLE `profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proxy_autoreg_host`
--

DROP TABLE IF EXISTS `proxy_autoreg_host`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proxy_autoreg_host` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `clock` int(11) NOT NULL DEFAULT '0',
  `host` varchar(64) NOT NULL DEFAULT '',
  `listen_ip` varchar(39) NOT NULL DEFAULT '',
  `listen_port` int(11) NOT NULL DEFAULT '0',
  `listen_dns` varchar(64) NOT NULL DEFAULT '',
  `host_metadata` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `proxy_autoreg_host_1` (`clock`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proxy_autoreg_host`
--

LOCK TABLES `proxy_autoreg_host` WRITE;
/*!40000 ALTER TABLE `proxy_autoreg_host` DISABLE KEYS */;
/*!40000 ALTER TABLE `proxy_autoreg_host` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proxy_dhistory`
--

DROP TABLE IF EXISTS `proxy_dhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proxy_dhistory` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `clock` int(11) NOT NULL DEFAULT '0',
  `druleid` bigint(20) unsigned NOT NULL,
  `ip` varchar(39) NOT NULL DEFAULT '',
  `port` int(11) NOT NULL DEFAULT '0',
  `value` varchar(255) NOT NULL DEFAULT '',
  `status` int(11) NOT NULL DEFAULT '0',
  `dcheckid` bigint(20) unsigned DEFAULT NULL,
  `dns` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `proxy_dhistory_1` (`clock`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proxy_dhistory`
--

LOCK TABLES `proxy_dhistory` WRITE;
/*!40000 ALTER TABLE `proxy_dhistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `proxy_dhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proxy_history`
--

DROP TABLE IF EXISTS `proxy_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proxy_history` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `itemid` bigint(20) unsigned NOT NULL,
  `clock` int(11) NOT NULL DEFAULT '0',
  `timestamp` int(11) NOT NULL DEFAULT '0',
  `source` varchar(64) NOT NULL DEFAULT '',
  `severity` int(11) NOT NULL DEFAULT '0',
  `value` longtext NOT NULL,
  `logeventid` int(11) NOT NULL DEFAULT '0',
  `ns` int(11) NOT NULL DEFAULT '0',
  `state` int(11) NOT NULL DEFAULT '0',
  `lastlogsize` bigint(20) unsigned NOT NULL DEFAULT '0',
  `mtime` int(11) NOT NULL DEFAULT '0',
  `flags` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `proxy_history_1` (`clock`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proxy_history`
--

LOCK TABLES `proxy_history` WRITE;
/*!40000 ALTER TABLE `proxy_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `proxy_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `regexps`
--

DROP TABLE IF EXISTS `regexps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `regexps` (
  `regexpid` bigint(20) unsigned NOT NULL,
  `name` varchar(128) NOT NULL DEFAULT '',
  `test_string` text NOT NULL,
  PRIMARY KEY (`regexpid`),
  UNIQUE KEY `regexps_1` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regexps`
--

LOCK TABLES `regexps` WRITE;
/*!40000 ALTER TABLE `regexps` DISABLE KEYS */;
INSERT INTO `regexps` VALUES (1,'File systems for discovery','ext3'),(2,'Network interfaces for discovery','eth0'),(3,'Storage devices for SNMP discovery','/boot'),(4,'Windows service names for discovery','SysmonLog'),(5,'Windows service startup states for discovery','automatic');
/*!40000 ALTER TABLE `regexps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rights`
--

DROP TABLE IF EXISTS `rights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rights` (
  `rightid` bigint(20) unsigned NOT NULL,
  `groupid` bigint(20) unsigned NOT NULL,
  `permission` int(11) NOT NULL DEFAULT '0',
  `id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`rightid`),
  KEY `rights_1` (`groupid`),
  KEY `rights_2` (`id`),
  CONSTRAINT `c_rights_1` FOREIGN KEY (`groupid`) REFERENCES `usrgrp` (`usrgrpid`) ON DELETE CASCADE,
  CONSTRAINT `c_rights_2` FOREIGN KEY (`id`) REFERENCES `groups` (`groupid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rights`
--

LOCK TABLES `rights` WRITE;
/*!40000 ALTER TABLE `rights` DISABLE KEYS */;
/*!40000 ALTER TABLE `rights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `screen_user`
--

DROP TABLE IF EXISTS `screen_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screen_user` (
  `screenuserid` bigint(20) unsigned NOT NULL,
  `screenid` bigint(20) unsigned NOT NULL,
  `userid` bigint(20) unsigned NOT NULL,
  `permission` int(11) NOT NULL DEFAULT '2',
  PRIMARY KEY (`screenuserid`),
  UNIQUE KEY `screen_user_1` (`screenid`,`userid`),
  KEY `c_screen_user_2` (`userid`),
  CONSTRAINT `c_screen_user_1` FOREIGN KEY (`screenid`) REFERENCES `screens` (`screenid`) ON DELETE CASCADE,
  CONSTRAINT `c_screen_user_2` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `screen_user`
--

LOCK TABLES `screen_user` WRITE;
/*!40000 ALTER TABLE `screen_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `screen_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `screen_usrgrp`
--

DROP TABLE IF EXISTS `screen_usrgrp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screen_usrgrp` (
  `screenusrgrpid` bigint(20) unsigned NOT NULL,
  `screenid` bigint(20) unsigned NOT NULL,
  `usrgrpid` bigint(20) unsigned NOT NULL,
  `permission` int(11) NOT NULL DEFAULT '2',
  PRIMARY KEY (`screenusrgrpid`),
  UNIQUE KEY `screen_usrgrp_1` (`screenid`,`usrgrpid`),
  KEY `c_screen_usrgrp_2` (`usrgrpid`),
  CONSTRAINT `c_screen_usrgrp_1` FOREIGN KEY (`screenid`) REFERENCES `screens` (`screenid`) ON DELETE CASCADE,
  CONSTRAINT `c_screen_usrgrp_2` FOREIGN KEY (`usrgrpid`) REFERENCES `usrgrp` (`usrgrpid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `screen_usrgrp`
--

LOCK TABLES `screen_usrgrp` WRITE;
/*!40000 ALTER TABLE `screen_usrgrp` DISABLE KEYS */;
/*!40000 ALTER TABLE `screen_usrgrp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `screens`
--

DROP TABLE IF EXISTS `screens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screens` (
  `screenid` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `hsize` int(11) NOT NULL DEFAULT '1',
  `vsize` int(11) NOT NULL DEFAULT '1',
  `templateid` bigint(20) unsigned DEFAULT NULL,
  `userid` bigint(20) unsigned DEFAULT NULL,
  `private` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`screenid`),
  KEY `screens_1` (`templateid`),
  KEY `c_screens_3` (`userid`),
  CONSTRAINT `c_screens_1` FOREIGN KEY (`templateid`) REFERENCES `hosts` (`hostid`) ON DELETE CASCADE,
  CONSTRAINT `c_screens_3` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `screens`
--

LOCK TABLES `screens` WRITE;
/*!40000 ALTER TABLE `screens` DISABLE KEYS */;
INSERT INTO `screens` VALUES (3,'System performance',2,3,10001,NULL,0),(4,'Zabbix server health',2,3,10047,NULL,0),(5,'System performance',2,2,10076,NULL,0),(6,'System performance',2,2,10077,NULL,0),(7,'System performance',2,2,10075,NULL,0),(9,'System performance',2,3,10074,NULL,0),(10,'System performance',2,3,10078,NULL,0),(15,'MySQL performance',2,1,10073,NULL,0),(16,'Zabbix server',2,2,NULL,1,0),(17,'Zabbix proxy health',2,2,10048,NULL,0),(18,'System performance',1,2,10079,NULL,0),(19,'System performance',2,2,10081,NULL,0),(20,'System performance',2,3,10107,NULL,0);
/*!40000 ALTER TABLE `screens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `screens_items`
--

DROP TABLE IF EXISTS `screens_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screens_items` (
  `screenitemid` bigint(20) unsigned NOT NULL,
  `screenid` bigint(20) unsigned NOT NULL,
  `resourcetype` int(11) NOT NULL DEFAULT '0',
  `resourceid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `width` int(11) NOT NULL DEFAULT '320',
  `height` int(11) NOT NULL DEFAULT '200',
  `x` int(11) NOT NULL DEFAULT '0',
  `y` int(11) NOT NULL DEFAULT '0',
  `colspan` int(11) NOT NULL DEFAULT '1',
  `rowspan` int(11) NOT NULL DEFAULT '1',
  `elements` int(11) NOT NULL DEFAULT '25',
  `valign` int(11) NOT NULL DEFAULT '0',
  `halign` int(11) NOT NULL DEFAULT '0',
  `style` int(11) NOT NULL DEFAULT '0',
  `url` varchar(255) NOT NULL DEFAULT '',
  `dynamic` int(11) NOT NULL DEFAULT '0',
  `sort_triggers` int(11) NOT NULL DEFAULT '0',
  `application` varchar(255) NOT NULL DEFAULT '',
  `max_columns` int(11) NOT NULL DEFAULT '3',
  PRIMARY KEY (`screenitemid`),
  KEY `screens_items_1` (`screenid`),
  CONSTRAINT `c_screens_items_1` FOREIGN KEY (`screenid`) REFERENCES `screens` (`screenid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `screens_items`
--

LOCK TABLES `screens_items` WRITE;
/*!40000 ALTER TABLE `screens_items` DISABLE KEYS */;
INSERT INTO `screens_items` VALUES (20,3,0,433,500,120,0,0,1,1,0,1,0,0,'',0,0,'',3),(22,3,0,387,500,148,1,0,1,1,0,1,0,0,'',0,0,'',3),(24,4,0,392,500,212,0,0,1,1,0,1,0,0,'',0,0,'',3),(25,4,0,404,500,100,1,0,1,1,0,1,0,0,'',0,0,'',3),(26,4,0,406,555,114,0,1,1,1,0,1,0,0,'',0,0,'',3),(27,4,0,410,500,128,1,1,1,1,0,1,0,0,'',0,0,'',3),(28,5,0,469,500,148,0,0,1,1,0,1,0,0,'',0,0,'',3),(30,6,0,475,500,114,0,0,1,1,0,1,0,0,'',0,0,'',3),(31,6,0,474,500,100,1,0,1,1,0,1,0,0,'',0,0,'',3),(32,7,0,463,500,120,0,0,1,1,0,1,0,0,'',0,0,'',3),(33,7,0,462,500,106,1,0,1,1,0,1,0,0,'',0,0,'',3),(36,9,0,457,500,120,0,0,1,1,0,1,0,0,'',0,0,'',3),(37,9,0,456,500,106,1,0,1,1,0,1,0,0,'',0,0,'',3),(40,10,0,481,500,114,0,0,1,1,0,1,0,0,'',0,0,'',3),(41,10,0,480,500,100,1,0,1,1,0,1,0,0,'',0,0,'',3),(42,15,0,454,500,200,0,0,1,1,0,1,0,0,'',0,0,'',3),(43,15,0,455,500,270,1,0,1,1,0,1,0,0,'',0,0,'',3),(44,16,2,1,500,100,0,0,2,1,0,0,0,0,'',0,0,'',3),(47,4,0,527,500,160,0,2,2,1,0,0,0,0,'',0,0,'',3),(48,17,0,532,500,212,0,0,1,1,0,1,0,0,'',0,0,'',3),(49,17,0,530,500,100,1,0,1,1,0,1,0,0,'',0,0,'',3),(50,17,0,531,500,100,0,1,1,1,0,1,0,0,'',0,0,'',3),(51,17,0,529,500,128,1,1,1,1,0,1,0,0,'',0,0,'',3),(52,9,0,544,500,100,0,1,1,1,0,0,0,0,'',0,0,'',3),(53,5,0,471,500,100,1,0,1,1,0,0,0,0,'',0,0,'',3),(54,5,0,498,500,100,0,1,1,1,0,0,0,0,'',0,0,'',3),(55,5,0,540,500,100,1,1,1,1,0,0,0,0,'',0,0,'',3),(56,7,0,541,500,100,0,1,1,1,0,0,0,0,'',0,0,'',3),(57,7,0,464,500,300,1,1,1,1,0,0,0,0,'',0,0,'',3),(58,6,0,542,500,100,0,1,1,1,0,0,0,0,'',0,0,'',3),(59,3,0,533,500,100,0,1,1,1,0,0,0,0,'',0,0,'',3),(60,3,0,436,500,300,1,1,1,1,0,0,0,0,'',0,0,'',3),(61,3,1,10009,500,100,0,2,1,1,0,0,0,0,'',0,0,'',3),(62,3,1,10013,500,100,1,2,1,1,0,0,0,0,'',0,0,'',3),(63,18,0,487,500,100,0,0,1,1,0,0,0,0,'',0,0,'',3),(64,18,0,543,500,100,0,1,1,1,0,0,0,0,'',0,0,'',3),(65,9,0,458,500,300,1,1,1,1,0,0,0,0,'',0,0,'',3),(66,9,1,22838,500,100,0,2,1,1,0,0,0,0,'',0,0,'',3),(67,9,1,22837,500,100,1,2,1,1,0,0,0,0,'',0,0,'',3),(68,10,0,545,500,100,0,1,1,1,0,0,0,0,'',0,0,'',3),(69,10,0,482,500,300,1,1,1,1,0,0,0,0,'',0,0,'',3),(70,10,1,22998,500,100,0,2,1,1,0,0,0,0,'',0,0,'',3),(71,10,1,22997,500,100,1,2,1,1,0,0,0,0,'',0,0,'',3),(72,19,0,495,500,100,0,0,1,1,0,0,0,0,'',0,0,'',3),(73,19,0,546,500,100,1,0,1,1,0,0,0,0,'',0,0,'',3),(74,19,1,23140,500,100,0,1,1,1,0,0,0,0,'',0,0,'',3),(75,19,1,23138,500,100,1,1,1,1,0,0,0,0,'',0,0,'',3),(76,20,0,560,500,120,0,0,1,1,0,1,0,0,'',0,0,'',3),(77,20,0,561,500,148,1,0,1,1,0,1,0,0,'',0,0,'',3),(78,20,0,563,500,100,0,1,1,1,0,0,0,0,'',0,0,'',3),(79,20,0,562,500,300,1,1,1,1,0,0,0,0,'',0,0,'',3),(80,20,1,25432,500,100,0,2,1,1,0,0,0,0,'',0,0,'',3),(81,20,1,25431,500,100,1,2,1,1,0,0,0,0,'',0,0,'',3);
/*!40000 ALTER TABLE `screens_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scripts`
--

DROP TABLE IF EXISTS `scripts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scripts` (
  `scriptid` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `command` varchar(255) NOT NULL DEFAULT '',
  `host_access` int(11) NOT NULL DEFAULT '2',
  `usrgrpid` bigint(20) unsigned DEFAULT NULL,
  `groupid` bigint(20) unsigned DEFAULT NULL,
  `description` text NOT NULL,
  `confirmation` varchar(255) NOT NULL DEFAULT '',
  `type` int(11) NOT NULL DEFAULT '0',
  `execute_on` int(11) NOT NULL DEFAULT '2',
  PRIMARY KEY (`scriptid`),
  UNIQUE KEY `scripts_3` (`name`),
  KEY `scripts_1` (`usrgrpid`),
  KEY `scripts_2` (`groupid`),
  CONSTRAINT `c_scripts_1` FOREIGN KEY (`usrgrpid`) REFERENCES `usrgrp` (`usrgrpid`),
  CONSTRAINT `c_scripts_2` FOREIGN KEY (`groupid`) REFERENCES `groups` (`groupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scripts`
--

LOCK TABLES `scripts` WRITE;
/*!40000 ALTER TABLE `scripts` DISABLE KEYS */;
INSERT INTO `scripts` VALUES (1,'Ping','/bin/ping -c 3 {HOST.CONN}',2,NULL,NULL,'','',0,1),(2,'Traceroute','/usr/bin/traceroute {HOST.CONN}',2,NULL,NULL,'','',0,1),(3,'Detect operating system','sudo /usr/bin/nmap -O {HOST.CONN}',2,7,NULL,'','',0,1);
/*!40000 ALTER TABLE `scripts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_alarms`
--

DROP TABLE IF EXISTS `service_alarms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service_alarms` (
  `servicealarmid` bigint(20) unsigned NOT NULL,
  `serviceid` bigint(20) unsigned NOT NULL,
  `clock` int(11) NOT NULL DEFAULT '0',
  `value` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`servicealarmid`),
  KEY `service_alarms_1` (`serviceid`,`clock`),
  KEY `service_alarms_2` (`clock`),
  CONSTRAINT `c_service_alarms_1` FOREIGN KEY (`serviceid`) REFERENCES `services` (`serviceid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_alarms`
--

LOCK TABLES `service_alarms` WRITE;
/*!40000 ALTER TABLE `service_alarms` DISABLE KEYS */;
/*!40000 ALTER TABLE `service_alarms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `services` (
  `serviceid` bigint(20) unsigned NOT NULL,
  `name` varchar(128) NOT NULL DEFAULT '',
  `status` int(11) NOT NULL DEFAULT '0',
  `algorithm` int(11) NOT NULL DEFAULT '0',
  `triggerid` bigint(20) unsigned DEFAULT NULL,
  `showsla` int(11) NOT NULL DEFAULT '0',
  `goodsla` double(16,4) NOT NULL DEFAULT '99.9000',
  `sortorder` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`serviceid`),
  KEY `services_1` (`triggerid`),
  CONSTRAINT `c_services_1` FOREIGN KEY (`triggerid`) REFERENCES `triggers` (`triggerid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services_links`
--

DROP TABLE IF EXISTS `services_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `services_links` (
  `linkid` bigint(20) unsigned NOT NULL,
  `serviceupid` bigint(20) unsigned NOT NULL,
  `servicedownid` bigint(20) unsigned NOT NULL,
  `soft` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`linkid`),
  UNIQUE KEY `services_links_2` (`serviceupid`,`servicedownid`),
  KEY `services_links_1` (`servicedownid`),
  CONSTRAINT `c_services_links_1` FOREIGN KEY (`serviceupid`) REFERENCES `services` (`serviceid`) ON DELETE CASCADE,
  CONSTRAINT `c_services_links_2` FOREIGN KEY (`servicedownid`) REFERENCES `services` (`serviceid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services_links`
--

LOCK TABLES `services_links` WRITE;
/*!40000 ALTER TABLE `services_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `services_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services_times`
--

DROP TABLE IF EXISTS `services_times`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `services_times` (
  `timeid` bigint(20) unsigned NOT NULL,
  `serviceid` bigint(20) unsigned NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  `ts_from` int(11) NOT NULL DEFAULT '0',
  `ts_to` int(11) NOT NULL DEFAULT '0',
  `note` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`timeid`),
  KEY `services_times_1` (`serviceid`,`type`,`ts_from`,`ts_to`),
  CONSTRAINT `c_services_times_1` FOREIGN KEY (`serviceid`) REFERENCES `services` (`serviceid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services_times`
--

LOCK TABLES `services_times` WRITE;
/*!40000 ALTER TABLE `services_times` DISABLE KEYS */;
/*!40000 ALTER TABLE `services_times` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `sessionid` varchar(32) NOT NULL DEFAULT '',
  `userid` bigint(20) unsigned NOT NULL,
  `lastaccess` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`sessionid`),
  KEY `sessions_1` (`userid`,`status`,`lastaccess`),
  CONSTRAINT `c_sessions_1` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('b1b0128fa013e5fc87c684a5c2b12746',1,1517408224,0),('828a19f45417993cf883c2c75c452300',1,1523615382,0),('3651915e1a93b319bd5d5bf363e1b223',1,1523764562,0),('0735e8a1ae7f4d8ac4a448286c7552af',1,1523779698,0),('8641091d2dfe1ed6e288e06421ad12b3',1,1523779595,1),('213806b18dcc13317932540aad9d143e',2,1522491847,0),('4f9fc86dd14d448ba0a66e472b47e9cd',2,1522491864,0),('946fbeaf8954015a876ecf566aa44f11',2,1523768958,0),('731d166d881162bf71662c8313dc9fa6',2,1523778779,0),('a1f2c1225dedad1c7ff4be8e2ecbcc17',2,1523779069,0),('72ccb9413dfe96e4e30ca660776784f2',2,1523779595,0);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slides`
--

DROP TABLE IF EXISTS `slides`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `slides` (
  `slideid` bigint(20) unsigned NOT NULL,
  `slideshowid` bigint(20) unsigned NOT NULL,
  `screenid` bigint(20) unsigned NOT NULL,
  `step` int(11) NOT NULL DEFAULT '0',
  `delay` varchar(32) NOT NULL DEFAULT '0',
  PRIMARY KEY (`slideid`),
  KEY `slides_1` (`slideshowid`),
  KEY `slides_2` (`screenid`),
  CONSTRAINT `c_slides_1` FOREIGN KEY (`slideshowid`) REFERENCES `slideshows` (`slideshowid`) ON DELETE CASCADE,
  CONSTRAINT `c_slides_2` FOREIGN KEY (`screenid`) REFERENCES `screens` (`screenid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slides`
--

LOCK TABLES `slides` WRITE;
/*!40000 ALTER TABLE `slides` DISABLE KEYS */;
/*!40000 ALTER TABLE `slides` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slideshow_user`
--

DROP TABLE IF EXISTS `slideshow_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `slideshow_user` (
  `slideshowuserid` bigint(20) unsigned NOT NULL,
  `slideshowid` bigint(20) unsigned NOT NULL,
  `userid` bigint(20) unsigned NOT NULL,
  `permission` int(11) NOT NULL DEFAULT '2',
  PRIMARY KEY (`slideshowuserid`),
  UNIQUE KEY `slideshow_user_1` (`slideshowid`,`userid`),
  KEY `c_slideshow_user_2` (`userid`),
  CONSTRAINT `c_slideshow_user_1` FOREIGN KEY (`slideshowid`) REFERENCES `slideshows` (`slideshowid`) ON DELETE CASCADE,
  CONSTRAINT `c_slideshow_user_2` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slideshow_user`
--

LOCK TABLES `slideshow_user` WRITE;
/*!40000 ALTER TABLE `slideshow_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `slideshow_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slideshow_usrgrp`
--

DROP TABLE IF EXISTS `slideshow_usrgrp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `slideshow_usrgrp` (
  `slideshowusrgrpid` bigint(20) unsigned NOT NULL,
  `slideshowid` bigint(20) unsigned NOT NULL,
  `usrgrpid` bigint(20) unsigned NOT NULL,
  `permission` int(11) NOT NULL DEFAULT '2',
  PRIMARY KEY (`slideshowusrgrpid`),
  UNIQUE KEY `slideshow_usrgrp_1` (`slideshowid`,`usrgrpid`),
  KEY `c_slideshow_usrgrp_2` (`usrgrpid`),
  CONSTRAINT `c_slideshow_usrgrp_1` FOREIGN KEY (`slideshowid`) REFERENCES `slideshows` (`slideshowid`) ON DELETE CASCADE,
  CONSTRAINT `c_slideshow_usrgrp_2` FOREIGN KEY (`usrgrpid`) REFERENCES `usrgrp` (`usrgrpid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slideshow_usrgrp`
--

LOCK TABLES `slideshow_usrgrp` WRITE;
/*!40000 ALTER TABLE `slideshow_usrgrp` DISABLE KEYS */;
/*!40000 ALTER TABLE `slideshow_usrgrp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slideshows`
--

DROP TABLE IF EXISTS `slideshows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `slideshows` (
  `slideshowid` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `delay` varchar(32) NOT NULL DEFAULT '30s',
  `userid` bigint(20) unsigned NOT NULL,
  `private` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`slideshowid`),
  UNIQUE KEY `slideshows_1` (`name`),
  KEY `c_slideshows_3` (`userid`),
  CONSTRAINT `c_slideshows_3` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slideshows`
--

LOCK TABLES `slideshows` WRITE;
/*!40000 ALTER TABLE `slideshows` DISABLE KEYS */;
/*!40000 ALTER TABLE `slideshows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sysmap_element_trigger`
--

DROP TABLE IF EXISTS `sysmap_element_trigger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sysmap_element_trigger` (
  `selement_triggerid` bigint(20) unsigned NOT NULL,
  `selementid` bigint(20) unsigned NOT NULL,
  `triggerid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`selement_triggerid`),
  UNIQUE KEY `sysmap_element_trigger_1` (`selementid`,`triggerid`),
  KEY `c_sysmap_element_trigger_2` (`triggerid`),
  CONSTRAINT `c_sysmap_element_trigger_1` FOREIGN KEY (`selementid`) REFERENCES `sysmaps_elements` (`selementid`) ON DELETE CASCADE,
  CONSTRAINT `c_sysmap_element_trigger_2` FOREIGN KEY (`triggerid`) REFERENCES `triggers` (`triggerid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sysmap_element_trigger`
--

LOCK TABLES `sysmap_element_trigger` WRITE;
/*!40000 ALTER TABLE `sysmap_element_trigger` DISABLE KEYS */;
/*!40000 ALTER TABLE `sysmap_element_trigger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sysmap_element_url`
--

DROP TABLE IF EXISTS `sysmap_element_url`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sysmap_element_url` (
  `sysmapelementurlid` bigint(20) unsigned NOT NULL,
  `selementid` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`sysmapelementurlid`),
  UNIQUE KEY `sysmap_element_url_1` (`selementid`,`name`),
  CONSTRAINT `c_sysmap_element_url_1` FOREIGN KEY (`selementid`) REFERENCES `sysmaps_elements` (`selementid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sysmap_element_url`
--

LOCK TABLES `sysmap_element_url` WRITE;
/*!40000 ALTER TABLE `sysmap_element_url` DISABLE KEYS */;
/*!40000 ALTER TABLE `sysmap_element_url` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sysmap_shape`
--

DROP TABLE IF EXISTS `sysmap_shape`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sysmap_shape` (
  `sysmap_shapeid` bigint(20) unsigned NOT NULL,
  `sysmapid` bigint(20) unsigned NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  `x` int(11) NOT NULL DEFAULT '0',
  `y` int(11) NOT NULL DEFAULT '0',
  `width` int(11) NOT NULL DEFAULT '200',
  `height` int(11) NOT NULL DEFAULT '200',
  `text` text NOT NULL,
  `font` int(11) NOT NULL DEFAULT '9',
  `font_size` int(11) NOT NULL DEFAULT '11',
  `font_color` varchar(6) NOT NULL DEFAULT '000000',
  `text_halign` int(11) NOT NULL DEFAULT '0',
  `text_valign` int(11) NOT NULL DEFAULT '0',
  `border_type` int(11) NOT NULL DEFAULT '0',
  `border_width` int(11) NOT NULL DEFAULT '1',
  `border_color` varchar(6) NOT NULL DEFAULT '000000',
  `background_color` varchar(6) NOT NULL DEFAULT '',
  `zindex` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`sysmap_shapeid`),
  KEY `sysmap_shape_1` (`sysmapid`),
  CONSTRAINT `c_sysmap_shape_1` FOREIGN KEY (`sysmapid`) REFERENCES `sysmaps` (`sysmapid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sysmap_shape`
--

LOCK TABLES `sysmap_shape` WRITE;
/*!40000 ALTER TABLE `sysmap_shape` DISABLE KEYS */;
INSERT INTO `sysmap_shape` VALUES (0,1,0,0,0,680,15,'{MAP.NAME}',9,11,'000000',0,0,0,0,'000000','',-1);
/*!40000 ALTER TABLE `sysmap_shape` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sysmap_url`
--

DROP TABLE IF EXISTS `sysmap_url`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sysmap_url` (
  `sysmapurlid` bigint(20) unsigned NOT NULL,
  `sysmapid` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL DEFAULT '',
  `elementtype` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`sysmapurlid`),
  UNIQUE KEY `sysmap_url_1` (`sysmapid`,`name`),
  CONSTRAINT `c_sysmap_url_1` FOREIGN KEY (`sysmapid`) REFERENCES `sysmaps` (`sysmapid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sysmap_url`
--

LOCK TABLES `sysmap_url` WRITE;
/*!40000 ALTER TABLE `sysmap_url` DISABLE KEYS */;
/*!40000 ALTER TABLE `sysmap_url` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sysmap_user`
--

DROP TABLE IF EXISTS `sysmap_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sysmap_user` (
  `sysmapuserid` bigint(20) unsigned NOT NULL,
  `sysmapid` bigint(20) unsigned NOT NULL,
  `userid` bigint(20) unsigned NOT NULL,
  `permission` int(11) NOT NULL DEFAULT '2',
  PRIMARY KEY (`sysmapuserid`),
  UNIQUE KEY `sysmap_user_1` (`sysmapid`,`userid`),
  KEY `c_sysmap_user_2` (`userid`),
  CONSTRAINT `c_sysmap_user_1` FOREIGN KEY (`sysmapid`) REFERENCES `sysmaps` (`sysmapid`) ON DELETE CASCADE,
  CONSTRAINT `c_sysmap_user_2` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sysmap_user`
--

LOCK TABLES `sysmap_user` WRITE;
/*!40000 ALTER TABLE `sysmap_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `sysmap_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sysmap_usrgrp`
--

DROP TABLE IF EXISTS `sysmap_usrgrp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sysmap_usrgrp` (
  `sysmapusrgrpid` bigint(20) unsigned NOT NULL,
  `sysmapid` bigint(20) unsigned NOT NULL,
  `usrgrpid` bigint(20) unsigned NOT NULL,
  `permission` int(11) NOT NULL DEFAULT '2',
  PRIMARY KEY (`sysmapusrgrpid`),
  UNIQUE KEY `sysmap_usrgrp_1` (`sysmapid`,`usrgrpid`),
  KEY `c_sysmap_usrgrp_2` (`usrgrpid`),
  CONSTRAINT `c_sysmap_usrgrp_1` FOREIGN KEY (`sysmapid`) REFERENCES `sysmaps` (`sysmapid`) ON DELETE CASCADE,
  CONSTRAINT `c_sysmap_usrgrp_2` FOREIGN KEY (`usrgrpid`) REFERENCES `usrgrp` (`usrgrpid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sysmap_usrgrp`
--

LOCK TABLES `sysmap_usrgrp` WRITE;
/*!40000 ALTER TABLE `sysmap_usrgrp` DISABLE KEYS */;
/*!40000 ALTER TABLE `sysmap_usrgrp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sysmaps`
--

DROP TABLE IF EXISTS `sysmaps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sysmaps` (
  `sysmapid` bigint(20) unsigned NOT NULL,
  `name` varchar(128) NOT NULL DEFAULT '',
  `width` int(11) NOT NULL DEFAULT '600',
  `height` int(11) NOT NULL DEFAULT '400',
  `backgroundid` bigint(20) unsigned DEFAULT NULL,
  `label_type` int(11) NOT NULL DEFAULT '2',
  `label_location` int(11) NOT NULL DEFAULT '0',
  `highlight` int(11) NOT NULL DEFAULT '1',
  `expandproblem` int(11) NOT NULL DEFAULT '1',
  `markelements` int(11) NOT NULL DEFAULT '0',
  `show_unack` int(11) NOT NULL DEFAULT '0',
  `grid_size` int(11) NOT NULL DEFAULT '50',
  `grid_show` int(11) NOT NULL DEFAULT '1',
  `grid_align` int(11) NOT NULL DEFAULT '1',
  `label_format` int(11) NOT NULL DEFAULT '0',
  `label_type_host` int(11) NOT NULL DEFAULT '2',
  `label_type_hostgroup` int(11) NOT NULL DEFAULT '2',
  `label_type_trigger` int(11) NOT NULL DEFAULT '2',
  `label_type_map` int(11) NOT NULL DEFAULT '2',
  `label_type_image` int(11) NOT NULL DEFAULT '2',
  `label_string_host` varchar(255) NOT NULL DEFAULT '',
  `label_string_hostgroup` varchar(255) NOT NULL DEFAULT '',
  `label_string_trigger` varchar(255) NOT NULL DEFAULT '',
  `label_string_map` varchar(255) NOT NULL DEFAULT '',
  `label_string_image` varchar(255) NOT NULL DEFAULT '',
  `iconmapid` bigint(20) unsigned DEFAULT NULL,
  `expand_macros` int(11) NOT NULL DEFAULT '0',
  `severity_min` int(11) NOT NULL DEFAULT '0',
  `userid` bigint(20) unsigned NOT NULL,
  `private` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`sysmapid`),
  UNIQUE KEY `sysmaps_1` (`name`),
  KEY `sysmaps_2` (`backgroundid`),
  KEY `sysmaps_3` (`iconmapid`),
  KEY `c_sysmaps_3` (`userid`),
  CONSTRAINT `c_sysmaps_1` FOREIGN KEY (`backgroundid`) REFERENCES `images` (`imageid`),
  CONSTRAINT `c_sysmaps_2` FOREIGN KEY (`iconmapid`) REFERENCES `icon_map` (`iconmapid`),
  CONSTRAINT `c_sysmaps_3` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sysmaps`
--

LOCK TABLES `sysmaps` WRITE;
/*!40000 ALTER TABLE `sysmaps` DISABLE KEYS */;
INSERT INTO `sysmaps` VALUES (1,'Local network',680,200,NULL,0,0,1,1,1,0,50,1,1,0,2,2,2,2,2,'','','','','',NULL,1,0,1,0);
/*!40000 ALTER TABLE `sysmaps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sysmaps_elements`
--

DROP TABLE IF EXISTS `sysmaps_elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sysmaps_elements` (
  `selementid` bigint(20) unsigned NOT NULL,
  `sysmapid` bigint(20) unsigned NOT NULL,
  `elementid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `elementtype` int(11) NOT NULL DEFAULT '0',
  `iconid_off` bigint(20) unsigned DEFAULT NULL,
  `iconid_on` bigint(20) unsigned DEFAULT NULL,
  `label` varchar(2048) NOT NULL DEFAULT '',
  `label_location` int(11) NOT NULL DEFAULT '-1',
  `x` int(11) NOT NULL DEFAULT '0',
  `y` int(11) NOT NULL DEFAULT '0',
  `iconid_disabled` bigint(20) unsigned DEFAULT NULL,
  `iconid_maintenance` bigint(20) unsigned DEFAULT NULL,
  `elementsubtype` int(11) NOT NULL DEFAULT '0',
  `areatype` int(11) NOT NULL DEFAULT '0',
  `width` int(11) NOT NULL DEFAULT '200',
  `height` int(11) NOT NULL DEFAULT '200',
  `viewtype` int(11) NOT NULL DEFAULT '0',
  `use_iconmap` int(11) NOT NULL DEFAULT '1',
  `application` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`selementid`),
  KEY `sysmaps_elements_1` (`sysmapid`),
  KEY `sysmaps_elements_2` (`iconid_off`),
  KEY `sysmaps_elements_3` (`iconid_on`),
  KEY `sysmaps_elements_4` (`iconid_disabled`),
  KEY `sysmaps_elements_5` (`iconid_maintenance`),
  CONSTRAINT `c_sysmaps_elements_1` FOREIGN KEY (`sysmapid`) REFERENCES `sysmaps` (`sysmapid`) ON DELETE CASCADE,
  CONSTRAINT `c_sysmaps_elements_2` FOREIGN KEY (`iconid_off`) REFERENCES `images` (`imageid`),
  CONSTRAINT `c_sysmaps_elements_3` FOREIGN KEY (`iconid_on`) REFERENCES `images` (`imageid`),
  CONSTRAINT `c_sysmaps_elements_4` FOREIGN KEY (`iconid_disabled`) REFERENCES `images` (`imageid`),
  CONSTRAINT `c_sysmaps_elements_5` FOREIGN KEY (`iconid_maintenance`) REFERENCES `images` (`imageid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sysmaps_elements`
--

LOCK TABLES `sysmaps_elements` WRITE;
/*!40000 ALTER TABLE `sysmaps_elements` DISABLE KEYS */;
/*!40000 ALTER TABLE `sysmaps_elements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sysmaps_link_triggers`
--

DROP TABLE IF EXISTS `sysmaps_link_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sysmaps_link_triggers` (
  `linktriggerid` bigint(20) unsigned NOT NULL,
  `linkid` bigint(20) unsigned NOT NULL,
  `triggerid` bigint(20) unsigned NOT NULL,
  `drawtype` int(11) NOT NULL DEFAULT '0',
  `color` varchar(6) NOT NULL DEFAULT '000000',
  PRIMARY KEY (`linktriggerid`),
  UNIQUE KEY `sysmaps_link_triggers_1` (`linkid`,`triggerid`),
  KEY `sysmaps_link_triggers_2` (`triggerid`),
  CONSTRAINT `c_sysmaps_link_triggers_1` FOREIGN KEY (`linkid`) REFERENCES `sysmaps_links` (`linkid`) ON DELETE CASCADE,
  CONSTRAINT `c_sysmaps_link_triggers_2` FOREIGN KEY (`triggerid`) REFERENCES `triggers` (`triggerid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sysmaps_link_triggers`
--

LOCK TABLES `sysmaps_link_triggers` WRITE;
/*!40000 ALTER TABLE `sysmaps_link_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `sysmaps_link_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sysmaps_links`
--

DROP TABLE IF EXISTS `sysmaps_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sysmaps_links` (
  `linkid` bigint(20) unsigned NOT NULL,
  `sysmapid` bigint(20) unsigned NOT NULL,
  `selementid1` bigint(20) unsigned NOT NULL,
  `selementid2` bigint(20) unsigned NOT NULL,
  `drawtype` int(11) NOT NULL DEFAULT '0',
  `color` varchar(6) NOT NULL DEFAULT '000000',
  `label` varchar(2048) NOT NULL DEFAULT '',
  PRIMARY KEY (`linkid`),
  KEY `sysmaps_links_1` (`sysmapid`),
  KEY `sysmaps_links_2` (`selementid1`),
  KEY `sysmaps_links_3` (`selementid2`),
  CONSTRAINT `c_sysmaps_links_1` FOREIGN KEY (`sysmapid`) REFERENCES `sysmaps` (`sysmapid`) ON DELETE CASCADE,
  CONSTRAINT `c_sysmaps_links_2` FOREIGN KEY (`selementid1`) REFERENCES `sysmaps_elements` (`selementid`) ON DELETE CASCADE,
  CONSTRAINT `c_sysmaps_links_3` FOREIGN KEY (`selementid2`) REFERENCES `sysmaps_elements` (`selementid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sysmaps_links`
--

LOCK TABLES `sysmaps_links` WRITE;
/*!40000 ALTER TABLE `sysmaps_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `sysmaps_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task`
--

DROP TABLE IF EXISTS `task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task` (
  `taskid` bigint(20) unsigned NOT NULL,
  `type` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `clock` int(11) NOT NULL DEFAULT '0',
  `ttl` int(11) NOT NULL DEFAULT '0',
  `proxy_hostid` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`taskid`),
  KEY `task_1` (`status`,`proxy_hostid`),
  KEY `c_task_1` (`proxy_hostid`),
  CONSTRAINT `c_task_1` FOREIGN KEY (`proxy_hostid`) REFERENCES `hosts` (`hostid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task`
--

LOCK TABLES `task` WRITE;
/*!40000 ALTER TABLE `task` DISABLE KEYS */;
/*!40000 ALTER TABLE `task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_acknowledge`
--

DROP TABLE IF EXISTS `task_acknowledge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_acknowledge` (
  `taskid` bigint(20) unsigned NOT NULL,
  `acknowledgeid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`taskid`),
  CONSTRAINT `c_task_acknowledge_1` FOREIGN KEY (`taskid`) REFERENCES `task` (`taskid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_acknowledge`
--

LOCK TABLES `task_acknowledge` WRITE;
/*!40000 ALTER TABLE `task_acknowledge` DISABLE KEYS */;
/*!40000 ALTER TABLE `task_acknowledge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_close_problem`
--

DROP TABLE IF EXISTS `task_close_problem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_close_problem` (
  `taskid` bigint(20) unsigned NOT NULL,
  `acknowledgeid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`taskid`),
  CONSTRAINT `c_task_close_problem_1` FOREIGN KEY (`taskid`) REFERENCES `task` (`taskid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_close_problem`
--

LOCK TABLES `task_close_problem` WRITE;
/*!40000 ALTER TABLE `task_close_problem` DISABLE KEYS */;
/*!40000 ALTER TABLE `task_close_problem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_remote_command`
--

DROP TABLE IF EXISTS `task_remote_command`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_remote_command` (
  `taskid` bigint(20) unsigned NOT NULL,
  `command_type` int(11) NOT NULL DEFAULT '0',
  `execute_on` int(11) NOT NULL DEFAULT '0',
  `port` int(11) NOT NULL DEFAULT '0',
  `authtype` int(11) NOT NULL DEFAULT '0',
  `username` varchar(64) NOT NULL DEFAULT '',
  `password` varchar(64) NOT NULL DEFAULT '',
  `publickey` varchar(64) NOT NULL DEFAULT '',
  `privatekey` varchar(64) NOT NULL DEFAULT '',
  `command` text NOT NULL,
  `alertid` bigint(20) unsigned DEFAULT NULL,
  `parent_taskid` bigint(20) unsigned NOT NULL,
  `hostid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`taskid`),
  CONSTRAINT `c_task_remote_command_1` FOREIGN KEY (`taskid`) REFERENCES `task` (`taskid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_remote_command`
--

LOCK TABLES `task_remote_command` WRITE;
/*!40000 ALTER TABLE `task_remote_command` DISABLE KEYS */;
/*!40000 ALTER TABLE `task_remote_command` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_remote_command_result`
--

DROP TABLE IF EXISTS `task_remote_command_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_remote_command_result` (
  `taskid` bigint(20) unsigned NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `parent_taskid` bigint(20) unsigned NOT NULL,
  `info` text NOT NULL,
  PRIMARY KEY (`taskid`),
  CONSTRAINT `c_task_remote_command_result_1` FOREIGN KEY (`taskid`) REFERENCES `task` (`taskid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_remote_command_result`
--

LOCK TABLES `task_remote_command_result` WRITE;
/*!40000 ALTER TABLE `task_remote_command_result` DISABLE KEYS */;
/*!40000 ALTER TABLE `task_remote_command_result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timeperiods`
--

DROP TABLE IF EXISTS `timeperiods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timeperiods` (
  `timeperiodid` bigint(20) unsigned NOT NULL,
  `timeperiod_type` int(11) NOT NULL DEFAULT '0',
  `every` int(11) NOT NULL DEFAULT '1',
  `month` int(11) NOT NULL DEFAULT '0',
  `dayofweek` int(11) NOT NULL DEFAULT '0',
  `day` int(11) NOT NULL DEFAULT '0',
  `start_time` int(11) NOT NULL DEFAULT '0',
  `period` int(11) NOT NULL DEFAULT '0',
  `start_date` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`timeperiodid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timeperiods`
--

LOCK TABLES `timeperiods` WRITE;
/*!40000 ALTER TABLE `timeperiods` DISABLE KEYS */;
/*!40000 ALTER TABLE `timeperiods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trends`
--

DROP TABLE IF EXISTS `trends`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trends` (
  `itemid` bigint(20) unsigned NOT NULL,
  `clock` int(11) NOT NULL DEFAULT '0',
  `num` int(11) NOT NULL DEFAULT '0',
  `value_min` double(16,4) NOT NULL DEFAULT '0.0000',
  `value_avg` double(16,4) NOT NULL DEFAULT '0.0000',
  `value_max` double(16,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`itemid`,`clock`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trends`
--

LOCK TABLES `trends` WRITE;
/*!40000 ALTER TABLE `trends` DISABLE KEYS */;
/*!40000 ALTER TABLE `trends` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trends_uint`
--

DROP TABLE IF EXISTS `trends_uint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trends_uint` (
  `itemid` bigint(20) unsigned NOT NULL,
  `clock` int(11) NOT NULL DEFAULT '0',
  `num` int(11) NOT NULL DEFAULT '0',
  `value_min` bigint(20) unsigned NOT NULL DEFAULT '0',
  `value_avg` bigint(20) unsigned NOT NULL DEFAULT '0',
  `value_max` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`itemid`,`clock`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trends_uint`
--

LOCK TABLES `trends_uint` WRITE;
/*!40000 ALTER TABLE `trends_uint` DISABLE KEYS */;
/*!40000 ALTER TABLE `trends_uint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trigger_depends`
--

DROP TABLE IF EXISTS `trigger_depends`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trigger_depends` (
  `triggerdepid` bigint(20) unsigned NOT NULL,
  `triggerid_down` bigint(20) unsigned NOT NULL,
  `triggerid_up` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`triggerdepid`),
  UNIQUE KEY `trigger_depends_1` (`triggerid_down`,`triggerid_up`),
  KEY `trigger_depends_2` (`triggerid_up`),
  CONSTRAINT `c_trigger_depends_1` FOREIGN KEY (`triggerid_down`) REFERENCES `triggers` (`triggerid`) ON DELETE CASCADE,
  CONSTRAINT `c_trigger_depends_2` FOREIGN KEY (`triggerid_up`) REFERENCES `triggers` (`triggerid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trigger_depends`
--

LOCK TABLES `trigger_depends` WRITE;
/*!40000 ALTER TABLE `trigger_depends` DISABLE KEYS */;
INSERT INTO `trigger_depends` VALUES (1,13295,13321),(3,13296,13295),(2,13296,13321),(4,13297,13321),(5,13298,13297),(6,13298,13321),(7,13299,13321),(9,13300,13299),(8,13300,13321),(10,13301,13321),(12,13302,13301),(11,13302,13321),(13,13303,13322),(14,13304,13303),(15,13304,13322),(16,13305,13322),(17,13306,13321),(18,13307,13305),(19,13307,13322),(20,13308,13306),(21,13308,13321),(22,13311,13309),(23,13312,13310),(24,13313,13321),(25,13314,13322),(26,13315,13313),(27,13315,13321),(28,13316,13314),(29,13316,13322),(30,13318,13317),(31,13319,13321),(32,13320,13319),(33,13320,13321),(34,13323,13321),(35,13324,13321),(36,13324,13323),(37,13325,13321),(38,13326,13321),(39,13326,13325),(41,13555,13554),(40,13556,13554);
/*!40000 ALTER TABLE `trigger_depends` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trigger_discovery`
--

DROP TABLE IF EXISTS `trigger_discovery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trigger_discovery` (
  `triggerid` bigint(20) unsigned NOT NULL,
  `parent_triggerid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`triggerid`),
  KEY `trigger_discovery_1` (`parent_triggerid`),
  CONSTRAINT `c_trigger_discovery_1` FOREIGN KEY (`triggerid`) REFERENCES `triggers` (`triggerid`) ON DELETE CASCADE,
  CONSTRAINT `c_trigger_discovery_2` FOREIGN KEY (`parent_triggerid`) REFERENCES `triggers` (`triggerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trigger_discovery`
--

LOCK TABLES `trigger_discovery` WRITE;
/*!40000 ALTER TABLE `trigger_discovery` DISABLE KEYS */;
/*!40000 ALTER TABLE `trigger_discovery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trigger_tag`
--

DROP TABLE IF EXISTS `trigger_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trigger_tag` (
  `triggertagid` bigint(20) unsigned NOT NULL,
  `triggerid` bigint(20) unsigned NOT NULL,
  `tag` varchar(255) NOT NULL DEFAULT '',
  `value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`triggertagid`),
  KEY `trigger_tag_1` (`triggerid`),
  CONSTRAINT `c_trigger_tag_1` FOREIGN KEY (`triggerid`) REFERENCES `triggers` (`triggerid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trigger_tag`
--

LOCK TABLES `trigger_tag` WRITE;
/*!40000 ALTER TABLE `trigger_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `trigger_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `triggers`
--

DROP TABLE IF EXISTS `triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `triggers` (
  `triggerid` bigint(20) unsigned NOT NULL,
  `expression` varchar(2048) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `status` int(11) NOT NULL DEFAULT '0',
  `value` int(11) NOT NULL DEFAULT '0',
  `priority` int(11) NOT NULL DEFAULT '0',
  `lastchange` int(11) NOT NULL DEFAULT '0',
  `comments` text NOT NULL,
  `error` varchar(2048) NOT NULL DEFAULT '',
  `templateid` bigint(20) unsigned DEFAULT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  `state` int(11) NOT NULL DEFAULT '0',
  `flags` int(11) NOT NULL DEFAULT '0',
  `recovery_mode` int(11) NOT NULL DEFAULT '0',
  `recovery_expression` varchar(2048) NOT NULL DEFAULT '',
  `correlation_mode` int(11) NOT NULL DEFAULT '0',
  `correlation_tag` varchar(255) NOT NULL DEFAULT '',
  `manual_close` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`triggerid`),
  KEY `triggers_1` (`status`),
  KEY `triggers_2` (`value`,`lastchange`),
  KEY `triggers_3` (`templateid`),
  CONSTRAINT `c_triggers_1` FOREIGN KEY (`templateid`) REFERENCES `triggers` (`triggerid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `triggers`
--

LOCK TABLES `triggers` WRITE;
/*!40000 ALTER TABLE `triggers` DISABLE KEYS */;
INSERT INTO `triggers` VALUES (10010,'{13078}>5','Processor load is too high on {HOST.NAME}','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(10011,'{13084}>30','Too many processes running on {HOST.NAME}','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(10012,'{12580}<50','Lack of free swap space on {HOST.NAME}','',0,0,2,0,'It probably means that the systems requires more physical memory.','',NULL,0,0,0,0,'',0,'',0),(10016,'{10199}>0','/etc/passwd has been changed on {HOST.NAME}','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(10021,'{12583}<0','{HOST.NAME} has just been restarted','',0,0,1,0,'','',NULL,0,0,0,0,'',0,'',0),(10041,'{10204}<256','Configured max number of processes is too low on {HOST.NAME}','',0,0,1,0,'','',NULL,0,0,0,0,'',0,'',0),(10042,'{12553}<1024','Configured max number of opened files is too low on {HOST.NAME}','',0,0,1,0,'','',NULL,0,0,0,0,'',0,'',0),(10043,'{10208}>0','Hostname was changed on {HOST.NAME}','',0,0,1,0,'','',NULL,0,0,0,0,'',0,'',0),(10044,'{10207}>0','Host information was changed on {HOST.NAME}','',0,0,1,0,'','',NULL,0,0,0,0,'',0,'',0),(10045,'{12927}>0','Version of zabbix_agent(d) was changed on {HOST.NAME}','',0,0,1,0,'','',13026,0,0,0,0,'',0,'',0),(10047,'{12550}=1','Zabbix agent on {HOST.NAME} is unreachable for 5 minutes','',0,0,3,0,'','',13025,0,0,0,0,'',0,'',0),(10190,'{13082}>300','Too many processes on {HOST.NAME}','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(13000,'{12144}<20M','Lack of available memory on server {HOST.NAME}','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13015,'{12641}<25','Less than 25% free in the configuration cache','',0,0,3,0,'Consider increasing CacheSize in the zabbix_server.conf configuration file','',NULL,0,0,0,0,'',0,'',0),(13017,'{12651}<25','Less than 25% free in the history index cache','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13019,'{12649}<25','Less than 25% free in the trends cache','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13023,'{12653}>100','More than 100 items having missing data for more than 10 minutes','',0,0,2,0,'zabbix[queue,10m] item is collecting data about how many items are missing data for more than 10 minutes (next parameter)','',NULL,0,0,0,0,'',0,'',0),(13025,'{12549}=1','Zabbix agent on {HOST.NAME} is unreachable for 5 minutes','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13026,'{12926}>0','Version of zabbix_agent(d) was changed on {HOST.NAME}','',0,0,1,0,'','',NULL,0,0,0,0,'',0,'',0),(13073,'{12645}<25','Less than 25% free in the history cache','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13074,'{12646}<5','Less than 5% free in the value cache','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13080,'{13164}>75','Zabbix alerter processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0,1,'{13164}<65',0,'',0),(13081,'{13170}>75','Zabbix configuration syncer processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0,1,'{13170}<65',0,'',0),(13082,'{13168}>75','Zabbix db watchdog processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0,1,'{13168}<65',0,'',0),(13083,'{13172}>75','Zabbix discoverer processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0,1,'{13172}<65',0,'',0),(13084,'{13174}>75','Zabbix escalator processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0,1,'{13174}<65',0,'',0),(13085,'{13176}>75','Zabbix history syncer processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0,1,'{13176}<65',0,'',0),(13086,'{13178}>75','Zabbix housekeeper processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0,1,'{13178}<65',0,'',0),(13087,'{13180}>75','Zabbix http poller processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0,1,'{13180}<65',0,'',0),(13088,'{13182}>75','Zabbix icmp pinger processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0,1,'{13182}<65',0,'',0),(13089,'{13184}>75','Zabbix ipmi poller processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0,1,'{13184}<65',0,'',0),(13091,'{13188}>75','Zabbix poller processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0,1,'{13188}<65',0,'',0),(13092,'{13190}>75','Zabbix proxy poller processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0,1,'{13190}<65',0,'',0),(13093,'{13192}>75','Zabbix self-monitoring processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0,1,'{13192}<65',0,'',0),(13094,'{13198}>75','Zabbix timer processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0,1,'{13198}<65',0,'',0),(13095,'{13200}>75','Zabbix trapper processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0,1,'{13200}<65',0,'',0),(13096,'{13202}>75','Zabbix unreachable poller processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0,1,'{13202}<65',0,'',0),(13097,'{13204}>75','Zabbix vmware collector processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0,1,'{13204}<65',0,'',0),(13243,'{13080}>20','Disk I/O is overloaded on {HOST.NAME}','',0,0,2,0,'OS spends significant time waiting for I/O (input/output) operations. It could be indicator of performance issues with storage system.','',NULL,0,0,0,0,'',0,'',0),(13266,'{12592}<20','Free disk space is less than 20% on volume {#FSNAME}','',0,0,2,0,'','',NULL,0,0,2,0,'',0,'',0),(13272,'{12598}<20','Free inodes is less than 20% on volume {#FSNAME}','',0,0,2,0,'','',NULL,0,0,2,0,'',0,'',0),(13275,'{13186}>75','Zabbix java poller processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0,1,'{13186}<65',0,'',0),(13285,'{13159}=0','Telnet service is down on {HOST.NAME}','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13287,'{12671}=1','Operational status was changed on {HOST.NAME} interface {#SNMPVALUE}','',0,0,1,0,'','',NULL,0,0,2,0,'',0,'',0),(13288,'{12672}=1','Operational status was changed on {HOST.NAME} interface {#SNMPVALUE}','',0,0,1,0,'','',13287,0,0,2,0,'',0,'',0),(13289,'{12673}=1','Operational status was changed on {HOST.NAME} interface {#SNMPVALUE}','',0,0,1,0,'','',13287,0,0,2,0,'',0,'',0),(13291,'{12675} / {12676} > 0.8','Free disk space is less than 20% on volume {#SNMPVALUE}','',0,0,2,0,'','',NULL,0,0,2,0,'',0,'',0),(13292,'{12677} / {12678} > 0.8','Free disk space is less than 20% on volume {#SNMPVALUE}','',0,0,2,0,'','',13291,0,0,2,0,'',0,'',0),(13293,'{12679} / {12680} > 0.8','Free disk space is less than 20% on volume {#SNMPVALUE}','',0,0,2,0,'','',13291,0,0,2,0,'',0,'',0),(13294,'{12681}=1','Operational status was changed on {HOST.NAME} interface {#SNMPVALUE}','',0,0,1,0,'','',13287,0,0,2,0,'',0,'',0),(13295,'{12682}<5 or {12682}>90','Baseboard Temp Critical [{ITEM.VALUE}]','',0,0,5,0,'','',NULL,0,0,0,0,'',0,'',0),(13296,'{12683}<10 or {12683}>83','Baseboard Temp Non-Critical [{ITEM.VALUE}]','',0,0,4,0,'','',NULL,0,0,0,0,'',0,'',0),(13297,'{12684}<0.953 or {12684}>1.149','BB +1.05V PCH Critical [{ITEM.VALUE}]','',0,0,5,0,'','',NULL,0,0,0,0,'',0,'',0),(13298,'{12685}<0.985 or {12685}>1.117','BB +1.05V PCH Non-Critical [{ITEM.VALUE}]','',0,0,4,0,'','',NULL,0,0,0,0,'',0,'',0),(13299,'{12686}<0.683 or {12686}>1.543','BB +1.1V P1 Vccp Critical [{ITEM.VALUE}]','',0,0,5,0,'','',NULL,0,0,0,0,'',0,'',0),(13300,'{12687}<0.708 or {12687}>1.501','BB +1.1V P1 Vccp Non-Critical [{ITEM.VALUE}]','',0,0,4,0,'','',NULL,0,0,0,0,'',0,'',0),(13301,'{12688}<1.362 or {12688}>1.635','BB +1.5V P1 DDR3 Critical [{ITEM.VALUE}]','',0,0,5,0,'','',NULL,0,0,0,0,'',0,'',0),(13302,'{12689}<1.401 or {12689}>1.589','BB +1.5V P1 DDR3 Non-Critical [{ITEM.VALUE}]','',0,0,4,0,'','',NULL,0,0,0,0,'',0,'',0),(13303,'{12690}<1.597 or {12690}>2.019','BB +1.8V SM Critical [{ITEM.VALUE}]','',0,0,5,0,'','',NULL,0,0,0,0,'',0,'',0),(13304,'{12691}<1.646 or {12691}>1.960','BB +1.8V SM Non-Critical [{ITEM.VALUE}]','',0,0,4,0,'','',NULL,0,0,0,0,'',0,'',0),(13305,'{12692}<2.876 or {12692}>3.729','BB +3.3V Critical [{ITEM.VALUE}]','',0,0,5,0,'','',NULL,0,0,0,0,'',0,'',0),(13306,'{12693}<2.982 or {12693}>3.625','BB +3.3V Critical [{ITEM.VALUE}]','',0,0,5,0,'','',NULL,0,0,0,0,'',0,'',0),(13307,'{12694}<2.970 or {12694}>3.618','BB +3.3V Non-Critical [{ITEM.VALUE}]','',0,0,4,0,'','',NULL,0,0,0,0,'',0,'',0),(13308,'{12695}<3.067 or {12695}>3.525','BB +3.3V Non-Critical [{ITEM.VALUE}]','',0,0,4,0,'','',NULL,0,0,0,0,'',0,'',0),(13309,'{12696}<2.876 or {12696}>3.729','BB +3.3V STBY Critical [{ITEM.VALUE}]','',0,0,5,0,'','',NULL,0,0,0,0,'',0,'',0),(13310,'{12697}<2.982 or {12697}>3.625','BB +3.3V STBY Critical [{ITEM.VALUE}]','',0,0,5,0,'','',NULL,0,0,0,0,'',0,'',0),(13311,'{12698}<2.970 or {12698}>3.618','BB +3.3V STBY Non-Critical [{ITEM.VALUE}]','',0,0,4,0,'','',NULL,0,0,0,0,'',0,'',0),(13312,'{12699}<3.067 or {12699}>3.525','BB +3.3V STBY Non-Critical [{ITEM.VALUE}]','',0,0,4,0,'','',NULL,0,0,0,0,'',0,'',0),(13313,'{12700}<4.471 or {12700}>5.538','BB +5.0V Critical [{ITEM.VALUE}]','',0,0,5,0,'','',NULL,0,0,0,0,'',0,'',0),(13314,'{12701}<4.362 or {12701}>5.663','BB +5.0V Critical [{ITEM.VALUE}]','',0,0,5,0,'','',NULL,0,0,0,0,'',0,'',0),(13315,'{12702}<4.630 or {12702}>5.380','BB +5.0V Non-Critical [{ITEM.VALUE}]','',0,0,4,0,'','',NULL,0,0,0,0,'',0,'',0),(13316,'{12703}<4.483 or {12703}>5.495','BB +5.0V Non-Critical [{ITEM.VALUE}]','',0,0,4,0,'','',NULL,0,0,0,0,'',0,'',0),(13317,'{12704}<5 or {12704}>66','BB Ambient Temp Critical [{ITEM.VALUE}]','',0,0,5,0,'','',NULL,0,0,0,0,'',0,'',0),(13318,'{12705}<10 or {12705}>61','BB Ambient Temp Non-Critical [{ITEM.VALUE}]','',0,0,4,0,'','',NULL,0,0,0,0,'',0,'',0),(13319,'{12706}<0 or {12706}>48','Front Panel Temp Critical [{ITEM.VALUE}]','',0,0,5,0,'','',NULL,0,0,0,0,'',0,'',0),(13320,'{12707}<5 or {12707}>44','Front Panel Temp Non-Critical [{ITEM.VALUE}]','',0,0,4,0,'','',NULL,0,0,0,0,'',0,'',0),(13321,'{12708}=0','Power','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(13322,'{12709}=0','Power','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(13323,'{12710}<324','System Fan 2 Critical [{ITEM.VALUE}]','',0,0,5,0,'','',NULL,0,0,0,0,'',0,'',0),(13324,'{12711}<378','System Fan 2 Non-Critical [{ITEM.VALUE}]','',0,0,4,0,'','',NULL,0,0,0,0,'',0,'',0),(13325,'{12712}<324','System Fan 3 Critical [{ITEM.VALUE}]','',0,0,5,0,'','',NULL,0,0,0,0,'',0,'',0),(13326,'{12713}<378','System Fan 3 Non-Critical [{ITEM.VALUE}]','',0,0,4,0,'','',NULL,0,0,0,0,'',0,'',0),(13327,'{13155}=0','MySQL is down','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(13328,'{12715}=1','Zabbix agent on {HOST.NAME} is unreachable for 5 minutes','',0,0,3,0,'','',13025,0,0,0,0,'',0,'',0),(13329,'{12929}>0','Version of zabbix_agent(d) was changed on {HOST.NAME}','',0,0,1,0,'','',13026,0,0,0,0,'',0,'',0),(13330,'{12717}<1024','Configured max number of opened files is too low on {HOST.NAME}','',0,0,1,0,'','',NULL,0,0,0,0,'',0,'',0),(13331,'{12718}<256','Configured max number of processes is too low on {HOST.NAME}','',0,0,1,0,'','',NULL,0,0,0,0,'',0,'',0),(13332,'{13089}>30','Too many processes running on {HOST.NAME}','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(13333,'{13088}>300','Too many processes on {HOST.NAME}','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(13334,'{13087}>5','Processor load is too high on {HOST.NAME}','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(13336,'{12723}>0','Hostname was changed on {HOST.NAME}','',0,0,1,0,'','',NULL,0,0,0,0,'',0,'',0),(13337,'{12724}<50','Lack of free swap space on {HOST.NAME}','',0,0,2,0,'It probably means that the systems requires more physical memory.','',NULL,0,0,0,0,'',0,'',0),(13338,'{12725}>0','Host information was changed on {HOST.NAME}','',0,0,1,0,'','',NULL,0,0,0,0,'',0,'',0),(13339,'{12726}<0','{HOST.NAME} has just been restarted','',0,0,1,0,'','',NULL,0,0,0,0,'',0,'',0),(13340,'{12727}>0','/etc/passwd has been changed on {HOST.NAME}','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(13341,'{12728}<20M','Lack of available memory on server {HOST.NAME}','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13342,'{12729}<20','Free inodes is less than 20% on volume {#FSNAME}','',0,0,2,0,'','',NULL,0,0,2,0,'',0,'',0),(13343,'{12730}<20','Free disk space is less than 20% on volume {#FSNAME}','',0,0,2,0,'','',NULL,0,0,2,0,'',0,'',0),(13344,'{12731}=1','Zabbix agent on {HOST.NAME} is unreachable for 5 minutes','',0,0,3,0,'','',13025,0,0,0,0,'',0,'',0),(13345,'{12930}>0','Version of zabbix_agent(d) was changed on {HOST.NAME}','',0,0,1,0,'','',13026,0,0,0,0,'',0,'',0),(13346,'{12733}<1024','Configured max number of opened files is too low on {HOST.NAME}','',0,0,1,0,'','',NULL,0,0,0,0,'',0,'',0),(13347,'{12734}<256','Configured max number of processes is too low on {HOST.NAME}','',0,0,1,0,'','',NULL,0,0,0,0,'',0,'',0),(13348,'{13074}>30','Too many processes running on {HOST.NAME}','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(13349,'{13073}>300','Too many processes on {HOST.NAME}','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(13350,'{13072}>5','Processor load is too high on {HOST.NAME}','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(13352,'{12739}>0','Hostname was changed on {HOST.NAME}','',0,0,1,0,'','',NULL,0,0,0,0,'',0,'',0),(13353,'{12740}<50','Lack of free swap space on {HOST.NAME}','',0,0,2,0,'It probably means that the systems requires more physical memory.','',NULL,0,0,0,0,'',0,'',0),(13354,'{12741}>0','Host information was changed on {HOST.NAME}','',0,0,1,0,'','',NULL,0,0,0,0,'',0,'',0),(13355,'{12742}<0','{HOST.NAME} has just been restarted','',0,0,1,0,'','',NULL,0,0,0,0,'',0,'',0),(13356,'{12743}>0','/etc/passwd has been changed on {HOST.NAME}','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(13357,'{12744}<20M','Lack of available memory on server {HOST.NAME}','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13358,'{12745}<20','Free inodes is less than 20% on volume {#FSNAME}','',0,0,2,0,'','',NULL,0,0,2,0,'',0,'',0),(13359,'{12746}<20','Free disk space is less than 20% on volume {#FSNAME}','',0,0,2,0,'','',NULL,0,0,2,0,'',0,'',0),(13360,'{12747}=1','Zabbix agent on {HOST.NAME} is unreachable for 5 minutes','',0,0,3,0,'','',13025,0,0,0,0,'',0,'',0),(13361,'{12931}>0','Version of zabbix_agent(d) was changed on {HOST.NAME}','',0,0,1,0,'','',13026,0,0,0,0,'',0,'',0),(13364,'{13071}>30','Too many processes running on {HOST.NAME}','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(13365,'{13070}>300','Too many processes on {HOST.NAME}','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(13366,'{13069}>5','Processor load is too high on {HOST.NAME}','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(13367,'{13068}>20','Disk I/O is overloaded on {HOST.NAME}','',0,0,2,0,'OS spends significant time waiting for I/O (input/output) operations. It could be indicator of performance issues with storage system.','',NULL,0,0,0,0,'',0,'',0),(13368,'{12755}>0','Hostname was changed on {HOST.NAME}','',0,0,1,0,'','',NULL,0,0,0,0,'',0,'',0),(13370,'{12757}>0','Host information was changed on {HOST.NAME}','',0,0,1,0,'','',NULL,0,0,0,0,'',0,'',0),(13371,'{12758}<0','{HOST.NAME} has just been restarted','',0,0,1,0,'','',NULL,0,0,0,0,'',0,'',0),(13372,'{12759}>0','/etc/passwd has been changed on {HOST.NAME}','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(13373,'{12760}<20M','Lack of available memory on server {HOST.NAME}','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13374,'{12761}<20','Free inodes is less than 20% on volume {#FSNAME}','',0,0,2,0,'','',NULL,0,0,2,0,'',0,'',0),(13375,'{12762}<20','Free disk space is less than 20% on volume {#FSNAME}','',0,0,2,0,'','',NULL,0,0,2,0,'',0,'',0),(13376,'{12763}=1','Zabbix agent on {HOST.NAME} is unreachable for 5 minutes','',0,0,3,0,'','',13025,0,0,0,0,'',0,'',0),(13377,'{12932}>0','Version of zabbix_agent(d) was changed on {HOST.NAME}','',0,0,1,0,'','',13026,0,0,0,0,'',0,'',0),(13382,'{13075}>5','Processor load is too high on {HOST.NAME}','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(13384,'{12771}>0','Hostname was changed on {HOST.NAME}','',0,0,1,0,'','',NULL,0,0,0,0,'',0,'',0),(13386,'{12773}>0','Host information was changed on {HOST.NAME}','',0,0,1,0,'','',NULL,0,0,0,0,'',0,'',0),(13388,'{12775}>0','/etc/passwd has been changed on {HOST.NAME}','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(13389,'{12776}<20M','Lack of available memory on server {HOST.NAME}','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13390,'{12777}<20','Free inodes is less than 20% on volume {#FSNAME}','',0,0,2,0,'','',NULL,0,0,2,0,'',0,'',0),(13391,'{12778}<20','Free disk space is less than 20% on volume {#FSNAME}','',0,0,2,0,'','',NULL,0,0,2,0,'',0,'',0),(13392,'{12779}=1','Zabbix agent on {HOST.NAME} is unreachable for 5 minutes','',0,0,3,0,'','',13025,0,0,0,0,'',0,'',0),(13393,'{12933}>0','Version of zabbix_agent(d) was changed on {HOST.NAME}','',0,0,1,0,'','',13026,0,0,0,0,'',0,'',0),(13395,'{12782}<256','Configured max number of processes is too low on {HOST.NAME}','',0,0,1,0,'','',NULL,0,0,0,0,'',0,'',0),(13396,'{13093}>30','Too many processes running on {HOST.NAME}','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(13397,'{13092}>300','Too many processes on {HOST.NAME}','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(13398,'{13091}>5','Processor load is too high on {HOST.NAME}','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(13399,'{13090}>20','Disk I/O is overloaded on {HOST.NAME}','',0,0,2,0,'OS spends significant time waiting for I/O (input/output) operations. It could be indicator of performance issues with storage system.','',NULL,0,0,0,0,'',0,'',0),(13400,'{12787}>0','Hostname was changed on {HOST.NAME}','',0,0,1,0,'','',NULL,0,0,0,0,'',0,'',0),(13401,'{12788}<50','Lack of free swap space on {HOST.NAME}','',0,0,2,0,'It probably means that the systems requires more physical memory.','',NULL,0,0,0,0,'',0,'',0),(13402,'{12789}>0','Host information was changed on {HOST.NAME}','',0,0,1,0,'','',NULL,0,0,0,0,'',0,'',0),(13403,'{12790}<0','{HOST.NAME} has just been restarted','',0,0,1,0,'','',NULL,0,0,0,0,'',0,'',0),(13404,'{12791}>0','/etc/passwd has been changed on {HOST.NAME}','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(13405,'{12792}<20M','Lack of available memory on server {HOST.NAME}','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13406,'{12793}<20','Free inodes is less than 20% on volume {#FSNAME}','',0,0,2,0,'','',NULL,0,0,2,0,'',0,'',0),(13407,'{12794}<20','Free disk space is less than 20% on volume {#FSNAME}','',0,0,2,0,'','',NULL,0,0,2,0,'',0,'',0),(13408,'{12795}=1','Zabbix agent on {HOST.NAME} is unreachable for 5 minutes','',0,0,3,0,'','',13025,0,0,0,0,'',0,'',0),(13409,'{12934}>0','Version of zabbix_agent(d) was changed on {HOST.NAME}','',0,0,1,0,'','',13026,0,0,0,0,'',0,'',0),(13410,'{12797}<1024','Configured max number of opened files is too low on {HOST.NAME}','',0,0,1,0,'','',NULL,0,0,0,0,'',0,'',0),(13411,'{12798}<256','Configured max number of processes is too low on {HOST.NAME}','',0,0,1,0,'','',NULL,0,0,0,0,'',0,'',0),(13414,'{13086}>5','Processor load is too high on {HOST.NAME}','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(13416,'{12803}>0','Hostname was changed on {HOST.NAME}','',0,0,1,0,'','',NULL,0,0,0,0,'',0,'',0),(13418,'{12805}>0','Host information was changed on {HOST.NAME}','',0,0,1,0,'','',NULL,0,0,0,0,'',0,'',0),(13419,'{12806}<0','{HOST.NAME} has just been restarted','',0,0,1,0,'','',NULL,0,0,0,0,'',0,'',0),(13420,'{12807}>0','/etc/passwd has been changed on {HOST.NAME}','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(13421,'{12808}<20M','Lack of available memory on server {HOST.NAME}','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13422,'{12809}<20','Free inodes is less than 20% on volume {#FSNAME}','',0,0,2,0,'','',NULL,0,0,2,0,'',0,'',0),(13423,'{12810}<20','Free disk space is less than 20% on volume {#FSNAME}','',0,0,2,0,'','',NULL,0,0,2,0,'',0,'',0),(13425,'{12812}>0','Host information was changed on {HOST.NAME}','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13428,'{12815}<0','{HOST.NAME} has just been restarted','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13430,'{13095}>300','Too many processes on {HOST.NAME}','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13431,'{12818}<10','Lack of available virtual memory on server {HOST.NAME}','',0,0,3,0,'','',NULL,0,0,0,1,'{12818}>20',0,'',0),(13433,'{12820}<10000','Lack of free memory on server {HOST.NAME}','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13435,'{13094}>5','Processor load is too high on {HOST.NAME}','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13437,'{12824}=1','Zabbix agent on {HOST.NAME} is unreachable for 5 minutes','',0,0,3,0,'','',13025,0,0,0,0,'',0,'',0),(13438,'{12935}>0','Version of zabbix_agent(d) was changed on {HOST.NAME}','',0,0,1,0,'','',13026,0,0,0,0,'',0,'',0),(13439,'{12826}<20','Free disk space is less than 20% on volume {#FSNAME}','',0,0,2,0,'','',NULL,0,0,2,0,'',0,'',0),(13441,'{13194}>75','Zabbix snmp trapper processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0,1,'{13194}<65',0,'',0),(13442,'{12830} > ({12831} * 0.7)','70% http-8080 worker threads busy on {HOST.NAME}','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(13443,'{12832} > ({12833} * 0.7)','70% http-8443 worker threads busy on {HOST.NAME}','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(13444,'{12834} > ({12835}  *0.7)','70% jk-8009 worker threads busy on {HOST.NAME}','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(13445,'{12836}>({12837}*0.7)','70% mp CMS Old Gen used on {HOST.NAME}','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13446,'{12838}>({12839}*0.7)','70% mp CMS Perm Gen used on {HOST.NAME}','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13447,'{12840}>({12841}*0.7)','70% mp Code Cache used on {HOST.NAME}','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13448,'{12842}>({12843}*0.7)','70% mp Perm Gen used on {HOST.NAME}','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13449,'{12844}>({12845}*0.7)','70% mp PS Old Gen used on {HOST.NAME}','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13450,'{12846}>({12847}*0.7)','70% mp PS Perm Gen used on {HOST.NAME}','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13451,'{12848}>({12849}*0.7)','70% mp Tenured Gen used on {HOST.NAME}','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13452,'{12850}>({12851}*0.7)','70% os Opened File Descriptor Count used on {HOST.NAME}','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13453,'{12852}<{12853}','gc Concurrent Mark Sweep in fire fighting mode on {HOST.NAME}','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13454,'{12854}<{12855}','gc Mark Sweep Compact in fire fighting mode on {HOST.NAME}','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13455,'{12856}<{12857}','gc PS Mark Sweep in fire fighting mode on {HOST.NAME}','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13456,'{12858} = 1','gzip compression is off for connector http-8080 on {HOST.NAME}','',0,0,1,0,'','',NULL,0,0,0,0,'',0,'',0),(13457,'{12859} = 1','gzip compression is off for connector http-8443 on {HOST.NAME}','',0,0,1,0,'','',NULL,0,0,0,0,'',0,'',0),(13458,'{12860}={12861}','mp CMS Old Gen fully committed on {HOST.NAME}','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(13459,'{12862}={12863}','mp CMS Perm Gen fully committed on {HOST.NAME}','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(13460,'{12864}={12865}','mp Code Cache fully committed on {HOST.NAME}','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(13461,'{12866}={12867}','mp Perm Gen fully committed on {HOST.NAME}','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(13462,'{12868}={12869}','mp PS Old Gen fully committed on {HOST.NAME}','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(13463,'{12870}={12871}','mp PS Perm Gen fully committed on {HOST.NAME}','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(13464,'{12872}={12873}','mp Tenured Gen fully committed on {HOST.NAME}','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(13465,'{12874}=1','{HOST.NAME} is not reachable','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13466,'{12967}=1','{HOST.NAME} uses suboptimal JIT compiler','',0,0,1,0,'','',NULL,0,0,0,0,'',0,'',0),(13507,'{12936}>0','Host name of zabbix_agentd was changed on {HOST.NAME}','',0,0,1,0,'','',NULL,0,0,0,0,'',0,'',0),(13508,'{12937}>0','Host name of zabbix_agentd was changed on {HOST.NAME}','',0,0,1,0,'','',13507,0,0,0,0,'',0,'',0),(13510,'{12939}>0','Host name of zabbix_agentd was changed on {HOST.NAME}','',0,0,1,0,'','',13507,0,0,0,0,'',0,'',0),(13511,'{12940}>0','Host name of zabbix_agentd was changed on {HOST.NAME}','',0,0,1,0,'','',13507,0,0,0,0,'',0,'',0),(13512,'{12941}>0','Host name of zabbix_agentd was changed on {HOST.NAME}','',0,0,1,0,'','',13507,0,0,0,0,'',0,'',0),(13513,'{12942}>0','Host name of zabbix_agentd was changed on {HOST.NAME}','',0,0,1,0,'','',13507,0,0,0,0,'',0,'',0),(13514,'{12943}>0','Host name of zabbix_agentd was changed on {HOST.NAME}','',0,0,1,0,'','',13507,0,0,0,0,'',0,'',0),(13515,'{12944}>0','Host name of zabbix_agentd was changed on {HOST.NAME}','',0,0,1,0,'','',13507,0,0,0,0,'',0,'',0),(13516,'{12945}>0','Host name of zabbix_agentd was changed on {HOST.NAME}','',0,0,1,0,'','',13507,0,0,0,0,'',0,'',0),(13517,'{12946}<25','Less than 25% free in the configuration cache','',0,0,3,0,'Consider increasing CacheSize in the zabbix_server.conf configuration file','',NULL,0,0,0,0,'',0,'',0),(13518,'{12947}<25','Less than 25% free in the history cache','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13519,'{12948}<25','Less than 25% free in the history index cache','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13520,'{12949}>100','More than 100 items having missing data for more than 10 minutes','',0,0,2,0,'zabbix[queue,10m] item is collecting data about how many items are missing data for more than 10 minutes (next parameter)','',NULL,0,0,0,0,'',0,'',0),(13521,'{13206}>75','Zabbix configuration syncer processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0,1,'{13206}<65',0,'',0),(13522,'{13208}>75','Zabbix discoverer processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0,1,'{13208}<65',0,'',0),(13523,'{13210}>75','Zabbix history syncer processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0,1,'{13210}<65',0,'',0),(13524,'{13211}>75','Zabbix housekeeper processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0,1,'{13211}<65',0,'',0),(13525,'{13212}>75','Zabbix http poller processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0,1,'{13212}<65',0,'',0),(13526,'{13213}>75','Zabbix icmp pinger processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0,1,'{13213}<65',0,'',0),(13527,'{13214}>75','Zabbix ipmi poller processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0,1,'{13214}<65',0,'',0),(13528,'{13215}>75','Zabbix java poller processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0,1,'{13215}<65',0,'',0),(13529,'{13216}>75','Zabbix poller processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0,1,'{13216}<65',0,'',0),(13530,'{13217}>75','Zabbix self-monitoring processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0,1,'{13217}<65',0,'',0),(13531,'{13218}>75','Zabbix snmp trapper processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0,1,'{13218}<65',0,'',0),(13532,'{13219}>75','Zabbix trapper processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0,1,'{13219}<65',0,'',0),(13533,'{13220}>75','Zabbix unreachable poller processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0,1,'{13220}<65',0,'',0),(13534,'{13207}>75','Zabbix data sender processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0,1,'{13207}<65',0,'',0),(13535,'{13209}>75','Zabbix heartbeat sender processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0,1,'{13209}<65',0,'',0),(13536,'{12965}<25','Less than 25% free in the vmware cache','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13538,'{12968}>70','70% os Process CPU Load on {HOST.NAME}','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13539,'{12969}>({12970}*0.7)','70% mem Heap Memory used on {HOST.NAME}','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13540,'{12971}>({12972}*0.7)','70% mem Non-Heap Memory used on {HOST.NAME}','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13541,'{12973}={12974}','mem Heap Memory fully committed on {HOST.NAME}','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(13542,'{12975}={12976}','mem Non-Heap Memory fully committed on {HOST.NAME}','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(13543,'{12977}<>1','{HOST.NAME} runs suboptimal VM type','',0,0,1,0,'','',NULL,0,0,0,0,'',0,'',0),(13544,'{12994}=0','FTP service is down on {HOST.NAME}','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13545,'{12995}=0','HTTP service is down on {HOST.NAME}','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13546,'{12996}=0','HTTPS service is down on {HOST.NAME}','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13547,'{12997}=0','IMAP service is down on {HOST.NAME}','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13548,'{12998}=0','LDAP service is down on {HOST.NAME}','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13549,'{13154}=0','NNTP service is down on {HOST.NAME}','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13550,'{13156}=0','NTP service is down on {HOST.NAME}','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13551,'{13152}=0','POP service is down on {HOST.NAME}','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13552,'{13157}=0','SMTP service is down on {HOST.NAME}','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13553,'{13158}=0','SSH service is down on {HOST.NAME}','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13554,'{13096}=0','{HOST.NAME} is unavailable by ICMP','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13555,'{13097}>0.15','Response time is too high on {HOST.NAME}','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(13556,'{13098}>20','Ping loss is too high on {HOST.NAME}','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(13557,'{13160}=1','Zabbix value cache working in low memory mode','',0,0,4,0,'','',NULL,0,0,0,0,'',0,'',0),(13559,'{13196}>75','Zabbix task manager processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0,1,'{13196}<65',0,'',0),(13561,'{13221}<>0','Service \"{#SERVICE.NAME}\" ({#SERVICE.DISPLAYNAME}) is not running (startup type {#SERVICE.STARTUPNAME})','',0,0,3,0,'','',NULL,0,0,2,0,'',0,'',0),(13585,'{13245}>0','Host name of zabbix_agentd was changed on {HOST.NAME}','',0,0,1,0,'','',13507,0,0,0,0,'',0,'',0),(13586,'{13246}=1','Zabbix agent on {HOST.NAME} is unreachable for 5 minutes','',0,0,3,0,'','',13025,0,0,0,0,'',0,'',0),(13587,'{13247}>0','Version of zabbix_agent(d) was changed on {HOST.NAME}','',0,0,1,0,'','',13026,0,0,0,0,'',0,'',0),(13588,'{13248}>5','Processor load is too high on {HOST.NAME}','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(13589,'{13249}>30','Too many processes running on {HOST.NAME}','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(13590,'{13250}<50','Lack of free swap space on {HOST.NAME}','',0,0,2,0,'It probably means that the systems requires more physical memory.','',NULL,0,0,0,0,'',0,'',0),(13591,'{13251}>0','/etc/passwd has been changed on {HOST.NAME}','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(13592,'{13252}<0','{HOST.NAME} has just been restarted','',0,0,1,0,'','',NULL,0,0,0,0,'',0,'',0),(13593,'{13253}<256','Configured max number of processes is too low on {HOST.NAME}','',0,0,1,0,'','',NULL,0,0,0,0,'',0,'',0),(13594,'{13254}<1024','Configured max number of opened files is too low on {HOST.NAME}','',0,0,1,0,'','',NULL,0,0,0,0,'',0,'',0),(13595,'{13255}>0','Hostname was changed on {HOST.NAME}','',0,0,1,0,'','',NULL,0,0,0,0,'',0,'',0),(13596,'{13256}>0','Host information was changed on {HOST.NAME}','',0,0,1,0,'','',NULL,0,0,0,0,'',0,'',0),(13597,'{13257}>300','Too many processes on {HOST.NAME}','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(13598,'{13258}<20M','Lack of available memory on server {HOST.NAME}','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13599,'{13259}>20','Disk I/O is overloaded on {HOST.NAME}','',0,0,2,0,'OS spends significant time waiting for I/O (input/output) operations. It could be indicator of performance issues with storage system.','',NULL,0,0,0,0,'',0,'',0),(13600,'{13260}<20','Free inodes is less than 20% on volume {#FSNAME}','',0,0,2,0,'','',NULL,0,0,2,0,'',0,'',0),(13601,'{13261}<20','Free disk space is less than 20% on volume {#FSNAME}','',0,0,2,0,'','',NULL,0,0,2,0,'',0,'',0);
/*!40000 ALTER TABLE `triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `userid` bigint(20) unsigned NOT NULL,
  `alias` varchar(100) NOT NULL DEFAULT '',
  `name` varchar(100) NOT NULL DEFAULT '',
  `surname` varchar(100) NOT NULL DEFAULT '',
  `passwd` char(32) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `autologin` int(11) NOT NULL DEFAULT '0',
  `autologout` varchar(32) NOT NULL DEFAULT '15m',
  `lang` varchar(5) NOT NULL DEFAULT 'en_GB',
  `refresh` varchar(32) NOT NULL DEFAULT '30s',
  `type` int(11) NOT NULL DEFAULT '1',
  `theme` varchar(128) NOT NULL DEFAULT 'default',
  `attempt_failed` int(11) NOT NULL DEFAULT '0',
  `attempt_ip` varchar(39) NOT NULL DEFAULT '',
  `attempt_clock` int(11) NOT NULL DEFAULT '0',
  `rows_per_page` int(11) NOT NULL DEFAULT '50',
  PRIMARY KEY (`userid`),
  UNIQUE KEY `users_1` (`alias`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Admin','Zabbix','Administrator','21232f297a57a5a743894a0e4a801fc3','',1,'0','zh_CN','30s',3,'default',0,'192.168.56.1',1523768958,50),(2,'guest','','','d41d8cd98f00b204e9800998ecf8427e','',0,'15m','en_GB','30s',1,'default',0,'',0,50);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_groups`
--

DROP TABLE IF EXISTS `users_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_groups` (
  `id` bigint(20) unsigned NOT NULL,
  `usrgrpid` bigint(20) unsigned NOT NULL,
  `userid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_groups_1` (`usrgrpid`,`userid`),
  KEY `users_groups_2` (`userid`),
  CONSTRAINT `c_users_groups_1` FOREIGN KEY (`usrgrpid`) REFERENCES `usrgrp` (`usrgrpid`) ON DELETE CASCADE,
  CONSTRAINT `c_users_groups_2` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_groups`
--

LOCK TABLES `users_groups` WRITE;
/*!40000 ALTER TABLE `users_groups` DISABLE KEYS */;
INSERT INTO `users_groups` VALUES (4,7,1),(2,8,2);
/*!40000 ALTER TABLE `users_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usrgrp`
--

DROP TABLE IF EXISTS `usrgrp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usrgrp` (
  `usrgrpid` bigint(20) unsigned NOT NULL,
  `name` varchar(64) NOT NULL DEFAULT '',
  `gui_access` int(11) NOT NULL DEFAULT '0',
  `users_status` int(11) NOT NULL DEFAULT '0',
  `debug_mode` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`usrgrpid`),
  UNIQUE KEY `usrgrp_1` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usrgrp`
--

LOCK TABLES `usrgrp` WRITE;
/*!40000 ALTER TABLE `usrgrp` DISABLE KEYS */;
INSERT INTO `usrgrp` VALUES (7,'Zabbix administrators',0,0,0),(8,'Guests',0,0,0),(9,'Disabled',0,1,0),(11,'Enabled debug mode',0,0,1),(12,'No access to the frontend',2,0,0);
/*!40000 ALTER TABLE `usrgrp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `valuemaps`
--

DROP TABLE IF EXISTS `valuemaps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `valuemaps` (
  `valuemapid` bigint(20) unsigned NOT NULL,
  `name` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`valuemapid`),
  UNIQUE KEY `valuemaps_1` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `valuemaps`
--

LOCK TABLES `valuemaps` WRITE;
/*!40000 ALTER TABLE `valuemaps` DISABLE KEYS */;
INSERT INTO `valuemaps` VALUES (4,'APC Battery Replacement Status'),(5,'APC Battery Status'),(7,'Dell Open Manage System Status'),(2,'Host availability'),(6,'HP Insight System Status'),(17,'HTTP response status code'),(14,'Maintenance status'),(1,'Service state'),(9,'SNMP device status (hrDeviceStatus)'),(11,'SNMP interface status (ifAdminStatus)'),(8,'SNMP interface status (ifOperStatus)'),(15,'Value cache operating mode'),(13,'VMware status'),(12,'VMware VirtualMachinePowerState'),(16,'Windows service startup type'),(3,'Windows service state'),(10,'Zabbix agent ping status');
/*!40000 ALTER TABLE `valuemaps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `widget`
--

DROP TABLE IF EXISTS `widget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `widget` (
  `widgetid` bigint(20) unsigned NOT NULL,
  `dashboardid` bigint(20) unsigned NOT NULL,
  `type` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `x` int(11) NOT NULL DEFAULT '0',
  `y` int(11) NOT NULL DEFAULT '0',
  `width` int(11) NOT NULL DEFAULT '1',
  `height` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`widgetid`),
  KEY `widget_1` (`dashboardid`),
  CONSTRAINT `c_widget_1` FOREIGN KEY (`dashboardid`) REFERENCES `dashboard` (`dashboardid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `widget`
--

LOCK TABLES `widget` WRITE;
/*!40000 ALTER TABLE `widget` DISABLE KEYS */;
INSERT INTO `widget` VALUES (1,1,'favgrph','',0,0,2,3),(2,1,'favscr','',2,0,2,3),(3,1,'favmap','',4,0,2,3),(4,1,'problems','',0,3,6,6),(5,1,'webovr','',0,9,3,4),(6,1,'dscvry','',3,9,3,4),(7,1,'hoststat','',6,0,6,4),(8,1,'syssum','',6,4,6,4),(9,1,'stszbx','',6,8,6,5);
/*!40000 ALTER TABLE `widget` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `widget_field`
--

DROP TABLE IF EXISTS `widget_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `widget_field` (
  `widget_fieldid` bigint(20) unsigned NOT NULL,
  `widgetid` bigint(20) unsigned NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `value_int` int(11) NOT NULL DEFAULT '0',
  `value_str` varchar(255) NOT NULL DEFAULT '',
  `value_groupid` bigint(20) unsigned DEFAULT NULL,
  `value_hostid` bigint(20) unsigned DEFAULT NULL,
  `value_itemid` bigint(20) unsigned DEFAULT NULL,
  `value_graphid` bigint(20) unsigned DEFAULT NULL,
  `value_sysmapid` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`widget_fieldid`),
  KEY `widget_field_1` (`widgetid`),
  KEY `widget_field_2` (`value_groupid`),
  KEY `widget_field_3` (`value_hostid`),
  KEY `widget_field_4` (`value_itemid`),
  KEY `widget_field_5` (`value_graphid`),
  KEY `widget_field_6` (`value_sysmapid`),
  CONSTRAINT `c_widget_field_1` FOREIGN KEY (`widgetid`) REFERENCES `widget` (`widgetid`) ON DELETE CASCADE,
  CONSTRAINT `c_widget_field_2` FOREIGN KEY (`value_groupid`) REFERENCES `groups` (`groupid`) ON DELETE CASCADE,
  CONSTRAINT `c_widget_field_3` FOREIGN KEY (`value_hostid`) REFERENCES `hosts` (`hostid`) ON DELETE CASCADE,
  CONSTRAINT `c_widget_field_4` FOREIGN KEY (`value_itemid`) REFERENCES `items` (`itemid`) ON DELETE CASCADE,
  CONSTRAINT `c_widget_field_5` FOREIGN KEY (`value_graphid`) REFERENCES `graphs` (`graphid`) ON DELETE CASCADE,
  CONSTRAINT `c_widget_field_6` FOREIGN KEY (`value_sysmapid`) REFERENCES `sysmaps` (`sysmapid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `widget_field`
--

LOCK TABLES `widget_field` WRITE;
/*!40000 ALTER TABLE `widget_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `widget_field` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-04-15 16:08:20