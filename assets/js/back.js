var base_url = "https://smitox.com/admin/";

/***************** Category DataTable *************************/
$(function () 
{
     show_category_data();
     show_subcategory_data();
     show_banner_data();
     show_brand_data();
     show_pincode_data();
     show_offer_data();
     show_unit_data();
     show_staff_members_data();
     show_staff_members_data1();
});
$("#category_id").change(function(){
    	var id =  $('#category_id').val();
    //	alert(id);
      $.ajax({
          type: 'POST',
          url:  base_url + 'Products/subcategoryWithCatID',
          data: {id:id},
          success:function(response){
             $('#subcategory_id').html(response);
      }
    });
  });
function show_category_data()
{
  $.ajax({
     url: base_url + 'show_category_data',
        type: "POST",
        dataType: "json",
        success: function (success) 
        {
            var main_data=success.cat_list;
            $('#show_category').empty();
            if (success.status === 'success') 
            {
                $('#show_category').show();
                var table='';
                var k='1';
                for(i=0;i<main_data.length;i++)
                {
                     if(main_data[i]['isActive'] == '0'){
                        var style = "text-success";
                        var activebtn = ` <a href="`+base_url + 'deletecategory'+`/`+main_data[i]['category_id']+`" class="btn call h5 " onclick="return confirm ('Are You Sure?')"><i class="icon-trash"></i>Inactive</a>`;
                    }
                    else{
                        var style = "text-danger";
                        var activebtn = ` <a href="`+base_url + 'master/activecategory'+`/`+main_data[i]['category_id']+`" class="btn call h5 " onclick="return confirm ('Are You Sure?')"><i class="icon-trash"></i>Active</a>`;
                    }
                table += `<div class="col-md-3 ui-state-default1 ui-sortable-handle mb-5" id="`+main_data[i]['category_id']+`">
                    <div class="shadow rounded bg-white">
                        <div class="card-body" id="panel_box" style="height: 198px;">
                            <i class="fa fa-circle `+style+`"></i>
                            <div class="col-md-12 text-center">
                                <img src="`+main_data[i]['category_images']+`" style="height: 80px;">
                            </div>
                            <div class="clearfix"></div>
                            <br>
                            <div class="row">
                                <div class="col-md-10 text-dark">
                                    <p>`+main_data[i]['name']+`</p>
                                </div>
                                <div class="col-md-2 text-center text-dark">
                                    <div class="dropdown">
                                        <a id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-ellipsis-v"></i></a>
                                        <div class="dropdown-menu text-dark bg-white shadow" aria-labelledby="dropdownMenuButton">
                                            <a href="Subcategory?id=`+main_data[i]['category_id']+`" class="btn call text-dark" ><i class="icon-pencil"></i>Subcategory</a><br> 
                                            <a href="#" class="btn call text-dark" id="editcategory" data-id="`+main_data[i]['category_id']+`" ><i class="icon-pencil"></i>Edit</a><br> 
                                            `+activebtn+`
                        
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                    </div></div><br><br>`; 
                // table+=`
                //      <tr>
                //       <td>`+k+++`</td>
                //       <td>`+main_data[i]['name']+`</td>
                //       <td><img src="`+main_data[i]['category_images']+`" alt="" class="img-fluid ml-0 mt-2  rounded-circle" width="40"></td>
                //       <td>
                //           <a href="#" class="call h5 mb-0" id="editcategory" data-id="`+main_data[i]['category_id']+`" ><i class="icon-pencil"></i></a> 
                //           <a href="`+base_url + 'deletecategory'+`/`+main_data[i]['category_id']+`" class="call h5 mb-0" onclick="return confirm ('Are You Sure?')"><i class="icon-trash"></i></a>
                //         </td>
                //       </tr>`;    
                }
                $("#show_category").append(table);
                $('#example').DataTable();
            } 
        },
        error: function (error) 
        {
        }
    });
}

$(document).on('click', '#editcategory', function(){
		var id = $(this).data('id');
		$.ajax({
			type: 'POST',
			url: base_url + 'editcategory',
			dataType: 'json',
			data: {id: id},
			success:function(response){
				console.log(response);
				$('#edit_category_name').val(response.name);
			//	$('#edit_image').val(response.category_images);
				$('#Categoryid').val(response.category_id);
				$('#editModal').modal('show');
			}
		});
	});


