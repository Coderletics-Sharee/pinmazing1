# Place all the behaviors and hooks related to the matching controller here.
$ ->
  $('#pins').imagesLoaded ->
    $('#pins').masonry
      itemSelector: '.box'
      isFitWidth: true
      
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
