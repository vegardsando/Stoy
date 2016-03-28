
// Set up variables to use for routing

$document	  = $(document);

var temp_instrument_counter = 0,
temp_column_counter = 0;

console.log('from CRM- routesToCMS.js:');
console.log(JSONCols);

var markup = [];
markup.Instr = '<div class="gen_box gen_box_"></div>';
markup.InstrInner = '<div class="instr_box">' +
                      '<a class="instr_box-settings"></a>' +
                      '<footer class="instr_box-footer" contenteditable="true">' +
                        '<p>..</p>' +
                      '</footer></div>';
markup.ColSingle = '<div class="canvas-col single-col"></div>';
markup.Col = '<div class="canvas-col big-col"></div>';

var $header     = $('.topHeader');
var $canvasMain = $('.canvas-main');
var $elementsParent;

var isSettingsPanelActive = false;
var ctrlClick = false;

// ****************
// INITIALIZE
// ****************
initialize();

function initialize() {

  // Hent innhold fra CMS og plasser elementer
  //$('.canvas-col.big-col').remove();
  populateColsFromJSON();

  $('.panel-settings span').droppable({

    tolerance: "pointer",

    drop: function(event, ui) {
      var target = $(event.target);
      ui.draggable.remove();
      $header.removeClass('show-instrument-settings');
    }

  });
}


// ****************
// POPULATE FROM JSON (CMS)
// ****************
function populateColsFromJSON() {

  // For hver kolonne i JSON-objektet
  for ( var i = 0, l = JSONCols.length; i < l; i++ ) {
      appendCol(JSONCols[i]);
  }

}

function selectElementContents(el) {
    var range = document.createRange();
    el = el[0];
    range.selectNodeContents(el);
    var sel = window.getSelection();
    sel.removeAllRanges();
    sel.addRange(range);
}

// ****************
// ADD COLUMN
// ****************

// Legg til ny kolonne
function appendCol(column) {

  // Lag midlertidig element og sett på riktige data-attributter
  var elementCol = $(markup.Col);
  elementCol.attr('data-id', column.id);
  elementCol.attr('data-rhytm', column.rhytm);

  // Legg til små-kolonner i stor kolonne
  for (i = 0; i < column.rhytm; i++) {
    var elementColSingle = $(markup.ColSingle);
    elementCol.append(elementColSingle);
  }

  // For hvert instrument
  for ( var i = 0, l = column.instruments.length; i < l; i++ ) {
    var thisInstrument = column.instruments[i];
    appendInstrument(elementCol, thisInstrument);
  }

  // Legg til blokk nederst for vers, refr etc
  elementCol.append('<div class="timetable-block"><p class="editable" contenteditable="true">' + column.name + '</p>' +
                      '<a class="instr_box-settings"></a>' +
                      '<a class="timetable-block--handle"></a>' +
                      '<div class="timetable-settings">Delete</div>' +
                    '</div>')

  elementCol.find('.instr_box-footer, .editable').dblclick(function(e) {
    selectElementContents($(this).get());
  });

  elementCol.find('.timetable-block .instr_box-settings').click(function() {

      if (elementCol.find('.timetable-block').hasClass('settings-active')) {
        elementCol.find('.timetable-block').removeClass('settings-active');
      } else {
        $('.timetable-block').removeClass('settings-active');
        elementCol.find('.timetable-block').addClass('settings-active');
      }


  });

  elementCol.find('.timetable-settings').click(function() {
    console.log('Delete this bitch');
    elementCol.remove();
  });

  // Sørg for at kolonene er droppable
  elementCol.droppable({
    tolerance: 'pointer',

    drop: function(event, ui) {

      // Lagre dragged element som en variabel
      var target = $(event.target);
      var tempElement = $(ui.draggable[0]);

      var originalColumn = ui.draggable.parent('.big-col').data('id');
      var thisColumn = target.data('id');
      var leftVal = 0;

      var helperleft = ui.helper.offset().left;
      var thisColoffset = target.offset().left;
      leftVal = Math.abs(thisColoffset +- helperleft);

      // Sjekk om ctrl har blitt klikket, isåfall, append kopien
      var helper = tempElement.draggable( "option", "helper" );

      if (helper === 'original') {
        target.append(tempElement);
        // Hvis elementet blir lagt i en ny kolonne, juster left-posisjon
        if (!target[0].isEqualNode($elementsParent)) {
          tempElement.css('left', leftVal);
        }
      } else {
        var $clone = ui.helper.clone(true).removeClass('ui-draggable-dragging');

        var elementClone = [];
        elementClone.height = $clone.outerHeight();
        elementClone.width = $clone.outerWidth();
        elementClone.left = leftVal;
        elementClone.top = parseInt($clone.css('top'));
        elementClone.role = $clone.find('.instr_box').data('role');
        elementClone.type = $clone.find('.instr_box').data('type');

        var $column = $('.big-col[data-id="' + column.id + '"]');

        appendInstrument($column, elementClone);

      }

    }
  });


  // Legg til slutt hele elementet inn
  $canvasMain.append(elementCol);

  // Sørg for at kolonnene kan flyttes også

  $canvasMain.sortable({
    connectWith: ".canvas-col.big-col",
    placeholder: "ui-state-highlight",
    helper:'clone',
    handle: ".timetable-block--handle",

    start: function(event, ui) {
      console.log('start dragging');
      $canvasMain.removeClass('dragscroll ');
      dragscroll.reset();
    },
    stop: function(event, ui) {
      $canvasMain.addClass('dragscroll ');
      dragscroll.reset();
    }
  });

  $canvasMain.disableSelection();
}

