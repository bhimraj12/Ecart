var base_url = "https://smitox.com/admin/";
 
/***************** Category DataTable *************************/
$(function () 
{  
    //  show_products_data();
});

function show_products_data()
{
  $.ajax({
     url: base_url + 'productsseller/show_products_data',
        type: "POST",
        dataType: "json",
        success: function (success) 
        {
            console.log(success);
            var main_data=success.list;
            $('#show_products').empty();
            if (success.status === 'success') 
            {
                $('#show_products').show();
                var table='';
                var k='1';
                var gst_type=status = '';
                for(i=0;i<main_data.length;i++)
                {
                    if(main_data[i]['gst_type'] == '0'){
                        gst_type = 'Inclusive';
                    }
                    else{
                        gst_type = 'Exclusive';
                    }
                    
                     if(main_data[i]['statusP'] == '0'){
                        status = `<a href="`+base_url + 'deleteproducts'+`/`+main_data[i]['Product_id']+`" class="btn btn-sm btn-success" onclick="return confirm ('Are You Sure? Inactive this Product')">Active</a>`;
                    }
                    else{
                        status = `<a href="`+base_url + 'activeproducts'+`/`+main_data[i]['Product_id']+`" class="btn btn-sm btn-danger" onclick="return confirm ('Are You Sure? Active this Product')">Inactive</a>`;
                    }
                   // console.log(main_data[i]['Product_id']+'|'+main_data[i]['statusP']+'|'+status);
                table+=`
                     <tr>
                        <td><input type="checkbox" name="inactivebult[]" id="inactivebult" value="`+main_data[i]['Product_id']+`" ></td>
                       <td>`+k+++`</td>
                       <td>`+main_data[i]['ProductName']+`</td>
                      
                       <td>`+main_data[i]['name']+`</td>
                       <td>`+main_data[i]['sub_category']+`</td>
                       <td>₹ `+main_data[i]['MRP']+`</td>
                       <td>₹ `+main_data[i]['Selling_price']+`</td>
                       <td>`+main_data[i]['GST']+`% (`+gst_type+`)</td>
                       <td>`+main_data[i]['Stock']+`</td>
                       <td>
                           <a href="#" class="call h5 mb-0" id="editproducts" data-id="`+main_data[i]['Product_id']+`" ><i class="icon-pencil"></i></a> 
                           </td>
                        <td>`+status+`</td>
                      </tr>`;    
                }
                $("#show_products").append(table);
                $('#products').DataTable();
            } 
        }
    });
}


