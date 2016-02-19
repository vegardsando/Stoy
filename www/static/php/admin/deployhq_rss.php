<?php
//get the q parameter from URL
if (isset($_GET["rss"])) {
	$id = $_GET["rss"];
	$projectUrl = 'https://mustasj.deployhq.com/projects/'.$id;
	$deployUrl = $projectUrl.'/deployments/new';
	$xml = $projectUrl.'/deployments.rss?token=v3poy9jcddmhvhiljdwukpzky7ac47u4ol1pguqi';


	echo("<div>");
	$xmlDoc = new DOMDocument();
	if ($xmlDoc->load($xml)){

		//get elements from "<channel>"
		$channel = $xmlDoc->getElementsByTagName('channel')->item(0);
		$channel_title = $channel->getElementsByTagName('title')->item(0)->childNodes->item(0)->nodeValue;
		$channel_link = $channel->getElementsByTagName('link')->item(0)->childNodes->item(0)->nodeValue;
		$channel_desc = $channel->getElementsByTagName('description')->item(0)->childNodes->item(0)->nodeValue;

		//output elements from "<channel>"
		echo("<a style='float: left; font-size: 30px; padding: 10px 14px; line-height: 30px; margin-right: 10px; background: black;' onClick='getDeployRSS()'>↺</a><a href='".$deployUrl."' style='float: left; font-size: 30px; padding: 10px 14px; line-height: 30px; margin-right: 10px; background: black;' target='_blank'>⇪</a><h3 style='color: gray; margin:0px !important; height: 50px; line-height: 25px;'><a style='color: black;' href='" . $channel_link . "' target='_blank'>" . $channel_title . "</a>");
		echo("<br>");
		echo($channel_desc . "</h3><section style='padding-top:10px;'>");

		//get and output "<item>" elements
		if ($xmlDoc->getElementsByTagName('item')->length == 0){
			die("This project hasn’t been deployed yet.<a style='position: absolute; right: 10px; top: 10px; background: black; padding: 10px 15px;' onClick='closeDeployRSS()'>X</a></section></div>");
		}

		$x=$xmlDoc->getElementsByTagName('item');
		for ($i=0; $i<=29; $i++) {
		  $item_title=$x->item($i)->getElementsByTagName('title')->item(0)->childNodes->item(0)->nodeValue;
		  $item_link=$x->item($i)->getElementsByTagName('link')->item(0)->childNodes->item(0)->nodeValue;
		  $item_desc=$x->item($i)->getElementsByTagName('description')->item(0)->childNodes->item(0)->nodeValue;

		if(strpos($item_desc, '(Completed)') !== false){
			$style = "background: #1FBE7B;";
		}elseif(strpos($item_desc, '(Pending)') !== false){
			$style = "background: #1f74db; width: 100%; max-width: none; font-size: 1.5em;";
		}elseif(strpos($item_desc, '(Running)') !== false){
			$style = "background: orange; width: 100%; max-width: none; font-size: 1.5em;";
		}elseif(strpos($item_desc, '(Failed)') !== false){
			$style = "background: #e54545;";
		}

		  echo ("<div style='padding: 20px; color:gray; display: inline-block; margin: 0 10px 10px 0; max-width: 400px; vertical-align: top;'><span style='padding: 8px 10px; color:white; ".$style."'><strong>" . $item_title . "</strong></span><br/>");
		  echo ("<br>");
		  echo ($item_desc . "<br/><a style='padding: 5px 10px; background:black; display: inline-block; margin: 10px 10px 10px 0;' href='" . $item_link. "' target='_blank'>See commit</a><a style='padding: 5px 10px; background:#009adb; display: inline-block; margin: 10px 10px 10px 0;' href='" . $item_link. "/rollback' target='_blank'>Rollback</a></div>");
		}

	} else {
	   echo("<section style='padding-top:10px;'>Wrong project uri");
	}

	echo ("<a style='position: absolute; right: 10px; top: 10px; background: black; padding: 10px 15px;' onClick='closeDeployRSS()'>X</a></section></div>");
}
?>
