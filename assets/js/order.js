var base_url = "https://smitox.com/admin/";
/***************** Category DataTable *************************/
$(function () 
{
     show_orders_data();
     show_sellersorders_data();
});

function show_orders_data(){
  $.ajax({
     url: base_url + 'show_orders_data/'+type,
    
        type: "POST",
        dataType: "json",
        
        success: function (success) 
        {
            var main_data=success.list;
            $('#show_orderlist').empty();
            // console.log(main_data);
            if (success.status === 'success') 
            {
                $('#show_orderlist').show();
                var table='';var avatar='';var b_form_status ='';var status = '';var view = '';var flag ='';var pytm='';var k='1';
                for(i=0;i<main_data.length;i++)
                {
                    if(main_data[i]['flag'] == 0){
                        flag = `<button class="btn btn-warning btn-sm rounded-btn">Pending</button>`;
                    }
                    else if(main_data[i]['flag'] == 1){
                        flag = `<button class="btn btn-primary btn-sm rounded-btn">Accepted</button>`;
                    }
                    else if(main_data[i]['flag'] == 2){
                        flag = `<button class="btn btn-danger btn-sm rounded-btn">Rejected</button>`;
                    }
                    else if(main_data[i]['flag'] == 3){
                        flag = `<button class="btn btn-danger btn-sm rounded-btn">Cancelled</button>`;
                    }
                    else if(main_data[i]['flag'] == 4){
                        flag = `<button class="btn btn-primary btn-sm rounded-btn">Dispatch</button>`;
                    }
                    else if(main_data[i]['flag'] == 5){
                        flag = `<button class="btn btn-success btn-sm rounded-btn">Delivered</button>`;
                    }
                    
                    else if(main_data[i]['flag'] == 6){
                        flag = `<button class="btn btn-success btn-sm rounded-btn">Return To Seller</button>`;
                    }
                    
                    if(main_data[i]['payment_type'] == 0){
                        pytm = `<button class="btn btn-primary btn-sm rounded-btn">COD</button>`;
                    }
                    else if(main_data[i]['payment_type'] == 2){
                        pytm = `<button class="btn btn-primary btn-sm rounded-btn">Advance</button>`;
                    }
                    else{
                       pytm = `<button class="btn btn-primary btn-sm rounded-btn">Online</button>`;
                    }
                    table+=`
                      <tr>
                      <td>`+ (i+1) +`</td>
                      <td>`+main_data[i]['user_id']+`<br>`+main_data[i]['user_fullname']+`<br>`+main_data[i]['mobile_no']+`</td>
                      <td><a class="call mb-0 btn btn-success" style="padding: 0.1rem 0.5rem" id="vieworder" onclick="vieworder('`+main_data[i]['order_id']+`')"  >`+main_data[i]['order_id']+`</a><br>
                      <span id="loader`+main_data[i]['order_id']+`"></span></td>
                      <td>`+main_data[i]['created_at']+`</td>
                   
                      <td>₹ `+main_data[i]['TotalProuctAmount']+`</td>
                      
                      <td>`+pytm+` </td>
                      <td>`+flag+` </td>
                      </tr>`;    
                }
                $("#show_orderlist").append(table);
                $('#orderlist').DataTable();
            } 
            
        }
    });
}

function show_sellersorders_data(){
  $.ajax({
     url: base_url + 'show_sellersorders_data/'+type,
    
        type: "POST",
        dataType: "json",
        
        success: function (success) 
        {
            var main_data=success.list;
            $('#show_orderlist1').empty();
            // console.log(main_data);
            if (success.status === 'success') 
            {
                $('#show_orderlist1').show();
                var table='';var avatar='';var b_form_status ='';var status = '';var view = '';var flag ='';var pytm='';var k='1';
                for(i=0;i<main_data.length;i++)
                {
                    if(main_data[i]['flag'] == 0){
                        flag = `<button class="btn btn-warning btn-sm rounded-btn">Pending</button>`;
                    }
                    else if(main_data[i]['flag'] == 1){
                        flag = `<button class="btn btn-primary btn-sm rounded-btn">Accepted</button>`;
                    }
                    else if(main_data[i]['flag'] == 2){
                        flag = `<button class="btn btn-danger btn-sm rounded-btn">Rejected</button>`;
                    }
                    else if(main_data[i]['flag'] == 3){
                        flag = `<button class="btn btn-danger btn-sm rounded-btn">Cancelled</button>`;
                    }
                    else if(main_data[i]['flag'] == 4){
                        flag = `<button class="btn btn-primary btn-sm rounded-btn">Dispatch</button>`;
                    }
                    else if(main_data[i]['flag'] == 5){
                        flag = `<button class="btn btn-success btn-sm rounded-btn">Delivered</button>`;
                    }
                    else if(main_data[i]['flag'] == 6){
                        flag = `<button class="btn btn-success btn-sm rounded-btn">Return to Seller</button>`;
                    }
                    
                    if(main_data[i]['payment_type'] == 0){
                        pytm = `<button class="btn btn-primary btn-sm rounded-btn">COD</button>`;
                    }
                    else if(main_data[i]['payment_type'] == 2){
                        pytm = `<button class="btn btn-primary btn-sm rounded-btn">Advance</button>`;
                    }
                    else{
                       pytm = `<button class="btn btn-primary btn-sm rounded-btn">Online</button>`;
                    }
                    table+=`
                      <tr>
                      <td>`+ (i+1) +`</td>
                      <td>`+main_data[i]['seller_id']['user_id']+`<br>`+main_data[i]['seller_id']['user_fullname']+`<br>`+main_data[i]['seller_id']['mobile_no']+`</td>
                      <td>`+main_data[i]['user_id']+`<br>`+main_data[i]['user_fullname']+`<br>`+main_data[i]['mobile_no']+`</td>
                      <td><a class="call mb-0" id="vieworder" onclick="vieworder(`+main_data[i]['order_id']+`)" data-id="`+main_data[i]['order_id']+`" >`+main_data[i]['order_id']+`</a></td>
                      <td>`+main_data[i]['created_at']+`</td>
                   
                      <td>₹ `+main_data[i]['TotalProuctAmount']+`</td>
                      
                      <td>`+pytm+` </td>
                      <td>`+flag+` </td>
                      </tr>`;    
                }
                $("#show_orderlist1").append(table);
                $('#orderlist1').DataTable();
            } 
            
        }
    });
}