/*********************Subcategory*******************************/


function show_subcategory_data()
{
  $.ajax({
     url: base_url + 'show_subcategory_data',
        type: "POST",
        dataType: "json",
        success: function (success) 
        {
            var main_data=success.cat_list;
            $('#show_subcategory').empty();
            if (success.status === 'success') 
            {
                $('#show_subcategory').show();
                var table='';
                var k='1';
                for(i=0;i<main_data.length;i++)
                {
                table+=`
                     <tr>
                       <td>`+k+++`</td>
                       <td>`+main_data[i]['sub_category']+`</td>
                       <td>`+main_data[i]['name']+`</td> 
                       <td><img src="`+main_data[i]['category_images']+`" alt="" class="img-fluid ml-0 mt-2  rounded-circle" width="40"></td>
                        <td>`+main_data[i]['commission']+`</td>                      
                       <td>
                           <a href="#" class="call h5 mb-0" id="editsubcategory" data-id="`+main_data[i]['sub_category_id']+`" ><i class="icon-pencil"></i></a> 
                           <a href="`+base_url + 'deletesubcategory'+`/`+main_data[i]['sub_category_id']+`" class="call h5 mb-0" onclick="return confirm ('Are You Sure?')"><i class="icon-trash"></i></a>
                        </td>
                      </tr>`;    
                }
                $("#show_subcategory").append(table);
                 $("#show_subcategory1").append("dfgf");
                $('#example1').DataTable();
            } 
        },
        error: function (error) 
        {
        }
    });
}

$(document).on('click', '#editsubcategory', function(){
		var id = $(this).data('id');
		$.ajax({
			type: 'POST',
			url: base_url + 'editsubcategory',
			dataType: 'json',
			data: {id: id},
			success:function(response){
				console.log(response);
				$('#edit_subcategory_name').val(response.sub_category);
				$('#Commission1').val(response.commission);
				$('#subcategoryid').val(response.sub_category_id);
				$('#editModal').modal('show');
			}
		});
	});
	
	
	
	/*********************banner*******************************/


function show_banner_data()
{
  $.ajax({
     url: base_url + 'show_banner_data',
        type: "POST",
        dataType: "json",
        success: function (success) 
        {
            var main_data=success.list;
            $('#show_banner').empty();
            if (success.status === 'success') 
            {
                $('#show_banner').show();
                var table='';
                var k='1';
                for(i=0;i<main_data.length;i++)
                {
                table+=`
                     <tr>
                       <td>`+k+++`</td>
                       <td>`+main_data[i]['banner_name']+`</td>
                       <td>`+main_data[i]['name']+`</td> 
                       <td>`+main_data[i]['sub_category']+`</td>
                       <td><img src="`+main_data[i]['banner_images']+`" alt="" class="img-fluid ml-0 mt-2  rounded-circle" width="40"></td>
                                             
                       <td>
                           <a href="#" class="call h5 mb-0" id="editbanner" data-id="`+main_data[i]['banner_id']+`" ><i class="icon-pencil"></i></a> 
                           <a href="`+base_url + 'deletebanner'+`/`+main_data[i]['banner_id']+`" class="call h5 mb-0" onclick="return confirm ('Are You Sure?')"><i class="icon-trash"></i></a>
                        </td>
                      </tr>`;    
                }
                $("#show_banner").append(table);
                $('#banner').DataTable();
            } 
        },
        error: function (error) 
        {
        }
    });
}

$(document).on('click', '#editbanner', function(){
		var id = $(this).data('id');
		$.ajax({
			type: 'POST',
			url: base_url + 'editbanner',
			dataType: 'json',
			data: {id: id},
			success:function(response){
				console.log(response);
				$('#edit_banner_name').val(response.banner_name);
				$('#bannerid').val(response.banner_id);
				$('#editModal').modal('show');
			}
		});
	});
	
	
	/*********************brands*******************************/


