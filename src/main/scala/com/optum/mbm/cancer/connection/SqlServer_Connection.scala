package com.optum.mbm.cancer.connection

import java.io._
import com.optum.mbm.cancer.config.{AppConf, GlobalCfg}
import com.optum.mbm.cancer.util.{FileUtil, HiveUtil}
import org.apache.spark.sql.SparkSession
import org.json4s.DefaultFormats
import org.json4s.jackson.JsonMethods.parse
import scala.collection.mutable.HashMap
import scala.io.Source

object SqlServer_Connection {
  def main(args: Array[String]): Unit = {
    println("Reading cfg file : " + args(0))
    if (AppConf(args(0))) {
      implicit val jsonDefaultFormats = DefaultFormats
      var jsonQueryFinal = ""
      val gConfig = new GlobalCfg
      var jsonQuery = ""
      val Date_format = new java.text.SimpleDateFormat("yyyyMMdd")
      val date = Date_format.format(new java.util.Date())
      val Month_Format = new java.text.SimpleDateFormat("yyyyMM")
      val date1 = Month_Format.format(new java.util.Date())
      try {
        var jsonQuery = gConfig.getJsonQueries(AppConf.ingJsonFileLoc)
        jsonQueryFinal = jsonQuery.replaceAll("\\s+", " ").mkString
        println("\n\nJson Query : " + jsonQueryFinal + "\n")
      } catch {
        case e: Exception => {
          println("Exception in getJsonQueries. Properties files is not in valid Json Format")
          e.printStackTrace()
          System.exit(1)
        }
      } finally {}
      val jsonObj = parse(jsonQueryFinal, true)
      val objDQCheck = jsonObj.extract[gConfig.AcquireConf]
      println("============================================")
      var query = ""

      val directory = AppConf.Restart_path
      println(directory)
      val file = gConfig.createTempFile(s"${directory}/temp_${date}.txt")
      println(file)
      try {
        val confMap = new HashMap[String, String]
        if (!file) {
          println("file not exist creating new file")
          val pw = new PrintWriter(s"${directory}/temp_${date}.txt")
          for (conf1 <- objDQCheck.acquisition_info) {
            println(conf1.File_Name)
            pw.println(conf1.File_Name)
          }
          pw.flush()
          pw.close()
          println("completed writing jsons to tempfile")
        }

        for (stbl <- objDQCheck.acquisition_info) {
          confMap.put("SqlSrcQuery", stbl.SqlSrcQuery)
          confMap.put("SqlDatabase", stbl.SqlDatabase)
          confMap.put("File_Name", stbl.File_Name)
          confMap.put("File_path", stbl.File_path)
          confMap.put("Exteranl_Table_Query", stbl.External_Table_Query)
          confMap.put("Type", stbl.Type)
          val File_path_new = stbl.File_path.replaceAll("File_Generic", AppConf.File_Generic)
          val New_Sql_query = stbl.SqlSrcQuery.replaceAll("Restart_path", AppConf.Restart_path)
          confMap.put("New_Sql_query", New_Sql_query)
          confMap.put("File_path_new", File_path_new)

          val s1 = Source.fromFile(s"${directory}/temp_${date}.txt").mkString
          println(s1)
          val tempname = s1.split("\\s+").contains(stbl.File_Name)
          println(s"File exist's in temporary file value${tempname}")
          if (tempname) {
            var spark = SparkSession.builder.appName("SqlServer").master("yarn").getOrCreate()
            FileUtil.file_movement(confMap)
            val count = SqlServerDB_Connection.connect(confMap, spark, directory)
            FileUtil.data_control_file_creations(confMap, count)
            spark.stop()
            spark.close()
            HiveUtil.connect(confMap)

            val star = Source.fromFile(s"${directory}/temp_${date}.txt").mkString.split("\\s+")
            var i = 0
            val pw = new PrintWriter(s"${directory}/temp_${date}.txt")
            while (i < star.length) {
              if (star(i) != stbl.File_Name) {
                println(star(i))
                pw.println(star(i))
              }
              i += 1
            }
            pw.flush()
            pw.close()

          } else {
            println("File is not found in Temp table or Json")
          }
          val file = new File(s"${directory}/temp_${date}.txt")
          if (file.length() == 0) {
            file.delete()
          }
        }
      }
      catch {
        case e: Exception => {
          println("Exception in Processing Files")
          e.printStackTrace()
          System.exit(3)
        }
      } finally {

      }
    }
  }
}
