$( function() {
  var availableTags = [
    "hola",
    "adios",
    "como estas"
  ];
  $( "#productos" ).autocomplete({
    source: availableTags
  });
} );
