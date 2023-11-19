var base_url = "https://smitox.com/admin/";
$(document).ready(function() {
  //  document.getElementById('pro-image').addEventListener('change', readImage, false);
    
    $( ".preview-images-zone" ).sortable();
    
    $(document).on('click', '.image-cancel', function() {
        let no = $(this).data('no');
        let path = $(this).data('path');
		$.ajax({
			type: 'POST',
			url: base_url + 'deleteimages',
			dataType: 'json',
			data: {id: no,path:path},
			success:function(response){
			 $(".preview-image.preview-show-"+no).remove();
			}
			
		});
        $(".preview-image.preview-show-"+no).remove();
    });
    
    $(document).on('click', '.image-cancel1', function() {
        let no = $(this).data('no');
			 $(".preview-image.preview-show-"+no).remove();
    });
    
     $(document).on('click', '.image-cancel-1', function() {
        let no = $(this).data('no');
        let path = $(this).data('path');
        if(path){
            $.ajax({
			type: 'POST',
			url: base_url + 'Products/delete_variant_images',
			dataType: 'json',
			data: {id: no,path:path},
			success:function(response){
			    if(response == 'success'){
			         $(".preview-image.preview-show-"+no).remove();
			    }
			    else{
			        alert(response);
			    }
			}
			
		});
        }
        else{
            $(".preview-image.preview-show-"+no).remove();
        }
        
			 //$(".preview-image.preview-show-"+no).remove();
    });
});


var num = 1;
function readImage(id) {
    
    if (window.File && window.FileList && window.FileReader) {
        var files = event.target.files; //FileList object
        
        for (let i = 0; i < files.length; i++) {
            var file = files[i];
            if (!file.type.match('image')) continue;
            
            var picReader = new FileReader();
            picReader.addEventListener('load', function (event) {
                var picFile = event.target;
                var html =  '<div class="preview-image preview-show-k' + num + '">' +
                            '<div class="image-cancel1" data-no="k' + num + '">x</div>' +
                            '<div class="image-zone"><img id="pro-img-k' + num + '" src="' + picFile.result + '"></div>' +
                            '<div class="tools-edit-image"></div>' +
                            '</div>';

               
                num = num + 1;
                
                 $.ajax({
            			type: 'POST',
            			url: base_url + 'addimages',
            			dataType: 'json',
            			data: {id: id,image:picFile.result},
            			success:function(response){
            			   if(response == '200'){
            			     $(".preview-images-zone").append(html);
            			   }
            			  
            			}
            		});       
                
            });

            picReader.readAsDataURL(file);
        }
       // $("#pro-image").val('');
    } else {
        console.log('Browser not support');
    }
}

function readUpdateImage(id,vid,p_id) {
    
    if (window.File && window.FileList && window.FileReader) {
        var files = event.target.files; //FileList object
        
        for (let i = 0; i < files.length; i++) {
            var file = files[i];
            if (!file.type.match('image')) continue;
            
            var picReader = new FileReader();
            picReader.addEventListener('load', function (event) {
                var picFile = event.target;
                var html =  '<div style="height: 136px;width: 144px;" class="preview-image preview-show-k' + id + '">' +
                            '<div style="right:-95px" class="image-cancel-1" data-no="k' + id + '">x</div>' +
                            '<div style="width:165%" class="image-zone"><img id="pro-img-k' + id + '" src="' + picFile.result + '"></div>' +
                            '<div class="tools-edit-image"></div>' +
                            '</div>';
                num = num + 1;
                $.ajax({
            			type: 'POST',
            			url: base_url + 'Products/updateimages',
            			dataType: 'json',
            			data: {id: vid,p_id:p_id,image:picFile.result},
            			success:function(response){
            			   if(response == '200'){
            			    $(".preview-images-zone-"+ id).html(html);
            			   }
            			  
            			}
            		});   
                 
            });

            picReader.readAsDataURL(file);
        }
       // $("#pro-image").val('');
    } else {
        console.log('Browser not support');
    }
}

function readImage1(id) {
    
    if (window.File && window.FileList && window.FileReader) {
        var files = event.target.files; //FileList object
        
        for (let i = 0; i < files.length; i++) {
            var file = files[i];
            if (!file.type.match('image')) continue;
            
            var picReader = new FileReader();
            picReader.addEventListener('load', function (event) {
                var picFile = event.target;
                var html =  '<div style="height: 136px;width: 144px;" class="preview-image preview-show-k' + id + '">' +
                            '<div style="right:-95px" class="image-cancel-1" data-no="k' + id + '">x</div>' +
                            '<div style="width:165%" class="image-zone"><img id="pro-img-k' + id + '" src="' + picFile.result + '"></div>' +
                            '<div class="tools-edit-image"></div>' +
                            '</div><input type="hidden" name="variant_image[]" value="' + picFile.result + '">';
                num = num + 1;
                 $(".preview-images-zone-"+ id).html(html);
            });

            picReader.readAsDataURL(file);
        }
      //  $("#pro-image").val('');
    } else {
        console.log('Browser not support');
    }
}