$(document).on('click', '#editproducts', function(){
     $(".preview-images-zone").empty();
     $("#appendvariant1").empty();
      $("#sets").empty();
     $("#stockssss").empty();
		var id = $(this).data('id');
		var table ='';var v_image='';
		$.ajax({
			type: 'POST',
			url: base_url + 'editproducts',
			dataType: 'json',
			data: {id: id},
			success:function(response){
    			
    		//	var explode = '<?php echo 123; ?>';
    // 			console.log(response);
			    $('#product_name1').val(response.product.ProductName);
			    $('#description1').val(response.product.ProductDescription);
			    $('#unit1').val(response.product.Unit);
			    $('#mrp1').val(response.product.MRP);
			    $('#selling_price1').val(response.product.Selling_price);
			    $('#gst1').val(response.product.GST);
			    $('#weight1').val(response.product.Weight);
			    $('#delivery_amt1').val(response.product.DeliveryCharge);
			    $('#p_weight1').val(response.product.PackageWeight);
			    $('#s_weight1').val(response.product.ShipmentWeight);
			    $('#minimum_order_quantity1').val(response.product.MinimumQty);
			    $('#max_qty1').val(response.product.MaximumQty);
			    $('#p_price1').val(response.product.Price);
			    $('#returnperiod1').val(response.product.ReturnPeriod);
			    $('#Purchase_amt1').val(response.product.purchase_rate);
			    $('#cat').val(response.product.Category_id);
			    $('#subcat').val(response.product.Subcategory_id);
			    $('#brandlist').val(response.product.Brand_id);
			    $('#product_id1').val(response.product.Product_id);
			    $('#p_id').val(response.product.Product_id);
			    $('#ProductLink1').val(response.product.ProductLink);
			    $('#brand_name1').val(response.product.brand_name);
			    $('#model_name1').val(response.product.model_name);
			    $('#model_id1').val(response.product.model_id);
			    $('#selling_price1').val(response.product.selling_price);
			    $('#cat').text(response.product.name);
			    $('#subcat').text(response.product.sub_category);
			    $('#brandlist').text(response.product.brand_name);
			    $('#unit_set1').val(response.product.unit_set);
			    $('#unit1').val(response.product.Unit);
			    $('#unit1').text(response.unitName.unit_name);
			    $('#subunit1').val(response.product.set_unit);
			    $('#subunit1').text(response.subunitName.unit_name);
			    var stock = response.product.Stock;
			    
			    if(stock =="0"){
			         var markupstock=`
			        <input type="number" class="form-control" name="stock1" placeholder="Stock" required="" value="">`;
			        $("#stockssss").append(markupstock);

			    }else{
                  	var markupstock=`
                        <input type="number" class="form-control" name="stock1" min="0" placeholder="Stock" required="" value="`+stock+`" >`;
			        $("#stockssss").append(markupstock);
			    }
			    
			    let keys_attribute = response.product.key_attribute;
			    let values_attribute = response.product.value_attribute;

                const myArr = keys_attribute.split(",");
                const myArr2 = values_attribute.split(",");
                
                let sets = response.sets;
                var k = 1;
                if(sets.length == 0){
                    while(k <=3){
                         
                    var markupsets=`
                        <div class="form-row">
                          <div class="col">
                            <input type="number" class="form-control"  name="minimum_quantity1[]"  id="minimum_quantity_`+k+`" value="0" onkeydown="setoldvalue`+k+`()" >
                              <input type="hidden" class="form-control"  name="mini_quantity[]"  value="`+response.product.MinimumQty+`">
                            <input type='hidden' name='product_type[]' value="1">
                            <div id="row`+k+k+`col1">0 `+response.subunitName.unit_name+`</div>
                            </div>
                            <div class="col">
                              <input type="number" class="form-control" name="maximum_quantity1[]" id="maximum_quantity_`+k+`" value="0">
                              <div id="row`+k+k+`col2">400 `+response.subunitName.unit_name+`</div>
                            </div>
                            <div class="col">
                              <input type="number" class="form-control" name="discount_mrp1[]" id="discount_mrp_`+k+`" value="0" step="any">
                              <div id="row`+k+k+`col3">Set Discount = ₹ 0</div>
                            </div>
                            <div class="col">
                              <input type="number" class="form-control" name="selling_price_set1[]" id="selling_price_set_`+k+`" value="0" step="any">
                              <div id="row`+k+k+`col4">1 set = ₹ 0</div>
                            </div>
                           
                        </div><br>
                    `;
                    k++;
                     $("#sets").append(markupsets);
                    }
                }
                
                else{
                sets.forEach(function(sets){
                    
                    var markupsets=`
                        <div class="form-row">
                          <div class="col">
                            <input type="number" class="form-control"  name="minimum_quantity1[]"  id="minimum_quantity_`+k+`" value="`+sets.minimum_quantity+`" onkeydown="setoldvalue`+k+`()">
                               <input type="hidden" class="form-control"  name="mini_quantity[]"  value="`+response.product.MinimumQty+`">
                            <input type='hidden' name='product_type[]' value="0">
                            <input type='hidden' name='productqty_id[]' value="`+sets.ProductQty_id+`">
                            <div id="row`+k+k+`col1">`+sets.minimum_quantity*response.product.unit_set+` `+response.subunitName.unit_name+`</div>
                            </div>
                            <div class="col">
                              <input type="number" class="form-control" name="maximum_quantity1[]" id="maximum_quantity_`+k+`" value="`+sets.maximum_quantity+`">
                              <div id="row`+k+k+`col2">`+sets.maximum_quantity*response.product.unit_set+` `+response.subunitName.unit_name+`</div>
                            </div>
                            <div class="col">
                              <input type="number" class="form-control" name="discount_mrp1[]" id="discount_mrp_`+k+`" value="`+sets.discount_mrp+`" step="any">
                              <div id="row`+k+k+`col3">Set Discount = ₹ `+sets.discount_mrp*response.product.unit_set+`</div>
                            </div>
                            <div class="col">
                              <input type="number" class="form-control" name="selling_price_set1[]" id="selling_price_set_`+k+`" value="`+sets.selling_price_set+`" step="any">
                              <div id="row`+k+k+`col4">1 set = ₹ `+sets.selling_price_set*response.product.unit_set+`</div>
                            </div>
                           
                        </div><br>
                    `;
                    //  var markupsets=`
                    //  <tr>
                    
                    //   <td> <input type="number" class="form-control"  name="minimum_quantity1[]"  id="minimum_quantity_`+k+`" value="`+sets.minimum_quantity+`">
                    //         <input type='hidden' name='product_type[]' value="0">
                    //         <input type='hidden' name='productqty_id[]' value="`+sets.ProductQty_id+`">
                    //         <div id="row`+k+k+`col1"></div></td>
                    //   <td> <input type="number" class="form-control" name="maximum_quantity1[]" id="maximum_quantity_`+k+`" value="`+sets.maximum_quantity+`">
                    //           <div id="row`+k+k+`col2"></div></td>
                    //   <td> <input type="number" class="form-control" name="discount_mrp1[]" id="discount_mrp_`+k+`" value="`+sets.discount_mrp+`" >
                    //           <div id="row`+k+k+`col3"></div></td>
                    //   <td><input type="number" class="form-control" name="selling_price_set1[]" id="selling_price_set_`+k+`" value="`+sets.selling_price_set+`">
                    //           <div id="row`+k+k+`col4"></div></td>
                    //   </tr>`;
                    
                    $("#sets").append(markupsets);
                    k++;
                });
                // console.log('for',k);
                 while(k <=3){
                        // console.log('while',k);
                    var markupsets=`
                        <div class="form-row">
                          <div class="col">
                            <input type="number" class="form-control"  name="minimum_quantity1[]"  id="minimum_quantity_`+k+`" value="0" onkeydown="setoldvalue`+k+`()">
                              <input type="hidden" class="form-control"  name="mini_quantity[]"  value="`+response.product.MinimumQty+`">
                            <input type='hidden' name='product_type[]' value="1">
                            <div id="row`+k+k+`col1">0 `+response.subunitName.unit_name+`</div>
                            </div>
                            <div class="col">
                              <input type="number" class="form-control" name="maximum_quantity1[]" id="maximum_quantity_`+k+`" value="0">
                              <div id="row`+k+k+`col2">400 `+response.subunitName.unit_name+`</div>
                            </div>
                            <div class="col">
                              <input type="number" class="form-control" name="discount_mrp1[]" id="discount_mrp_`+k+`" value="0" step="any">
                              <div id="row`+k+k+`col3">Set Discount = ₹ 0</div>
                            </div>
                            <div class="col">
                              <input type="number" class="form-control" name="selling_price_set1[]" id="selling_price_set_`+k+`" value="0" step="any">
                              <div id="row`+k+k+`col4">1 set = ₹ 0</div>
                            </div>
                           
                        </div><br>
                    `;
                    k++;
                     $("#sets").append(markupsets);
                    }
                }
                  $("#specification").empty();
			    myArr.forEach(function(myArr) {
			        
                   var markup1 = `
                       <div class="form-row">
                            <div class="col-md-12 mb-3">
                              <input type="text" class="form-control" name="key_attribute1[]"  placeholder="custom key" value="`+myArr+`" >
                            </div>
                            </div>`;               
                $("#specification").append(markup1);  
                });
                 $("#specification2").empty();
                myArr2.forEach(function(myArr2){
                    var markup2 = `
                    <div class="form-row">
                            <div class="col-md-12 mb-3">
                              <input type="text" class="form-control" name="value_attribute1[]"  placeholder="custom key" value="`+myArr2+`">
                            </div>
                            </div>
                    `;
                    $("#specification2").append(markup2);
                });
    
			    if(response.product.CashonDelivery == '0'){
			    $('#invalidCheck21').attr('checked',true);
			    }
			    if(response.product.AllowReturn == '0'){
			    $('#invalidCheck221').attr('checked',true);
			    }
			    if(response.product.live_product == '1'){
			    $('#invalidCheck222').attr('checked',true);
			    }
			    
			    for(i=0;i<response.product_images.length;i++)
                {
                    table+=`<div class="preview-image preview-show-`+response.product_images[i]['Image_id']+`">
                                <div class="image-cancel" data-no="`+response.product_images[i]['Image_id']+`" data-path="`+response.product_images[i]['Image']+`">x</div>
                                
                                <div class="image-zone"><img id="pro-img-`+response.product_images[i]['Image_id']+`" src="`+response.product_images[i]['images']+`"></div>
                                <div class="tools-edit-image"></div>
                            </div>`;
                }
                $("#imageid").html('<input type="file" id="pro-image" name="pro-image" style="" class="form-control" multiple onchange="readImage('+response.product.Product_id+')">');
                
                
               
                for(i=0;i<response.variant.length;i++)
                {
                    if(response.variant[i]['vp_image'] !==''){ v_image = response.variant[i]['images'];}
                else{ v_image = base_url+'assets/images/product/no-image.png'}
                   var markup=`
                     <tr>
                       <td><input type='hidden' name='v_id[]' value="`+response.variant[i]['variant_id']+`"><input type='hidden' name='db_type[]' value="0"><input type='button' class='btn btn-danger btn-sm' value='Delete' onclick='deletevariant1(this,`+response.variant[i]['variant_id']+`,"`+response.variant[i]['vp_image']+`")'></td>
                       <td><input type='hidden' name='option1[]' value="`+ response.variant[i]['option_name'] +`"> `+ response.variant[i]['option_name'] +`</td>
                       <td><input type='hidden' name='variant1[]' value="`+ response.variant[i]['varient_name'] +`"> `+ response.variant[i]['varient_name'] +`</td>
                       <td>Prodcut Quantity<input type='number' class='form-control' name='vp_quantity1[]'  placeholder="Quantity" value="`+response.variant[i]['vp_qty']+`" onchange="myFunction()">
                       Prodcut Price :<input type='number' class='form-control' name='vp_mrp1[]'  placeholder="MRP" value="`+response.variant[i]['vp_price']+`">
                       Selling Price :<input type='number' class='form-control' name='vp_sprice1[]'  placeholder="Selling Price" value="`+response.variant[i]['vp_selling_price']+`"></td>
                       
                       
                       <td><input type="file" name="pro-image" style="" class="form-control" onchange="readUpdateImage(`+ i +`,`+response.variant[i]['variant_id']+`,`+response.variant[i]['Product_id']+`)">
                            <div class="preview1 preview-images-zone-`+ i +`" style="min-height: 145px;">
                                <div class="preview-image preview-show-`+response.variant[i]['variant_id']+`" style="height: 136px;width: 144px;">
                                    <div class="image-cancel-1" data-no="`+response.variant[i]['variant_id']+`" data-path="`+response.variant[i]['vp_image']+`" style="right:-95px">x</div>
                                    <div class="image-zone" style="width:165%"><img id="pro-img-`+response.variant[i]['variant_id']+`" src="`+v_image+`"></div>
                                    <div class="tools-edit-image"><input type="hidden" name="variant_image[]" value=""></div>
                                </div>
                            </div></td>
                      </tr>`;    
                $("#appendvariant1").append(markup);   
                }
                
                $(".preview-images-zone").append(table);

                $('#editModal').modal('show');
                
			}
		});
	});
	
	    $('#returnperiod').hide();
	    $('#invalidCheck22').click(function(){
            if($(this).prop("checked") === true){
                $('#returnperiod').show();
            }
            else if($(this).prop("checked") === false){
                 $('#returnperiod').hide();
            }
        });
	
	
    
 

