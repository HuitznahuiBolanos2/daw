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


$( function() {
  var availableTags = [
    "Pedro",
    "Juan",
    "Alonso"
  ];
  $( "#cliente" ).autocomplete({
    source: availableTags
  });
} );
