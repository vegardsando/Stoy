
        <footer>
            <img class="footer_logo" src="static/img/logo_dark.png">

            <ul class="unstyled">
                <li>
                    <img src="static/img/icon_address.png">
                    <span>Båtmannsgata 4<br>7044 Trondheim</span>
                </li>
                <li>
                    <img src="static/img/icon_contact.png">
                    <span>post@stoey.no<br>
                        Thomas: 847 58 484<br>
                        David: 847 58 484
                    </span>

                </li>
                <li class="facebook">
                    <img src="static/img/icon_facebook.png">
                    <span>Facebook</span>
                </li>
                <li class="vimeo">
                    <img src="static/img/icon_vimeo.png">
                    <span>Vimeo</span>
                </li>
            </ul>
        </footer>

        <script src="/static/js/vendor/modernizr-custom-2.7.1.min.js"></script>
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
        <script>window.jQuery || document.write('<script src="/static/js/vendor/jquery-1.10.2.min.js"><\/script>')</script>

        <script src="/static/js/LAB.min.js"></script>
		<script>
		  $LAB
		  //.script("/static/js/vendor/modernizr-custom-2.7.1.min.js")
		  //.script("/static/js/vendor/jquery.fitvids.js")
		  .script("<?php _minimee('{exp:minimee:display js="added" display="url"}'); ?>")
		  .script("<?php _minimee('{exp:minimee:display js="bottom_js" display="url"}'); ?>")
		  .wait(function(){
		  	  try{Typekit.load();}catch(e){}
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
        <script src="/static/js/plugins.js"></script>
        <script src="https://maps.googleapis.com/maps/api/js"></script>
        <script src="http://a.vimeocdn.com/js/froogaloop2.min.js"></script>
        <script src="static/js/vendor/jquery.fitvids.js"></script>
        <script src="/static/js/main.js<?php _dev_time() ?>"></script>
        <?php _minimee('{/exp:minimee:js}'); ?>

         <?php _google_analythics(); // Code: 'universial'/'old'/true/"code" -> ({UA} for UA-). UA-: false/'XXXXX-X', Alert: false/true ?>
    </body>
</html>