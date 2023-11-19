var base_url = "https://smitox.com/admin/";
/***************** Category DataTable *************************/
$(function () {
     show_dashboard_details(type);
});
function show_dashboard_details(type)
{
    var main_data = '';
            var format = new Intl.NumberFormat('en-IN', {
                style: 'currency',
                currency: 'INR',
                minimumFractionDigits: 2,
            });
           
    $.ajax({
     url: base_url + 'reports/'+type,
     type: "POST",
     dataType: "json",
        success: function (success) 
        {
            var orders=success.list.orders;
            // console.log("orders",orders);
            $("#t-orders").text(orders.total_orders.length);
            $("#c-orders").text(orders.completed_orders.length);
            $("#i-orders").text(orders.inprocess_orders.length);
            $("#p-orders").text(orders.pending_orders.length);
            
            var users=success.list.users;
            // console.log("users",users);
            $("#t-Users").text(users.total.length);
            $("#c-Users").text(users.active.length);
            $("#i-Users").text(users.sellers.length);
            $("#p-Users").text(users.users.length);
            
            var Payment = success.list.Payment;
            var Payment1 = success.list.Payment1;
            if(Payment !== undefined){
                // console.log("Payment",Payment);
                $("#t-Payment").text(format.format(Payment.total));
                $("#c-Payment").text(format.format(Payment.recived));
                $("#i-Payment").text(format.format(Payment.pending));
                $("#p-Payment").text(format.format(Payment.profit));
            }
            if(Payment1 !== undefined){
                $("#t-orders-amt").text(format.format(Payment1.total_amt));
                $("#c-orders-amt").text(format.format(Payment1.complete_amt));
                $("#i-orders-amt").text(format.format(Payment1.inprogress_amt));
                $("#p-orders-amt").text(format.format(Payment1.pending_amt));
            }
            users_total(main_data);
        }
    });
}
 function users_total(main_data){
    var table='';var avatar='';var b_form_status ='';var status = '';var view = '';
                var live ='';var orderType='';
                var k='1';
                
                for(i=0;i<main_data.length;i++)
                {
                    if(main_data[i]['image'] === ''){
                        avatar = base_url+'assets/images/user/noimg.png';
                    }
                    else{
                         avatar = base_url+'assets/images/user/'+main_data[i]['image'];
                    }
                    
                    
                    if(main_data[i]['flag'] === '1'){
                         flag = `<a href="`+base_url + 'blockusers/0/'+type+`/`+main_data[i]['user_id']+`" onclick="return confirm ('Unblock this Seller?')"><button class="btn btn-danger btn-sm ">Blocked</button></a>`;
                    }
                    else{
                          flag = `<a href="`+base_url + 'blockusers/1/'+type+`/`+main_data[i]['user_id']+`" onclick="return confirm ('Block this Seller?')"><button class="btn btn-info btn-sm rounded-btn">Active</button></a>`;
                    }
                    
                    if(main_data[i]['live_product'] == '1'){
                        live = `<div class="update23" data-id="`+main_data[i]['user_id']+`"><input type="checkbox" name="live_product" id="live_nolive" value="0" checked></div>`;
                    }
                    else{
                        live = `<div class="update23" data-id="`+main_data[i]['user_id']+`"><input type="checkbox" name="live_product" id="live_nolive" value="1" ></div>`;
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
                            status = `<a href="`+base_url + 'activeuser/1/'+type+`/`+main_data[i]['user_id']+`"   onclick="return confirm ('Active this Seller?')"><button class="btn btn-danger btn-sm rounded-btn">Pending</button></a>`;
                        }
                        else{
                            status = '<button class="btn btn-success btn-sm rounded-btn">Completed</button>';
                        }
                        view = `<a href="#" id="viewuser" class="call h5 mb-0" id="" data-id="`+main_data[i]['user_id']+`" ><i class="icon-eye"></i></a>`;
                        b_form_status = '<button class="btn btn-info btn-sm rounded-btn"><i class="fa fa-check"></i></button>';
                    }
                    else{
                        view = `<a href="#" id="" class="call h5 mb-0" onclick="alert('KYC is Pending')"><i class="icon-eye"></i></a>`;
                        status = `<button class="btn btn-danger btn-sm rounded-btn disabled" data-toggle="tooltip" data-placement="bottom" title="Enable After KYC Done">Pending</button>`;
                        b_form_status = '<button class="btn btn-danger btn-sm rounded-btn"><i class="fa fa-times"></i></button>';
                    }   
                    table+=`
                     <tr>
                      <td><input type="checkbox" name="inactivebulk[]" id="inactivebult" value="`+main_data[i]['user_id']+`" ></td>
                      
                       <td class="text-center"><img src="`+avatar+`" alt="" class="img-fluid ml-0 rounded-circle" style="height: 40px;width: 40px;"><br><span class="badge badge-primary">`+main_data[i]['user_id']+`</span></td>
                       <td>`+main_data[i]['user_fullname']+`<br>`+main_data[i]['mobile_no']+`<br>`+main_data[i]['email_id']+`</td>
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

$(document).on('click','#todays,#months,#years,#all', function(e) {
    var type1 = $(this).val();
    
    if(type1 == "todays"){
        $('#total_sellers_user_id').attr("href", base_url + 'list/todays');
        $("#total_active_id").attr("href", base_url + 'dashboard_list/active/todays');
        $('#total_seller_id').attr("href", base_url + 'dashboard_list/Sellers/todays');
        $("#total_users_id").attr("href", base_url + 'dashboard_list/Users/todays');
        
        $('#total_orders_id').attr("href", base_url + 'dashboard_orders/all/todays');
        $("#total_complete_orders_id").attr("href", base_url + 'dashboard_orders/Delivered/todays');
        $("#total_progress_orders_id").attr("href", base_url + 'dashboard_orders/Accepted/todays');
        $("#total_pending_orders_id").attr("href", base_url + 'dashboard_orders/Pending/todays');
    } else if(type1 == "months"){
        $('#total_sellers_user_id').attr("href", base_url + 'list/months');
        $("#total_active_id").attr("href", base_url + 'dashboard_list/active/months');
        $('#total_seller_id').attr("href", base_url + 'dashboard_list/Sellers/months');
        $("#total_users_id").attr("href", base_url + 'dashboard_list/Users/months');
        
        $('#total_orders_id').attr("href", base_url + 'orders/months');
        $("#total_complete_orders_id").attr("href", base_url + 'dashboard_orders/Delivered/months');
        $("#total_progress_orders_id").attr("href", base_url + 'dashboard_orders/Accepted/months');
        $("#total_pending_orders_id").attr("href", base_url + 'dashboard_orders/Pending/months');
    } else if(type1 == "years"){
        $('#total_sellers_user_id').attr("href", base_url + 'list/years');
        $("#total_active_id").attr("href", base_url + 'dashboard_list/active/years');
        $('#total_seller_id').attr("href", base_url + 'dashboard_list/Sellers/years');
        $("#total_users_id").attr("href", base_url + 'dashboard_list/Users/years');
        
        $('#total_orders_id').attr("href", base_url + 'orders/years');
        $("#total_complete_orders_id").attr("href", base_url + 'dashboard_orders/Delivered/years');
        $("#total_progress_orders_id").attr("href", base_url + 'dashboard_orders/Accepted/years');
        $("#total_pending_orders_id").attr("href", base_url + 'dashboard_orders/Pending/years');
    } else {
        $('#total_sellers_user_id').attr("href", base_url + 'list/all');
        $("#total_active_id").attr("href", base_url + 'list/active');
        $('#total_seller_id').attr("href", base_url + 'list/Sellers');
        $("#total_users_id").attr("href", base_url + 'list/Users');
        
        $('#total_orders_id').attr("href", base_url + 'orders/all');
        $("#total_complete_orders_id").attr("href", base_url + 'orders/Delivered');
        $("#total_progress_orders_id").attr("href", base_url + 'orders/Accepted');
        $("#total_pending_orders_id").attr("href", base_url + 'orders/Pending');
    }
    show_dashboard_details(type1);
});
