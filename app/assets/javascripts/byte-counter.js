$(document).ready(function() {
  var props = {
    imgSize: {
    x: 1050,
    y: 600
    },

  }
   var sources = [
    'https://raw.githubusercontent.com/kromitj/images/master/011.png',
    'https://raw.githubusercontent.com/kromitj/images/master/011.png',
    'https://raw.githubusercontent.com/kromitj/images/master/011.png',
    'https://raw.githubusercontent.com/kromitj/images/master/011.png',
    'https://raw.githubusercontent.com/kromitj/images/master/011.png',
    'https://raw.githubusercontent.com/kromitj/images/master/011.png',
    'https://raw.githubusercontent.com/kromitj/images/master/011.png',
    'https://raw.githubusercontent.com/kromitj/images/master/011.png',
  ];
  images = loadImages2(sources);

  var canvas = document.getElementById('myCanvas');
  var context = canvas.getContext('2d');
 
  $('.enter_btn').on('click', function(event) {
    event.preventDefault();

    var $link = $('.input_form');
    console.log("login link: " + $link.attr("action"));
     var ajaxRequest = $.ajax({
       url: $link.attr("action"),
       type: 'post',
       data: $link.serialize()
     });

     ajaxRequest.done(function (formHtml) {
      console.log(formHtml)
      var img_array = formHtml.bit_adder_imgs;
      console.log(img_array);
       $('.input_a').html(formHtml.input_a);
       $('.input_b').html(formHtml.input_b);
       $('.math_problem').html(formHtml.math_problem);
       $('.binary_output').html(formHtml.output);
       $('.num_output').html(formHtml.num_output);
       loadImages(sources, function(images) {
        
        context.font = "bold 16px Arial";
        drawImgs(context, images, img_array, props.imgSize)
      });
     });
  });  
  $('.tab a').click(function (e) {
  e.preventDefault();
  alert('yo');
  $(this).tab('show')
})
  

      
}); // end on.ready

function loadImages(sources, callback) {
  var images = {};
  var loadedImages = 0;
  var numImages = 0;
  // get num of sources
  for(var src in sources) {
    numImages++;
  }
  for(var src in sources) {
    images[src] = new Image();
    images[src].onload = function() {
      if(++loadedImages >= numImages) {
        callback(images);
      }
    };
    images[src].src = sources[src];
  }
}


function loadImages2(sources) {
  var images = []
  for (var source in sources) {
    var myImage = new Image(1050, 600);
    myImage.src = sources[source];
    images.push(myImage);
  };
  return images  
};
function generateImgTitles() {
  var ordinalSuffixes = ["th", "st", "nd", "rd", "th", "th", "th", "th"];
  var titles = [];
  for (var i = 0; i < 8; i++) {
    titles.push(i + ordinalSuffixes[i] + " Bit Counter")
  };
  return titles;
}

function drawImgs(context, images, img_array, imgSize) {
  var imgTitles = generateImgTitles();
  for (var i = 0; i < 8; i++) {
    context.drawImage(images[img_array[i]], (imgSize.x*i), 0, imgSize.x, imgSize.y);
    context.fillText(imgTitles[i], ((imgSize.x*i) + imgSize.x/2.1), (imgSize.y*.05));
  };
}