$("#addvariant").on('click', function () {
    
    var o = $("#option").val();
    var v = $("#variant").val();
    
    // var option = $("#option").val();
    // var variant = $("#variant").val();
    if(v === ''){
      alert('Input is Empty');  
    }
    else if(o == ''){
        alert('Input is Empty'); 
    }
    else{
        var variant = v[0].toUpperCase() + v.slice(1).toLowerCase();
    var option = o[0].toUpperCase() + o.slice(1).toLowerCase();
    
        $('[name="variant[]"]').not(this).each(function(){
            if($(this).val().toUpperCase() == variant.toUpperCase()) {
                
                alert(variant +' Already Added.');
                var rowCount = $("#tablevariant tr").length;
                var i = this.parentNode.parentNode.rowIndex;
                document.getElementById("tablevariant").deleteRow(rowCount);
            }
            else{
                
         $('[name="vp_quantity[]"]').not(this).each(function(){
                if($(this).val() == '') {
                alert('Product Quantity field is blank');
                var i = this.parentNode.parentNode.rowIndex;
                var rowCount = $("#tablevariant tr").length;
                document.getElementById("tablevariant").deleteRow(rowCount);
            }
            
        });
        
        $('[name="vp_mrp[]"]').not(this).each(function(){
                if($(this).val() == '') {
                alert('MRP field is blank');
                var i = this.parentNode.parentNode.rowIndex;
                var rowCount = $("#tablevariant tr").length;
                //alert(rowCount);
               $('#add_product_data').prop('disabled', true);
                document.getElementById("tablevariant").deleteRow(rowCount);
            }
        });
        
        $('[name="vp_pprice[]"]').not(this).each(function(){
                if($(this).val() == '') {
                alert('Selling Price field is blank');
                var i = this.parentNode.parentNode.rowIndex;
                var rowCount = $("#tablevariant tr").length;
                //alert(rowCount);
                document.getElementById("tablevariant").deleteRow(rowCount);
            }
            
        });
        
        
        $('[name="vp_image[]"]').not(this).each(function(){
                if($(this).val() == '') {
                alert('Image field is blank');
                var i = this.parentNode.parentNode.rowIndex;
                var rowCount = $("#tablevariant tr").length;
                //alert(rowCount);
                document.getElementById("tablevariant").deleteRow(rowCount);
            }
            
        });
            }
        }); 
        
       var markup=`
                     <tr>
                       <td><input type='button' class='btn btn-danger btn-sm' value='Delete' onclick='deletevariant(this)'></td>
                       <td><input type='hidden' name='option[]' value="`+ option +`"> `+ option +`</td>
                       <td><input type='hidden' name='variant[]' value="`+ variant +`"> `+ variant +`</td>
                       <td><input type='number' class='form-control' name='vp_quantity[]' id='vp_quantity' placeholder="Quantity" value="" onchange="myFunction()"></td>
                       <td><input type='number' class='form-control' name='vp_mrp[]' id='vp_mrp' placeholder="MRP" value=""></td>
                       <td><input type='number' class='form-control' name='vp_pprice[]' id='vp_pprice' placeholder="Per Piece Price" value="" onchange="vp_set(this.value)"><span id="vp_set"></span></td>
                     
                       <td><input type='file' class='form-control' name='vp_image[]' id='vp_image'></td>
                      </tr>`;    
        $("#appendvariant").append(markup);
        var rowCount = $("#appendvariant tr").length;
        if(rowCount > 0){
            $("#stock").attr('disabled',true);
        }
        $("#variant").val('');
    }
    });
    
    
   function vp_set(r){
        // var unit_select = $('#unit_select option:selected').text();
        // var unitValue =  document.getElementById("unit_set").value;
        // var maxdata = Number(r)* Number(unitValue);
        // $("span #vp_set:last").text('1 '+unit_select+' =  ₹ '+maxdata);
       
       // alert(maxdata);alert(unitValue);alert(r);
} 
    
    
    $("#addset").click(function(){
    
    // var id = $("#product_name").val();
     var sets = $("#set").val();
     var qty = $("#qty").val();
     var p_price = $("#p_price").val();
    if((Number(sets) == '0') && (Number(qty) == '0') && (Number(p_price) == '0')){
      alert('Input is Empty');  
    }
    else{
    var markup = "<tr><td><input type='button' class='btn btn-danger btn-sm' value='Delete' onclick='deleteSet(this)'></td><td><input type='hidden' name='set[]' value="+ sets +">" + sets + "</td><td><input type='hidden' name='qty[]' value="+ qty +">" + qty + "</td><td><input type='hidden' name='p_price[]' value="+ p_price +">" + p_price + "</td></tr>";
    $("#appendset").append(markup);
    $("#set").val('');
    $("#qty").val('');
    $("#p_price").val('');
    }
    });
    


function deleteSize(r) {
  var i = r.parentNode.parentNode.rowIndex;
  document.getElementById("tablesize").deleteRow(i);
}

function deleteSet(r) {
  var i = r.parentNode.parentNode.rowIndex;
  document.getElementById("tableset").deleteRow(i);
}

 function deleteColour(r) {
  var i = r.parentNode.parentNode.rowIndex;
  document.getElementById("tablecolour").deleteRow(i);
}

$("#category").change(function(){
    	var id =  $('#category').val();
    //	alert(id);
      $.ajax({
          type: 'POST',
          url:  base_url + 'Products/subcategoryWithCatID',
          data: {id:id},
          success:function(response){
             $('#subcategory').html(response);
             $('#brand_id12').html('<option value="">No Brand Found</option>');
      }
    });
  });
  
  
  $("#category_s").change(function(){
    	var id =  $('#category_s').val();
    //	alert(id);
      $.ajax({
          type: 'POST',
          url:  base_url + 'Productsseller/subcategoryWithCatID',
          data: {id:id},
          success:function(response){
             $('#subcategory').html(response);
             $('#brand_id12').html('<option value="">No Brand Found</option>');
      }
    });
  });
  
  $("#subcategory").change(function(){
    	var sid =  $('#subcategory').val();
    //	console.log(sid);
      $.ajax({
          type: 'POST',
          url:  base_url + 'Products/brandWithSubcategoryID',
          data: {id:sid},
          success:function(response){
             $('#brand_id12').html(response);
      }
    });
  });
  
  
