<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Page Title</title>
    <!-- Include Font Awesome for WhatsApp icon -->
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
                    <h4>Manage Seller</h4>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="<?= base_url('admin/home') ?>">Home</a></li>
                        <li class="breadcrumb-item active">Seller</li>
                    </ol>
                </div>
            </div>
        </div><!-- /.container-fluid -->
    </section>
    <section class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12 main-content">
                    <div class="card content-area p-4">
                        <div class="card-header border-0">
                            <div class="card-tools row">
                                <a href="<?= base_url() . 'admin/sellers/manage-seller' ?>" class="btn btn-block btn-outline-primary btn-sm">Add Seller</a>
                            </div>
                        </div>
                        <div class="card-innr">
                            <div class="row col-md-6">
                                <div class="row col-md-4 pull-right">
                                    <a href="#" class="btn btn-success update-seller-commission" title="If you found seller commission not crediting using cron job you can update seller commission from here!">Update Seller Commission</a>
                                </div>
                            </div>
                            <div class="gaps-1-5x"></div>
                            <table class='table-striped' id='seller_table' data-toggle="table" data-url="<?= base_url('admin/sellers/view_sellers') ?>" data-click-to-select="true" data-side-pagination="server" data-pagination="true" data-page-list="[5, 10, 20, 50, 100, 200]" data-search="true" data-show-columns="true" data-show-refresh="true" data-trim-on-search="false" data-sort-name="sd.id" data-sort-order="DESC" data-mobile-responsive="true" data-toolbar="" data-show-export="true" data-maintain-selected="true" data-export-types='["txt","excel"]' data-query-params="queryParams">
                                <thead>
                                    <tr>
                                        <th data-field="id" data-sortable="true">ID</th>
                                        <th data-field="name" data-sortable="false">Name</th>
                                        <th data-field="email" data-sortable="false">Email</th>
                                        <th data-field="mobile" data-sortable="true" data-formatter="whatsappFormatter">Mobile No</th>
                                        <!-- ... (Rest of your table headers) -->
                                        <th data-field="operate">Actions</th>
                                        <!-- <th data-field="order_type" data-formatter="orderTypeFormatter">Order Type</th> -->
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
            <input type="radio" name="order_type_${row.id}" value="0" ${value == '0' ? 'checked' : ''} onclick="updateOrderType(${row.id}, 0)">COD<br>
            <input type="radio" name="order_type_${row.id}" value="1" ${value == '1' ? 'checked' : ''} onclick="updateOrderType(${row.id}, 1)">Prepaid<br>
            <input type="radio" name="order_type_${row.id}" value="2" ${value == '2' ? 'checked' : ''} onclick="updateOrderType(${row.id}, 2)">Advance<br>
        </div>
    `;
}

// Add a new function to handle the POST request
function updateOrderType(userId, orderType) {
    $.ajax({
        type: "POST",
        context: "application/json",
        data: { 'order_type': orderType, 'id': userId },
        url: base_url + "updateOrderType",
        success: function (data) {
            // Handle success, if needed
            // For example, you can update the UI or display a message
        },
        error: function (error) {
            // Handle error, if needed
        }
    });
}

    // ... (Your existing JavaScript code remains unchanged)
</script>

</body>
</html>