function vieworder(id){
	//	var id = $(this).data('id');
	var flag='';var buttons ='';
		$("#invoicelist").empty();
		$.ajax({
			type: 'POST',
			url: base_url + 'Orders/vieworder',
			dataType: 'json',
			data: {id: id},
			beforeSend: function () {
                    $('#loader'+id).html('<div class="badge badge-info">Please wait..!</div>');
                },
			success:function(response){
			 //   console.log(response);
			  $('#loader'+id).html('');
			    var invoice = `<a href="`+base_url+`invoice_data/view/`+response.OrderDetails.order_id+`" target="_blank" class="btn btn-success float-right">Preview</a>
			    <a href="`+base_url+`invoice_data/download/`+response.OrderDetails.order_id+`" target="_blank" class="btn btn-success float-right">Download</a>
			    <a href="https://wa.me/91`+response.UserData.mobile_no+`?text=Dear Customer, your order has been successfully placed. your order Number is: `+response.OrderDetails.order_id+` thank you for shopping with us SMITOX B2B.
                click here for invoice https://smitox.com/inv/`+response.OrderDetails.order_id+`" target="_blank" class="btn btn-success float-right">Share</a>
			    `;
			    if(response.OrderDetails.flag == 0){
                        flag = `Pending`;
                         buttons = `<button type="button" class="btn btn-info" id="AccpetOrder1"  data-inv="`+response.OrderDetails.order_id    +`">Accept Order</button>
                                    <button type="button" class="btn btn-success" id="RejectOrder"  data-inv="`+response.OrderDetails.order_id    +`">Cancel Order</button>
                                    <button type="button" class="btn btn-primary" id="UpdateOrder">Update Order</button>`;
                    }
                    else if(response.OrderDetails.flag == 1){
                        if(response.OrderDetails.api_type == 1){
                            buttons = `<button type="button" class="btn btn-info" id="DispatchOrder"  data-inv="`+response.OrderDetails.order_id    +`">Dispatch Order</button>`;
                        }
                        flag = `Accepted`;
                    }
                    else if(response.OrderDetails.flag == 2){
                        flag = `Rejected`;
                    }
                    else if(response.OrderDetails.flag == 3){
                        flag = `Cancelled`;
                    }
                    else if(response.OrderDetails.flag == 4){
                        if(response.OrderDetails.api_type == 1){
                            buttons = `<button type="button" class="btn btn-success" id="DeliveredOrder"  data-inv="`+response.OrderDetails.order_id    +`">Delivered Order</button>
                                        <button type="button" class="btn btn-success" id="returnOrder1"  data-inv="`+response.OrderDetails.order_id    +`">Retrun To Seller Order</button>
                                        `;
                        }
                        flag = `Dispatch`;
                    }
                    else if(response.OrderDetails.flag == 5){
                        flag = `Delivered`;
                    }
                    else if(response.OrderDetails.flag == 6){
                        flag = `Retrun To Seller`;
                        buttons = `<button type="button" class="btn btn-success" id="DeliveredOrder"  data-inv="`+response.OrderDetails.order_id    +`">Delivered Order</button>`;
                    }
               
                            if(response.OrderDetails.payment_type == '1'){
                               var payment = 'Online'; 
                               var cod ='';
                                
                            }else{
                                var payment = 'Cash on Delivery';
                               
                                 var cod= `<tr>  <td class="text-right" colspan="4"></td><td class="text-right"><b>COD Charges</b></td>
                                             <td class="text-right"><input type="hidden" id="cod1" name="cod" value="`+response.OrderDetails.COD_charges+`">₹<span id="cod">`+response.OrderDetails.COD_charges+`</span></td>
                                              </tr>`;
                            }
               
                                                
                var htmldata =`<div class="row">
                                    <div class="col-12 col-md-12">
                                        <div class="card border-0">
                                            <div class="bg-info card-header d-flex justify-content-between align-items-center">                               
                                                <a href="#" class="float-left mr-3  py-1 px-2 rounded text-white back-to-invoice">
                                                    <b>Date: </b> `+response.OrderDetails.created_at+`
                                                </a>
                                                <h4 class="card-title">Invoice# <span class="inv-no">`+response.OrderDetails.order_id+`</span></h4>                               
                                            </div>
                                                <p class="text-right mt-1 px-5">Order Status :<b> `+flag+`</b></p>
                                        </div>
                                    </div>
                                    <div class="col-12 col-md-12">
                                        <div class="card border-0">
                                            <div class="card-body table-responsive">
                                                <table class="table table-bordered">
                                                    <thead>
                                                        <tr>
                                                            <td style="width: 50%;"><b>Sold by</b></td>
                                                            <td style="width: 50%;"><b>Ship To</b></td>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td><address>
                                                                    <strong>`+response.SellerData.company+`</strong><br>
                                                                    `+response.SellerData.address+`,`+response.SellerData.pincode+`</address>
                                                                    <b>Telephone:</b> `+response.SellerData.mobile_no+`<br>
                                                                    <b>PAN No</b> `+response.SellerData.pan_no+`<br>
                                                                    <b>GST:</b> `+response.SellerData.gst_no+`
                                                            </td>
                                                            <td><b>Name:</b>`+response.OrderDetails.fullname+`<br>
                                                            <address>`+response.OrderDetails.buildingname+`,`+response.OrderDetails.area+`
                                                            `+response.OrderDetails.landmark+`,`+response.OrderDetails.sector+`
                                                            `+response.OrderDetails.city+`,`+response.OrderDetails.state+`,`+response.OrderDetails.pincode+`
                                                            
                                                            </address>
                                                                <b>Contact</b> `+response.OrderDetails.contact+`<br>
                                                                <b>Order ID:</b> `+response.OrderDetails.order_id+`<br>
                                                                <b>Payment Method:</b> `+payment+`<br>
                                                           </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-12 col-md-12">
                                        <div class="card border-0">
                                            <div class="card-body table-responsive">
                                           <span id="loader"> </span>
                                                <table class="table table-bordered">
                                                    <thead>
                                                        <tr>
                                                            <td><b>Product</b></td>
                                                            <td class="text-right"><b>Quantity</b></td>
                                                            <td class="text-right"><b>Unit Price</b></td>
                                                            <td class="text-right"><b>Net Amount</b></td>
                                                            <td class="text-right"><b>Tax Amount</b></td>
                                                            <td class="text-right"><b>Total</b></td>
                                                            <td class="text-right"></td>
                                                        </tr>
                                                    </thead>
                                                    <tbody id="apd">`;
                                                    
                                                      for(i=0;i<response.list.length;i++)
                                                     {
                                                            var gst = (response.list[i].ProuctGST/2);
                                                            var gst_percentage = (response.list[i].GST_Percentage/2);
                                                            var Productvariant='';
                                                            if(response.list[i].variant_id != 0){Productvariant = `(`+response.ProductData[i].varient_name+`)`;}
                                                            else {Productvariant = '';}
                                                        htmldata+=` <tr>
                                                                        <td><div class="row"><input type="hidden" name="orderDetailId" value="`+response.list[i].detail_order_id+`"/> <div class="col-md-3"><a href="`+base_url+`assets/images/product/`+response.ProductImg[i]+`" target="_blank"><img src="`+base_url+`assets/images/product/`+response.ProductImg[i]+`" style="width:50px;height:50px;margin-right: 12px;"></a></div><div class="col-md-9">`+response.list[i].ProductName+Productvariant+`<br>`+response.ProductData[i].sku_code+`</div></div></td>
                                                                        <td class="text-right"><input type="number" class="form-control col-md-8" id="productQty`+response.list[i].detail_order_id+`" name="productQty" value="`+response.list[i].cart_product_qty+`" onchange="editInvoice(`+response.list[i].detail_order_id+`,`+response.ProductData[i].gst_type+`,`+response.ProductData[i].GST+`)" onkeyup="editInvoice(`+response.list[i].detail_order_id+`,`+response.ProductData[i].gst_type+`,`+response.ProductData[i].GST+`)"></td>
                                                                        <td class="text-right">  <div class="input-group"><div class="input-group-prepend"><span class="input-group-text" id="inputGroupPrepend">₹</span></div><input type="number" onkeyup="editInvoice(`+response.list[i].detail_order_id+`,`+response.ProductData[i].gst_type+`,`+response.ProductData[i].GST+`)" onchange="editInvoice(`+response.list[i].detail_order_id+`,`+response.ProductData[i].gst_type+`,`+response.ProductData[i].GST+`)" class="form-control" id="productPrice`+response.list[i].detail_order_id+`" name="productPrice" value="`+response.list[i].ProductPrice+`"></div></td>
                                                                        <td class="text-right">₹<span id="price_data_`+response.list[i].detail_order_id+`">`+response.list[i].TotalProuctPrice+`</span><input type="hidden" id="product_price_`+response.list[i].detail_order_id+`" name="product_price" value="`+response.list[i].TotalProuctPrice+`"><input type="hidden" id="puchase_price" name="puchase_price" value="`+response.ProductData[i].purchase_rate+`"></td>
                                                                        <td class="text-right"><input type="hidden" id="P_GST`+response.list[i].detail_order_id+`" name="P_GST" value="`+response.list[i].ProuctGST+`"/>CGST(`+gst_percentage+`%) : ₹<span id="cgst_data_`+response.list[i].detail_order_id+`">`+gst+`</span><br>SGST(`+gst_percentage+`%): ₹<span id="sgst_data_`+response.list[i].detail_order_id+`">`+gst+`</span></td>
                                                                        <td class="text-right">₹<span id="total_data_`+response.list[i].detail_order_id+`">`+response.list[i].TotalProuctAmount+`</span><input type="hidden" id="totalP`+response.list[i].detail_order_id+`" value="`+response.list[i].TotalProuctAmount+`" name="totalP"></td>
                                                                        <td class="text-right"><i class="icon-trash" onclick="removeProduct('`+response.list[i].detail_order_id+`','`+response.list[i].order_id+`')"></i></td>
                                                                    </tr>`;
                                                        
                                                     }
                                                    
                                                    htmldata+=`           
                                                        <tr>
                                                          <td class="text-right" colspan="4"></td>
                                                            <td class="text-right"><b>Disocunt</b></td>
                                                            <td class="text-right"><div class="input-group"><div class="input-group-prepend"><span class="input-group-text" id="inputGroupPrepend">₹</span></div><input type="number" class="form-control col-md-12" id="discount" name="discount" onkeyup="deliveryCharge()" onchange="deliveryCharge()" value="`+response.OrderDetails.discount+`"></div></td>
                                                        </tr>
                                                        <tr>
                                                            <td class="text-right" colspan="4"></td>
                                                            <td class="text-right" ><b>Delivery Charges</b></td>
                                                            <td class="text-right"><div class="input-group"><div class="input-group-prepend"><span class="input-group-text" id="inputGroupPrepend">₹</span></div><input type="number" class="form-control col-md-12" id="dc" name="name" onkeyup="deliveryCharge()" onchange="deliveryCharge()" value="`+response.OrderDetails.TotalDeliveryCharges+`"></div></td>
                                                        </tr>
                                                         `+cod+`
                                                         
                                                        <tr>
                                                            <td class="text-right" colspan="4"></td>
                                                            <td class="text-right"><b>Total</b></td>
                                                            <td class="text-right">₹<input type="hidden" id="TTAmount" name="TTAmount" value="`+response.OrderDetails.TT_Amount+`"><span id="ta">`+response.OrderDetails.TT_Amount+`</span></td>
                                                        </tr>
                                                        <tr>
                                                          <td class="text-right" colspan="4"></td>
                                                            <td class="text-right"><b>Amount Paid</b></td>
                                                            <td class="text-right"><input type="hidden" id="order_id" name="order_id" value="`+response.OrderDetails.order_id+`">₹<span id="paid">`+response.OrderDetails.AmountPaid+`</span></td>
                                                        </tr>
                                                         <tr>
                                                          <td class="text-right" colspan="4"></td>
                                                            <td class="text-right"><b>Amount Pending</b></td>
                                                            <td class="text-right"><input type="hidden" class="form-control col-md-6" id="pending1" name="pending" value="`+response.OrderDetails.AmountPending+`">₹<span id="pending">`+response.OrderDetails.AmountPending+`</span></td>
                                                        </tr>
                                                        <tr>
                                                         <td class="" >awbNumber : `+response.OrderDetails.awbNumber+`<br>
                                                         Shipment ID : `+response.OrderDetails.shipmentID+`<br>
                                                           Shipment Name : `+response.OrderDetails.CouriorName+`<br>
                                                            Razorpay Id : `+response.OrderDetails.payment_id+`</td>
                                                           <td class="" colspan="5">Order Note : `+response.OrderDetails.orderNote+`</td>
                                                           
                                                        </tr>
                                                    </tbody>
                                                </table>
                                                 
                                            </div>
                                            <div class="modal-footer" style="display: inline-table !important;">
                                            <span id="loader"></span>
                                                `+buttons+`
                                                <button type="button" class="btn btn-secondary float-right" data-dismiss="modal">Close</button>
                                                 `+invoice+`<span class="float-right btn text-white">Invoice</span>
                                            </div>
                                        </div>
                                    </div>
                                    
                                </div>`;
                    $("#invoicelist").append(htmldata);
                    $('#editModal').modal('show');
			}
		});
	}
	
