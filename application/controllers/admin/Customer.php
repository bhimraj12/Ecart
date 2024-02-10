<?php
defined('BASEPATH') or exit('No direct script access allowed');


class Customer extends CI_Controller
{

    public function __construct()
    {
        parent::__construct();
        $this->load->database();
        $this->load->helper(['url', 'language', 'timezone_helper']);
        $this->load->model(['Customer_model', 'address_model']);

        if (!has_permissions('read', 'customers')) {
            $this->session->set_flashdata('authorize_flag', PERMISSION_ERROR_MSG);
            redirect('admin/home', 'refresh');
        }
    }

    public function index()
    {
        if ($this->ion_auth->logged_in() && $this->ion_auth->is_admin()) {
            $this->data['main_page'] = TABLES . 'manage-customer';
            $settings = get_settings('system_settings', true);
            $this->data['title'] = 'View Customer | ' . $settings['app_name'];
            $this->data['meta_description'] = ' View Customer  | ' . $settings['app_name'];
            $this->data['about_us'] = get_settings('about_us');
            $this->load->view('admin/template', $this->data);
        } else {
            redirect('admin/login', 'refresh');
        }
    }

    public function view_customer()
    {
        if ($this->ion_auth->logged_in() && $this->ion_auth->is_admin()) {
            return $this->Customer_model->get_customer_list();
        } else {
            redirect('admin/login', 'refresh');
        }
    }

    public function manage_customer_wallet()
    {
        if ($this->ion_auth->logged_in() && $this->ion_auth->is_admin()) {

            $this->data['main_page'] = TABLES . 'manage-customer-wallet';
            $settings = get_settings('system_settings', true);
            $this->data['title'] = 'View Customer | ' . $settings['app_name'];
            $this->data['meta_description'] = ' View Customer  | ' . $settings['app_name'];
            $this->data['about_us'] = get_settings('about_us');
            $this->load->view('admin/template', $this->data);
        } else {
            redirect('admin/login', 'refresh');
        }
    }

    public function update_customer_wallet()
    {

        if (print_msg(!has_permissions('update', 'customers'), PERMISSION_ERROR_MSG, 'customers', false)) {
            return false;
        }

        if ($this->ion_auth->logged_in() && $this->ion_auth->is_admin()) {
            $this->form_validation->set_rules('user_id', 'User ID', 'trim|required|xss_clean');
            $this->form_validation->set_rules('type', 'Type', 'trim|required|xss_clean');
            $this->form_validation->set_rules('amount', 'Amount', 'trim|required|xss_clean|numeric');
            $this->form_validation->set_rules('message', 'Message', 'trim|required|xss_clean');

            if (!$this->form_validation->run()) {
                $this->response['error'] = true;
                $this->response['csrfName'] = $this->security->get_csrf_token_name();
                $this->response['csrfHash'] = $this->security->get_csrf_hash();
                $this->response['message'] = validation_errors();
                print_r(json_encode($this->response));
            } else {
                if ($_POST['type'] == 'debit' || $_POST['type'] == 'credit') {
                    $message = (isset($_POST['message']) && !empty($_POST['message'])) ? $this->input->post('message', true) : "Balance " . $_POST['type'] . "ed.";
                    $response = update_wallet_balance($_POST['type'], $_POST['user_id'], $_POST['amount'], $message);
                    $response['csrfName'] = $this->security->get_csrf_token_name();
                    $response['csrfHash'] = $this->security->get_csrf_hash();
                    print_r(json_encode($response));
                }
            }
        } else {
            redirect('admin/login', 'refresh');
        }
    }