$("#special_price").change(function(){
    	var selling_price =  $('#special_price').val();
    	var mrp =  $('#mrp').val();
        	if(Number(selling_price) > Number(mrp)){
        	    alert('Price is greater than MRP');
        	    $('#special_price').val(0);
        	}
});

$("#selling_price1").change(function(){
    	var selling_price =  $('#selling_price1').val();
    	var mrp =  $('#mrp1').val();
        	if(Number(selling_price) > Number(mrp)){
        	    alert('Price is greater than MRP');
        	    $('#selling_price1').val('');
        	}
        	else{
        	     //var value = $( this ).val();
                var unitValue = $('#unit_set1').val();
                var maxdata = Number(selling_price)* Number(unitValue);
                $("#selling_price1").val(maxdata);
        	}
});

function myFunction() {
   var sum = 0;
    $('[name="vp_quantity[]"]').not(this).each(function(){
        sum = Number(sum) + Number($(this).val());
    }); 
    $("#stock").val(sum);
}

function deletevariant(r) {
      var i = r.parentNode.parentNode.rowIndex;
      var myTab = document.getElementById('tablevariant');
      var amount = myTab.rows[i].cells[3].childNodes[0].value;
      var stock =  $("#stock").val();
      var sum=0;
    
        sum = Number(stock) - Number(amount);
        $("#stock").val(sum);
        document.getElementById("tablevariant").deleteRow(i);
        var rowCount = $("#appendvariant tr").length;
        if(rowCount == 0){
            $("#stock").attr('disabled',false);
        }
}

$("#addvariant1").on('click', function () {
   
    var p = $("#tablevariant1 tr").length;
    var o = $("#option1").val();
    var v = $("#variant1").val();
    
    if(v === ''){
      alert('Variant name is Empty');  
    }
    else if(o == ''){
        alert('Option is Empty'); 
    }
    else{
        var variant1 = v[0].toUpperCase() + v.slice(1).toLowerCase();
        var option1  = o[0].toUpperCase() + o.slice(1).toLowerCase();
        $('[name="variant1[]"]').not(this).each(function(){
            if($(this).val().toUpperCase() == variant1.toUpperCase()) {
                alert(variant1 +' Already Added.');
                var rowCount1 = $("#tablevariant1 tr").length;
                var i = this.parentNode.parentNode.rowIndex;
                document.getElementById("tablevariant1").deleteRow(rowCount1);
            }
            else{
                
         $('[name="vp_quantity1[]"]').not(this).each(function(){
            if($(this).val() == '') {
                alert('Product Quantity field is blank');
                var i = this.parentNode.parentNode.rowIndex;
                var rowCount1 = $("#tablevariant1 tr").length;
                document.getElementById("tablevariant1").deleteRow(rowCount1);
            }
            
        });
        
        $('[name="vp_mrp1[]"]').not(this).each(function(){
            if($(this).val() == '') {
                alert('MRP field is blank');
                var i = this.parentNode.parentNode.rowIndex;
                var rowCount1 = $("#tablevariant1 tr").length;
                document.getElementById("tablevariant1").deleteRow(rowCount1);
            }
        });
        
        $('[name="vp_sprice1[]"]').not(this).each(function(){
            if($(this).val() == '') {
                alert('Selling Price field is blank');
                var i = this.parentNode.parentNode.rowIndex;
                var rowCount1 = $("#tablevariant1 tr").length;
                document.getElementById("tablevariant1").deleteRow(rowCount1);
            }
            
        });
        
        $('[name="vp_image1[]"]').not(this).each(function(){
            if($(this).val() == '') {
                alert('Image field is blank');
                var i = this.parentNode.parentNode.rowIndex;
                var rowCount1 = $("#tablevariant1 tr").length;
                document.getElementById("tablevariant1").deleteRow(rowCount1);
            }
            
        });
            }
        }); 
        
       var markup1=`
                     <tr>
                       <td><input type='hidden' name='db_type[]' value="1"><input type='button' class='btn btn-danger btn-sm' value='Delete' onclick='deletevariant1(this,0,0)'></td>
                       <td><input type='hidden' name='option1[]' value="`+ option1 +`"> `+ option1 +`</td>
                       <td><input type='hidden' name='variant1[]' value="`+ variant1 +`"> `+ variant1 +`</td>
                       <td>Product Quantity<input type='number' class='form-control' name='vp_quantity1[]' id='vp_quantity' placeholder="Quantity" value="" onchange="myFunction1()">
                       Product Price<input type='number' class='form-control' name='vp_mrp1[]' id='vp_mrp' placeholder="MRP" value="">
                       Selling Price<input type='number' class='form-control' name='vp_sprice1[]' id='vp_sprice' placeholder="Selling Price" value=""></td>
                       <td><input type="file" id="pro-image" name="pro-image" style="" class="form-control" onchange="readImage1(`+p+`)" >
                       <div class="preview1 preview-images-zone-`+p+`" style="min-height: 145px;"><img style="height: 133px;width: 100%;" src="`+base_url+`assets/images/product/no-image.png"></div>
                       </td>
                      </tr>`;    
        $("#appendvariant1").append(markup1);
        var rowCount1 = $("#appendvariant1 tr").length;
        // if(rowCount > 0){
        //     $("#stock").attr('disabled',true);
        // }
        $("#variant1").val('');
    }
    });

function myFunction1() {
   var sum = 0;
    $('[name="vp_quantity1[]"]').each(function(){
        sum += Number($(this).val());
    }); 
    $("#up_stock").val(sum);
    return sum;
}

function clear_sets() {
   $('#mini_quantitty_bind1,#mini_quantitty_bind2,#maximum_quantity,#discount_mrp,#selling_price_bind,#maximum_quantity1,#discount_mrp1,#selling_price_bind1,#maximum_quantity2,#discount_mrp2,#selling_price_bind2').val('');
   $('#row1col2,#row1col3,#row1col4,#row2col1,#row2col2,#row2col3,#row2col4,#row3col1,#row3col2,#row3col3,#row3col4').text('');
   
}
  
function deletevariant1(r,id,path) {
       var pid =$('#p_id').val();
        var result = confirm("Are You Sure?");
        
            if (result == true) {
                
                
                if(id !== 0){
                        var i = r.parentNode.parentNode.rowIndex;
                        document.getElementById("tablevariant1").deleteRow(i);
                        var sum = myFunction1();
                        $.ajax({
                            type: 'POST',
                            url:  base_url + 'Products/deletevariant',
                            data: {id : id,path:path,sum:sum,pid:pid},
                            success:function(response){
                            alert(response);
                                if(response == 'failed'){
                                    alert('Error while deleting');
                                }
                                else{
                                    alert('successfully Deleted');
                                    
                                }
                            }
                        });
                }
                else{
                        var i = r.parentNode.parentNode.rowIndex;
                        document.getElementById("tablevariant1").deleteRow(i);
                        myFunction1();
                }
              } 

}


$(document).on('submit','#update_variant',function(e){
        e.preventDefault();
         $.ajax({
          type: 'POST',
          url:  base_url + 'updatevariant',
          data: $(this).serialize(),
          success:function(response){
              if(response == 0){
                  alert('Error, please try again!');
              }
              else{
                  
                //  alert('Success,Data Updated!');
                //  $('#editmodal').modal('hide');
                  $('#editModal').modal('hide');
                  show_products_data();
                  
              }
        }
    });
});