function vieworder1(id){
	//	var id = $(this).data('id');var flag='';var buttons ='';
		  // $("#apd").empty();
		    $("#loader").html('');
		$.ajax({
			type: 'POST',
			url: base_url + 'Orders/vieworder',
			dataType: 'json',
			data: {id: id},
			beforeSend: function () {
                    $('#loader'+id).html('<div class="badge badge-info">Please wait..!</div>');
                },
			success:function(response){
			    console.log(response);
			  $('#loader'+id).html('');
			   if(response.OrderDetails.payment_type == '1'){
                               var payment = 'Online'; 
                               var cod ='';
                                
                            }else{
                                var payment = 'Cash on Delivery';
                               
                                 var cod= `<tr>  <td class="text-right" colspan="4"></td><td class="text-right"><b>COD Charges1</b></td>
                                             <td class="text-right"><input type="hidden" id="cod1" name="cod" value="`+response.OrderDetails.COD_charges+`">₹<span id="cod">`+response.OrderDetails.COD_charges+`</span></td>
                                              </tr>`;
                            }
                var htmldata =``;
                                                    
                                                      for(i=0;i<response.list.length;i++)
                                                     {
                                                            var gst = (response.list[i].ProuctGST/2);
                                                            var gst_percentage = (response.list[i].GST_Percentage/2);
                                                            var Productvariant='';
                                                            if(response.list[i].variant_id != 0){Productvariant = `(`+response.ProductData[i].varient_name+`)`;}
                                                            else {Productvariant = '';}
                                                        htmldata+=` <tr>
                                                                        <td><div class="row"><input type="hidden" name="orderDetailId" value="`+response.list[i].detail_order_id+`"/> <div class="col-md-3"><a href="`+base_url+`assets/images/product/`+response.ProductImg[i]+`" target="_blank"><img src="`+base_url+`assets/images/product/`+response.ProductImg[i]+`" style="width:50px;height:50px;margin-right: 12px;"></a></div><div class="col-md-9">`+response.list[i].ProductName+Productvariant+`<br>`+response.ProductData[i].sku_code+`</div></div></td>
                                                                        <td class="text-right"><input type="number" class="form-control col-md-8" id="productQty`+response.list[i].detail_order_id+`" name="productQty" value="`+response.list[i].cart_product_qty+`" onchange="editInvoice(`+response.list[i].detail_order_id+`,`+response.ProductData[i].gst_type+`,`+response.ProductData[i].GST+`)" onkeyup="editInvoice(`+response.list[i].detail_order_id+`,`+response.ProductData[i].gst_type+`,`+response.ProductData[i].GST+`)"></td>
                                                                        <td class="text-right">  <div class="input-group"><div class="input-group-prepend"><span class="input-group-text" id="inputGroupPrepend">₹</span></div><input type="number" onkeyup="editInvoice(`+response.list[i].detail_order_id+`,`+response.ProductData[i].gst_type+`,`+response.ProductData[i].GST+`)" onchange="editInvoice(`+response.list[i].detail_order_id+`,`+response.ProductData[i].gst_type+`,`+response.ProductData[i].GST+`)" class="form-control" id="productPrice`+response.list[i].detail_order_id+`" name="productPrice" value="`+response.list[i].ProductPrice+`"></div></td>
                                                                        <td class="text-right">₹<span id="price_data_`+response.list[i].detail_order_id+`">`+response.list[i].TotalProuctPrice+`</span><input type="hidden" id="product_price_`+response.list[i].detail_order_id+`" name="product_price" value="`+response.list[i].TotalProuctPrice+`"><input type="hidden" id="puchase_price" name="puchase_price" value="`+response.ProductData[i].purchase_rate+`"></td>
                                                                        <td class="text-right"><input type="hidden" id="P_GST`+response.list[i].detail_order_id+`" name="P_GST" value="`+response.list[i].ProuctGST+`"/>CGST(`+gst_percentage+`%) : ₹<span id="cgst_data_`+response.list[i].detail_order_id+`">`+gst+`</span><br>SGST(`+gst_percentage+`%): ₹<span id="sgst_data_`+response.list[i].detail_order_id+`">`+gst+`</span></td>
                                                                        <td class="text-right">₹<span id="total_data_`+response.list[i].detail_order_id+`">`+response.list[i].TotalProuctAmount+`</span><input type="hidden" id="totalP`+response.list[i].detail_order_id+`" value="`+response.list[i].TotalProuctAmount+`" name="totalP"></td>
                                                                        <td class="text-right"><i class="icon-trash" onclick="removeProduct('`+response.list[i].detail_order_id+`','`+response.list[i].order_id+`')"></i></td>
                                                                    </tr>`;
                                                        
                                                     }
                                                    
                                                    htmldata+=`           
                                                        <tr>
                                                          <td class="text-right" colspan="4"></td>
                                                            <td class="text-right"><b>Disocunt</b></td>
                                                            <td class="text-right"><div class="input-group"><div class="input-group-prepend"><span class="input-group-text" id="inputGroupPrepend">₹</span></div><input type="number" class="form-control col-md-12" id="discount" name="discount" onkeyup="deliveryCharge()" onchange="deliveryCharge()" value="`+response.OrderDetails.discount+`"></div></td>
                                                        </tr>
                                                        <tr>
                                                            <td class="text-right" colspan="4"></td>
                                                            <td class="text-right" ><b>Delivery Charges</b></td>
                                                            <td class="text-right"><div class="input-group"><div class="input-group-prepend"><span class="input-group-text" id="inputGroupPrepend">₹</span></div><input type="number" class="form-control col-md-12" id="dc" name="name" onkeyup="deliveryCharge()" onchange="deliveryCharge()" value="`+response.OrderDetails.TotalDeliveryCharges+`"></div></td>
                                                        </tr>
                                                         `+cod+`
                                                         
                                                        <tr>
                                                            <td class="text-right" colspan="4"></td>
                                                            <td class="text-right"><b>Total</b></td>
                                                            <td class="text-right">₹<input type="hidden" id="TTAmount" name="TTAmount" value="`+response.OrderDetails.TT_Amount+`"><span id="ta">`+response.OrderDetails.TT_Amount+`</span></td>
                                                        </tr>
                                                        <tr>
                                                          <td class="text-right" colspan="4"></td>
                                                            <td class="text-right"><b>Amount Paid</b></td>
                                                            <td class="text-right"><input type="hidden" id="order_id" name="order_id" value="`+response.OrderDetails.order_id+`">₹<span id="paid">`+response.OrderDetails.AmountPaid+`</span></td>
                                                        </tr>
                                                         <tr>
                                                          <td class="text-right" colspan="4"></td>
                                                            <td class="text-right"><b>Amount Pending</b></td>
                                                            <td class="text-right"><input type="hidden" class="form-control col-md-6" id="pending1" name="pending" value="`+response.OrderDetails.AmountPending+`">₹<span id="pending">`+response.OrderDetails.AmountPending+`</span></td>
                                                        </tr>
                                                        <tr>
                                                         <td class="" >awbNumber : `+response.OrderDetails.awbNumber+`<br>
                                                         Shipment ID : `+response.OrderDetails.shipmentID+`<br>
                                                           Shipment Name : `+response.OrderDetails.CouriorName+`<br>
                                                            Razorpay Id : `+response.OrderDetails.payment_id+`</td>
                                                           <td class="" colspan="5">Order Note : `+response.OrderDetails.orderNote+`</td>
                                                           
                                                        </tr>
                                                    </tbody>`;
                    $("#apd").html(htmldata);
                    // $('#editModal').modal('show');
			}
		});
	}
	
