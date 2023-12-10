var base_url = "https://smitox.com/admin/";
/***************** Category DataTable *************************/
$(function () 
{
     show_users_data();
});

function show_users_data()
{
  $.ajax({
     url: base_url + 'show_users_data/'+type,
    
        type: "POST",
        dataType: "json",
        success: function (success) 
        {
            var main_data=success.list;
            // console.log("asasas",main_data);
            $('#show_userlist').empty();
            if (success.status === 'success') 
            {
                $('#show_userlist').show();
                var table='';var avatar='';var b_form_status ='';var status = '';var view = '';
                var live ='';var orderType='';
                var k='1';
                for(i=0;i<main_data.length;i++)
                {
                    if(main_data[i]['image'] === ''){
                        avatar = base_url+'assets/images/user/noimg.png';
                    }
                    else{
                         avatar = main_data[i]['images'];
                    }
                    
                    
                    if(main_data[i]['flag'] === '1'){
                         flag = `<a href="`+base_url + 'blockusers/0/'+type+`/`+main_data[i]['user_id']+`" onclick="return confirm ('Unblock this Seller?')" class="btn btn-danger btn-sm ">Blocked</a>`;
                    }
                    else{
                          flag = `<a href="`+base_url + 'blockusers/1/'+type+`/`+main_data[i]['user_id']+`" onclick="return confirm ('Block this Seller?')" class="btn btn-info btn-sm rounded-btn">Active</a>`;
                    }
                    
                    if(main_data[i]['live_product'] == '1'){
                        live = `<div class="update23" data-id="`+main_data[i]['user_id']+`"><input type="checkbox" name="live_product" id="live_nolive`+main_data[i]['user_id']+`" value="0" checked></div>`;
                    }
                    else{
                        live = `<div class="update23" data-id="`+main_data[i]['user_id']+`"><input type="checkbox" name="live_product" id="live_nolive`+main_data[i]['user_id']+`" value="1" ></div>`;
                    }
                    
                    if(main_data[i]['order_type'] == '0'){
                        orderType = `<div class="update2" data-id="`+main_data[i]['user_id']+`"><input type="radio" id="cod`+main_data[i]['user_id']+`" name="order_type`+main_data[i]['user_id']+`" value="0" checked>COD<br><input type="radio" id="cod`+main_data[i]['user_id']+`" name="order_type`+main_data[i]['user_id']+`" value="1">Prepaid<br><input type="radio" id="cod`+main_data[i]['user_id']+`" name="order_type`+main_data[i]['user_id']+`" value="2">Advance<br></div>`;
                    }else if(main_data[i]['order_type'] == '1'){
                        orderType = `<div href="" class="update2" data-id="`+main_data[i]['user_id']+`"><input type="radio" id="cod`+main_data[i]['user_id']+`" name="order_type`+main_data[i]['user_id']+`" value="0">COD<br><input type="radio" id="cod`+main_data[i]['user_id']+`" name="order_type`+main_data[i]['user_id']+`" value="1" checked>Prepaid<br><input type="radio" id="cod`+main_data[i]['user_id']+`" name="order_type`+main_data[i]['user_id']+`" value="2">Advance<br></div>`;
                    }else if(main_data[i]['order_type'] == '2'){
                        orderType = `<div href="" class="update2" data-id="`+main_data[i]['user_id']+`"><input type="radio" id="cod`+main_data[i]['user_id']+`" name="order_typ`+main_data[i]['user_id']+`e" value="0">COD<br><input type="radio" id="cod`+main_data[i]['user_id']+`" name="order_type`+main_data[i]['user_id']+`" value="1">Prepaid<br><input type="radio" id="cod`+main_data[i]['user_id']+`" name="order_type`+main_data[i]['user_id']+`" value="2" checked>Advance<br></div>`;
                    }
                    
                    if(main_data[i]['b_form_status'] === '4'){
                        if(main_data[i]['status'] === '0'){
                            status = `<a href="`+base_url + 'activeuser/1/'+type+`/`+main_data[i]['user_id']+`"   onclick="return confirm ('Active this Seller?')" class="btn btn-danger btn-sm rounded-btn">Pending</a>`;
                        }
                        else{
                            status = '<span class="btn btn-success btn-sm rounded-btn">Completed</span>';
                        }
                        view = `<a href="#" id="viewuser" class="call h5 mb-0" id="" data-id="`+main_data[i]['user_id']+`" ><i class="icon-eye"></i></a>`;
                        b_form_status = '<span class="btn btn-info btn-sm rounded-btn"><i class="fa fa-check"></i></span>';
                    }
                    else{
                        view = `<a href="#" id="" class="call h5 mb-0" onclick="alert('KYC is Pending')"><i class="icon-eye"></i></a>`;
                        status = `<span class="btn btn-danger btn-sm rounded-btn disabled" data-toggle="tooltip" data-placement="bottom" title="Enable After KYC Done">Pending</span>`;
                        b_form_status = '<span class="btn btn-danger btn-sm rounded-btn"><i class="fa fa-times"></i></span>';
                    }  
                    var commision = "0.00";
                    table+=`
                    <tr>
                        <td><input type="checkbox" name="inactivebulk[]" id="inactivebult" value="`+main_data[i]['user_id']+`" ></td>
                        <td class="text-center"><img src="`+avatar+`" alt="" class="img-fluid ml-0 rounded-circle" style="height: 40px;width: 40px;"><br><span class="badge badge-primary">`+main_data[i]['user_id']+`</span></td>
                        <td>`+main_data[i]['user_fullname']+`<br>`+main_data[i]['mobile_no']+`<a target="_blank" href="https://api.whatsapp.com/send/?phone=91`+main_data[i]['mobile_no']+`&text&app_absent=0" class="badge badge-success"><i class="fab fa-whatsapp"></i></a><br>`+main_data[i]['email_id']+`</td>
                        <td>`+b_form_status+`</td>
                        <td>`+status+`</td>
                        <td>`+flag+`</a></td>
                        <td>`+view+`</td>
                        <td>`+live+`</td>
                        <td>`+orderType+`</td>
                    </tr>`;    
                }
                $("#show_userlist").append(table);
                $('#userlist').DataTable();
            } 
        }
    });
}