function show_brand_data()
{
  $.ajax({
     url: base_url + 'show_brand_data',
        type: "POST",
        dataType: "json",
        success: function (success) 
        {
            var main_data=success.list;
            $('#show_brand').empty();
            if (success.status === 'success') 
            {
                $('#show_brand').show();
                var table='';
                var k='1';
                for(i=0;i<main_data.length;i++)
                {
                    if(main_data[i]['isActive'] == '0'){
                        var style = "text-success";
                        var activebtn = ` <a href="`+base_url + 'deletebrand'+`/`+main_data[i]['brand_id']+`" class="btn call h5 " onclick="return confirm ('Are You Sure?')"><i class="icon-trash"></i>Inactive</a>`;
                    }
                    else{
                        var style = "text-danger";
                        var activebtn = ` <a href="`+base_url + 'master/activebrand'+`/`+main_data[i]['brand_id']+`" class="btn call h5 " onclick="return confirm ('Are You Sure?')"><i class="icon-trash"></i>Active</a>`;
                    }
                table += `<div class="col-md-3 ui-state-default1 ui-sortable-handle mb-5" id="`+main_data[i]['brand_id']+`">
                    <div class="shadow rounded bg-white">
                        <div class="card-body" id="panel_box" style="min-height: 150px;">
                            <i class="fa fa-circle `+style+`"></i>
                            <div class="col-md-12 text-center">
                                <img src="`+main_data[i]['brand_images']+`" style="height: 80px;">
                            </div>
                            <div class="clearfix"></div>
                            <br>
                            <div class="row text-dark">
                                <div class="col-md-10">
                                    <p>`+main_data[i]['brand_name']+`</p>
                                </div>
                                <div class="col-md-2 text-center">
                                    <div class="dropdown">
                                        <a id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-ellipsis-v"></i></a>
                                        <div class="dropdown-menu bg-white" aria-labelledby="dropdownMenuButton">
                                              <a href="#" class="btn call h5 " id="editbrand" data-id="`+main_data[i]['brand_id']+`" ><i class="icon-pencil"></i>Edit</a> <br>
                                               `+activebtn+`
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                    </div></div><br><br>`; 
                // table+=`
                //      <tr>
                //       <td>`+k+++`</td>
                //       <td>`+main_data[i]['brand_name']+`</td>
                //       <td><img src="`+main_data[i]['brand_images']+`" alt="" class="img-fluid ml-0 mt-2  rounded-circle" width="40"></td>
                //       <td>
                //           <a href="#" class="call h5 mb-0" id="editbrand" data-id="`+main_data[i]['brand_id']+`" ><i class="icon-pencil"></i></a> 
                //           <a href="`+base_url + 'deletebrand'+`/`+main_data[i]['brand_id']+`" class="call h5 mb-0" onclick="return confirm ('Are You Sure?')"><i class="icon-trash"></i></a>
                //         </td>
                    //   </tr>`;    
                }
                $("#show_brand").append(table);
                $('#brand').DataTable();
            } 
        },
        error: function (error) 
        {
        }
    });
}
//  <td>`+main_data[i]['name']+`</td>
//                         <td>`+main_data[i]['sub_category']+`</td>

$(document).on('click', '#editbrand', function(){
		var id = $(this).data('id');
		$.ajax({
			type: 'POST',
			url: base_url + 'editbrand',
			dataType: 'json',
			data: {id: id},
			success:function(response){
				console.log(response);
				$('#edit_brand_name').val(response.brand_name);
				$('#brandid').val(response.brand_id);
				$('#editModal').modal('show');
			}
		});
	});

	/*********************pincode*******************************/


function show_pincode_data()
{
    
     $('.lds-ellipsis').show();
  $.ajax({
     url: base_url + 'show_pincode_data',
        type: "POST",
        dataType: "json",
        success: function (success) 
        {
            var main_data=success.list;
            $('#show_pincode').empty();
            if (success.status === 'success') 
            {
               
                var table='';
                var k='1';
                for(i=0;i<main_data.length;i++)
                {
                    if(main_data[i]['isAvailable'] == '0'){
                        var d = '<button class="btn btn-success">Available</button>';
                    }
                    else{
                        var d = '<button class="btn btn-info">Unavailable</button>';
                    }
                table+=`
                     <tr>
                       <td>`+k+++`</td>
                       <td>`+main_data[i]['pincode']+`</td>
                       <td>`+d+`</td> 
                       <td>
                           <a href="#" class="call h5 mb-0" id="editpincode" data-id="`+main_data[i]['pincode_id']+`" ><i class="icon-pencil"></i></a> 
                       </td>
                      </tr>`;    
                }
                $("#show_pincode").append(table);
                $('#pincode').DataTable();
            } 
        },
         complete: function(){
        $('.lds-ellipsis').hide();
      },
        error: function (error) 
        {
        }
    });
}