function removeProduct(order_detail_id,order_id){
    if(confirm('Are you Sure?..!')){
        $.ajax({
			type: 'POST',
			url: base_url + 'Orders/removeProducts',
			dataType: 'json',
			data: {order_detail_id:order_detail_id,order_id:order_id},
			beforeSend: function () {
                    $('#loader').html('<div class="lds-roller" style="position:absolute;left: 504px;"><div></div><div></div><div></div><div></div></div>');
            },
			success:function(response){
			 //   console.log(response);
			    if(response.status == '200'){
			     //   $("#invoicelist").empty();
                    // $('#editModal').modal('hide');
                    vieworder1(order_id);
			    }
			    else{
			        alert('Something Went Wrong');
			    }
			}
		});
    }
    
}

function editInvoice(id,gst_type,gst){
	    
	    
// 		var id = $(this).data('pid');
        $('#AccpetOrder1,#RejectOrder').hide();
		var qty = Number($('#productQty'+id).val());
		var price = Number($('#productPrice'+id).val());
		var total = price*qty;
        if(gst == '0'){
            total = total-gst;
            total_amount = total + gst;
        } 
        else{
            if(gst_type == 0){
                gst = Math.round(total - (total * (100/(100+gst))));   
                total = total-gst;
                total_amount = total + gst;
            }
            else{
                gst =  Math.round(total * (gst/100));
                total_amount = total+gst;
            }
        }
        
        // var ta = Number($('#ta').text());
        // var pending = Number($('#pending').text());
	    var dc = Number($('#dc').val());
	    var paid = Number($('#paid').text());
		var cod = Number($('#cod').text());
		var discount = Number($('#discount').val());
		
		$('#price_data_'+id).text(total);
		$('#product_price_'+id).val(total);
		$('#P_GST'+id).text(gst);
		$('#cgst_data_'+id).text(gst/2);
		$('#sgst_data_'+id).text(gst/2);
		$('#total_data_'+id).text(total_amount);
		$('#totalP'+id).val(total_amount);
		
		var arr = document.getElementsByName('totalP');
        var tot=0;
        for(var i=0;i<arr.length;i++){
            if(parseInt(arr[i].value))
            // console.log(parseInt(arr[i].value));

                tot += parseInt(arr[i].value);
        }
        var Final_amount = (tot - discount)+dc+cod;
		$('#ta').text(Final_amount);
		$('#TTAmount').val(Final_amount);
		$('#pending').text(Final_amount - paid);
		$('#pending1').val(Final_amount - paid);
// 		$('#dc').text(total_amount);
// 		$('#paid').text(total_amount);
// 		$('#cod').text(total_amount);
	   
	   
}

