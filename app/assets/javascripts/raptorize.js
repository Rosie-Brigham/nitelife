/*
 * jQuery Raptorize Plugin 1.0
 * www.ZURB.com/playground
 * Copyright 2010, ZURB
 * Free to use under the MIT license.
 * http://www.opensource.org/licenses/mit-license.php
*/

(function($) {
  $.fn.raptorize = function(options) {
    //Yo' defaults
    var defaults = {
      enterOn: 'click', //timer, konami-code, click
      delayTime: 5000 //time before raptor attacks on timer mode
    };

    //Extend those options
    var options = $.extend(defaults, options);

    return this.each(function() {

      var _this = $(this);
      var audioSupported = false;

      if ($.browser) { // old jQuery audio detection
        if ($.browser.mozilla && $.browser.version.substr(0, 5) >= "1.9.2" || $.browser.webkit) {
          audioSupported = true;
        }
      } else {
        var audio = document.createElement('audio');
        if (audio.canPlayType) { // HTML5 audio element function
          audioSupported = true;
        }
      }

      //Raptor Vars
      // var raptorImageMarkup = '<img id="elRaptor" style="display: none" src="<%= image_tag "raptor.jpg" %>" />''
      // var raptorAudioMarkup = '<audio id="elRaptorShriek" preload="auto">' +
      //   '<source src="<%= asset_path("raptor-sound.mp3") %>" />' +
      //   '<source src="<%= asset_path("raptor-sound.ogg") %>" />' +
      //   '</audio>';
      var locked = false;

      //Append Raptor and Style
      var raptor = $('#elRaptor').css({
        "position":"fixed",
        "bottom": "-700px",
        "right" : "0",
        "display" : "block"
      })

      // Animating Code
      function init() {
        locked = true;

        //Sound Hilarity
        // if(audioSupported) {
        //   function playSound() {
        //     var sound = document.getElementById('elRaptorShriek');
        //     sound.load();
        //     sound.play();
        //   }
        //   playSound();
        // }

        // Movement Hilarity
        raptor.animate({
          "bottom" : "0"
        }, function() {
          console.log("Fired")
          $(this).animate({
            "bottom" : "-130px"
          }, 100, function() {
            var offset = (($(this).position().left)+400);
            $(this).delay(300).animate({
              "right" : offset
            }, 2200, function() {
              raptor = $('#elRaptor').css({
                "bottom": "-700px",
                "right" : "0"
              })
              locked = false;
            })
          });
        });
      }

      //Determine Entrance
      if(options.enterOn == 'timer') {
        setTimeout(init, options.delayTime);
      } else if(options.enterOn == 'click') {
        _this.bind('click', function(e) {
          e.preventDefault();
          if(!locked) {
            init();
          }
        })
      } else if(options.enterOn == 'konami-code'){
        var kkeys = [];
        var konami = "38,38,40,40,37,39,37,39,66,65";
        var klength = konami.split(',').length;
        $(window).bind("keydown.raptorz", function(e){
          kkeys.push( e.keyCode );
          if ( kkeys.length > klength ) {
            kkeys.shift();
          }
          if ( kkeys.toString() === konami ) {
            init();
            kkeys = [];
          }
        });

      }

    });//each call
  }//orbit plugin call
})(jQuery);