// ****************
// ADD INSTRUMENT BLOCK
// ****************

// Legg til nytt instrument
function appendInstrument(column, instrument) {

  var elementInstr = $(markup.Instr);
  elementInstr.attr('data-id', instrument.id);

  var elementInstrInner = $(markup.InstrInner);
  elementInstrInner.attr('data-type', instrument.type);
  elementInstrInner.attr('data-role', instrument.role);
  elementInstrInner.attr('data-desc', instrument.desc);
  elementInstrInner.find('.instr_box-footer p').text(instrument.desc);

  elementInstr.css({
    'top' : instrument.top,
    'left' : instrument.left,
    'height' : instrument.height,
    'width' : instrument.width,
    'position' : 'absolute'
  }).mousedown(function(event) {

    $(this).draggable('option', { helper : event.ctrlKey ? 'clone' : 'original'});
  })

    .draggable({
      grid: [75, 14],

      cancel: '.instr_box-settings, .instr_box-footer, .instruments',

      start: function(event, ui) {

        $canvasMain.removeClass('dragscroll ');
        dragscroll.reset();

        // Husk hvilken kolonne elementet ligger i
        $elementsParent = event.currentTarget.offsetParent;

        $header.addClass('show-instrument-settings');
        elementInstr.addClass('holding-down');


      },

      stop: function(event, ui) {
        $canvasMain.addClass('dragscroll ');
        dragscroll.reset();

        elementInstr.removeClass('holding-down');
        $header.removeClass('show-instrument-settings');

      }

    })
    .resizable({
      grid: [ 75, 14 ],

      start: function(event, ui) {
        console.log('start dragging');
        $canvasMain.removeClass('dragscroll ');
        dragscroll.reset();
      },

      stop: function(event, ui) {
        $canvasMain.addClass('dragscroll ');
        dragscroll.reset();
      }

    });

    // Lag instrument-settings-panel for hvert element
    var instrumentsClone = $('#aside-newcontent .instruments').clone();

    // CLICK HANDLERS
    // *********************

    instrumentsClone.find('li').click(function(e) {
      var type = $(this).data('type');
      var thisElement = elementInstrInner;
      thisElement.attr('data-type',type);

      // Lukk settings
      setTimeout(function() {
          elementInstr.removeClass('settings-active');
      }, 1000)

    });

    elementInstrInner.find('.instr_box-footer').dblclick(function(e) {
      console.log('double-click');
      selectElementContents($(this).get());
    });

    elementInstr.append(instrumentsClone);
    elementInstr.append(elementInstrInner);

    if (column.length) {
      column.append(elementInstr);
    } else {
      $('.canvas-col.big-col').first().append(elementInstr);
    }


}