$(document).ready(function(){
  $("button#add_specifi").click(function(){
    $("#add_specification").toggle();
  });
});

$(document).ready(function(){      
      var i=1;  
   
      $('#add').click(function(){  
           i++;             
           $('#dynamic_field').append('<div id="form-row'+i+'"><div class="form-row"><div class="col-md-5 mb-3"><input type="text" class="form-control" name="key_attribute[]"  placeholder="custom key" value="" required></div><div class="col-md-5 mb-3"><input type="text" class="form-control" name="value_attribute[]"  placeholder="custom value" value="" required></div><div class="col-md-2 mb-3"><button type="button" name="remove" id="'+i+'" class="btn btn-danger btn_remove">Remove</button></div></div></div>');
     });
     
     $(document).on('click', '.btn_remove', function(){  
           var button_id = $(this).attr("id"); 
           var res = confirm('Are You Sure You Want To Delete This?');
           if(res==true){
           $('#form-row'+button_id+'').remove();  
           $('#'+button_id+'').remove();  
           }
      });  
  
    });

$(document).ready(function(){      
      var i=1;  
   
      $('#add1').click(function(){  
           i++;             
           $('#dynamic_field1').append('<div id="form-row'+i+'"><div class="form-row"><div class="col-md-4 mb-3"><input type="text" class="form-control" name="key_attribute1[]"  placeholder="custom key" value=""></div><div class="col-md-4 mb-3"><input type="text" class="form-control" name="value_attribute1[]"  placeholder="custom value" value=""></div><div class="col-md-4 mb-3"><button type="button" name="remove" id="'+i+'" class="btn btn-danger btn_remove4">Remove Custom Attribute</button></div></div></div>');
     });
     
     $(document).on('click', '.btn_remove4', function(){  
           var button_id = $(this).attr("id"); 
           var res = confirm('Are You Sure You Want To Delete This?');
           if(res==true){
           $('#form-row'+button_id+'').remove();  
           $('#'+button_id+'').remove();  
           }
      });  
  
    });    

$(function() {
        $('#unit_select').change(function(){
            $('#select_units').show();
        });
});

$(document).ready(function(){
  $("button#add_bulk").click(function(){
    $("#add_bulk_products").toggle();
  });
});
$(document).ready(function(){
    
$('#mrp').keyup(function(){
    var mrp = $("#mrp").val();
    $('#special_price').val(0);

});

$('#mrp1').keyup(function(){
    var mrp = $("#mrp").val();
    $('#selling_price1').val();

});

$('#selling_price').keyup(function(){
    $('#selling_price_bind').val($("#selling_price").val());
});

$('#mini_quantity').keyup(function(){
    var mini_quantity_bind = $('#mini_quantity').val();
    var value = $('#set_unit').val();
    var unit_set = $('#unit_set').val();
    var setdata = Number(unit_set)* (Number(mini_quantity_bind)+1);
     var value1 = $('#set_unit option:selected').text();
    $("#row1col1").text(setdata+' ' +value1);
    $('#mini_quantitty_bind').val(Number(mini_quantity_bind)+1);
    clear_sets();
    
});


  $('#set_unit,#unit_set,#special_price,#unit_select').on('change', function() {
    
    // var discount_mrp = $('#discount_mrp').val();
    // var selling_price_bind = $('#selling_price_bind').val();
    var value = $('#set_unit').val();
    var unit_set = $('#unit_set').val();
    var special_price =  $('#special_price').val();
    var value1 = $('#set_unit option:selected').text();
    var unit_select = $('#unit_select option:selected').text();
    
    
    $( "#unit_value" ).text('[ 1 '+unit_select+'= '+unit_set+' '+value1+' ]');
    
    var mini_quantity_1 = $('#mini_quantitty_bind').val();
    var mini_quantity_2 = $('#mini_quantitty_bind1').val();
    var mini_quantity_3 = $('#mini_quantitty_bind2').val();
      
    var maximum_quantity_1 = $('#maximum_quantity').val();
    var maximum_quantity_2 = $('#maximum_quantity1').val();
    var maximum_quantity_3 = $('#maximum_quantity2').val();
    
    var discount_mrp_1 = $('#discount_mrp').val();
    var discount_mrp_2 = $('#discount_mrp1').val();
    var discount_mrp_3 = $('#discount_mrp2').val();
   
    var setdata  = Number(unit_set)* Number(mini_quantity_1);
    var setdata2 = Number(unit_set)* Number(mini_quantity_2);
    var setdata3 = Number(unit_set)* Number(mini_quantity_3);
    
    var setdata4 = Number(unit_set)* Number(maximum_quantity_1);
    var setdata5 = Number(unit_set)* Number(maximum_quantity_2);
    var setdata6 = Number(unit_set)* Number(maximum_quantity_3);
    
    var selling_price_set_1 = Number(special_price) - Number(discount_mrp_1);
    var selling_price_set_2 = Number(special_price) - Number(discount_mrp_2);
    var selling_price_set_3 = Number(special_price) - Number(discount_mrp_3);

    $( "#selling_price" ).val(special_price*unit_set);
    $( "#row1col1" ).text(setdata+' ' +value1);
    $( "#row2col1" ).text(setdata2+' ' +value1);
    $( "#row3col1" ).text(setdata3+' ' +value1);
    
    $( "#row1col2" ).text(setdata4+' ' +value1);
    $( "#row2col2" ).text(setdata5+' ' +value1);
    $( "#row3col2" ).text(setdata6+' ' +value1);
    
    $( "#row1col3" ).text(unit_select+' Discount = ₹ ' +Number(unit_set)*Number(discount_mrp_1));
    $( "#row2col3" ).text(unit_select+' Discount = ₹ ' +Number(unit_set)*Number(discount_mrp_2));
    $( "#row3col3" ).text(unit_select+' Discount = ₹ ' +Number(unit_set)*Number(discount_mrp_3));
    
    $( "#row1col4" ).text('1 '+unit_select+' = ₹' +(special_price-discount_mrp_1)*unit_set);
    $( "#row2col4" ).text('1 '+unit_select+' = ₹' +(special_price-discount_mrp_2)*unit_set);
    $( "#row3col4" ).text('1 '+unit_select+' = ₹' +(special_price-discount_mrp_3)*unit_set);
    
    $( "#selling_price_bind" ).val(selling_price_set_1);
    $( "#selling_price_bind1" ).val(selling_price_set_2);
    $( "#selling_price_bind2" ).val(selling_price_set_3);
});

// $('#set_unit,#unit_set').on('change', function() {
//     var maximum_quantity_bind = $('#maximum_quantity').val();
//     var discount_mrp = $('#discount_mrp').val();
//     var selling_price_bind = $('#selling_price_bind').val();
//     var value = $('#set_unit').val();
//     var unit_set = $('#unit_set').val();
//     var mini_quantity_bind = $('#mini_quantity').val();
//     var mini_quantity_bind1 = $('#mini_quantity1').val();
//     var special_price =  $('#special_price').val();
//     var setdata = Number(unit_set)* Number(mini_quantity_bind);
//     var setdata5 = Number(unit_set)* Number(mini_quantity_bind1);
//     var setdata3 = Number(unit_set)* Number(discount_mrp);
//     var setdata4 = Number(unit_set)* Number(selling_price_bind);
    
//     var value1 = $('#set_unit option:selected').text();
//     var unit_select = $('#unit_select option:selected').text();
    
//     $( "span#unit_value" ).text('[ 1 '+unit_select+'= '+unit_set+' '+value1+' ]');
//     $( "#selling_price" ).val(special_price*unit_set);
//     $( "#row1col1" ).text(setdata+' ' +value1);

// });


$('#special_price').on('change', function() {
    var value = $( this ).val();
    var unitValue = $('#unit_set').val();
    var maxdata = Number(value)* Number(unitValue);
    $("#selling_price").val(maxdata);
});

// $('#selling_price1').on('change', function() {
//     var value = $( this ).val();
//     var unitValue = $('#unit_set').val();
//     var maxdata = Number(value)* Number(unitValue);
//     $("#selling_price").val(maxdata);
// });
});   



