<div class="login-box w-auto">
    <!-- Content Header (Page header) -->
    <!-- Main content -->
    <section class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="card card-info">
                        <!-- form start -->
                        <form class="form-horizontal form-submit-event" action="<?= base_url('delivery_boy/login/create_delivery_boy'); ?>" method="POST" id="add_product_form">
                            <?php if (isset($user_data) && !empty($user_data)) { ?>
                                <input type="hidden" name="user_id" value="<?= $user_data['to_be_seller_id'] ?>">
                                <input type='hidden' name='user_name' value='<?= $user_data['to_be_seller_name'] ?>'>
                                <input type='hidden' name='user_mobile' value='<?= $user_data['to_be_seller_mobile'] ?>'>
                            <?php
                            } ?>
                            <div class="card-body">
                                <div class="login-logo">
                                    <a href="<?= base_url() . 'delivery_boy/login' ?>"><img src="<?= base_url() . $logo ?>"></a>
                                </div>
                                <h4 class="mb-4">Delivery Boy Registration</h4>
                                <h5>Personal Details</h5>
                                <hr>
                                <div class="form-group row">
                                    <label for="name" class="col-sm-2 col-form-label">Name <span class='text-danger text-sm'>*</span></label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="name" placeholder="Delivery Boy Name" name="name">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="mobile" class="col-sm-2 col-form-label">Mobile <span class='text-danger text-sm'>*</span></label>
                                    <div class="col-sm-10">
                                        <input type="number" class="form-control" id="mobile" placeholder="Enter Mobile" name="mobile">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="email" class="col-sm-2 col-form-label">Email <span class='text-danger text-sm'>*</span></label>
                                    <div class="col-sm-10">
                                        <input type="email" class="form-control" id="email" placeholder="Enter Email" name="email">
                                    </div>
                                </div>

                                <?php
                                //if (!isset($fetched_data[0]['id'])) {
                                ?>
                                    <div class="form-group row ">
                                        <label for="password" class="col-sm-2 col-form-label">Password <span class='text-danger text-sm'>*</span></label>
                                        <div class="col-sm-10">
                                            <input type="password" class="form-control" id="password" placeholder="Enter Password" name="password">
                                        </div>
                                    </div>
                                    <div class="form-group row ">
                                        <label for="confirm_password" class="col-sm-2 col-form-label">Confirm Password <span class='text-danger text-sm'>*</span></label>
                                        <div class="col-sm-10">
                                            <input type="password" class="form-control" id="confirm_password" placeholder="Enter Confirm Password" name="confirm_password">
                                        </div>
                                    </div>
                                <?php
                                //}
                                ?>

                                <div class="form-group row">
                                    <label for="address" class="col-sm-2 col-form-label">Address <span class='text-danger text-sm'>*</span></label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="address" placeholder="Enter Address" name="address">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="zipcodes" class="col-sm-2 col-form-label">Serviceable Zipcodes <span class='text-danger text-sm'>*</span></label>
                                    <div class="col-sm-10">
                                        <select name="serviceable_zipcodes[]" class="form-control deliveryboy_search_zipcode w-100" multiple onload="multiselect()" id="deliverable_zipcodes">
                                            <?php
                                            // if (isset($zipcodes) && !empty($zipcodes)) {
                                                $zipcodes_name =  fetch_details('zipcodes', "",  'zipcode,id', "", "", "", "", "id");
                                                foreach ($zipcodes_name as $row) {
                                                // print_r($row);
                                                // die;
                                            ?>
                                                    <option value=<?= $row['id'] ?> <?= (!empty($zipcodes) && in_array($row['id'], $zipcodes)) ? 'selected' : ''; ?>> <?= $row['zipcode'] ?></option>
                                            <?php }
                                            // }
                                            ?>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="driving_license" class="col-sm-2 col-form-label">Driving License <span class='text-danger text-sm'>*</span></label>
                                    <div class="col-sm-10">
                                        <?php if (isset($fetched_data[0]['driving_license']) && !empty($fetched_data[0]['driving_license'])) { ?>
                                            <span class="text-danger">*Leave blank if there is no change</span>
                                        <?php } else { ?>
                                            <span class="text-danger">*Add Driving License's front and back image(select multiple)</span>
                                        <?php } ?>
                                        <input type="file" class="form-control" name="driving_license[]" id="driving_license" accept="image/*" multiple />
                                    </div>
                                </div>
                                
                                <!-- <div class="form-group">
                                    <button type="reset" class="btn btn-warning">Reset</button>
                                    <button type="submit" class="btn btn-success" id="submit_btn"><?//= (isset($fetched_data[0]['id'])) ? 'Update Delivery Boy' : 'Add Delivery Boy' ?></button>
                                </div> -->
                                

                                <div class="form-group">
                                    <button type="reset" class="btn btn-warning">Reset</button>
                                    <button type="submit" class="btn btn-success" id="submit_btn">Submit</button>
                                </div>
                            </div>
                            <div class="d-flex justify-content-center">
                                <div class="form-group" id="error_box">
                                    <div class="card text-white d-none mb-3">
                                    </div>
                                </div>
                            </div>
                            <!-- /.card-footer -->
                        </form>
                    </div>
                    <!--/.card-->
                </div>
                <!--/.col-md-12-->
            </div>
            <!-- /.row -->
        </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
</div>