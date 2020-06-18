package com.optum.mbm.cancer.config

import java.io._
import java.util._
import org.apache.log4j.Logger

object AppConf {

  val log = Logger.getLogger(com.optum.mbm.cancer.connection.SqlServer_Connection.getClass.getName)
  var ingJsonFileLoc = ""
  var SqlServerDriver = ""
  var Hive_DataBase = ""
  var ingJdbcUrl = ""
  var ThriftServer = ""
  var UserName = ""
  var CredentialStore = ""
  var CredentialAlias = ""
  var File_Generic = ""
  //var Provision_path = ""
  var Restart_path = ""
  var Archive_path =""
  var Monthly_Hive =""
  var Daily_Hive =""
  var Mount_path=""
  var Replace_String=""
  var Temp =""


  private val prop = new Properties();

  def apply(confFilePath: String): Boolean = {

    if (scala.reflect.io.File(scala.reflect.io.Path(confFilePath)).exists == true) {
      prop.load(new FileInputStream(confFilePath))
      ingJsonFileLoc = prop.getProperty("ingJsonFileLoc")
      SqlServerDriver = prop.getProperty("SqlServerDriver")
      Hive_DataBase = prop.getProperty("Hive_DataBase")
      ingJdbcUrl = prop.getProperty("ingJdbcUrl")
      ThriftServer = prop.getProperty("ThriftServer")
      UserName = prop.getProperty("UserName")
      CredentialStore = prop.getProperty("CredentialStore")
      CredentialAlias = prop.getProperty("CredentialAlias")
      File_Generic = prop.getProperty("File_Generic")
      //Provision_path = prop.getProperty("Provision_path")
      Restart_path = prop.getProperty("Restart_path")
      Archive_path = prop.getProperty("Archive_path")
      Monthly_Hive = prop.getProperty("Monthly_Hive")
      Daily_Hive = prop.getProperty("Daily_Hive")
      Mount_path = prop.getProperty("Mount_path")
      Replace_String=prop.getProperty("Replace_String")

      println("Properties file ::" + prop)
      return true

    }

    else {
      println("Properties file not found :" + confFilePath)
      return false
    }

  }

}