$(document).on('click', '#editpincode', function(){
		var id = $(this).data('id');
		$.ajax({
			type: 'POST',
			url: base_url + 'editpincode',
			dataType: 'json',
			data: {id: id},
			success:function(response){
				$('#edit_pincode').val(response.pincode);
				$('#pincodeid').val(response.pincode_id);
				if(response.isAvailable == '1'){$('#exampleRadios2').prop('checked', true);}
				else{$('#exampleRadios1').prop('checked', true);}
				$('#editModal').modal('show');
			}
		});
	});
	
/*********************unit*******************************/


function show_unit_data()
{
  $.ajax({
     url: base_url + 'show_unit_data',
        type: "POST",
        dataType: "json",
        success: function (success) 
        {
            var main_data=success.list;
            $('#show_unit').empty();
            if (success.status === 'success') 
            {
                $('#show_unit').show();
                var table='';
                var k='1';
                for(i=0;i<main_data.length;i++)
                {
                    if(main_data[i]['isActive'] == '0'){
                        var d = '<button class="btn btn-success">Available</button>';
                    }
                    else{
                        var d = '<button class="btn btn-info">Unavailable</button>';
                    }
                table+=`
                     <tr>
                       <td>`+k+++`</td>
                       <td>`+main_data[i]['unit_name']+`</td>
                       <td>`+d+`</td> 
                       <td>
                           <a href="#" class="call h5 mb-0" id="editunit" data-id="`+main_data[i]['unit_id']+`" ><i class="icon-pencil"></i></a> 
                       </td>
                      </tr>`;    
                }
                $("#show_unit").append(table);
                $('#unit').DataTable();
            } 
        },
        error: function (error) 
        {
        }
    });
}

$(document).on('click', '#editunit', function(){
		var id = $(this).data('id');
		$.ajax({
			type: 'POST',
			url: base_url + 'editunit',
			dataType: 'json',
			data: {id: id},
			success:function(response){
				$('#edit_unit').val(response.unit_name);
				$('#unitid').val(response.unit_id);
				if(response.isAvailable == '1'){$('#exampleRadios2').prop('checked', true);}
				else{$('#exampleRadios1').prop('checked', true);}
				$('#editModal').modal('show');
			}
		});
	});
	
	/*********************offers*******************************/


function show_offer_data()
{
  $.ajax({
     url: base_url + 'show_offer_data',
        type: "POST",
        dataType: "json",
        success: function (success) 
        {
            var main_data=success.list;
            // console.log(main_data);
            $('#show_offer').empty();
            if (success.status === 'success') 
            {
                $('#show_offer').show();
                var table='';
                var k='1';
                for(i=0;i<main_data.length;i++)
                {
                table+=`
                     <tr>
                       <td>`+k+++`</td>
                       <td>`+main_data[i]['Offer_title']+`</td>
                       <td>`+main_data[i]['Description']+`</td> 
                        <td>`+main_data[i]['name']+`</td>
                        <td>`+main_data[i]['sub_category']+`</td>
                        
                       <td><img src="`+main_data[i]['offer_images']+`" alt="" class="img-fluid ml-0 mt-2  rounded-circle" width="40"></td>
                        <td><a href="#" class="call h5 mb-0" id="addproduct" data-id="`+main_data[i]['Offer_id']+`" data-catid="`+main_data[i]['category_id']+`" data-subcatid="`+main_data[i]['subcategory_id']+`" ><i class="icon-plus"></i></a>&nbsp;&nbsp;
                        </td>
                       <td>
                           <a href="#" class="call h5 mb-0" id="editoffer" data-id="`+main_data[i]['Offer_id']+`" ><i class="icon-pencil"></i></a> 
                           <a href="`+base_url + 'deleteoffer'+`/`+main_data[i]['Offer_id']+`" class="call h5 mb-0" onclick="return confirm ('Are You Sure?')"><i class="icon-trash"></i></a>
                        </td>
                       
                      </tr>`;    
                }
     
                $("#show_offer").append(table);
                $('#offer').DataTable();
            } 
        },
        error: function (error) 
        {
        }
    });
}
 

