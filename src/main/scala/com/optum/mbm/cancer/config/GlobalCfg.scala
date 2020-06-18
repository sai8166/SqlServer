package com.optum.mbm.cancer.config

import scala.io.Source

class GlobalCfg {

  case class Acquisition_info(Comment: String,
                              Type: String,
                              SqlSrcQuery: String,
                              SqlDatabase: String,
                              File_Name: String,
                              File_path: String,
                              External_Table_Query: String

                             )

  case class AcquireConf(acquisition_info: List[Acquisition_info])

  def getJsonQueries(jsonCfg: String): String = {

    if (scala.reflect.io.File(scala.reflect.io.Path(jsonCfg)).exists == true)
      Source.fromFile(jsonCfg).getLines.mkString
    else "Error : Json File not present - " + jsonCfg

  }

  def createTempFile(temp: String): Boolean = {
      println("entered create temp file")

      if (scala.reflect.io.File(scala.reflect.io.Path(temp)).exists == true) {

        return true;
      }
      else {
        return false;
      }

  }

}