// $(document).ready(function(){      
//       var i=0;  
      
//       $('#add3').click(function(){ 
//           if(i>=2){
//           alert("Not Allowed more than 3 rows")  
//           }
//           else{
//               i++;    
//              $('#dynamic_bulk').append('<tr id="row'+i+'"><td><input type="number" class="form-control" id="minimum_quantity_new'+i+'"  name="minimum_quantity[]" value=""></td><td><input type="number" class="form-control" id="maximum_quantity'+i+'"  name="maximum_quantity[]" value=""></td><td><input type="number" class="form-control" id="discount_mrp'+i+'"  name="discount_mrp[]" value=""></td><td><input type="number" class="form-control" id="selling_price_bind'+i+'"  name="selling_price_set[]" value="" readonly></td><td><button type="button" name="remove" id="'+i+'" class="btn btn-danger btn_remove2">X</button></td></tr><tr id="row2'+i+'"><td><span id="unit_value11"></span>222</td><td>111</td></tr>');
//           }
//       });
     
//      $(document).on('click', '.btn_remove2', function(){  
//           var button_id2 = $(this).attr("id"); 
//           var res = confirm('Are You Sure You Want To Delete This?');
//           if(res==true){
//           $('#row'+button_id2+'').remove();  
//           $('#row2'+button_id2+'').remove();
//           $('#'+button_id2+'').remove();
//           i--;
//           }
//       });  

//     });
     
     
$(document).on('change', '#discount_mrp', function(){  
     var curr_value = Number($(this).val());
     var selling_price = $('#special_price').val();
     var total = Number(selling_price)-Number(curr_value);
     var unit_set =  $('#unit_set').val();
     var setvlaue = total * unit_set;
     var persetdiscount = curr_value * unit_set;
     
     $("td #selling_price_bind:last").val(total);
     $( "#row1col3" ).text('Set Discount =  ₹ '+persetdiscount);
     $( "#row1col4" ).text('1 set =  ₹ '+setvlaue);
});

$(document).on('change', '#discount_mrp1', function(){
    // var curr_value = Number($(this).val());
    // var selling_price = $('#selling_price1').val();
    // var total = Number(selling_price)-Number(curr_value);
    // $("#selling_price_bind1").val(total);
    
     var curr_value = Number($(this).val());
     var selling_price = $('#special_price').val();
     var total = Number(selling_price)-Number(curr_value);
     var unit_set =  $('#unit_set').val();
     var setvlaue = total * unit_set;
     var persetdiscount = curr_value * unit_set;
     
     $("#selling_price_bind1").val(total);
     $( "#row2col3" ).text('Set Discount =  ₹ '+persetdiscount);
     $( "#row2col4" ).text('1 set =  ₹ '+setvlaue);
});

$(document).on('change', '#discount_mrp2', function(){
    // var curr_value = Number($(this).val());
    // var selling_price = $('#selling_price1').val();
    // var total = Number(selling_price)-Number(curr_value);
    // $("#selling_price_bind1").val(total);
    
     var curr_value = Number($(this).val());
     var selling_price = $('#special_price').val();
     var total = Number(selling_price)-Number(curr_value);
     var unit_set =  $('#unit_set').val();
     var setvlaue = total * unit_set;
     var persetdiscount = curr_value * unit_set;
     
     $("#selling_price_bind2").val(total);
     $( "#row3col3" ).text('Set Discount =  ₹ '+persetdiscount);
     $( "#row3col4" ).text('1 set =  ₹ '+setvlaue);
});

$(document).on('change', '#maximum_quantity',  function(){
    i=0;
    i++;
     var value1 = $('#set_unit option:selected').text();
     var maximum_quantity = $("#maximum_quantity").val();
     var unit_set = $('#unit_set').val();
      var mini1 = $("#mini_quantitty_bind").val();
    if(Number(mini1) >= Number(maximum_quantity)){
        alert('Maximum Qunatity is less than MinimumQuantity');
        $("#maximum_quantity,#maximum_quantity1,#maximum_quantity2").val('');
        $("#mini_quantitty_bind1,#mini_quantitty_bind2").val('');
        $( "#row1col2,#row2col2,#row3col2,#row2col1,#row3col1" ).text('0 ' +$('#set_unit1 option:selected').text());
        
    }
    else{
     var max = Number(maximum_quantity)+i;
     var setdata2 = Number(unit_set)* Number(maximum_quantity);
     var setdata3 = Number(unit_set)* Number(max);
     
     $("#mini_quantitty_bind1").val(max);
     $( "#row1col2" ).text(setdata2+' ' +value1);
     $( "#row2col1" ).text(setdata3+' ' +value1);
}
});

$(document).on('change', '#maximum_quantity1 ',  function(){
    i=0;
    i++;
     var value1 = $('#set_unit option:selected').text();
     var maximum_quantity = $("#maximum_quantity1").val();
     var unit_set = $('#unit_set').val();
       var mini1 = $("#mini_quantitty_bind1").val();
    if(Number(mini1) >= Number(maximum_quantity)){
        alert('Maximum Qunatity is less than MinimumQuantity');
        $("#maximum_quantity1,#maximum_quantity2").val('');
        $("#mini_quantitty_bind2").val('');
        $( "#row2col2,#row3col2,#row3col1" ).text('0 ' +$('#set_unit1 option:selected').text());
        
    }
    else{
     var max = Number(maximum_quantity)+i;
     var setdata2 = Number(unit_set)* Number(maximum_quantity);
     var setdata3 = Number(unit_set)* Number(max);
     
     $( "#row2col2" ).text(setdata2+' ' +value1);
     $( "#row3col1" ).text(setdata3+' ' +value1);
     $("#mini_quantitty_bind2").val(max);
    }
});

$(document).on('change', '#maximum_quantity2 ',  function(){
   
     var value1 = $('#set_unit option:selected').text();
     var maximum_quantity = $("#maximum_quantity2").val();
     var unit_set = $('#unit_set').val();
       var mini1 = $("#mini_quantitty_bind2").val();
    if(Number(mini1) >= Number(maximum_quantity)){
        alert('Maximum Qunatity is less than MinimumQuantity');
        $("#maximum_quantity2").val('');
        $( "#row3col2" ).text('0 ' +$('#set_unit1 option:selected').text());
        
    }
    else{
     var max = Number(maximum_quantity)+i;
     var setdata2 = Number(unit_set)* Number(maximum_quantity);
     
     $( "#row3col2" ).text(setdata2+' ' +value1);
}
});





