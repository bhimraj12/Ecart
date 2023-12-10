<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Page Title</title>
    <!-- Include Font Awesome for WhatsApp and other icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous">
</head>
<body>

<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <!-- Main content -->
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h4>View Customers</h4>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="<?= base_url('admin/home') ?>">Home</a></li>
                        <li class="breadcrumb-item active">Customers</li>
                    </ol>
                </div>
            </div>
            <div class="modal fade " tabindex="-1" role="dialog" aria-hidden="true" id='customer-address-modal'>
                <!-- ... (Your existing modal code remains unchanged) -->
            </div>

        </div><!-- /.container-fluid -->
    </section>
    <section class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12 main-content">
                    <div class="card content-area p-4">
                        <div class="card-innr">
                            <div class="gaps-1-5x row d-flex adjust-items-center">
                            </div>
                            <table class='table-striped' data-toggle="table" data-url="<?= base_url('admin/customer/view_customer') ?>" data-side-pagination="server" data-click-to-select="true" data-pagination="true" data-id-field="id" data-page-list="[5, 10, 20, 50, 100, 200]" data-search="true" data-show-columns="true" data-show-refresh="true" data-trim-on-search="false" data-sort-name="id" data-sort-order="desc" data-mobile-responsive="true" data-toolbar="#toolbar" data-show-export="true" data-maintain-selected="true" data-export-types='["txt","excel"]' data-query-params="queryParams">
                                <thead>
                                    <tr>
                                        <th data-field="id" data-sortable="true">ID</th>
                                        <th data-field="name" data-sortable="false">Name</th>
                                        <th data-field="email" data-sortable="true">Email</th>
                                        <th data-field="mobile" data-sortable="true" data-formatter="whatsappFormatter">Mobile No</th>
                                        
                                        <th data-field="balance" data-sortable="true">Balance</th>
                                        <th data-field="street" data-sortable="true">Street</th>
                                        <th data-field="area" data-sortable="true">Area</th>
                                        <th data-field="city" data-sortable="true">City</th>
                                        <th data-field="date" data-sortable="true">Date</th>
                                        <th data-field="status" data-sortable="true">Status</th>
                                        <!-- New Order Type Column -->
                                        <th data-field="actions" data-sortable="true">Actions</th>
                                        <th data-field="cod_type" data-formatter="orderTypeFormatter">Order Type</th>
                                    </tr>
                                </thead>
                            </table>
                        </div><!-- .card-innr -->
                    </div><!-- .card -->
                </div>
            </div>
            <!-- /.row -->
        </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
</div>

<!-- ... (Your existing HTML code remains unchanged) -->

<script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha384-e4700E6kFqK52i98fiuy3cCecDpuxJ8zZEFe7B7RS9ZcbJxSb5S+8pUjjmeM+Tl" crossorigin="anonymous"></script>

<script>
function whatsappFormatter(value) {
    return `
        <div>
            <span>${value}</span>
            <a href="https://wa.me/${value}" target="_blank" title="Chat on WhatsApp">
                <i class="fab fa-whatsapp" style="color: #25d366;"></i>
            </a>
        </div>
    `;
}

function orderTypeFormatter(value, row, index) {
    return `
        <div class="update2" data-id="${row.id}">
            <input type="radio" name="cod_type${row.id}" value="0" ${value == '0' ? 'checked' : ''} onchange="updateOrderType(${row.id}, ${value}, 0)">COD<br>
            <input type="radio" name="cod_type${row.id}" value="1" ${value == '1' ? 'checked' : ''} onchange="updateOrderType(${row.id}, ${value}, 1)">Prepaid<br>
            <input type="radio" name="cod_type${row.id}" value="2" ${value == '2' ? 'checked' : ''} onchange="updateOrderType(${row.id}, ${value}, 2)">Advance<br>
        </div>
    `;
}

function updateOrderType(customerId, currentOrderType, newOrderType) {
    // Make an AJAX call to update the order type on the server
    $.ajax({
        url: 'updateOrderType', // Replace with your server endpoint
        type: 'POST',
        data: {
            id: customerId,
            cod_type: currentOrderType,
            new_cod_type: newOrderType
        },
        success: function (result) {
    console.log('Received result:', result);

    // Explicitly parse the JSON response
    result = JSON.parse(result);

    console.log(result.error);
    console.log(result.message);

    if (result && result.error === false) {
        iziToast.success({
            message: '<span style="text-transform:capitalize">' + result.message + '</span>',
        });
        $('.table').bootstrapTable('refresh');
    } else {
        iziToast.error({
            message: '<span style="text-transform:capitalize">' + (result.message || 'Unknown error') + '</span>',
        });
    }
},

     error: function(xhr, status, error) {
        console.error("Error updating order type:", error);
    }
    });
}
</script>

<!-- ... (Your existing HTML code remains unchanged) -->


</body>
</html>
