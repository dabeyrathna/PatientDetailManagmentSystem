<?php

function selectMenu($user){ 

		$logOutStr = '';
		$menu = '';
		if($user != ''){
			$logOutStr = '<li><a href=""><img align="center" src="images/user1.png" width="15" height="19">'.$user.'</a>
							<ul>
								<li><a href="logout.php?log=0">Logout</a></li>
							</ul>
						</li>';			
		}
		if($user == ''){
			$menu = '<nav>
			<ul>
				<li><a href="index.php">Home</a></li>
                <li><a href="about.php">About</a></li>
				<li><a href="login.php">Login</a></li>	
				<li><a href="">Sign up</a>
					<ul>
						<li><a href="signupDoctor.php">Sign up as a Doctor</a></li>
						<li><a href="signupPatient.php">Sign up as a Patient</a></li>
					</ul>
				</li> 		
				<li><a href="">Services</a>
					<ul>
						<li><a href="articleLsit.php">Articals</a></li>
						<li><a href="forumQList.php">Forum</a></li>
					</ul>
				</li> 	
                <li><a href="contactUs.php">Contact Us</a></li>
				'.$logOutStr.'
			</ul>
		</nav>';
		
		}		
		else if(strcasecmp($user[0], 'D') == 0){
			$menu = '<nav>
			<ul>
				<li><a href="index.php">Home</a></li>
                <li><a href="daccount.php">My Account</a></li>
        		<li><a href="">Services</a>
					<ul>
						<li><a href="articleLsit.php">Articals</a></li>
						<li><a href="forumQList.php">Forum</a></li>
					</ul>
				</li> 	
                <li><a href="contactUs.php">Contact Us</a></li>
				'.$logOutStr.'
			</ul>
		</nav>';
		}
		
		
		else if(strcasecmp($user[0], 'P') == 0){
			$menu = '<nav>
			<ul>
				<li><a href="index.php">Home</a></li>
                <li><a href="paccount.php">My Account</a></li>
                <li><a href="">Services</a>
					<ul>
						<li><a href="articleLsit.php">Articals</a></li>
						<li><a href="forumQList.php">Forum</a></li>
					</ul>
				</li> 									
                <li><a href="contactUs.php">Contact Us</a></li>
				'.$logOutStr.'
			</ul>
		</nav>';
		}
		
		else if(strcasecmp($user[0], 'E') == 0){
			
		$menu = '<nav>
			<ul>
				<li><a href="index.php">Home</a></li>
                <li><a href="eaccount.php">My Account</a></li>	
				<li><a href="">Tasks</a>
					<ul>
						<li><a href="historyDataUpload.php">Upload reports</a></li>
						<li><a href="rosterUpload.php">Rosters</a></li>
					</ul>
				</li> 
				<li><a href="">Contacts</a>
					<ul>
						<li><a href="contactDoctors.php">Contact Doctors</a></li>
						<li><a href="contactUs.php">contact Us</a></li>
					</ul>
				</li>
				'.$logOutStr.'
			</ul>
		</nav>';
		}
		else if(strcasecmp($user[0], 'S') == 0){
			$menu = '<nav>
			<ul>
				<li><a href="index.php">Home</a></li>
                <li><a href="saccount.php">My Account</a></li>
        		<li><a href="">Charts</a>
					<ul>
						<li><a href="#">Articals</a></li>
						<li><a href="#">Forum</a></li>
					</ul>
				</li> 	
                <li><a href="contactUs.php">Contact Us</a></li>
				'.$logOutStr.'
			</ul>
		</nav>';
		}
		
else if(strcasecmp($user[0], 'a') == 0){
			$menu = '<nav>
			<ul>
				<li><a href="index.php">Home</a></li>
                <li><a href="aaccount.php">My Account</a></li>
        		<li><a href="">Charts</a>
					<ul>
						<li><a href="#">Articals</a></li>
						<li><a href="#">Forum</a></li>
					</ul>
				</li> 	
                <li><a href="contactUs.php">Contact Us</a></li>
				'.$logOutStr.'
			</ul>
		</nav>';
		}

	
	return $menu;
}


?>