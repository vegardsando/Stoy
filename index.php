<?php global $base; include "header.php"; ?>

<section id="frontpage-slide-container" class="slide-container">

    <!--First Slide-->
    <div class="slide current setsrc text-right" data-desktop="/static/img/stock12.jpg"
         data-tablet="static/temp/SUITE01_3-EDIT.jpg"
         data-phone="static/temp/SUITE01_3-EDIT.jpg" data-id='1'>
        <div class="slide-text">
            <p>Lyden av den gode historie</p>
            <p class="smaller">Musikk, lyddesign, voiceover og foley</p>
<!--
<p>Lyd som gir liv til gode historier</p>
            <p>Lyden av den gode historie</p>
            <p>Lyden som gir liv til din historie</p>
            <p>Lyden gir liv til den gode historie</p>
-->

        </div>
    </div>


    <ul class="pagination"></ul>

</section>

<figure class="divider down"></figure>

</header>

<section class="row">
    <figure class="emblem-heading">
        <h2>Utvalgte<strong> jobber</strong></h2>
    </figure>
</section>

<figure class="divider down"></figure>

<section class="grid">

    <article class="effect-two">
        <img class="sizer" src="http://placehold.it/350x250">
        <div class="sizer-div">
            <img src="/static/temp/bg.jpg">
            <div class="video">
                <iframe src="//player.vimeo.com/video/39739082" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
            </div>					
            <figcaption>
                <h2>Lorem <span>ipsum</span></h2>
                <p>Roxy was my best friend. She'd cross any border for me.</p>
                <span class="icon_play">
                    <?php include "/static/img/icon_play.svg" ?>
                </span>
            </figcaption>
        </div>
    </article>

    <article class="effect-one">
        <img class="sizer" src="http://placehold.it/350x250">
        <div class="sizer-div">
            <img src="/static/temp/bg8.jpg">
            <div class="video">
                <iframe src="//player.vimeo.com/video/110128159" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
            </div>					
            <figcaption>
                <h2>Lorem <span>ipsum</span></h2>
                <p>Roxy was my best friend. She'd cross any border for me.</p>
                <span class="icon_play">
                    <?php include "/static/img/icon_play.svg" ?>
                </span>
            </figcaption>
        </div>
    </article>

    <article class="effect-three">
        <img class="sizer" src="http://placehold.it/350x250">
        <div class="sizer-div">
            <img src="/static/temp/bg7.jpg">
            <figcaption>
                <h2>Lorem <span>ipsum</span></h2>
                <p>Milo went to the woods. He took a fun ride and never came back.</p>
                <span class="icon_play">
                    <?php include "/static/img/icon_play.svg" ?>
                </span>					
            </figcaption>
        </div>
    </article>

    <article class="effect-one">
        <img class="sizer" src="http://placehold.it/350x250">
        <div class="sizer-div">
            <img src="/static/temp/bg4.jpg">
            <figcaption>
                <h2>Lorem <span>ipsum</span></h2>
                <p>Roxy was my best friend. She'd cross any border for me.</p>
            </figcaption>
        </div>
    </article>

    <article class="effect-one">
        <img class="sizer" src="http://placehold.it/350x250">
        <div class="sizer-div">
            <img src="/static/temp/bg5.jpg">
            <figcaption>
                <h2>Lorem <span>ipsum</span></h2>
                <p>Milo went to the woods. He took a fun ride and never came back.</p>
            </figcaption>
        </div>
    </article>

    <article class="effect-one">
        <img class="sizer" src="http://placehold.it/350x250">
        <div class="sizer-div">
            <img src="/static/temp/bg6.jpg">
            <figcaption>
                <h2>Lorem <span>ipsum</span></h2>
                <p>Roxy was my best friend. She'd cross any border for me.</p>
            </figcaption>
        </div>
    </article>

    <div class="row centered">
        <div class="btn border">
            <a href="">Se alle jobber</a>
        </div>
    </div>
</section>

<section class="row">
    <figure class="emblem-heading">
        <h2>Hva vi er <strong>gode</strong> på</h2>
    </figure>
</section>

<figure class="divider down"></figure>

<section id="frontpage_studio-foley">

    <figure class="foley">
        <div class="sizer-div">
            <img src="/static/img/stock13.jpg">
        </div>

        <div class="text">
            <h2>Lyd til<span> bilde</span></h2>
            <p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque.</p>
            <span class="btn transparent small">
                <a href="#">Les mer</a>
            </span>
        </div>

    </figure>

    <figure class="studio">

        <div class="sizer-div">
            <img src="/static/img/stock1.jpg">
        </div>

        <div class="text">
            <h2>Studio og <strong>musikkproduksjon</strong></h2>
            <p>At vero eos et accusamus et iusto odio dignissimos mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio.</p>
            <span class="btn transparent small">
                <a href="#">Les mer</a>
            </span>
        </div>

    </figure>

</section>

<section class="row">
    <figure class="emblem-heading">
        <h2>Noen av våre<strong> samarbeidspartnere</strong></h2>
    </figure>
</section>

<figure class="divider"></figure>

<section id="frontpage_kunder">
    <div class="row">
        <a href="#">
            <img src="/static/temp/logo_helmet.png">
        </a>
        <a href="#">
            <img src="/static/temp/logo_nrk.png">
        </a>
        <a href="#">
            <img src="/static/temp/logo_ekkofilm.png">
        </a>
        <a href="#">
            <img src="/static/temp/logo_news.png">
        </a>
        <a href="#">
            <img src="/static/temp/logo_spaett.png">
        </a>
    </div>
    <figure class="divider down colored"></figure>
</section>


<section id="frontpage_map">
    <div id="map"></div>
</section>

<?php include "footer.php"; ?>
