package com.optum.mbm.cancer.util

import java.io.File
import scala.collection.mutable.HashMap
import com.optum.mbm.cancer.config.AppConf
import org.apache.commons.io.FileUtils
import org.apache.hadoop.conf.Configuration
import org.apache.hadoop.fs.{FileSystem, Path}
import scala.util.Try

object FileUtil {

  def mv(oldName: String, newName: String) = {
    println(oldName)
    println(newName)
    println("Entered into Move")
    Try(new File(oldName.replaceAll(AppConf.Replace_String, "")).renameTo(new File(newName))).getOrElse(false)
  }

  def file_movement(confMap: HashMap[String, String]): Unit = {
    println("Enter into File_movement")
    FileUtils.copyDirectory(new File(AppConf.Mount_path + confMap("File_path_new")), new File(AppConf.Archive_path), true)

    if ("Daily".equals(confMap("Type"))) {
      FileUtils.deleteDirectory(new File(AppConf.Daily_Hive))
      FileUtils.forceMkdir(new File(AppConf.Daily_Hive))
    }
    else {
      FileUtils.deleteDirectory(new File(AppConf.Monthly_Hive))
      FileUtils.forceMkdir(new File(AppConf.Monthly_Hive))
    }

  }

  def data_control_file_creations(confMap: HashMap[String, String], count: Long): Unit = {
    println("Enter into data_control_file_creations")
    val Date_format = new java.text.SimpleDateFormat("yyyyMMdd")
    val date = Date_format.format(new java.util.Date())
    val Month_Format = new java.text.SimpleDateFormat("yyyyMM")
    val date1 = Month_Format.format(new java.util.Date())
    val fs = FileSystem.get(new Configuration())
    val status = fs.listStatus(new Path(confMap("File_path_new")))
    println(confMap("File_path_new"))
    status.foreach(x => {
      println(x.getPath)
      val file_name = x.getPath
      if (file_name.toString.contains("_SUCCESS")) {
        FileUtil.delete(x.getPath.toString, true)

      }
      if ("Daily".equals(confMap("Type")) && !(x.getPath.toString).contains("_SUCCESS")) {

        val file_name = AppConf.Mount_path + x.getPath
        println("=====================================")
        println("entered daily")
        println("=====================================")
        val dailyFileName = confMap("File_Name").replaceAll("YYYYMMDD", date)
        val new_file_name: String = AppConf.Mount_path + confMap("File_path_new") + "/" + dailyFileName + ".txt"
        FileUtil.mv(file_name, new_file_name)
        val ctlFile = AppConf.Mount_path + confMap("File_path_new") + "/" + dailyFileName + ".ctl"
        println("ctrl file" + ctlFile)
        import java.io._
        val pw = new PrintWriter(new File(ctlFile))
        pw.write(dailyFileName + ".txt|" + count)
        pw.close
        FileUtils.copyFileToDirectory(new File(new_file_name), new File(AppConf.Daily_Hive))


      } else if (!(x.getPath.toString).contains("_SUCCESS")) {
        println("=====================================")
        println("entered monthly")
        println("=====================================")
        val file_name = AppConf.Mount_path + x.getPath.toString
        val MonthlyFileName = confMap("File_Name").replaceAll("YYYYMM", date1)
        val new_file_name: String = AppConf.Mount_path + confMap("File_path_new") + "/" + MonthlyFileName + ".txt"
        FileUtil.mv(file_name, new_file_name)
        val ctlFile = AppConf.Mount_path + confMap("File_path_new") + "/" + MonthlyFileName + ".ctl"
        println("ctrl file" + ctlFile)
        import java.io._
        val pw = new PrintWriter(new File(ctlFile))
        pw.write(MonthlyFileName + ".txt|" + count)
        pw.close

        FileUtils.copyFileToDirectory(new File(new_file_name), new File(AppConf.Monthly_Hive))

      }
      else {}
    }
    )

  }

  def delete(filePath: String, recursive: Boolean): Unit = {
    println("Entered into Delete")
    val fs = FileSystem.get(new Configuration())
    if (fs.exists(new Path(filePath)))
      fs.delete(new Path(filePath), recursive)
  }

}
