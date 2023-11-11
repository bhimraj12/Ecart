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
                            <p class="card-text h6 ">Advance Percentage (COD) Per Order : &nbsp;&nbsp;&nbsp;<?php echo $advance['percentage']; ?> %</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>