$(document).on('click', '#editoffer', function(){
		var id = $(this).data('id');
		$.ajax({
			type: 'POST',
			url: base_url + 'editoffer',
			dataType: 'json',
			data: {id: id},
			success:function(response){
			
				$('#edit_title').val(response.Offer_title);
				$('#offerid').val(response.Offer_id);
				$('#edit_description').val(response.Description);
				$('#editModal').modal('show');
			}
		});
	});
	
	$(document).on('click', '#viewproducts', function(){
		var id1 = $(this).data('id');
	    $.ajax({
			type: 'POST',
			url: base_url + 'viewofferproduct',
			dataType: 'json',
			data: {id1: id1},
			
			success:function(success){
			//	console.log(success);
			var main_data=success.list;
            $('#productlist').empty();
        
           
            if (success.status === 'success') 
            {
                	
                $('#productlist').show();
                var div='';
                var k='1';
                for(i=0;i<main_data.length;i++)
                {
                div+=`
                
                     <div class="col-md-6 col-lg-3 mb-4">
                            <div class="position-relative" style="position: absolute!important;">
                                <img src="`+main_data[i]['image']+`" alt="" class="img-fluid" style="max-width: 24%;">
                                
                            </div>
                            <div class="pt-3 ml-4 pl-5">
                                <p class="mb-2"><a href="#" class="font-weight-bold text-primary">`+main_data[i]['ProductName']+`</a></p>
                                <div class="clearfix">
                                    <div class="d-inline-block"><del>`+main_data[i]['MRP']+`/-</del></div>
                                    <div class="d-inline-block text-danger pl-2">`+main_data[i]['Price']+`/-</div>
                                   
                                    <div class="form-check">
                                     
                                      <input class="form-check-input" name="opid" type="checkbox" value="`+main_data[i]['op_id']+`" id="flexCheckDefault`+main_data[i]['op_id']+`">
                                      <label class="btn btn-outline-primary btn-sm form-check-label" for="flexCheckDefault`+main_data[i]['op_id']+`">
                                       Delete
                                      </label>
                                    </div>
                                </div>
                            </div>
                        </div>`;    
                }
     
                $("#productlist").append(div);

			  $('#view_products').modal('show');
			}
			else{
			      $("#productlist").append('<div class="alert alert-danger" >NO Products Found</div>');
			      $('#view_products').modal('show');
			}

		}
               
			
	});			
		
	});
	
	var mobile = '7021632115';
    var userid = "A1617161716";
    function getOfferProducts(id){
        $.ajax({
			type: 'POST',
			url: base_url + 'viewofferproduct',
			dataType: 'json',
			data: {id1: id},
			 
			success:function(success){
    			var main_data=success.list;
                // $('#product_name').empty();
                if (success.status === 'success'){
                    $('#product_name').show();
                    var div='';var k='1';
                    for(i=0;i<main_data.length;i++){
                        // div+=`<option value="`+main_data[i]['Product_id']+`">`+main_data[i]['ProductName']+`</option>`;   
                        div += `<tr>
                                    <td><img class="img-thumbnail" src="`+main_data[i]['image']+`" width="50" height="50"></td>
                                    <td>`+main_data[i]['ProductName']+`</td>
                                    <td><s>₹ `+main_data[i]['MRP']+`</s> ₹ `+main_data[i]['Selling_price']+`</td>
                                    <td><button class="btn btn-danger" onclick="deleteRow('`+main_data[i]['op_id']+`','`+main_data[i]['offer_id']+`')"><i class="icon-trash"></i></button></td>
                                </tr>`;
                    }
                    $("#append_data").html(div);
    				$('#offerid1').val(id);
    				$('#addproduct1').modal('show');
    			}
    		}
        });
    }
	$(document).on('click', '#addproduct', function(){
		var id = $(this).data('id');
		var subcatId = $(this).data('subcatid');
	    var settings = {
          "url": base_url+"api/Userapp_api/product_list_BySubcategoryId",
          "method": "POST",
          "timeout": 0,
          "data": JSON.stringify({
            "mobile_no": mobile,
            "subcategoryid": subcatId,
            "user_id": userid,
            "sorting_id": "0",
            "filter": {"filter_id": "0","min": "0","max": "0"}
          }),
        };
        $.ajax(settings).done(function (response) {
          var html1 = '<option value="0">Select Products</option>';
          for(var j =0;j< response.data.length;j++){
              html1 += `<option value="`+response.data[j].Product_id+`">`+response.data[j].ProductName+`</option>`;
          }
           $('#product_name').html(html1);
            getOfferProducts(id);
        });
        
	    			
    });
	
	$(document).on('click', '#addproduct11', function(){
		var id = $(this).data('id');
        $("#table").find("tr:gt(0)").remove();
		$('#offerid1').val(id);
		$('#addproduct1').modal('show');
		
	});
	
	