function saveAllToJson() {

  // Clear JSONCols array
  JSONCols = [];

  $('.canvas-col.big-col').each(function(i, e) {
    var tempCols =  {};
    tempCols.instruments = [];

    tempCols.id = i;
    tempCols.name = $(this).find('.timetable-block .editable').text();
    tempCols.rhytm = $(this).data('rhytm');

    $(this).find('.gen_box').each(function(index, e) {
      var tempInstr = {};
      console.log('hver boks');
      var instrBox = $(this).find('.instr_box');
      tempInstr.id = index;
      tempInstr.type = instrBox.data('type');
      tempInstr.role = instrBox.data('role');
      tempInstr.desc = instrBox.find('.instr_box-footer p').text();
      tempInstr.height = parseInt($(this).css('height'));
      tempInstr.width = parseInt($(this).css('width'));
      tempInstr.top = parseInt($(this).css('top'));
      tempInstr.left = parseInt($(this).css('left'));

      tempCols.instruments.push(tempInstr);
    })

    JSONCols.push(tempCols);

  });

  // Push temp to main object
  console.log(JSONCols);
  var jsonStringify = JSON.stringify(JSONCols);

  var newTitle = $('.topHeader h1').text();

  $('#updateEntry input[name="title"]').val(newTitle);
  $('#updateEntry input[name="slug"]').val(newTitle);
  $('#updateEntry input[name="fields[json]"]').val(jsonStringify);

  // Lagre skjema
  $('#updateEntry input[type=submit]').click();
}


$document.on('click', '#aside-newcontent span', function (e) {
  $(this).parent().toggleClass('show');
});

$document.on('click', '#topHeader-menu, #topHeader-menuClose', function (e) {
  $('#canvas-wrapper').toggleClass('menuActive');
});

$document.on('click', '#aside-newcontent .instruments li', function (e) {
  //appendInstrument(elementCol, thisInstrument);

  var tempObj = [];
  tempObj.type = $(this).data('type');
  tempObj.role = '';
  tempObj.top = 200;
  tempObj.left = 0;
  tempObj.width = 300;
  tempObj.height = 100;

  appendInstrument('', tempObj);

});

$document.on('click', '.instr_box-settings', function (e) {
  e.preventDefault();
  var gen_box = $(this).parents('.gen_box');

  if (gen_box.hasClass('settings-active')) {
    gen_box.removeClass('settings-active');
  } else {
    $('.gen_box').removeClass('settings-active');
    gen_box.addClass('settings-active');
  }

  $canvasMain.removeClass('dragscroll ');
  dragscroll.reset();

});

$document.on('click', '.btn-newcol', function (e) {

  var colLength = $('.big-col').length;
  // Toggle menu
  e.preventDefault();
  var tempColToCreate = [];
  tempColToCreate.id = colLength + 1;
  tempColToCreate.name = 'ny kolonne';
  tempColToCreate.instruments = [];
  tempColToCreate.rhytm = 4;
  appendCol(tempColToCreate);
});

// LAGRE ENDRINGER PÅ SIDEN . GJØR OM TIL FUNKSJON!!
$document.on('click', '#saveentry', function (e) {
  // Toggle menu
  e.preventDefault();

  // Bygg opp json-object
  saveAllToJson();

});


// PAN SCROLLING
var orgScrollTop = $('.pianoroll').css('top');
$canvasMain.on('scroll',function (e) {

  var scrollTop = $(this).scrollTop();

  if (orgScrollTop > 0) {
    $('.pianoroll').css('top', orgScrollTop -scrollTop);
    //orgScrollTop = scrollTop;
  } else {
    orgScrollTop = scrollTop;
  }

});