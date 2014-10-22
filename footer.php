        <script src="/static/js/vendor/modernizr-custom-2.7.1.min.js"></script>
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
        <script>window.jQuery || document.write('<script src="/static/js/vendor/jquery-1.10.2.min.js"><\/script>')</script>
		
        <script src="/static/js/LAB.min.js"></script>
		<script>
		  $LAB
		  //.script("/static/js/vendor/modernizr-custom-2.7.1.min.js")
		  //.script("//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js")
		  .script("<?php _minimee('{exp:minimee:display js="added" display="url"}'); ?>")
		  .script("<?php _minimee('{exp:minimee:display js="bottom_js" display="url"}'); ?>")
		  .wait(function(){
		  	  try{Typekit.load();}catch(e){}
			  init_page();
		  });
		</script>
		
		<script type="text/javascript">
	       	function css_file(file){
	       		if(file.length == 0 || file.indexOf('{') !== -1) return;
				link = document.createElement("link");
				link.href = file;
				link.type = "text/css";
				link.rel = "stylesheet";
	
				document.getElementsByTagName( "head" )[0].appendChild( link );
			}
			css_file('{exp:minimee:display css="screen" display="url"}');
			css_file('{exp:minimee:display css="added" display="url"}');
		</script>
		
		<?php _minimee('{exp:minimee:js queue="bottom_js"}'); ?>
        <script src="http://cdnjs.cloudflare.com/ajax/libs/gsap/latest/TweenLite.min.js"></script>
		<script src="http://cdnjs.cloudflare.com/ajax/libs/gsap/latest/plugins/ScrollToPlugin.min.js"></script>
        <script src="/static/js/plugins.js"></script>
        <script src="/static/js/main.js<?php _dev_time() ?>"></script>
        <?php _minimee('{/exp:minimee:js}'); ?>
        
         <?php _google_analythics(); // Code: 'universial'/'old'/true/"code" -> ({UA} for UA-). UA-: false/'XXXXX-X', Alert: false/true ?>
    </body>
</html>