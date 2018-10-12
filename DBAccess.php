<?php 
  class DBAccess{
      function initConnection(){
         $connection=mysql_connect("localhost","root","") or die ("Server Error " . mysql_error());
         $database=mysql_select_db("hospital",$connection) or die ("Database Error " . mysql_error());
         return $connection; 
      }      
  }  
?>