function deliveryCharge(){
	    $('#AccpetOrder1,#RejectOrder').hide();
	    var dc = Number($('#dc').val());
	    var paid = Number($('#paid').text());
		var cod = Number($('#cod').text());
		var discount = Number($('#discount').val());
	    var arr = document.getElementsByName('totalP');
        var tot=0;
        
        for(var i=0;i<arr.length;i++){
            if(parseInt(arr[i].value))
                tot += parseInt(arr[i].value);
        }
        var Final_amount = (tot+dc+cod) - discount ;
		$('#ta').text(Final_amount);
		$('#TTAmount').val(Final_amount);
		$('#discount').val(discount);
		$('#pending').text(Final_amount - paid);
		$('#pending1').val(Final_amount - paid);
	}

$(document).on('click', '#UpdateOrder', function(){
	   // if(confirm('Are you Sure?')){
	        $("#orderdata").empty();
            $("#orderdata2").empty();
            $("#orderdata3").empty();
	        var TotalProductPrice = document.getElementsByName('product_price');
	        var productQty = document.getElementsByName('productQty');
	        var PerproductPrice = document.getElementsByName('productPrice');
	        var TotalProductPriceGST = document.getElementsByName('P_GST');
	        var FinalAmount = document.getElementsByName('totalP');
	        var purchasePrice = document.getElementsByName('puchase_price');
	        var orderDetailId = document.getElementsByName('orderDetailId');
	        
	        var deliveryCharge = Number($('#dc').val());
	        var CODCharges = Number($('#cod1').val());
	        var A_pending = Number($('#pending1').val());
	        var discount = Number($('#discount').val());
	        var order_id = $('#order_id').val();
	        
            var marray = []; var arrayData = [];var order_detail_id = [];var Morder_detail_id = [];var TotalAmount = 0;var TotalGST = 0;var TTotalAmount = 0;var TotalProfit = 0;var FFinalAmount = 0;var TTProfit = 0;
            for(var i=0;i<TotalProductPrice.length;i++){
                TotalAmount += parseInt(TotalProductPrice[i].value);
                TotalGST += parseInt(TotalProductPriceGST[i].value);
                TTProfit += parseInt(FinalAmount[i].value) - (parseInt(purchasePrice[i].value)*parseInt(productQty[i].value));
                marray.push(arrayData = {
                    ProductPrice:parseInt(PerproductPrice[i].value),
                    cart_product_qty:parseInt(productQty[i].value),
                    TotalProuctPrice:parseInt(TotalProductPrice[i].value),
                    ProuctGST:parseInt(TotalProductPriceGST[i].value),
                    TotalProuctAmount:parseInt(FinalAmount[i].value),
                    purchase_rate:parseInt(purchasePrice[i].value),
                    total_purchase_amount:parseInt(purchasePrice[i].value)*parseInt(productQty[i].value),
                    TotalProfit:parseInt(FinalAmount[i].value) - (parseInt(purchasePrice[i].value)*parseInt(productQty[i].value)),
                    });
                Morder_detail_id.push({detail_order_id :parseInt(orderDetailId[i].value)});
            }
            FFinalAmount = (TotalAmount + TotalGST) - discount;
            TTotalAmount = FFinalAmount + deliveryCharge + CODCharges;
            var orderDetailsArray = {
                TotalAmount: TotalAmount,
                TotalGst:TotalGST,
                FinalAmount:FFinalAmount,
                TotalDeliveryCharges:deliveryCharge,
                COD_charges:CODCharges,
                TT_Amount:TTotalAmount,
                AmountPending:A_pending,
                Total_profit:TTProfit - discount,
                discount:discount,
                };
                
        $.ajax({
			type: 'POST',
			url: base_url + 'Orders/UpdateEditOrder',
			dataType: 'json',
			data: {OrderDetails:marray,OrderDetailsId:Morder_detail_id,orders:orderDetailsArray,ordersId:order_id},
			beforeSend: function () {
                    $('#loader').html('<div class="btn alert-warning">Please wait. Order update request proccessing!</div>');
            },
			success:function(response){
			 //   console.log(response);
			    if(response.status == '200'){
			         $('#editModal').modal('hide');
			         var htmldata = `<div class="icon-box" style="background: #17b3a3;"><i class="fas fa-check"></i></div><h4 class="modal-title w-100">Order Updated!</h4>`;
                     var htmldata2 = `<p class="text-center">Order ID :   `+order_id+`</p>`;
                     var htmldata3 = `<button class="btn btn-success btn-block" data-dismiss="modal">OK</button>`;
                        $("#orderdata").append(htmldata);
                        $("#orderdata2").append(htmldata2);
                        $("#orderdata3").append(htmldata3);
		                $('#AcceptOrder').modal('show');
		                show_orders_data();
			    }
			    else{
			        alert('Something Went Wrong');
			    }
			}
		});
        // console.log(marray);console.log(Morder_detail_id);
        // console.log(orderDetailsArray);console.log(order_id);
        
	   // }
	});

$(document).on('click', '#AccpetOrder1', function(){
	   // if (confirm("Are you Sure?")) {
    	 	 var inv = $(this).data('inv');
    	     
    	 $.ajax({
			type: 'GET',
			url: base_url + 'Orders/pick_address',
			dataType: 'json',
			success:function(response){
			 //   console.log(response);
			    $('#editModal').modal('hide');
			    var html = '<option value="">Select Address</option>';
			    for(var i=0; i < response.length; i++){
			        html += `<option value="`+response[i].id+`">`+response[i].address+`, `+response[i].city+`, `+response[i].state+`, `+response[i].pincode+`</option>`;
			    }
    	        $("#inv_1").val(inv);
    	        $("#addressid").append(html);
    	        $('#apimodel').modal('show');
			}
		});

	   // }
	});
	