$("#add-row").click(function(){
   
    var id = $("#product_name").val();
    var offerid1 = $("#offerid1").val();
    if(id == '0'){
        toastr.error('Please Select product..!');
    }
    else{
        $.ajax({
			type: 'POST',
			url: base_url + 'offerproduct',
			dataType: 'json',
			data: {offerid1: offerid1,productid:id},
			 
			success:function(success){
    		    if (success == '200'){
    		        toastr.success('Products Has Been added to offer');
                    getOfferProducts(offerid1);
    			}
    		    else{      
    		        toastr.error('Products already added to this offer');
                    getOfferProducts(offerid1);
    			}
    		}
        });
    }
});

function deleteRow(op_id,offer_id) {
    $.ajax({
		type: 'POST',
		url: base_url + 'master/remove_offer_product',
		dataType: 'json',
		data: {op_id:op_id},
		 
		success:function(success){
		    if (success == '200'){
		        toastr.success('Products Has Been deleted from this offer');
                getOfferProducts(offer_id);
			}
		    else{      
		        toastr.error('Something Went Wrong..!');
                getOfferProducts(offer_id);
			}
		}
    });
//   var i = r.parentNode.parentNode.rowIndex;
//   document.getElementById("table").deleteRow(i);
}

/*********************unit*******************************/


function show_staff_members_data()
{
  $.ajax({
     url: base_url + 'show_staff_members_data',
        type: "POST",
        dataType: "json",
        success: function (success) 
        {
            var main_data=success.staff_list;
            $('#show_unit').empty();
            if (success.status === 'success') 
            {
                $('#show_staff').show();
                var table='';
                var k='1';
                for(i=0;i<main_data.length;i++)
                {
                    if(main_data[i]['isActive'] == '0'){
                        var d = '<button class="btn btn-success btn-sm">Available</button>';
                    }
                    else{
                        var d = '<button class="btn btn-info btn-sm">Unavailable</button>';
                    }
                     if(main_data[i]['avatar'] != ''){
                        var avatar  = `<img src="assets/images/staff/`+main_data[i]['avatar']+`" alt="" class="img-fluid ml-0  rounded-circle" width="40">`;
                    } 
                    else{
                        var avatar = `<img src="assets/images/no-image.jpg" alt="" class="img-fluid ml-0 rounded-circle" width="40">`;
                    }
                                 
                table+=`
                     <tr>
                       <td>`+k+++`</td>
                        <td>`+avatar+`</td>
                        <td>`+main_data[i]['fname']+` `+main_data[i]['lname']+`</td>
                         <td>`+main_data[i]['mobile']+`</td>
                          <td>`+main_data[i]['email']+`</td>
                          <td>
                           <a href="#" class="call h5 mb-0" id="editstaff" data-id="`+main_data[i]['staff_id']+`" ><i class="icon-pencil"></i></a> 
                            </td>
                            <td>`+d+`</td>
                       <td></td> 
                       
                      </tr>`;    
                }
                $("#show_staff").append(table);
                $('#staff').DataTable();
            } 
        },
        error: function (error) 
        {
        }
    });
}

