<?php
defined('BASEPATH') or die('No direct script access allowed!');

class Catatan extends CI_Controller
{
	public function __construct()
	{
		parent::__construct();
		is_login();
		$this->load->model('Catatan_model', 'catatan');
	}

	public function index()
	{
		$data['catatan'] = $this->catatan->get_all();
		return $this->template->load('template', 'catatan', $data);
	}

	public function store()
	{
		$nama_catatan = $this->input->post('nama_catatan');
		$result = $this->catatan->insert_data(['nama_catatan' => $nama_catatan]);
		if ($result) {
			$response = [
				'status' => 'success',
				'message' => 'Catatan berhasil ditambahkan!',
				'data' => $result
			];
		} else {
			$response = [
				'status' => 'error',
				'message' => 'Catatan gagal ditambahkan!'
			];
		}

		return $this->response_json($response);
	}

	public function update()
	{
		$id_catatan = $this->input->post('id_catatan');
		$nama_catatan = $this->input->post('nama_catatan');

		$result = $this->catatan->update_data($id_catatan, ['nama_catatan' => $nama_catatan]);
		if ($result) {
			$response = [
				'status' => 'success',
				'message' => 'Catatan berhasil diupdate!',
				'data' => $result
			];
		} else {
			$response = [
				'status' => 'error',
				'message' => 'Catatan gagal diupdate!'
			];
		}

		return $this->response_json($response);
	}

	public function destroy()
	{
		$id_catatan = $this->uri->segment(3);
		$result = $this->catatan->delete_data($id_catatan);
		if ($result) {
			$response = [
				'status' => 'success',
				'message' => 'Catatan telah dihapus!'
			];
		} else {
			$response = [
				'status' => 'error',
				'message' => 'Catatan gagal dihapus!'
			];
		}

		return $this->response_json($response);
	}

	private function response_json($response)
	{
		header('Content-Type: application/json');
		echo json_encode($response);
	}
}



/* End of File: d:\Ampps\www\project\absen-pegawai\application\controllers\Catatan.php */