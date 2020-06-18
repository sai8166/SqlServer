package com.optum.mbm.cancer.connection

import java.util.Properties

import com.optum.mbm.cancer.config.AppConf
import org.apache.hadoop.security.alias.CredentialProviderFactory
import org.apache.spark.sql.SparkSession

import scala.collection.mutable.HashMap
import scala.io.Source

object SqlServerDB_Connection {
  def connect(confMap: HashMap[String, String], spark: SparkSession, directory: String): Long = {
    val connectionProperties = new Properties()
    connectionProperties.put("user", AppConf.UserName)
    connectionProperties.put("password", getCredentialSecret(AppConf.CredentialStore, AppConf.CredentialAlias, spark))
    connectionProperties.put("driver", AppConf.SqlServerDriver)
    Class.forName(AppConf.SqlServerDriver)
    val dbURL = AppConf.ingJdbcUrl
    val Query  = Source.fromFile(confMap("New_Sql_query")).mkString
    //val Query = confMap("New_Sql_query")
    val pushdown_query = s"${Query}"
    val df_SqlServer = spark.read.jdbc(url = dbURL, table = pushdown_query, properties = connectionProperties)
    //df_SqlServer.show()
    //df_SqlServer.write.mode("overwrite").format("csv").option("delimiter", "|").option("header", "true").save("/datalake/optum/optuminsight/d_ocd/dev/d_outbound/provision/MBM/MBM_CANCER/DAILY/")
    //df_SqlServer.write.mode("overwrite").format("csv").option("delimiter", "|").option("header", "true").save(confMap("File_path_new"))//datelake
if (df_SqlServer.count() == 0) {
  df_SqlServer.show()
  val df_SqlServer_temp = df_SqlServer.schema.map(_.name).mkString("|")
  val b =Seq(df_SqlServer_temp)
  import spark.implicits._
  val d = b.toDF()
  d.coalesce(1).write.mode("overwrite").format("csv").option("delimiter", "|").option("header", "false").option("quote", "\u0000").save(confMap("File_path_new"))
}else{
  df_SqlServer.show()
  df_SqlServer.coalesce(1).write.mode("overwrite").format("csv").option("delimiter", "|").option("header", "true").save(confMap("File_path_new"))//datelake
}
    df_SqlServer.count()+1

  }

  def getCredentialSecret(aCredentialStore: String, aCredentialAlias: String, spark: SparkSession): String = {
    val config = spark.sparkContext.hadoopConfiguration
    config.set(CredentialProviderFactory.CREDENTIAL_PROVIDER_PATH, aCredentialStore)
    String.valueOf(config.getPassword(aCredentialAlias))

  }
}