$(document).ready(function(){      
      var i=0;  

      $('#add4').click(function(){
          if(i>=3){
           alert("Not Allowed more than 6 rows")  
          }else{
           i++;             
           $('#sets').append('<div id="row'+i+'"><div class="form-row"><div class="col"><input type="number" class="form-control" id="mini_quantitty_bind1"  name="minimum_quantity1[]" value=""><input type="hidden" name="product_type[]" value="1"></div><div class="col"><input type="number" class="form-control" id="maximum_quantity_new" name="maximum_quantity1[]" value=""></div><div class="col"><input type="number" class="form-control" id="discount_mrp_new" name="discount_mrp1[]" value=""></div><div class="col"><input type="number" class="form-control" id="selling_price_bind2" name="selling_price_set1[]" value=""></div><div class="col"><button type="button" name="remove" id="'+i+'" class="btn btn-danger btn_remove4">Delete</button></div></div></div></div>');
          } 
          });
     
      $(document).on('click', '.btn_remove4', function(){  
           var button_id3 = $(this).attr("id"); 
           $('#row'+button_id3+'').remove();  
          $('#'+button_id3+'').remove();  
          i--;
      });  
      
});


$(document).on('keyup', '#minimum_quantity_1',  function(){
   
    $("#maximum_quantity_1,#maximum_quantity_2,#maximum_quantity_3").val('');
    $("#minimum_quantity_2,#minimum_quantity_3").val('');
    var mini1 = $("#minimum_quantity_1").val();
    var mini_Set = Number(mini1)*Number($('#unit_set1').val());
    $( "#row11col1" ).text( mini_Set+' ' +$('#set_unit1 option:selected').text());
     $( "#row11col2,#row22col2,#row33col2,#row22col1,#row33col1" ).text('0 ' +$('#set_unit1 option:selected').text());
    //  $( "#row2col1" ).text(setdata3+' ' +value1);

});
//edit
$(document).on('change', '#maximum_quantity_1',  function(){
    i=0;
    i++;
    
     
     var value1 = $('#set_unit1 option:selected').text();
     var maximum_quantity = $("#maximum_quantity_1").val();
     var unit_set = $('#unit_set1').val();
     var mini1 = $("#minimum_quantity_1").val();
    if(Number(mini1) >= Number(maximum_quantity)){
        alert('Maximum Qunatity is less than MinimumQuantity');
        $("#maximum_quantity_1,#maximum_quantity_2,#maximum_quantity_3").val('');
        $("#minimum_quantity_2,#minimum_quantity_3").val('');
        $( "#row11col2,#row22col2,#row33col2,#row22col1,#row33col1" ).text('0 ' +$('#set_unit1 option:selected').text());
        
    }
    else{
   
     var max = Number(maximum_quantity)+i;
     var setdata2 = Number(unit_set)* Number(maximum_quantity);
     var setdata3 = Number(unit_set)* Number(max);
     
     $("#minimum_quantity_2").val(max);
     $("#maximum_quantity_2,#maximum_quantity_3").val('');
     $( "#row11col2" ).text(setdata2+' ' +value1);
     $( "#row22col1" ).text(setdata3+' ' +value1);
          
    }

});

$(document).on('change', '#maximum_quantity_2 ',  function(){
    i=0;
    i++;
     var value1 = $('#set_unit1 option:selected').text();
     var maximum_quantity = $("#maximum_quantity_2").val();
     var unit_set = $('#unit_set1').val();
    
     var mini1 = $("#minimum_quantity_2").val();
    if(Number(mini1) >= Number(maximum_quantity)){
        alert('Maximum Qunatity is less than MinimumQuantity');
        $("#maximum_quantity_2,#maximum_quantity_3").val('');
        $("#minimum_quantity_3").val('');
        $( "#row22col2,#row33col2,#row33col1" ).text('0 ' +$('#set_unit1 option:selected').text());
        
    }
    else{
   
     var max = Number(maximum_quantity)+i;
     var setdata2 = Number(unit_set)* Number(maximum_quantity);
     var setdata3 = Number(unit_set)* Number(max);
     
     $( "#row22col2" ).text(setdata2+' ' +value1);
     $( "#row33col1" ).text(setdata3+' ' +value1);
     $("#minimum_quantity_3").val(max);
      $("#maximum_quantity_3").val('');
    }
});

$(document).on('change', '#maximum_quantity_3 ',  function(){
   
     var value1 = $('#set_unit1 option:selected').text();
     var maximum_quantity = $("#maximum_quantity_3").val();
     var unit_set = $('#unit_set1').val();
      var mini1 = $("#minimum_quantity_3").val();
    if(Number(mini1) >= Number(maximum_quantity)){
        alert('Maximum Qunatity is less than MinimumQuantity');
        $("#maximum_quantity_3").val('');
        $( "#row33col2" ).text('0 ' +$('#set_unit1 option:selected').text());
        
    }
    else{
   
     var max = Number(maximum_quantity)+i;
     var setdata2 = Number(unit_set)* Number(maximum_quantity);
     
     $( "#row33col2" ).text(setdata2+' ' +value1);
}
});


$(document).on('keyup', '#discount_mrp_1', function(){  
     var curr_value = Number($(this).val());
     var selling_price = $('#selling_price1').val();
     var total = Number(selling_price)-Number(curr_value);
     var unit_set =  $('#unit_set1').val();
     var setvlaue = total * unit_set;
     var persetdiscount = curr_value * unit_set;
     
     $("#selling_price_set_1").val(total);
     $( "#row11col3" ).text('Set Discount =  ₹ '+persetdiscount);
     $( "#row11col4" ).text('1 set =  ₹ '+setvlaue);
});

$(document).on('keyup', '#discount_mrp_2', function(){  
     var curr_value = Number($(this).val());
     var selling_price = $('#selling_price1').val();
     var total = Number(selling_price)-Number(curr_value);
     var unit_set =  $('#unit_set1').val();
     var setvlaue = total * unit_set;
     var persetdiscount = curr_value * unit_set;
     
     $("#selling_price_set_2").val(total);
     $( "#row22col3" ).text('Set Discount =  ₹ '+persetdiscount);
     $( "#row22col4" ).text('1 set =  ₹ '+setvlaue);
});

