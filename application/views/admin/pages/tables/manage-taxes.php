<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <!-- Main content -->
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h4>Manage Taxes</h4>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="<?= base_url('admin/home') ?>">Home</a></li>
                        <li class="breadcrumb-item active">Tax</li>
                    </ol>
                </div>
            </div>
        </div><!-- /.container-fluid -->
    </section>
    <section class="content-cod">
    <main>
    <div class="container-fluid site-width">
        <div class="col-6">
            <div class="col-12  align-self-center">
                <div class="sub-header py-3 align-self-center d-sm-flex w-100 rounded">
                    <div class="w-sm-100 mr-auto"><h5 class="mb-0">Percentage For Advance COD</h5></div>
                </div>
            </div>
            <div class="card">
                <div class="card-body">
                    <div class="row">
                        <div class="col-12">
                            <?= form_open_multipart('update_advance'); ?>
                            <div class="input-group">
                                <label for="username1" class="col-8"><input type="number" class="form-control " name="percentage" placeholder="Advance Percentage"  required="required" step="any"></label> 
                                <label for="username1" class="col-4"><button type="submit" class="btn btn-primary col-12 mb-3">Add Advance</button></label> 
                            </div>
                            <?= form_close(); ?>
                        </div>
                        <div class="col-12 text-center">
                            <p class="card-text h6 ">Advance Percentage (COD) Per Order : 40 %</p>

                            <!-- <?php echo $advance['percentage']; ?> %</p> -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>
    
    </section>


    <section class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="modal fade edit-modal-lg" tabindex="-1" role="dialog" aria-hidden="true">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title">Edit Taxes</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body p-0">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-12 main-content">
                    <div class="card content-area p-4">
                        <div class="card-header border-0">
                            <div class="card-tools">
                                <a href="<?= base_url() . 'admin/taxes/' ?>" class="btn btn-block btn-outline-primary btn-sm">Add Tax </a>
                            </div>
                        </div>
                        <div class="card-innr">
                            <div class="gaps-1-5x"></div>
                            <table class='table-striped' data-toggle="table" data-url="<?= base_url('admin/taxes/get_tax_list') ?>" data-click-to-select="true" data-side-pagination="server" data-pagination="true" data-page-list="[5, 10, 20, 50, 100, 200]" data-search="true" data-show-columns="true" data-show-refresh="true" data-trim-on-search="false" data-sort-name="id" data-sort-order="asc" data-mobile-responsive="true" data-toolbar="" data-show-export="true" data-maintain-selected="true" data-query-params="queryParams">
                                <thead>
                                    <tr>
                                        <th data-field="id" data-sortable="true" data-align='center'>ID</th>
                                        <th data-field="title" data-sortable="false" data-align='center'>Title</th>
                                        <th data-field="percentage" data-sortable="true" data-align='center'>Percentage</th>
                                        <th data-field="operate" data-sortable="false" data-align='center'>Action</th>
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
