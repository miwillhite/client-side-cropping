require 'sinatra'

get '/' do
  erb :index
end

__END__


@@index

<!DOCTYPE html>

<html>
<head>
  <meta http-equiv="Content-type" content="text/html; charset=utf-8">
  <title>Testerooni</title>
  
  <style type="text/css" media="screen">
    /* jquery.Jcrop.min.css v0.9.9 (build:20120109) */
    .jcrop-holder{direction:ltr;text-align:left;}
    .jcrop-vline,.jcrop-hline{background:#FFF url(Jcrop.gif) top left repeat;font-size:0;position:absolute;}
    .jcrop-vline{height:100%;width:1px!important;}
    .jcrop-hline{height:1px!important;width:100%;}
    .jcrop-vline.right{right:0;}
    .jcrop-hline.bottom{bottom:0;}
    .jcrop-handle{background-color:#333;border:1px #eee solid;font-size:1px;}
    .jcrop-tracker{-webkit-tap-highlight-color:transparent;-webkit-touch-callout:none;-webkit-user-select:none;height:100%;width:100%;}
    .jcrop-handle.ord-n{left:50%;margin-left:-4px;margin-top:-4px;top:0;}
    .jcrop-handle.ord-s{bottom:0;left:50%;margin-bottom:-4px;margin-left:-4px;}
    .jcrop-handle.ord-e{margin-right:-4px;margin-top:-4px;right:0;top:50%;}
    .jcrop-handle.ord-w{left:0;margin-left:-4px;margin-top:-4px;top:50%;}
    .jcrop-handle.ord-nw{left:0;margin-left:-4px;margin-top:-4px;top:0;}
    .jcrop-handle.ord-ne{margin-right:-4px;margin-top:-4px;right:0;top:0;}
    .jcrop-handle.ord-se{bottom:0;margin-bottom:-4px;margin-right:-4px;right:0;}
    .jcrop-handle.ord-sw{bottom:0;left:0;margin-bottom:-4px;margin-left:-4px;}
    .jcrop-dragbar.ord-n,.jcrop-dragbar.ord-s{height:7px;width:100%;}
    .jcrop-dragbar.ord-e,.jcrop-dragbar.ord-w{height:100%;width:7px;}
    .jcrop-dragbar.ord-n{margin-top:-4px;}
    .jcrop-dragbar.ord-s{bottom:0;margin-bottom:-4px;}
    .jcrop-dragbar.ord-e{margin-right:-4px;right:0;}
    .jcrop-dragbar.ord-w{margin-left:-4px;}
    .jcrop-light .jcrop-vline,.jcrop-light .jcrop-hline{background:#FFF;filter:Alpha(opacity=70)!important;opacity:.70!important;}
    .jcrop-light .jcrop-handle{-moz-border-radius:3px;-webkit-border-radius:3px;background-color:#000;border-color:#FFF;border-radius:3px;}
    .jcrop-dark .jcrop-vline,.jcrop-dark .jcrop-hline{background:#000;filter:Alpha(opacity=70)!important;opacity:.7!important;}
    .jcrop-dark .jcrop-handle{-moz-border-radius:3px;-webkit-border-radius:3px;background-color:#FFF;border-color:#000;border-radius:3px;}
  </style>
  
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
  <script src="https://raw.github.com/tapmodo/Jcrop/master/js/jquery.Jcrop.min.js"></script>
</head>

<body>
  
  <input type="file" id="input" style="display:block"/>
  <div style="width:895px;height:291px;overflow:hidden;">
    <img src="" id="preview" />
  </div>

  <script>
  
    // TODO
    // dynamically adjust the preview calculations using the uploaded images dims (currently static)

    var URL = window.webkitURL || window.URL,
    
        // http://deepliquid.com/projects/Jcrop/demos.php?demo=thumbnail
        showPreview = function(coords) {
          var rx = 895 / coords.w;
          var ry = 291 / coords.h;

          $('#preview').css({
            width: Math.round(rx * 299) + 'px',
            height: Math.round(ry * 408) + 'px',
            marginLeft: '-' + Math.round(rx * coords.x) + 'px',
            marginTop: '-' + Math.round(ry * coords.y) + 'px'
          });
        },
  
        // http://jsfiddle.net/Raynos/YVMfr/16/
        handleFiles = function(e) {
          
          // Create the image from the local file
          var url = URL.createObjectURL(e.target.files[0]);
          var img = new Image();
          img.src = url;
          
          // Set the src for the preview to that of the image
          $('#preview').attr('src', url);
          
          // jQueryify the image
          var $img = $(img);
          
          // Append it to the DOM
          $('body').append($img);
          
          // Apply jCrop
          $img.Jcrop({
            aspectRatio: 895/291,
            onChange: showPreview,
            onSelect: showPreview
          });
        
        }
  

    window.onload = function() {
      var input = document.getElementById('input');
      input.addEventListener('change', handleFiles, false);
    }

  </script>  
</body>
</html>