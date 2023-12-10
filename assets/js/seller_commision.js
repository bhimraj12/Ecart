var base_url = "https://smitox.com/admin/";
/***************** Category DataTable *************************/
$(function () 
{
     show_users_data();
});

function show_users_data()
{
  $.ajax({
     url: base_url + 'users/show_seller_data',
    
        type: "POST",
        dataType: "json",
        success: function (success) 
        {
            var main_data=success.list;
            console.log("asasas",main_data);
            $('#show_userlist').html('');
            if (success.status === 'success') 
            {
                $('#show_userlist').show();
                var table='';
                var avatar='';
                var k='1';
                for(i=0;i<main_data.length;i++) {
                    
                    if(main_data[i]['image'] === ''){
                        avatar = base_url+'assets/images/user/noimg.png';
                    } else{
                        avatar =  base_url+'assets/images/user/'+main_data[i]['image'];
                    }
                    
                    var view_button = (main_data[i].pay_amount == 0 )?'':'<a href="'+ base_url+'users/seller_order_details/'+ main_data[i].user_id +'" class="btn btn-primary">View</a>';
                    // var pay_button = (main_data[i]['pay_amount'] == 0 )?'':'<a href="'+ base_url+'razorpay/checkout/'+ main_data[i]['user_id'] +'" class="btn btn-danger">PAY</a>';
                    var pay_button = (main_data[i].pay_amount == 0 )?``:`<button class="btn btn-danger sweet-8" onclick="pay_status('`+main_data[i].user_id+`','`+main_data[i]['pay_amount']+`','`+main_data[i]['user_fullname']+`')">PAY</button>`;
                    
                    table+=`
                     <tr>
                       <td class="text-center"><img src="`+ avatar +`" alt="" class="img-fluid ml-0 rounded-circle" style="height: 40px;width: 40px;"><br><span class="badge badge-primary">`+main_data[i]['user_id']+`</span></td>
                       <td>`+main_data[i]['user_fullname']+`<br>`+main_data[i]['mobile_no']+`<br>`+main_data[i]['email_id']+`</td>
                       <td>`+main_data[i]['commission']+`</td>
                       <td>`+main_data[i]['pay_amount']+`</td>
                       <td>`+ pay_button +`</td>
                       <td>`+ view_button +`</td>
                    </tr>`;    
                }
                $("#show_userlist").html(table);
                $('#userlist').DataTable();
            } 
        }
    });
}

function pay_status(userid,amt,name){
    // if(confirm('Are You Sure..?')){
   
    // }

        swal({
          title: "Name : "+name,
          text: "Amount : "+amt,
          type: "info",
          showCancelButton: true,
          closeOnConfirm: false,
          showLoaderOnConfirm: true
        }, function () {
             $.ajax({
                url: base_url + 'users/pay_status_success',
                type: "POST",
                dataType: "json",
                data:{userid:userid,amt:amt },
                success: function (success) 
                {
                    if(success == 200){
                        $("#show_userlist").html('');
                        show_users_data();
                        swal("Payment Successfull..!");
                    }
                }
            });
            
        
        });

}
