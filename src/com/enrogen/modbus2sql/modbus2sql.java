//////////////////////////////////////////////////////////////////////////
//com.enrogen.modbus2sql.modbus2sql.java
//2010 - James A R Brown
//Released under GPL V2
//////////////////////////////////////////////////////////////////////////

package com.enrogen.modbus2sql;

import java.io.File;

public interface modbus2sql {
    public static final double VERSION = 0.1;
    public static final double REQUIRED_XML_VERSION = 0.1;

    public static final boolean DEBUG_JAMOD=true;
    public static final boolean DEBUG_SQL=true;
    public static final boolean DEBUG_MODBUS_CONNECTION=true;

    //The timer events
    public static final int SQL_ALIVE_POLL_TICKER = 1000; //mSec
    public static final int MODBUS_POLL_TICKER=2000; //mSec
    public static final int WATCHDOG_POLL_TICKER=1000; //mSec

    //Modbus Data is regarded as "current" if younger than
    public static int MYSQL_MODBUS_DATA_CURRENT = 15; //sec
    
    //If no setting.xml file exists it will be created with these parameters
    //You need to delete the setting.xml to recreate if you change these values
    public static final String SETTING_XML_MAINDIRECTORY = System.getProperty("user.home");
    public static final String SETTING_XML_SUBDIRECTORY = ".modbus2sql";
    public static final String FILE_SEPARATOR = System.getProperty("file.separator");
    public static final String SETTING_XML_FILENAME = "setting.xml";
    public static final String FULL_MODBUS2SQL_PATH = SETTING_XML_MAINDIRECTORY +
            FILE_SEPARATOR + SETTING_XML_SUBDIRECTORY;
    public static final String FULL_SETTING_XML_PATH =  FULL_MODBUS2SQL_PATH +
            FILE_SEPARATOR + SETTING_XML_FILENAME;
    public static final String MYSQL_DEFAULT_SERVER = "127.0.0.1";
    public static final String MYSQL_DEFAULT_PORT = "3306";
    public static final String MYSQL_DEFAULT_USER = "modbus2sql";
    public static final String MYSQL_DEFAULT_PASSWORD = "modicon";
    public static final String MYSQL_DEFAULT_DATABASE = "modbus2sql";
    
    //Modify the path for the yum installed rxtx drivers in fedora
    public static final String SYSTEM_PATH = System.getProperty("java.library.path");
    public static final String SYSTEM_EXTENDED_PATH = System.setProperty("java.library.path", SYSTEM_PATH
            + ":/usr/lib64/rxtx:/usr/lib/rxtx");

    //HighByte Unimplemented Feature response from contoller.
    public static final Integer HIGH_BYTE_UNIMPLEMENTED_FEATURE = 65535;

    //Logging to file
    public static final int LOG_SIZE_LIMIT =  256000; // 256k
    public static final int LOG_MAX_FILES = 3;
    public static final boolean LOG_APPEND = true;
    public static final String LOG_MODBUS2SQL_FILENAME = FULL_MODBUS2SQL_PATH +
            FILE_SEPARATOR + "Modbus2SQLLog%g.log";
}
