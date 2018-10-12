<?php 
	session_start();
	require_once("DBAccess.php");  
	$db = new DBAccess();
	$dbConnection = $db->initConnection();

	$chartScript = "";
	$tableContent = "<table width='50%' align='center' border='1'><tr><th>Data series</th><th>No of patients</th></tr>";
	if(isset($_POST['chartType']))
	{
		
		if($_POST['chartType'] == 1)
		{
			$healthIssue = $_POST['issue'];
			$encode = array();
			$districtList =  json_encode($_POST['districtList']);
			
			$i = 0;
			foreach ($_POST['districtList'] as $selectedOption)
			{				
				$sql = "SELECT count(*) as cout, 5 as data FROM prescription, health_issue, hospital, patient_history where prescription.issueId = '".$healthIssue."' AND district='".$selectedOption."' AND prescription.issueId = health_issue.issueId AND hospital.hId = patient_history.hId AND prescription.presId IN (SELECT distinct(presId) FROM patient_history)";	

				$query=mysql_query($sql,$dbConnection);							
				$row = mysql_fetch_assoc($query);		
				
				$encode['data'][] = (int)$row['cout'];
				
				$tableContent .= "<tr align='center'><td>".$selectedOption."</td><td>".$row['cout']."</td></tr>";
			}
			
			$chartScript = "$(function () {
							$('#container').highcharts({
								title: {
									text: 'Health Issue (".$healthIssue.") with selected districts',
									x: 0 //center
								},
								subtitle: {
									text: '',
									x: 0
								},
								xAxis: {
									categories: ".$districtList."
								},
								yAxis: {
									title: {
										text: 'No of Patients'
									},
									plotLines: [{
										value: 0,
										width: 1,
										color: '#808080'
									}]
								},
								tooltip: {
									valueSuffix: ''
								},
								legend: {
									layout: 'vertical',
									align: 'right',
									verticalAlign: 'middle',
									borderWidth: 0
								},
								series: 
								[
								 ".json_encode($encode)."]
							});
						});";
			
		}
		else if($_POST['chartType'] == 2){
			$chartScript = "$(function () {
					$('#container').highcharts({
						chart: {
							plotBackgroundColor: null,
							plotBorderWidth: null,
							plotShadow: false,
							type: 'pie'
						},
						title: {
							text: 'Pie char description of selected health Issue'
						},
						tooltip: {
							pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
						},
						plotOptions: {
							pie: {
								allowPointSelect: true,
								cursor: 'pointer',
								dataLabels: {
									enabled: true,
									format: '<b>{point.name}</b>: {point.percentage:.1f} %',
									style: {
										color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
									}
								}
							}
						},
						series: [{
							name: 'Gender',
							colorByPoint: true,
							data: [{
								name: 'Male Patients',
								y: 56.30,
								sliced: true,
								selected: true
							}, 
							{
								name: 'Female',
								y: 44.70
							}]
						}]
					});
				});";
			
			$tableContent .= "<tr align='center'><td>Male</td><td>56.33%</td></tr>";
			$tableContent .= "<tr align='center'><td>Female</td><td>44.77%</td></tr>";
		}
		else if($_POST['chartType'] == 3){
			$chartScript =  "$(function () {
					$('#container').highcharts({
						title: {
							text: 'Monthly Report of selected issues',
							x: -20 //center
						},
						subtitle: {
							text: '',
							x: 0
						},
						xAxis: {
							categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
								'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
						},
						yAxis: {
							title: {
								text: 'No of Patients'
							},
							plotLines: [{
								value: 0,
								width: 1,
								color: '#808080'
							}]
						},
						tooltip: {
							valueSuffix: ''
						},
						legend: {
							layout: 'vertical',
							align: 'right',
							verticalAlign: 'middle',
							borderWidth: 0
						},
						series: [{
							name: 'I100',
							data: [25, 42, 15, 72, 18, 48, 37, 16, 83, 18, 27, 72]
						}, {	
							name: 'I124',
							data: [17, 35, 37, 28, 11, 19, 52, 83, 16, 35, 72, 37]
						}, {	
							name: 'I113',
							data: [11, 30, 17, 48, 18, 49, 26, 83, 11, 95, 32, 82]
						},{
							name: 'I102',
							data: [26, 72, 82, 15, 53, 63, 74, 18, 26, 37, 74, 52]
						}]
					});
				});";
			
						$tableContent = "";
		}
		else if($_POST['chartType'] == 4)
		{
			if($_POST['yearUpperLimit'] > $_POST['yearLowerLimit'])
			{
				$upperYear = $_POST['yearUpperLimit'];
				$lowerYear = $_POST['yearLowerLimit'];
			}
			else{
				$lowerYear = $_POST['yearUpperLimit'];
				$upperYear = $_POST['yearLowerLimit'];	
			}
			
			$issueList = "";
			$data = 'series: [';
			foreach ($_POST['multiSelectIssue'] as $selectedOption)
			{		
			
				
				$yearRange = "";
				$i = $lowerYear;
				$countArr = '';
				while($i <= $upperYear)
				{
					$sql = "SELECT count(*) as c,issue FROM prescription, health_issue where prescription.issueId = '".$selectedOption."' AND prescription.issueId =  health_issue.issueId AND YEAR(date)='".$i."'";

					$query=mysql_query($sql,$dbConnection);
					$currentIssue = "";
					$flag = 0;
					$rec = mysql_fetch_assoc($query);
					
					$countArr .=  $rec['c'].",";
					$currCount = $rec['c'];
					$currentIssue .= $rec['issue'].",";

						
					$yearRange .= $i.",";					
					$i++;
				}
				$data .= "{	name: '".$currentIssue."',";
				$countArr = substr($countArr,0,-1);
				$data .= 'data: ['.$countArr.']},';	
				$yearRange = substr($yearRange,0,-1);
				$issueList .= "'".$selectedOption."',";
			}
			$data = substr($data,0,-1);
			$data .= ']';
			$issueList = substr($issueList,0,-1);
			
			$tableContent .= "</table>";
			$chartScript = "$(function () {
								$('#container').highcharts({
									chart: {
										type: 'area',
										spacingBottom: 30
									},
									title: {
										text: 'Health Statistics'
									},
									subtitle: {
										text: 'Selected Issues with Year range From : ".$lowerYear."  To : ".$upperYear."',
										floating: true,
										align: 'right',
										verticalAlign: 'bottom',
										y: 15
									},
									legend: {
										layout: 'vertical',
										align: 'left',
										verticalAlign: 'top',
										x: 150,
										y: 100,
										floating: true,
										borderWidth: 1,
										backgroundColor: (Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF'
									},
									xAxis: {
										categories: [".$yearRange."]
									},
									yAxis: {
										title: {
											text: 'Number of Patients'
										},
										labels: {
											formatter: function () {
												return this.value;
											}
										}
									},
									tooltip: {
										formatter: function () {
											return '<b>' + this.series.name + '</b><br/>' +
												this.x + ': ' + this.y;
										}
									},
									plotOptions: {
										area: {
											fillOpacity: 0.5
										}
									},
									credits: {
										enabled: false
									},
									".$data."
								});
							});";
					$tableContent = "";

		}
		else if($_POST['chartType'] == 5)
		{
			
			
			
			$chartScript = "$(function () {
					$('#container').highcharts({
						chart: {
							type: 'column',
							margin: 75,
							options3d: {
								enabled: true,
								alpha: 10,
								beta: 25,
								depth: 70
							}
						},
						title: {
							text: '3D chart with null values'
						},
						subtitle: {
							text: 'Notice the difference between a 0 value and a null point'
						},
						plotOptions: {
							column: {
								depth: 25
							}
						},
						xAxis: {
							categories: Highcharts.getOptions().lang.shortMonths
						},
						yAxis: {
							title: {
								text: null
							}
						},
						series: [{
							name: 'Sales',
							data: [2, 3, null, 4, 0, 5, 1, 4, 6, 3]
						}]
					});
				});";
			
			echo $chartScript;
			}
		}
		
		$tableContent .= "</table>";
	
	


?>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>Highcharts Example</title>

		<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
		<style type="text/css">
			${demo.css}
		</style>
		<script type="text/javascript">
			<?php echo  $chartScript;?>

		</script>
	</head>
	<body>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>

<br><br>
<div align="center">
<a class="button-link1" href="saccount.php">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Back&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>&nbsp;  
<a class="button-link1" href="print();">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Print&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>&nbsp;  
</div>
<br><br><br>
<div id="container" style="min-width: 310px; height: 400px; margin: 0 auto"></div>

	<br>
	<hr>
<div id="tables" style="min-width: 310px; height: 400px; margin: 0 auto"><?php echo "<br><br><br><br>".$tableContent;?></div>

	</body>
</html>