$(document).on('click', '#AccpetOrderApi', function(){

		var inv = $('#inv_1').val();
		var boxes = $('#boxes').val();
		var weight = $('#Weight').val();
		var addressid = $('#addressid').val();
		if(boxes == '' || boxes == 0){
		    alert('Please add no of boxes..!');
		}
		else if(weight == '') {
		     alert('Please add Wight of boxes..!');
		}
		else if(addressid == ''){
		    alert('Please select address..!');
		}
		else{

		    $("#orderdata").empty();$("#orderdata2").empty();$("#orderdata3").empty();
	    	$.ajax({
			type: 'POST',
			url: base_url + 'Orders/AccpetOrder',
			dataType: 'json',
			data: {inv:inv,boxes:boxes,weight:weight,addressid:addressid},
			success:function(response){
			 //   console.log(response.status);
			    if(response.status == 'Success'){
			         $('#apimodel').modal('hide');
			         var htmldata = `<div class="icon-box" style="background: #17b3a3;"><i class="fas fa-check"></i></div><h4 class="modal-title w-100">Order Accepted!</h4>`;
                     var htmldata2 = `<p class="text-center">Order ID :   `+inv+`</p>`;
                     var htmldata3 = `<button class="btn btn-success btn-block" data-dismiss="modal">OK</button>`;
                        $("#orderdata").append(htmldata);
                        $("#orderdata2").append(htmldata2);
                         $("#orderdata3").append(htmldata3);
                          
		                $('#AcceptOrder').modal('show');
		                show_orders_data();
			    }
			    else{
			        alert('Something Went Wrong');
			    }
			}
		});
        }
	})
	
$(document).on('click', '#AccpetOrderOther', function(){

		var inv = $('#inv_1').val();
		var c_name = $('#c_name').val();
		var tracking_id = $('#tracking_id').val();

		$("#orderdata").empty();$("#orderdata2").empty();$("#orderdata3").empty();
		$.ajax({
			type: 'POST',
			url: base_url + 'Orders/AccpetOrderOther',
			dataType: 'json',
			data: {inv:inv,c_name:c_name,tracking_id:tracking_id},
			success:function(response){
			 //   console.log(response.status);
			    if(response.status == 'Success'){
			         $('#apimodel').modal('hide');
			         var htmldata = `<div class="icon-box" style="background: #17b3a3;"><i class="fas fa-check"></i></div><h4 class="modal-title w-100">Order Accepted!</h4>`;
                     var htmldata2 = `<p class="text-center">Order ID :   `+inv+`</p>`;
                     var htmldata3 = `<button class="btn btn-success btn-block" data-dismiss="modal">OK</button>`;
                        $("#orderdata").append(htmldata);
                        $("#orderdata2").append(htmldata2);
                         $("#orderdata3").append(htmldata3);
                          
		                $('#AcceptOrder').modal('show');
		                show_orders_data();
			    }
			    else{
			        alert('Something Went Wrong');
			    }
			}
		});
	})
	
$(document).on('click', '#RejectOrder', function(){
    	if (confirm("Are you Sure?")) {
       	    var inv = $(this).data('inv');
    		$("#orderdata").empty();$("#orderdata2").empty();$("#orderdata3").empty();
    		$.ajax({
    			type: 'POST',
    			url: base_url + 'Orders/RejectOrder',
    			dataType: 'json',
    			data: {inv: inv},
    			success:function(response){
    			 //   console.log(response.status);
    			    if(response.status == '200'){
    			         $('#editModal').modal('hide');
    			         var htmldata = `<div class="icon-box" style="background: rgb(246 78 96);"><i class="fas fa-check"></i></div><h4 class="modal-title w-100">Order Cancelled!</h4>`;
                         var htmldata2 = `<p class="text-center">Order ID :  `+inv+`</p>`;
                         var htmldata3 = `<button class="btn btn-danger btn-block" data-dismiss="modal">OK</button>`;
                            $("#orderdata").append(htmldata);
                            $("#orderdata2").append(htmldata2);
                             $("#orderdata3").append(htmldata3);
    		                $('#AcceptOrder').modal('show');
    		                show_orders_data();
    			    }
    			}
    		});
    	} 
	})
	
$(document).on('click', '#returnOrder1', function(){
    	if (confirm("Are you Sure?")) {
       	    var inv = $(this).data('inv');
    		$("#orderdata").empty();$("#orderdata2").empty();$("#orderdata3").empty();
    		$.ajax({
    			type: 'POST',
    			url: base_url + 'Orders/returnOrder1',
    			dataType: 'json',
    			data: {inv: inv},
    			success:function(response){
    			 //   console.log(response.status);
    			    if(response.status == 'Success'){
    			         $('#editModal').modal('hide');
    			         var htmldata = `<div class="icon-box" style="background: rgb(246 78 96);"><i class="fas fa-check"></i></div><h4 class="modal-title w-100">Order Return!</h4>`;
                         var htmldata2 = `<p class="text-center">Order ID :  `+inv+`</p>`;
                         var htmldata3 = `<button class="btn btn-danger btn-block" data-dismiss="modal">OK</button>`;
                            $("#orderdata").append(htmldata);
                            $("#orderdata2").append(htmldata2);
                             $("#orderdata3").append(htmldata3);
    		                $('#AcceptOrder').modal('show');
    		                show_orders_data();
    			    }
    			}
    		});
    	} 
	})

$(document).on('click', '#editAddress', function(){
    	var id = $(this).data('id');
    	$.ajax({
			type: 'POST',
			url: base_url + 'Orders/viewAddress',
			dataType: 'json',
			data: {id: id},
			success:function(response){
				// console.log(response);
				$('#address').val(response.address);
				$('#city').val(response.city);
				$('#state').val(response.state);
				$('#pincode1').val(response.pincode);
				$('#addid').val(response.id);
				$('#editModal').modal('show');
			}
		});
	});
	
$(document).on('click', '#deleteAddress', function(){
	    if(confirm('Are you Sure?')){
    	var id = $(this).data('id');
    	$.ajax({
			type: 'POST',
			url: base_url + 'Orders/deleteAddress',
			dataType: 'json',
			data: {id: id},
			success:function(response){
				alert('Address Delete Successfully');
				location.reload();
			}
		});
	    }
	});

$(document).on('click', '#DispatchOrder', function(){
	//	var id = $(this).data('id');
		var inv = $(this).data('inv');
		 $("#orderdata").empty();$("#orderdata2").empty();$("#orderdata3").empty();
		$.ajax({
			type: 'POST',
			url: base_url + 'Orders/DispatchOrder',
			dataType: 'json',
			data: {inv: inv},
			success:function(response){
			 //   console.log(response.status);
			    if(response.status == 'Success'){
			         $('#editModal').modal('hide');
			         var htmldata = `<div class="icon-box" style="background: rgb(246 78 96);"><i class="fas fa-check"></i></div><h4 class="modal-title w-100">Order Dispatched!</h4>`;
                     var htmldata2 = `<p class="text-center">Order ID :  `+inv+`</p>`;
                     var htmldata3 = `<button class="btn btn-danger btn-block" data-dismiss="modal">OK</button>`;
                        $("#orderdata").append(htmldata);
                        $("#orderdata2").append(htmldata2);
                        $("#orderdata3").append(htmldata3);
		                $('#AcceptOrder').modal('show');
		                show_orders_data();
			    }
			}
		});
	}) 
	
