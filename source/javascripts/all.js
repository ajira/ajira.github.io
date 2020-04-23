//= require jquery-2.1.4
//= require scrollreveal.3.3.6
//= require vivus-0.2.2

$(document).ready(function() {

  window.sr = ScrollReveal({
    enter: 'top',
    move: '64px',
    over: '1s',
    reset: true
  });
  window.sr.reveal('.sr-top', {origin: 'top'});
  window.sr.reveal('.sr-left', {origin: 'left'});
  window.sr.reveal('.sr-right', {origin: 'right'});
  window.sr.reveal('.sr-bottom', {origin: 'bottom'});
  window.sr.reveal('.sr-scale-10', {scale: 0.9});
  window.sr.reveal('.sr-spin-90', {rotate: {x: 90}});
  window.sr.reveal('.sr-negspin-25', {rotate: {x: -25}});

  $('svg.vivus').each(function() {
    var $el = $(this);
    var oldClass = $el.attr('class');
    var defaultConfig = {
      duration: 200,
      onReady: function() { $el.attr('class', oldClass + ' vivus-start'); }
    };

    var config = $.extend(defaultConfig, $el.data());
    this.vivus = new Vivus(this, config, function() { $el.attr('class', oldClass + ' vivus-start vivus-done') });

    $el.on('click', function() {
      this.vivus.onReady();
      this.vivus.reset().play();
    });
  });

  $('.team-person').click(function() {
    var $el = $(this);
    var targetId = $el.attr('href');
    var $target = $(targetId);

    $target.addClass('active');
  });

  $('.team-person-profile .close-btn').click(function() {
    $(this).closest('.team-person-profile').removeClass('active');
  });

});
