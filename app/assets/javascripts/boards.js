var people;

function get_characters() {
  var level = window.location.href.split("/").pop();
  if (level) {
    $.get( '/read_character.json', {
      id: level
    }).done( function(data) {
      people = data;
    }).fail( function( jqxhr, textStatus, error ) {
      var err = textStatus + ", " + error;
      console.log( "Ajax Request Failed: " + err );
    });
  }
}

function inRange(row, col, x, y) {
  return (row >= x && row <= (x + 20) && col >= y && col <= (y + 40)) ? true : false;
}

function checkImage(posX, posY) {
  var found = people;
  for (var i = 0; i < found.length; i++) {
    if (inRange(posX, posY, found[i].posx, found[i].posy)) {
      $('.'+ (found[i].name.toLowerCase()) + ' .checkmark').show();
      $("<div class='square' style='left:" + found[i].posx + "px; top:" + found[i].posy + "px;'></div>").appendTo('.bigimage');
      people.splice(i, 1);
      if (people.length == 0) {
        $('#gameover').fadeIn('slow');
      }
    }
  }  
}

$(document).on("turbolinks:load", function() {
  if ($('.wrapper').length) {
    get_characters();
  }
  $('.bigimage img').on('click', function(event) {
    var offset = $(this).offset();
    var clickedX = event.pageX - offset.left;
    var clickedY = event.pageY - offset.top;  
    checkImage(clickedX, clickedY);
  });
});
