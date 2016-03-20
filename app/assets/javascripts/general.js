var ratyjs = function() {
  $('.rating').raty({ path: '/assets', scoreName: 'comment[rating]' });
  $('.rated').raty({ path: '/assets',
    readOnly: true,
    score: function() {
      return $(this).attr('data-score');
    }
  });
}
 
 
$(document).on('ready page:load', function(){
  ratyjs();

  $('.img-zoom').elevateZoom({
    lensShape : "square", 
    zoomWindowWidth: 200,
    zoomWindowHeight: 200,
    lensSize : 200,
    zoomType  : "lens", 
    cursor: "crosshair"
  });
});

$(function() {
  $(".alert").delay(4000).fadeOut(1500);
});