$(document).on('click', '#editstaff', function(){
		var id = $(this).data('id');
		$.ajax({
			type: 'POST',
			url: base_url + 'edit_staff',
			dataType: 'json',
			data: {id: id},
			success:function(response){
				$('#first_name').val(response.fname);
				$('#last_name').val(response.lname);
				$('#mobile').val(response.mobile);
				$('#email').val(response.email);
				if(response.avatar == ''){
				    var avatar = 'assets/images/no-image.jpg';
				}else{
				    var avatar = 'assets/images/staff/'+response.avatar;
				}
				$('#profile').attr('src',avatar);
				$('#profile_photo_name').val(response.avatar);
				
				if(response.isActive == '1'){$('#exampleRadios2').prop('checked', true);}
				else{$('#exampleRadios1').prop('checked', true);}
				$('#staff_id').val(response.staff_id);
				$('#editModal').modal('show');
			}
		});
	});

function show_staff_members_data1()
{
  $.ajax({
     url: base_url + 'show_staff_members_data1',
        type: "POST",
        dataType: "json",
        success: function (success) 
        {
            var main_data=success.staff_list;
            $('#show_unit').empty();
            if (success.status === 'success') 
            {
                $('#show_staff').show();
                var table='';
                var k='1';
                for(i=0;i<main_data.length;i++)
                {
                    if(main_data[i]['flag'] == '0'){
                        var d = '<button class="btn btn-success btn-sm">Active</button>';
                    }
                    else{
                        var d = '<button class="btn btn-info btn-sm">Inactive</button>';
                    }
                   
                        var avatar = `<img src="assets/images/no-image.jpg" alt="" class="img-fluid ml-0 rounded-circle" width="40">`;
                   
                                 
                table+=`
                     <tr>
                       <td>`+k+++`</td>
                        <td>`+avatar+`</td>
                        <td>`+main_data[i]['user_fullname']+`</td>
                        <td>`+main_data[i]['company']+`</td>
                        <td>`+main_data[i]['mobile_no']+`</td>
                        <td>`+main_data[i]['email_id']+`</td>
                        <td>`+main_data[i]['min_order_price']+`</td>
                        <td><a href="#" class="call h5 mb-0" id="editstaff1" data-id="`+main_data[i]['user_id']+`" ><i class="icon-pencil"></i></a></td>
                        <td>`+d+`</td>
                     </tr>`;    
                }
                $("#show_staff1").append(table);
                $('#staff1').DataTable();
            } 
        },
        error: function (error) 
        {
        }
    });
}

$(document).on('click', '#editstaff1', function(){
		var id = $(this).data('id');
		$.ajax({
			type: 'POST',
			url: base_url + 'edit_staff1',
			dataType: 'json',
			data: {id: id},
			success:function(response){
				$('#first_name').val(response.user_fullname);
				$('#last_name').val(response.company);
				$('#mobile').val(response.mobile_no);
				$('#email').val(response.email_id);
				$('#amount1').val(response.min_order_price);
				
				if(response.flag == '1'){$('#exampleRadios2').prop('checked', true);}
				else{$('#exampleRadios1').prop('checked', true);}
				$('#staff_id').val(response.user_id);
				$('#editModal').modal('show');
			}
		});
	});
	
		$( "#show_category,#sort_subcategory,#show_brand" ).sortable({
        update: function (event, ui) {
            $('.updatesort').css("display","inline-block");
        }
    });
    
     $('.updatesort').click(function(){
        var sids=[];
        var tablename = $(this).data('tname');
        var id_name = $(this).data('idname');
        
        $( ".ui-state-default1" ).each(function() {
            sids.push($(this).attr('id'));
        });
        $.ajax({
            url: base_url +"master/sorting",
            data: {sids:sids,id_name:id_name,tablename:tablename},
            type: "post",
            success: function(data){
                swal("Sort order updated successfully!", "", "success");
                // setTimeout(function () {
                //     swal.close();
                //     location.reload();
                // }, 2000);
            }
        });
    });
        
        