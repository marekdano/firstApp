
$(document).on('ready page:load', function(){
  $('.rating').raty({ path: '/assets', scoreName: 'comment[rating]' });
  $('.rated').raty({ path: '/assets',
    readOnly: true,
    score: function() {
      return $(this).attr('data-score');
    }
  });

  $('.img-zoom').elevateZoom({
    zoomType  : "lens", 
    lensShape : "square", 
    lensSize : 300 
  });
});

$(function() {
  $(".alert").delay(4000).fadeOut(1500);
});

