<?php $underside = 'fixed underside'; ?>
<?php global $base; include "header.php"; ?>


    <section class="row">
    	<figure class="emblem-heading">
    		<h2>Artsdatabanken<strong></strong></h2>
   		</figure>
   	</section>	


   <section id="case_slide-container" class="slide-container">

      <!--First Slide-->
      <div class="slide">
        <div class="row">
            <div class="text">
            	<h1>Artsdatabanken</h1>
            	<p><strong>Lyd og musikk - Helmet</strong></p>
            	<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. </p>
            </div>
        	</div class="video">

    		</div>
        </div>

      </div>

    </section>

    <figure class="divider down"></figure>

</header>    

    <section class="row">
    	<figure class="emblem-heading">
    		<h2>Ta gjerne <strong>kontakt</strong></h2>
   		</figure>
   	</section>

   	<figure class="divider"></figure>

	<section id="frontpage_kontakt">
		<div class="row">
			<div class="frontpage_ansatte">
				<div class="col">
					<img src="/static/temp/monkey1.jpg">
					<h3>Thomas Gregussen</h3>
					<p>Producer/Songwriter</p>
					<p>Tlf: 1234567</p>
					<div class="text_extended">
						<a href="">
							<img src="/static/img/icon_twitter.svg">
						</a>
						<a href="">
							<img src="/static/img/icon_facebook.svg">
						</a>
						<a href="">
							<img src="/static/img/icon_linkedin.svg">
						</a>								
					</div>
				</div>
				<div class="col">
					<img src="/static/temp/monkey2.jpg">
					<h3>Thomas Gregussen</h3>
					<p>Producer/Songwriter</p>
					<p>Tlf: 1234567</p>
					<div class="text_extended">
						<a href="">
							<img src="/static/img/icon_twitter.svg">
						</a>
						<a href="">
							<img src="/static/img/icon_facebook.svg">
						</a>
						<a href="">
							<img src="/static/img/icon_linkedin.svg">
						</a>
					</div>
				</div>
				<div class="col">
					<img src="/static/temp/monkey1.jpg">
					<h3>Thomas Gregussen</h3>
					<p>Producer/Songwriter</p>
					<p>Tlf: 1234567</p>
					<div class="text_extended">
						<a href="">
							<img src="/static/img/icon_twitter.svg">
						</a>
						<a href="">
							<img src="/static/img/icon_facebook.svg">
						</a>
						<a href="">
							<img src="/static/img/icon_linkedin.svg">
						</a>
					</div>
				</div>								
			</div>
			<div class="reformed-form" form-title="kontakt_form">
				<form>
		
					<div class="pos-rel">
					    <input type="text" name="fornavn" value="" id="freeform_fornavn" maxlength="150">
					    <label>Fornavn</label>
					</div>
	
					<div class="pos-rel">
					    <input type="text" name="etternavn" value="" id="freeform_etternavn" maxlength="150">
					    <label>Etternavn</label>
					</div>

					<div class="pos-rel">
					    <input type="text" name="e-post" value="" id="freeform_e-post" maxlength="150">
					    <label>E-post</label>
					</div>
	
					<div class="pos-rel">
					    <input type="text" name="telefon" value="" id="freeform_telefon" maxlength="150">
					    <label>Telefon</label>
					</div>
	
					<div class="btn_wrap">
						<button type="submit" class="btn">
							<a href="#">Send</a>
						</button>
						<input type="file" name="last_opp_cv[0]" value="" id="freeform_last_opp_cv0" class="hidden input_upload">
						<input type="submit" name="submit" value="Submit" class="hidden input_submit">
					</div>
				</form>
			</div>
		</div>
	</section>

<?php include "footer.php"; ?>
