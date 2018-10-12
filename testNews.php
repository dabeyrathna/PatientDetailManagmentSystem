<?php
	require_once("DBAccess.php");  
	$db = new DBAccess();
	$dbConnection = $db->initConnection();
	
	function articalList()
	{

			$str = "";
			$sql = "SELECT * FROM article ORDER BY date DESC LIMIT 6 ";	
				  
			$query=mysql_query($sql,$dbConnection) or die("SQL Error ".mysql_error());
					while($rows=mysql_fetch_array($query))
		   {
			 $str .= '<li class="news-item">'.$rows['topic'].' :  '.$rows['description'].'<a href="#">Read more...</a></li>';
		   }  
		   echo $str;
  	}
	
	function forumList()
	{

				$str = "";
				$sql = "SELECT * FROM forumQuest ORDER BY time DESC LIMIT 6";	
						
			  
				$query=mysql_query($sql,$dbConnection) or die("SQL Error ".mysql_error());
				while($rows=mysql_fetch_array($query))
			   {
				 // echo "<a href='forumDiscussion.php?qid=".$rows["qId"]."' style=' color: white;'>".$rows['time']."&nbsp;". $rows['topic']."</a><br/><br/>";		
				 echo '<li class="news-item">*Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam in venenatis enim... <a href="#">Read more...</a></li>';
			   }  

	}
	
	
	function rosterList(){
		
		$str = "";
		$sql = "SELECT * FROM rosters ORDER BY date DESC LIMIT 6";	
			  
		$query=mysql_query($sql,$dbConnection) or die("SQL Error ".mysql_error());
				while($rows=mysql_fetch_array($query))
	   {
		 // echo "<a href='rosterList.php?no=".$rows['rosterId']."' style='color: white;'>".$rows['date']."&nbsp;".$rows["department"]."</a><br/><br/>";
		 
		 echo '<li class="news-item">*sssssssssssssssssssssssssssss Nullam in venenatis enim... <a href="#">Read more...</a></li>';
	   }  
  	
	}
?>




<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css" />
<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="js/jquery.bootstrap.newsbox.min.js"></script>
<script type="text/javascript">
    $(function () {
        $(".demo1").bootstrapNews({
            newsPerPage: 5,
            autoplay: true,
			pauseOnHover:true,
            direction: 'up',
            newsTickerInterval: 1000,
            onToDo: function () {
                //console.log(this);
            }
        });	
  
    });
</script>

<div class="col-md-4">
<div class="panel panel-default" style="background-color:#999900;border:hidden">
<div class="panel-footer" style="background-color:#999900;border:hidden">
<div class="col-xs-12" style="background-color:#999900;">
<ul class="demo1" style="background-color:#999900;">

<?php 
	if($_GET['info']==1){
		$artList = 	articalList();
		echo $artList;
	}
	else if($_GET['info']==2){
		$faqList = 	forumList();
		echo $faqList;
	}
	else if($_GET['info']==3){
		$rostList = rosterList();
		echo $frostList;
	}

?>


</ul>
</div>
</div>
</div>
</div>
</html>