$(document).on('click', '#DeliveredOrder', function(){
	//	var id = $(this).data('id');
		var inv = $(this).data('inv');
		 $("#orderdata").empty();$("#orderdata2").empty();$("#orderdata3").empty();
		$.ajax({
			type: 'POST',
			url: base_url + 'Orders/DeliveredOrder',
			dataType: 'json',
			data: {inv: inv},
			success:function(response){
			    console.log(response);
			    if(response.status == 'Success'){
			         $('#editModal').modal('hide');
			         var htmldata = `<div class="icon-box" style="background: rgb(246 78 96);"><i class="fas fa-check"></i></div><h4 class="modal-title w-100">Order Delivered!</h4>`;
                     var htmldata2 = `<p class="text-center">Order ID :  `+inv+`</p>`;
                     var htmldata3 = `<button class="btn btn-danger btn-block" data-dismiss="modal">OK</button>`;
                        $("#orderdata").append(htmldata);
                        $("#orderdata2").append(htmldata2);
                        $("#orderdata3").append(htmldata3);
		                $('#AcceptOrder').modal('show');
		                show_orders_data();
			    }
			}
		});
	});
	
// $(document).on('click', '#vieworder', function(){
// 		var id = $(this).data('id');var flag='';var buttons ='';
// 		$("#invoicelist").empty();
// 		$.ajax({
// 			type: 'POST',
// 			url: base_url + 'Orders/vieworder',
// 			dataType: 'json',
// 			data: {id: id},
// 			beforeSend: function () {
//                     $('#loader'+id).html('<div class="badge badge-info">Please wait..!</div>');
//                 },
// 			success:function(response){
// 			 //   console.log(response);
// 			  $('#loader'+id).html('');
// 			    var invoice = `<a href="`+base_url+`invoice_data/view/`+response.OrderDetails.order_id+`" target="_blank" class="btn btn-success float-right">Preview</a>
// 			    <a href="`+base_url+`invoice_data/download/`+response.OrderDetails.order_id+`" target="_blank" class="btn btn-success float-right">Download</a>
// 			    <a href="https://wa.me/91`+response.UserData.mobile_no+`?text=Dear Customer, your order has been successfully placed. your order Number is: `+response.OrderDetails.order_id+` thank you for shopping with us SMITOX B2B.
//                 click here for invoice https://smitox.com/inv/`+response.OrderDetails.order_id+`" target="_blank" class="btn btn-success float-right">Share</a>
// 			    `;
// 			    if(response.OrderDetails.flag == 0){
//                         flag = `Pending`;
//                          buttons = `<button type="button" class="btn btn-info" id="AccpetOrder1"  data-inv="`+response.OrderDetails.order_id    +`">Accept Order</button>
//                                     <button type="button" class="btn btn-success" id="RejectOrder"  data-inv="`+response.OrderDetails.order_id    +`">Cancel Order</button>
//                                     <button type="button" class="btn btn-primary" id="UpdateOrder">Update Order</button>`;
//                     }
//                     else if(response.OrderDetails.flag == 1){
//                         if(response.OrderDetails.api_type == 1){
//                             buttons = `<button type="button" class="btn btn-info" id="DispatchOrder"  data-inv="`+response.OrderDetails.order_id    +`">Dispatch Order</button>`;
//                         }
//                         flag = `Accepted`;
//                     }
//                     else if(response.OrderDetails.flag == 2){
//                         flag = `Rejected`;
//                     }
//                     else if(response.OrderDetails.flag == 3){
//                         flag = `Cancelled`;
//                     }
//                     else if(response.OrderDetails.flag == 4){
//                         if(response.OrderDetails.api_type == 1){
//                             buttons = `<button type="button" class="btn btn-success" id="DeliveredOrder"  data-inv="`+response.OrderDetails.order_id    +`">Delivered Order</button>`;
//                         }
//                         flag = `Dispatch`;
//                     }
//                     else if(response.OrderDetails.flag == 5){
//                         flag = `Delivered`;
//                     }
               
//                             if(response.OrderDetails.payment_type == '1'){
//                               var payment = 'Online'; 
//                               var cod ='';
                                
//                             }else{
//                                 var payment = 'Cash on Delivery';
                               
//                                  var cod= `<tr>  <td class="text-right" colspan="4"></td><td class="text-right"><b>COD Charges</b></td>
//                                              <td class="text-right"><input type="hidden" id="cod1" name="cod" value="`+response.OrderDetails.COD_charges+`">₹<span id="cod">`+response.OrderDetails.COD_charges+`</span></td>
//                                               </tr>`;
//                             }
               
                                                
//                 var htmldata =`<div class="row">
//                                     <div class="col-12 col-md-12">
//                                         <div class="card border-0">
//                                             <div class="bg-info card-header d-flex justify-content-between align-items-center">                               
//                                                 <a href="#" class="float-left mr-3  py-1 px-2 rounded text-white back-to-invoice">
//                                                     <b>Date: </b> `+response.OrderDetails.created_at+`
//                                                 </a>
//                                                 <h4 class="card-title">Invoice# <span class="inv-no">`+response.OrderDetails.order_id+`</span></h4>                               
//                                             </div>
//                                                 <p class="text-right mt-1 px-5">Order Status :<b> `+flag+`</b></p>
//                                         </div>
//                                     </div>
//                                     <div class="col-12 col-md-12">
//                                         <div class="card border-0">
//                                             <div class="card-body table-responsive">
//                                                 <table class="table table-bordered">
//                                                     <thead>
//                                                         <tr>
//                                                             <td style="width: 50%;"><b>Sold by</b></td>
//                                                             <td style="width: 50%;"><b>Ship To</b></td>
//                                                         </tr>
//                                                     </thead>
//                                                     <tbody>
//                                                         <tr>
//                                                             <td><address>
//                                                                     <strong>`+response.SellerData.company+`</strong><br>
//                                                                     `+response.SellerData.address+`,`+response.SellerData.pincode+`</address>
//                                                                     <b>Telephone:</b> `+response.SellerData.mobile_no+`<br>
//                                                                     <b>PAN No</b> `+response.SellerData.pan_no+`<br>
//                                                                     <b>GST:</b> `+response.SellerData.gst_no+`
//                                                             </td>
//                                                             <td><b>Name:</b>`+response.OrderDetails.fullname+`<br>
//                                                             <address>`+response.OrderDetails.buildingname+`,`+response.OrderDetails.area+`
//                                                             `+response.OrderDetails.landmark+`,`+response.OrderDetails.sector+`
//                                                             `+response.OrderDetails.city+`,`+response.OrderDetails.state+`,`+response.OrderDetails.pincode+`
                                                            
//                                                             </address>
//                                                                 <b>Contact</b> `+response.OrderDetails.contact+`<br>
//                                                                 <b>Order ID:</b> `+response.OrderDetails.order_id+`<br>
//                                                                 <b>Payment Method:</b> `+payment+`<br>
//                                                           </td>
//                                                         </tr>
//                                                     </tbody>
//                                                 </table>
//                                             </div>
//                                         </div>
//                                     </div>
//                                     <div class="col-12 col-md-12">
//                                         <div class="card border-0">
//                                             <div class="card-body table-responsive">
//                                                 <table class="table table-bordered">
//                                                     <thead>
//                                                         <tr>
//                                                             <td><b>Product</b></td>
//                                                             <td class="text-right"><b>Quantity</b></td>
//                                                             <td class="text-right"><b>Unit Price</b></td>
//                                                             <td class="text-right"><b>Net Amount</b></td>
//                                                             <td class="text-right"><b>Tax Amount</b></td>
//                                                             <td class="text-right"><b>Total</b></td>
//                                                             <td class="text-right"></td>
//                                                         </tr>
//                                                     </thead>
//                                                     <tbody>`;
                                                    
