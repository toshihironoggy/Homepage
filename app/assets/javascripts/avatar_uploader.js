//$( document ).on('turbolinks:load', function() {
$(document).ready(function() {
  // Start upload preview image
  //$(".gambar").attr("src", "https://user.gadjian.com/static/images/personnel_boy.png");
            var $uploadCrop,
            tempFilename,
            rawImg,
            imageId;
            function readFile(input) {
              if (input.files && input.files[0]) {
                      var reader = new FileReader();
                      reader.onload = function (e) {
                  $('.upload-demo').addClass('ready');
                  $('#cropImagePop').modal('show');
                        rawImg = e.target.result;
                      }
                      reader.readAsDataURL(input.files[0]);
                  }
                  else {
                    swal("Sorry - you're browser doesn't support the FileReader API");
                }
            }

            $uploadCrop = $('#upload-demo').croppie({
              viewport: {
                width: 200,
                height: 200,
                type: 'circle'
              },
              enforceBoundary: false,
              enableExif: ture
            });
            $('#cropImagePop').on('shown.bs.modal', function(){
              // alert('Shown pop');
              $uploadCrop.croppie('bind', {
                    url: rawImg,
                  }).then(function(){
                    console.log('jQuery bind complete');
                  });
            });

            $('.item-img').on('change', function () { imageId = $(this).data('id'); tempFilename = $(this).val();
                                                     $('#cancelCropBtn').data('id', imageId); readFile(this); });
            $('#cropImageBtn').on('click', function (ev) {
              $uploadCrop.croppie('result', {
                type: 'canvas',
                //format: 'json',
                size: 'viewport'
              }).then(function (resp) {

                $.ajax({
                    url: "users/avatar",
                    type: "POST",
                    //beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
                    data: {"avatar": resp},
                    success: function (data) {
                      $('#item-img-output').attr('src', resp);
                            //html = '<img src="' + data.user.avatar + '" />';
                            //$("#item-img-output").html(html);
                    }
                });
                //$('#item-img-output').attr('src', resp);
                $('#cropImagePop').modal('hide');
              });
            });
});


