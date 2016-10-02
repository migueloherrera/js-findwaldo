console.log('we are here...');
var people;

function get_characters() {
  var level = window.location.href.split("/").pop();
  if (level) {
    $.get( '/read_character.json', {
      id: level
    }).done( function(data) {
      people = data;
      populateMenu(data);
    }).fail( function( jqxhr, textStatus, error ) {
      var err = textStatus + ", " + error;
      console.log( "Ajax Request Failed: " + err );
    });
  }
}

function populateMenu(data) {
  for (var i=0; i < data.length; i++) {
    console.log(data[i].name);
  }
}

function inRange(row, col, x, y) {
  return (row >= x && row <= (x + 20) && col >= y && col <= (y + 40)) ? true : false;
}

function checkImage(posX, posY) {
  console.log(posX, posY, people.length);

  for (var i = 0; i < people.length; i++) {
    console.log(posX, posY, people[i].posx, people[i].posy);
    if (inRange(posX, posY, people[i].posx, people[i].posy)) {
      console.log('Found: ', people[i].name);
    }
  }  
}

$(document).on("turbolinks:load", function() {
  console.log('turbo is ready: ', $.turbo.isReady);
  get_characters();
  console.log('the document is ready');
  $('.bigimage img').on('click', function(event) {
    console.log('clicked image');
    var offset = $(this).offset();
    var clickedX = event.pageX - offset.left;
    var clickedY = event.pageY - offset.top;  

    checkImage(clickedX, clickedY);
  });
 
});
