<?php
defined('BASEPATH') or exit('No direct script access allowed');
class Cod_Advance_Payment_model extends CI_Model
{
    public function __construct()
    {
        $this->load->database();
        $this->load->library(['ion_auth', 'form_validation']);
        $this->load->helper(['url', 'language', 'function_helper']);
    }


    public function get_cod_advance()
    {
        return $this->db->get_where('cod_advance_payment', ['id' => 1])->row_array();
    }


    public function update_cod_advance($request)
    {
        $cod_advance_data = [
            'percent' => $request->percent,
        ];

        $this->db->set($cod_advance_data)->where('id', $request->id)->update('cod_advance_payment');
    }
}