//                                                       for(i=0;i<response.list.length;i++)
//                                                      {
//                                                             var gst = (response.list[i].ProuctGST/2);
//                                                             var gst_percentage = (response.list[i].GST_Percentage/2);
//                                                             var Productvariant='';
//                                                             if(response.list[i].variant_id != 0){Productvariant = `(`+response.ProductData[i].varient_name+`)`;}
//                                                             else {Productvariant = '';}
//                                                         htmldata+=` <tr>
//                                                                         <td><div class="row"><input type="hidden" name="orderDetailId" value="`+response.list[i].detail_order_id+`"/> <div class="col-md-3"><a href="`+base_url+`assets/images/product/`+response.ProductImg[i]+`" target="_blank"><img src="`+base_url+`assets/images/product/`+response.ProductImg[i]+`" style="width:50px;height:50px;margin-right: 12px;"></a></div><div class="col-md-9">`+response.list[i].ProductName+Productvariant+`<br>`+response.ProductData[i].sku_code+`</div></div></td>
//                                                                         <td class="text-right"><input type="number" class="form-control col-md-8" id="productQty`+response.list[i].detail_order_id+`" name="productQty" value="`+response.list[i].cart_product_qty+`" onchange="editInvoice(`+response.list[i].detail_order_id+`,`+response.ProductData[i].gst_type+`,`+response.ProductData[i].GST+`)" onkeyup="editInvoice(`+response.list[i].detail_order_id+`,`+response.ProductData[i].gst_type+`,`+response.ProductData[i].GST+`)"></td>
//                                                                         <td class="text-right">  <div class="input-group"><div class="input-group-prepend"><span class="input-group-text" id="inputGroupPrepend">₹</span></div><input type="number" onkeyup="editInvoice(`+response.list[i].detail_order_id+`,`+response.ProductData[i].gst_type+`,`+response.ProductData[i].GST+`)" onchange="editInvoice(`+response.list[i].detail_order_id+`,`+response.ProductData[i].gst_type+`,`+response.ProductData[i].GST+`)" class="form-control" id="productPrice`+response.list[i].detail_order_id+`" name="productPrice" value="`+response.list[i].ProductPrice+`"></div></td>
//                                                                         <td class="text-right">₹<span id="price_data_`+response.list[i].detail_order_id+`">`+response.list[i].TotalProuctPrice+`</span><input type="hidden" id="product_price_`+response.list[i].detail_order_id+`" name="product_price" value="`+response.list[i].TotalProuctPrice+`"><input type="hidden" id="puchase_price" name="puchase_price" value="`+response.ProductData[i].purchase_rate+`"></td>
//                                                                         <td class="text-right"><input type="hidden" id="P_GST`+response.list[i].detail_order_id+`" name="P_GST" value="`+response.list[i].ProuctGST+`"/>CGST(`+gst_percentage+`%) : ₹<span id="cgst_data_`+response.list[i].detail_order_id+`">`+gst+`</span><br>SGST(`+gst_percentage+`%): ₹<span id="sgst_data_`+response.list[i].detail_order_id+`">`+gst+`</span></td>
//                                                                         <td class="text-right">₹<span id="total_data_`+response.list[i].detail_order_id+`">`+response.list[i].TotalProuctAmount+`</span><input type="hidden" id="totalP`+response.list[i].detail_order_id+`" value="`+response.list[i].TotalProuctAmount+`" name="totalP"></td>
//                                                                         <td class="text-right"><i class="icon-trash" onclick="removeProduct(`+response.list[i].detail_order_id+`)"></i></td>
//                                                                     </tr>`;
                                                        
//                                                      }
                                                    
//                                                     htmldata+=`           
//                                                         <tr>
//                                                           <td class="text-right" colspan="4"></td>
//                                                             <td class="text-right"><b>Disocunt</b></td>
//                                                             <td class="text-right"><div class="input-group"><div class="input-group-prepend"><span class="input-group-text" id="inputGroupPrepend">₹</span></div><input type="number" class="form-control col-md-12" id="discount" name="discount" onkeyup="deliveryCharge()" onchange="deliveryCharge()" value="`+response.OrderDetails.discount+`"></div></td>
//                                                         </tr>
//                                                         <tr>
//                                                             <td class="text-right" colspan="4"></td>
//                                                             <td class="text-right" ><b>Delivery Charges</b></td>
//                                                             <td class="text-right"><div class="input-group"><div class="input-group-prepend"><span class="input-group-text" id="inputGroupPrepend">₹</span></div><input type="number" class="form-control col-md-12" id="dc" name="name" onkeyup="deliveryCharge()" onchange="deliveryCharge()" value="`+response.OrderDetails.TotalDeliveryCharges+`"></div></td>
//                                                         </tr>
//                                                          `+cod+`
                                                         
//                                                         <tr>
//                                                             <td class="text-right" colspan="4"></td>
//                                                             <td class="text-right"><b>Total</b></td>
//                                                             <td class="text-right">₹<input type="hidden" id="TTAmount" name="TTAmount" value="`+response.OrderDetails.TT_Amount+`"><span id="ta">`+response.OrderDetails.TT_Amount+`</span></td>
//                                                         </tr>
//                                                         <tr>
//                                                           <td class="text-right" colspan="4"></td>
//                                                             <td class="text-right"><b>Amount Paid</b></td>
//                                                             <td class="text-right"><input type="hidden" id="order_id" name="order_id" value="`+response.OrderDetails.order_id+`">₹<span id="paid">`+response.OrderDetails.AmountPaid+`</span></td>
//                                                         </tr>
//                                                          <tr>
//                                                           <td class="text-right" colspan="4"></td>
//                                                             <td class="text-right"><b>Amount Pending</b></td>
//                                                             <td class="text-right"><input type="hidden" class="form-control col-md-6" id="pending1" name="pending" value="`+response.OrderDetails.AmountPending+`">₹<span id="pending">`+response.OrderDetails.AmountPending+`</span></td>
//                                                         </tr>
//                                                         <tr>
//                                                          <td class="" >awbNumber : `+response.OrderDetails.awbNumber+`<br>
//                                                          Shipment ID : `+response.OrderDetails.shipmentID+`<br>
//                                                           Shipment Name : `+response.OrderDetails.CouriorName+`<br>
//                                                             Razorpay Id : `+response.OrderDetails.payment_id+`</td>
//                                                           <td class="" colspan="5">Order Note : `+response.OrderDetails.orderNote+`</td>
                                                           
//                                                         </tr>
//                                                     </tbody>
//                                                 </table>
//                                             </div>
//                                             <div class="modal-footer" style="display: inline-table !important;">
//                                             <span id="loader"></span>
//                                                 `+buttons+`
//                                                 <button type="button" class="btn btn-secondary float-right" data-dismiss="modal">Close</button>
//                                               `+invoice+`<span class="float-right btn text-white">Invoice</span>  
//                                             </div>
//                                         </div>
//                                     </div>
                                    
//                                 </div>`;
//                     $("#invoicelist").append(htmldata);
//                     $('#editModal').modal('show');
// 			}
// 		});
// 	});