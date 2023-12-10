var base_url = "https://smitox.com/admin/";
/***************** Category DataTable *************************/
$(function () 
{
     show_orders_returndetails();
   // $('#AcceptOrder').modal('hide');
});
function show_orders_returndetails()
{
    $.ajax({
     url: base_url + 'show_orders_returndetails/'+type,
        type: "POST",
        dataType: "json",
        
        success: function (success) 
        {
            var main_data=success.list;
            $('#show_orderreturnlist').empty();
            if (success.status === 'success') 
            {
                $('#show_orderreturnlist').show();
                var table='';var avatar='';var b_form_status ='';var status = '';var view = '';var flag ='';var pytm='';var k='1';var edit='';
                for(i=0;i<main_data.length;i++)
                {
                    if(main_data[i]['return_status'] == 0){
                        flag = `<button class="btn btn-warning btn-sm rounded-btn">No Return</button>`;
                         
                    }
                    else if(main_data[i]['return_status'] == 1){
                        flag = `<button class="btn btn-primary btn-sm rounded-btn">Applied</button>`;
                        edit = `<a href="" class="update1" data-id="`+main_data[i]['detail_order_id']+`"><i class="fas fa-edit"></i><input type="hidden" name="returnReason" id="returnReason`+main_data[i]['detail_order_id']+`" value="`+main_data[i]['return_reason']+`"><input type="hidden" name="returnProof" id="returnProof`+main_data[i]['detail_order_id']+`" value="`+main_data[i]['return_proof']+`"><input type="hidden" name="userId" id="orderID`+main_data[i]['detail_order_id']+`" value="`+main_data[i]['detail_order_id']+`"></a>`;
                    
                    }
                    else if(main_data[i]['return_status'] == 2){
                        flag = `<button class="btn btn-danger btn-sm rounded-btn">Confirmed</button>`;
                        edit = `<a href="" class="update1" data-id="`+main_data[i]['detail_order_id']+`"><i class="fas fa-edit"></i><input type="hidden" name="returnReason" id="returnReason`+main_data[i]['detail_order_id']+`" value="`+main_data[i]['return_reason']+`"><input type="hidden" name="returnProof" id="returnProof`+main_data[i]['detail_order_id']+`" value="`+main_data[i]['return_proof']+`"><input type="hidden" name="userId" id="orderID`+main_data[i]['detail_order_id']+`" value="`+main_data[i]['detail_order_id']+`"></a>`;
                    }
                    else if(main_data[i]['return_status'] == 3){
                        flag = `<button class="btn btn-danger btn-sm rounded-btn">Cancelled</button>`;
                        edit = `<button class="btn btn-warning btn-sm rounded-btn">Cancelled</button>`;
                    }
                    else if(main_data[i]['return_status'] == 4){
                        flag = `<button class="btn btn-primary btn-sm rounded-btn">Completed</button>`;
                        edit = `<button class="btn btn-warning btn-sm rounded-btn">Completed</button>`;
                    }
                    
                    if(main_data[i]['payment_type'] == 0){
                        pytm = `<button class="btn btn-primary btn-sm rounded-btn">COD</button>`;
                        
                    }
                    else{
                      pytm = `<button class="btn btn-primary btn-sm rounded-btn">Online</button>`;
                    }
                    
                    
                    table+=`
                      <tr>
                      <td>`+ (i+1) +`</td>
                      <td>`+main_data[i]['ProductName']+`</td>
                      <td>`+main_data[i]['order_id']+`-`+main_data[i]['detail_order_id']+`</td>
                      <td>`+main_data[i]['order_placed_date']+`</td>
                      <td>₹ `+main_data[i]['TotalProuctAmount']+`</td>
                      <td>`+flag+` </td>
                      <td>`+main_data[i]['return_reason']+`</td>
                      <td><a href=`+base_url+`assets/images/returnproduct/`+main_data[i]['return_proof']+` target="_blank"><img src=`+base_url+`assets/images/returnproduct/`+main_data[i]['return_proof']+` alt="" class="img-fluid ml-0 rounded-circle" width="40" style="height: 40px;"></a></td>
                      <td>`+edit+`</td>
                      </tr>`;    
                }
                $("#show_orderreturnlist").append(table);
                $('#orderlist').DataTable();
            } 
        }
    });
}


$(document).on('click', '.update1', function(){
    
    var id = $(this).data('id');
    var returnReason = $("#returnReason"+id).val();
    var returnProof = $("#returnProof"+id).val();
    $("#return_reason").text(returnReason);
    $("#return_proof").attr('src',base_url+`assets/images/returnproduct/`+returnProof);
    $("#detail_order_id").val(id);
    
    $("#ReturnStatus").modal("show");
    return false;
});

$(document).on('click','#status-submit', function(e) {
    
    var returnRn = $('#return_reason').val();
    var returnpProf = $('#return_proof').val();
    var detailId = $('#detail_order_id').val();
    var returnSts = $('#status').val();
    $.ajax({
        type: "POST",
        context: "application/json",
        data: {'returnRn':returnRn,'returnpProf':returnpProf,'detailId':detailId,'returnSts':returnSts},
        url: base_url+"updateStatus",
        success: function(data) 
        {
            // alert("aaaaa");
        }
    });
});
