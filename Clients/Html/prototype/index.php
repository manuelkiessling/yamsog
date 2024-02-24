<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>Untitled Document</title>
	</head>
	
	<style>
		body {
			margin-top: 100px;
		}

		div {
			background-repeat:no-repeat;
			display:inline-block;
			height:170px;
			margin-top:-91px;
			width:100px;
		}
		
		img {
			display:inline-block;
			height:141px;
			padding-left:9px;
			padding-top:29px;
			width:80px;
		}
		
		.t_g {
			background-image: url(g.png);
		}
		
		.t_p {
			background-image: url(p.png);
		}
		
		.t_w {
			background-image: url(w.png);
		}
	</style>
	
	<body>
		
		<?php

			$json_data = file_get_contents('http://0.0.0.0:3001/state/get');
			
			$state = json_decode($json_data, TRUE);
			
			$r = 0;
			foreach ($state['map']['terrain'] as $cols) {
				 $c = 0;
				 foreach ($cols as $col) {
				 	echo "<div id='{$r}_$c' class='t_$col'>";
					if ($state['map']['units'][$r][$c]['type']) echo "<img src='{$state['map']['units'][$r][$c]['type']}.png'";
					echo "</div>";
					$c++;
					
				 }
				 $r++;
				 echo '<br />';
			}

		?>
		
	</body>
</html>