    public function search_user()
    {
        // Fetch users
        $this->db->select('*');
        $this->db->where("username like '%" . $_GET['search'] . "%'");
        $fetched_records = $this->db->get('users');
        $users = $fetched_records->result_array();
        // Initialize Array with fetched data
        $data = array();
        foreach ($users as $user) {
            $data[] = array("id" => $user['id'], "text" => $user['username']);
        }
        echo json_encode($data);
    }
    public function addresses()
    {
        if ($this->ion_auth->logged_in() && $this->ion_auth->is_admin()) {
            $this->data['main_page'] = TABLES . 'manage-address';
            $settings = get_settings('system_settings', true);
            $this->data['title'] = 'View Address | ' . $settings['app_name'];
            if (isset($_GET['view_id'])) {
                $this->data['view_id'] = (isset($_GET['view_id'])) ? $_GET['view_id'] : null;
            }
            $this->data['meta_description'] = ' View Address  | ' . $settings['app_name'];
            $this->load->view('admin/template', $this->data);
        } else {
            redirect('admin/login', 'refresh');
        }
    }

    public function get_address()
    {
        if ($this->ion_auth->logged_in() && $this->ion_auth->is_admin()) {

            $this->address_model->get_address_list();
        } else {
            redirect('admin/login', 'refresh');
        }
    }

    public function updateOrderType()
    {
        if ($this->ion_auth->logged_in() && $this->ion_auth->is_admin()) {
            $cod_type = $this->input->post('new_cod_type');
                    $id = $this->input->post('id');
                    $updateResult = $this->Customer_model->updateOrderType($cod_type, $id);
            
                    if ($updateResult) {
                        $response['error'] = false;
                        $response['message'] = 'Order type successfully updated.';
                    } else {
                        $response['error'] = true;
                        $response['message'] = 'Failed to update order type.';
                    }
            
                    // Return the JSON response
                    echo json_encode($response);
        } else {
            redirect('admin/login', 'refresh');
        }
    }

    public function get_all_users_carts()
    {
        $offset = 0;
        $limit = 10;
        $sort = 'cart.date_created';
        $order = 'DESC';
    
        if (isset($_GET['offset'])) {
            $offset = $_GET['offset'];
        }
        if (isset($_GET['limit'])) {
            $limit = $_GET['limit'];
        }
        if (isset($_GET['sort'])) {
            if ($_GET['sort'] == 'id') {
                $sort = 'cart.id';
            } elseif ($_GET['sort'] == 'name') {
                $sort = 'products.name';
            }
            elseif ($_GET['sort'] == 'username') {
                $sort = 'users.username';
            }
            elseif ($_GET['sort'] == 'email') {
                $sort = 'users.email';
            }
            elseif ($_GET['sort'] == 'qty') {
                $sort = 'cart.qty';
            }
            elseif ($_GET['sort'] == 'date_created') {
                $sort = 'cart.date_created';
            }
            elseif ($_GET['sort'] == 'mobile') {
                $sort = 'users.mobile';
            }
            else {
                $sort = $_GET['sort'];
            }
        }
        if (isset($_GET['order'])) {
            $order = $_GET['order'];
        }
        if (isset($_GET['search'])) {
            $search = $_GET['search'];
        }
    
        if ($this->ion_auth->logged_in() && $this->ion_auth->is_admin()) {
            $this->db->select('cart.*, users.username,users.email,users.mobile, product_variants.product_id, products.category_id,products.name');
            $this->db->from('cart');
            $this->db->join('users', 'users.id = cart.user_id');
            $this->db->join('product_variants', 'product_variants.id = cart.product_variant_id');
            $this->db->join('products', 'products.id = product_variants.product_id');
            if (isset($search)) {
                $this->db->group_start();
                $this->db->like('users.username', $search);
                $this->db->or_like('products.name', $search);
                $this->db->or_like('users.email', $search);
                $this->db->or_like('users.mobile', $search);
                $this->db->or_like('cart.qty', $search);
                $this->db->or_like('cart.date_created', $search);
                $this->db->group_end();
            }
            
            $this->db->order_by($sort, $order);
            $this->db->limit($limit, $offset);
            $query = $this->db->get();
            $result = $query->result();
    
            if (empty($result)) {
                $this->response['error'] = true;
                $this->response['message'] = 'Cart Is Empty !';
                $this->response['data'] = array();
            } else {
                $this->response['error'] = false;
                $this->response['message'] = 'Data Retrieved Successfully !';
                $this->response['data'] = $result;
            }
    
            echo json_encode($this->response);
        } else {
            redirect('admin/login', 'refresh');
        }
    }
    

}
