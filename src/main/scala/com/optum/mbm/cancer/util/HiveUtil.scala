package com.optum.mbm.cancer.util

import org.apache.spark.sql.SparkSession
import com.optum.mbm.cancer.config.AppConf
import scala.collection.mutable.HashMap

object HiveUtil {
  def connect(confMap: HashMap[String, String]): Unit = {
    println("Enter into Hive External Table")
    val spark = SparkSession.builder.appName("Hivesqlserver").master("yarn").config("hive.metastore.uris", AppConf.ThriftServer).enableHiveSupport().getOrCreate()
    val Hive_database = AppConf.Hive_DataBase
    val Provision_path = confMap("Exteranl_Table_Query").replaceAll("File_Generic", AppConf.File_Generic)
    val Hive_query = Provision_path
    spark.sql(s"use ${Hive_database}")
    spark.sql(s"${Hive_query}")
  }
}