$(document).on('keyup', '#discount_mrp_3', function(){  
     var curr_value = Number($(this).val());
     var selling_price = $('#selling_price1').val();
     var total = Number(selling_price)-Number(curr_value);
     var unit_set =  $('#unit_set1').val();
     var setvlaue = total * unit_set;
     var persetdiscount = curr_value * unit_set;
     
     $("#selling_price_set_3").val(total);
     $( "#row33col3" ).text('Set Discount =  ₹ '+persetdiscount);
     $( "#row33col4" ).text('1 set =  ₹ '+setvlaue);
});
  
  $('#set_unit1,#unit_set1,#selling_price1,#unit_select1').on('change', function() {
    
    var discount_mrp = $('#discount_mrp_1').val();
    var selling_price_bind = $('#selling_price_bind').val();
    var value = $('#set_unit1').val();
    var unit_set = $('#unit_set1').val();
    var special_price =  $('#selling_price1').val();
    var value1 = $('#set_unit1 option:selected').text();
    var unit_select = $('#unit_select1 option:selected').text();
    
    
    $( "#unit_value" ).text('[ 1 '+unit_select+'= '+unit_set+' '+value1+' ]');
    
    var mini_quantity_1 = $('#minimum_quantity_1').val();
    var mini_quantity_2 = $('#minimum_quantity_1').val();
    var mini_quantity_3 = $('#minimum_quantity_1').val();
      
    var maximum_quantity_1 = $('#maximum_quantity_1').val();
    var maximum_quantity_2 = $('#maximum_quantity_1').val();
    var maximum_quantity_3 = $('#maximum_quantity_1').val();
    
    var discount_mrp_1 = $('#discount_mrp_1').val();
    var discount_mrp_2 = $('#discount_mrp_2').val();
    var discount_mrp_3 = $('#discount_mrp_3').val();
   
    var setdata  = Number(unit_set)* Number(mini_quantity_1);
    var setdata2 = Number(unit_set)* Number(mini_quantity_2);
    var setdata3 = Number(unit_set)* Number(mini_quantity_3);
    
    var setdata4 = Number(unit_set)* Number(maximum_quantity_1);
    var setdata5 = Number(unit_set)* Number(maximum_quantity_2);
    var setdata6 = Number(unit_set)* Number(maximum_quantity_3);
    
    var selling_price_set_1 = Number(special_price) - Number(discount_mrp_1);
    var selling_price_set_2 = Number(special_price) - Number(discount_mrp_2);
    var selling_price_set_3 = Number(special_price) - Number(discount_mrp_3);

    $( "#selling_price1" ).val(special_price*unit_set);
    $( "#row11col1" ).text(setdata+' ' +value1);
    $( "#row22col1" ).text(setdata2+' ' +value1);
    $( "#row33col1" ).text(setdata3+' ' +value1);
    
    $( "#row11col2" ).text(setdata4+' ' +value1);
    $( "#row22col2" ).text(setdata5+' ' +value1);
    $( "#row33col2" ).text(setdata6+' ' +value1);
    
    $( "#row11col3" ).text(unit_select+' Discount = ₹ ' +Number(unit_set)*Number(discount_mrp_1));
    $( "#row22col3" ).text(unit_select+' Discount = ₹ ' +Number(unit_set)*Number(discount_mrp_2));
    $( "#row33col3" ).text(unit_select+' Discount = ₹ ' +Number(unit_set)*Number(discount_mrp_3));
    
    $( "#row11col4" ).text('1 '+unit_select+' = ₹' +(special_price-discount_mrp_1)*unit_set);
    $( "#row22col4" ).text('1 '+unit_select+' = ₹' +(special_price-discount_mrp_2)*unit_set);
    $( "#row33col4" ).text('1 '+unit_select+' = ₹' +(special_price-discount_mrp_3)*unit_set);
    
    $( "#selling_price_set_1" ).val(selling_price_set_1);
    $( "#selling_price_set_2" ).val(selling_price_set_2);
    $( "#selling_price_set_3" ).val(selling_price_set_3);
});

$("#category1").change(function(){
    	var id =  $('#category1').val();
    // 	alert(id);
      $.ajax({
          type: 'POST',
          url:  base_url + 'Products/subcategoryWithCatID',
          data: {id:id},
          success:function(response){
             $('#subcategory1').html(response);
         //    $('#brand_id12').html('<option value="">No Brand Found</option>');
      }
    });
  });
  
  $("#subcategory1").change(function(){
    	var sid =  $('#subcategory').val();
    //	console.log(sid);
      $.ajax({
          type: 'POST',
          url:  base_url + 'Products/brandWithSubcategoryID',
          data: {id:sid},
          success:function(response){
          //   $('#brand_id12').html(response);
      }
    });
  });
  
  function deletesets1(r) {
     
    var i = r.parentNode.parentNode.rowIndex;

    var t = document.getElementById('settable');
	var len = t.rows.length;
	var rows = t.getElementsByTagName('tr');
// 	var cels = rows[i].getElementsByTagName('td');
// 	$('#minimum_quantity_'+i).val('');
// 	$('#maximum_quantity_'+i).val('');
// 	$('#discount_mrp_'+i).val('');
// 	$('#selling_price_set_'+i).val('');
//       cels[1].style.display='none';
//       cels[2].style.display='none';
//       cels[3].style.display='none';
//       cels[4].style.display='none';
      
      $("#setShow"+i+i).show();  
      $("#setdelete"+i+i).hide(); 
      
    if(i == '2'){
        i++;
        var cels = rows[i].getElementsByTagName('td');
       	$('#minimum_quantity_'+i).val('');
    	$('#maximum_quantity_'+i).val('');
    	$('#discount_mrp_'+i).val('');
    	$('#selling_price_set_'+i).val('');
          cels[1].style.display='none';
          cels[2].style.display='none';
          cels[3].style.display='none';
          cels[4].style.display='none';
        $("#setdelete"+i+i).hide(); 
   }
    if(i == '1'){
        while(i <= 3){
   
        var cels = rows[i].getElementsByTagName('td');
       	$('#minimum_quantity_'+i).val('');
    	$('#maximum_quantity_'+i).val('');
    	$('#discount_mrp_'+i).val('');
    	$('#selling_price_set_'+i).val('');
          cels[1].style.display='none';
          cels[2].style.display='none';
          cels[3].style.display='none';
          cels[4].style.display='none';
        $("#setdelete"+i+i).hide(); 
        i++;
        }
   }
   
//	t.rows[i].cols[1].style.display = 'none';
}


  
  function Showsets1(r) {
    var i = r.parentNode.parentNode.rowIndex;
    var t = document.getElementById('settable');
	var len = t.rows.length;
	var rows = t.getElementsByTagName('tr');
	var cels = rows[i].getElementsByTagName('td');

      cels[1].style.display='table-cell';
      cels[2].style.display='table-cell';
      cels[3].style.display='table-cell';
      cels[4].style.display='table-cell';
      $("#setShow"+i+i).hide();  
      $("#setdelete"+i+i).show();  
     
      if(i == '1'){
          i++;
           alert(i);
           $("#setShow"+i+i).show();  
      }
      else if(i == '2'){
          i++;
           $("#setShow"+i+i).show();  
      }
      
}


function InactiveRow() {
  var a = document.getElementsByName('#inactivebult').checked;
   var selected = new Array();
 
        //Reference the Table.
        var tblFruits = document.getElementById("products");
 
        //Reference all the CheckBoxes in Table.
        var chks = tblFruits.getElementsByName("inactivebult");
 
        // Loop and push the checked CheckBox value in Array.
        for (var i = 0; i < chks.length; i++) {
            if (chks[i].checked) {
                selected.push(chks[i].value);
            }
        }
 
        //Display the selected CheckBox values.
        if (selected.length > 0) {
            alert("Selected values: " + selected.join(","));
        }
    
}
$("form").on("submit", function(event){
        event.preventDefault();
        var formValues= $(this).serialize();
        // console.log(formValues);
		$.ajax({
			type: 'POST',
			url: base_url + 'Productsseller/addproducts',
			dataType: 'json',
			data:formValues,
			beforeSend: function () {
			     // $('#add_product_data').attr('disabled', 'disabled');
			    $('#add_product_data').hide();
                $('#loader').html('<div class="spinner-border text-primary" role="status"><span class="sr-only">Loading...</span></div>');
            },
			success:function(response){
				// console.log(response);
				if(response.status == 200){
				   AndroidInterface.showToast('Success..! Product added successfully.');
				   // toastr.success('Success..! Product added successfully.');
				}
				else{
				    AndroidInterface.showToast('Error - Try again after some time.');
				   // toastr.error('Error - Try again after some time.');
				}
				document.getElementById('addProdcut').reset();
                $('#loader').html('');
                $('#add_product_data').show();
                $("form").removeClass("was-validated");
			}
		});
	});
