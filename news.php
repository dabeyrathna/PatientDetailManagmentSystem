
<?php
require_once("DBAccess.php");
			$db = new DBAccess();
			$dbConnection = $db->initConnection();
			$queryString1="SELECT * FROM Article ORDER BY date DESC";         
			$query1 = mysql_query($queryString1,$dbConnection) or die("MySql Error".mysql_error());	
			
			
			$str = 'Latest Artical uploads   -    ';
			
			
			while($rows=mysql_fetch_array($query1)){	
		
				$str .=	'topic : '.$rows["topic"].'   Under the issue : '.$rows["issueId"].'  Download now.......       ';                           
                         
			}
?>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.jticker.min.js"></script>
    <script type="text/javascript">
      jQuery(function($) {
        $('.ticker1').jTicker();
      });
</script>

<style type="text/css">
      .ticker1 {
        width: 820px;
        background-color:#003300;
        color:#fff;
        padding: 20px;
      }
      * { font-family:'roboto Condensed', sans-serif}
</style>

<div class="ticker1">
      <span> <?php echo $str; ?></span>
</div>