// <td>`+main_data[i]['user_fullname']+`</td>
//                       <td>`+main_data[i]['mobile_no']+` </td>
// <td><a href="" class="btn btn-info btn-lg Update" data-id="`+main_data[i]['user_id']+`"><span class="glyphicon glyphicon-plus"></span><input type="text" id="credit_amount`+main_data[i]['user_id']+`" value="`+main_data[i]['credit']+`" readonly><input type="hidden" name="userId" id="userID`+main_data[i]['user_id']+`" value="`+main_data[i]['user_id']+`"></a></td>
                     
$(document).on('click', '#viewuser', function(){
    const d = new Date();
    let time = d.getTime();
		var id = $(this).data('id');
		$.ajax({
			type: 'POST',
			url: base_url + 'viewuser',
			dataType: 'json',
			data: {id: id},
			success:function(response){
			    
			// Business Details
				$('#name').val(response.list.fname);
				$('#lname').val(response.list.lname);
				$('#user_id').val(response.list.user_id);
				$('#entity').val(response.list.entity_name);
				$('#mobile').val(response.list.b_mobile_no);
				$('#email').val(response.list.b_email_id);
				$('#pincode1').val(response.list.pincode);
				$('#country').val(response.list.country);
				$('#address').val(response.list.address);
				$('#order').val(response.list.min_order_price);
				
			// Bank Details	
				$('#user_id1').val(response.list.user_id);
				$('#acc_name').val(response.list.account_name);
				$('#acc_no').val(response.list.account_no);
				$('#ifsc').val(response.list.ifsccode);
				$('#cheque').prop('src',base_url+'assets/images/document/'+response.list.user_id+'/'+response.list.check_image+'?'+time);
				
			// Tax Details	
			    $('#user_id2').val(response.list.user_id);
				$('#country1').val(response.list.country);
				$('#company').val(response.list.company);
				$('#gst_doc').prop('src',base_url+'assets/images/document/'+response.list.user_id+'/'+response.list.gst_image+'?'+time);
				$('#GST').val(response.list.gst_no);
				$('#pan').val(response.list.pan_no);
				$('#pan_doc').prop('src',base_url+'assets/images/document/'+response.list.user_id+'/'+response.list.pan_image+'?'+time);
				
		    // KYC Details	
		        $('#user_id3').val(response.list.user_id);
				$('#proof1').val(response.list.identity_proof);
				$('#proof_no1').val(response.list.identity_proof_no);
				$('#proof_doc1').prop('src',base_url+'assets/images/document/'+response.list.user_id+'/'+response.list.identity_proof_image+'?'+time);
				$('#proof2').val(response.list.address_proof);
				$('#proof_no2').val(response.list.address_proof_no);
				$('#proof_doc2').prop('src',base_url+'assets/images/document/'+response.list.user_id+'/'+response.list.address_proof_image+'?'+time);
				$('#editModal').modal('show');
			}
		});
	});
	
$(document).on('click', '.update23', function(){
   var userId= $(this).data('id');
//   alert(userId);
   var checkedValue = $('#live_nolive'+userId).val();
//   alert(checkedValue);

  $.ajax({
      	type: 'POST',
		url: base_url + 'liveUser',
		dataType: 'json',
        context: "application/json",
        data: {checkedValue:checkedValue,userId:userId},
        success: function(data) 
        {
            // console.log(data);
            // alert('success');
        }
    });
     
});    

$(document).on('click', '.Update', function(){
    var id = $(this).data('id');
    //var userID = $("#userID"+id).val();
    var creditAmount = $("#credit_amount"+id).val();
    
    $("#creAmount").val(creditAmount);
    $("#userID1").val(id );
    
    $("#MyPopup").modal("show");
    return false;
});

$(document).on('click','#tag-form-submit', function(e) {
    var amount = $('#creAmount').val();
    var usrId = $('#userID1').val();
    $.ajax({
        type: "POST",
        context: "application/json",
        data: {'amount':amount,'usrId':usrId},
        url: base_url+"updateCreditamount",
        success: function(data) 
        {
            // alert('success');
        }
    });
    
});
$(document).on('click', '.update2', function(){
   var id = $(this).data('id');
   var order_type = $('#cod'+id+':checked').val();
   
   $.ajax({
        type: "POST",
        context: "application/json",
        data: {'order_type':order_type,'id':id},
        url: base_url+"updateOrderType",
        success: function(data) 
        {
            // alert('success');
        }
    });
    
});

// $(document).ready(function() {
//     var table = $('#userlist').DataTable( {
//         scrollY: 400,
//         paging:  true,
//         keys:    true
//     } );
// } );
