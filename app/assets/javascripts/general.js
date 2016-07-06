var ratyjs = function() {
  $('.rating').raty({ path: '/assets', scoreName: 'comment[rating]' });
  $('.rated').raty({ path: '/assets',
    readOnly: true,
    score: function() {
      return $(this).attr('data-score');
    }
  });
}
 
$(document).on('turbolinks:load', function(){
  ratyjs();

  $('.img-zoom').elevateZoom({
    lensShape : "square", 
    zoomWindowWidth: 100,
    zoomWindowHeight: 100,
    lensSize : 150,
    zoomType  : "lens", 
    cursor: "crosshair"
  });  
});

$(function() {
  $(".alert").delay(4000).fadeOut(1500); 
});

