<?php
    function isTimedOut()
	{
        if(isset($_SESSION["uid"]))
		{
              if($_SESSION["timeOut"]< time()-$_SESSION["lastAction"])
			  {
                  header("location:logout.php?log=1");
              }
			  else
			  {
				 $_SESSION["lastAction"]=time();
			  }
         } 
    }

?>
