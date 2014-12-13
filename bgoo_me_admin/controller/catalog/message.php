<?php
class ControllerCatalogMessage extends Controller {
	private $error = array();

	public function index() {
		$this->language->load('catalog/message');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('catalog/message');

		$this->getList();
	}

	public function insert() {
		$this->language->load('catalog/message');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('catalog/message');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_catalog_message->addmessage($this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			$this->redirect($this->url->link('catalog/message', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getForm();
	}

	public function review(){
		$this->language->load('catalog/message');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('catalog/message');
		if (isset($this->request->get['id'])) {
			$id = $this->request->get['id'];
			$this->model_catalog_message->reviewMessage($id);
		}
		$this->redirect($this->url->link('catalog/message', 'token=' . $this->session->data['token'] . $url, 'SSL'));
	}

	public function reply(){
		$this->language->load('catalog/message');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('catalog/message');

		if ($this->request->server['REQUEST_METHOD'] == 'POST'){

			$this->model_catalog_message->replymessage($this->request->get['id'], $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->redirect($this->url->link('catalog/message', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}
		$this->getForm();
	}

	public function update() {

		$this->language->load('catalog/message');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('catalog/message');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_catalog_message->editmessage($this->request->get['id'], $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			$this->redirect($this->url->link('catalog/message', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getForm();

	}

	public function delete() {
		$this->language->load('catalog/message');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('catalog/message');

		if (isset($this->request->post['selected']) && $this->validateDelete()) {
			foreach ($this->request->post['selected'] as $message_id) {
				$this->model_catalog_message->deletemessage($message_id);
			}

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			$this->redirect($this->url->link('catalog/message', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getList();
	}

	protected function getList() {
		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'title';
		}

		if (isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = 'ASC';
		}

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		$url = '';

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$this->data['breadcrumbs'] = array();

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => false
		);

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('catalog/message', 'token=' . $this->session->data['token'] . $url, 'SSL'),
			'separator' => ' :: '
		);

		$this->data['insert'] = $this->url->link('catalog/message/insert', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$this->data['delete'] = $this->url->link('catalog/message/delete', 'token=' . $this->session->data['token'] . $url, 'SSL');

		$this->data['messages'] = array();

		$data = array(
			'sort'  => $sort,
			'order' => $order,
			'start' => ($page - 1) * $this->config->get('config_admin_limit'),
			'limit' => $this->config->get('config_admin_limit')
		);

		$message_total = $this->model_catalog_message->getTotalMessages();

		$results = $this->model_catalog_message->getMessages($data);

		foreach ($results as $result) {
			$action = array();

			$action[] = array(
				'text' => $this->language->get('text_edit'),
				'reply' => $this->language->get('text_reply'),
				'review' => $this->language->get('text_review'),
				'reply_href' => $this->url->link('catalog/message/reply', 'token=' . $this->session->data['token'] . '&id=' . $result['id'] . $url, 'SSL'),
				'review_href' => $this->url->link('catalog/message/review', 'token=' . $this->session->data['token'] . '&id=' . $result['id'] . $url, 'SSL'),
				'href' => $this->url->link('catalog/message/update', 'token=' . $this->session->data['token'] . '&id=' . $result['id'] . $url, 'SSL')
			);

			$this->data['messages'][] = array(
				'id' 			 => $result['id'],
				'content'          => $result['content'],
				'review'          => $result['review'],
				'sort_order'     => $result['sort_order'],
				'selected'       => isset($this->request->post['selected']) && in_array($result['message_id'], $this->request->post['selected']),
				'action'         => $action
			);
		}

		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['text_no_results'] = $this->language->get('text_no_results');

		$this->data['column_title'] = $this->language->get('column_content');
		$this->data['column_sort_order'] = $this->language->get('column_sort_order');
		$this->data['column_action'] = $this->language->get('column_action');

		$this->data['button_insert'] = $this->language->get('button_insert');
		$this->data['button_delete'] = $this->language->get('button_delete');

		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}

		if (isset($this->session->data['success'])) {
			$this->data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$this->data['success'] = '';
		}

		$url = '';

		if ($order == 'ASC') {
			$url .= '&order=DESC';
		} else {
			$url .= '&order=ASC';
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$this->data['sort_title'] = $this->url->link('catalog/message', 'token=' . $this->session->data['token'] . '&sort=title' . $url, 'SSL');
		$this->data['sort_sort_order'] = $this->url->link('catalog/message', 'token=' . $this->session->data['token'] . '&sort=sort_order' . $url, 'SSL');

		$url = '';

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		$pagination = new Pagination();
		$pagination->total = $message_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_admin_limit');
		$pagination->text = $this->language->get('text_pagination');
		$pagination->url = $this->url->link('catalog/message', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL');

		$this->data['pagination'] = $pagination->render();

		$this->data['sort'] = $sort;
		$this->data['order'] = $order;

		$this->template = 'catalog/message_list.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);

		$this->response->setOutput($this->render());
	}

	protected function getForm() {

		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['text_default'] = $this->language->get('text_default');
		$this->data['text_enabled'] = $this->language->get('text_enabled');
		$this->data['text_disabled'] = $this->language->get('text_disabled');

		$this->data['entry_title'] = $this->language->get('entry_title');
		$this->data['entry_content'] = $this->language->get('entry_content');
		$this->data['entry_reply'] = $this->language->get('entry_reply');
		$this->data['entry_description'] = $this->language->get('entry_description');
		$this->data['entry_store'] = $this->language->get('entry_store');
		$this->data['entry_keyword'] = $this->language->get('entry_keyword');
		$this->data['entry_bottom'] = $this->language->get('entry_bottom');
		$this->data['entry_sort_order'] = $this->language->get('entry_sort_order');
		$this->data['entry_status'] = $this->language->get('entry_status');
		$this->data['entry_layout'] = $this->language->get('entry_layout');

		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_cancel'] = $this->language->get('button_cancel');

		$this->data['tab_general'] = $this->language->get('tab_general');
		$this->data['tab_data'] = $this->language->get('tab_data');
		$this->data['tab_design'] = $this->language->get('tab_design');

		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}

		if (isset($this->error['title'])) {
			$this->data['error_title'] = $this->error['title'];
		} else {
			$this->data['error_title'] = array();
		}

		if (isset($this->error['description'])) {
			$this->data['error_description'] = $this->error['description'];
		} else {
			$this->data['error_description'] = array();
		}

		$url = '';

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$this->data['breadcrumbs'] = array();

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => false
		);

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('catalog/message', 'token=' . $this->session->data['token'] . $url, 'SSL'),
			'separator' => ' :: '
		);

		if (!isset($this->request->get['id'])) {
			$this->data['action'] = $this->url->link('catalog/message/reply', 'token=' . $this->session->data['token'] . $url, 'SSL');
		} else {
			$this->data['action'] = $this->url->link('catalog/message/reply', 'token=' . $this->session->data['token'] . '&id=' . $this->request->get['id'] . $url, 'SSL');
		}

		$this->data['cancel'] = $this->url->link('catalog/message', 'token=' . $this->session->data['token'] . $url, 'SSL');

		if (isset($this->request->get['message_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$message_info = $this->model_catalog_message->getmessage($this->request->get['message_id']);
		}

		$this->data['token'] = $this->session->data['token'];

		$this->load->model('localisation/language');

		$this->data['languages'] = $this->model_localisation_language->getLanguages();

		if (isset($this->request->post['message'])) {
			$this->data['message'] = $this->request->post['message_description'];
		} elseif (isset($this->request->get['id'])) {
			$this->data['message'] = $this->model_catalog_message->getMessage($this->request->get['id']);
		} else {
			$this->data['message'] = array();
		}

		$this->load->model('setting/store');

		$this->data['stores'] = $this->model_setting_store->getStores();

		if (isset($this->request->post['message_store'])) {
			$this->data['message_store'] = $this->request->post['message_store'];
		} elseif (isset($this->request->get['message_id'])) {
			$this->data['message_store'] = $this->model_catalog_message->getmessageStores($this->request->get['message_id']);
		} else {
			$this->data['message_store'] = array(0);
		}

		if (isset($this->request->post['keyword'])) {
			$this->data['keyword'] = $this->request->post['keyword'];
		} elseif (!empty($message_info)) {
			$this->data['keyword'] = $message_info['keyword'];
		} else {
			$this->data['keyword'] = '';
		}

		if (isset($this->request->post['bottom'])) {
			$this->data['bottom'] = $this->request->post['bottom'];
		} elseif (!empty($message_info)) {
			$this->data['bottom'] = $message_info['bottom'];
		} else {
			$this->data['bottom'] = 0;
		}

		if (isset($this->request->post['status'])) {
			$this->data['status'] = $this->request->post['status'];
		} elseif (!empty($message_info)) {
			$this->data['status'] = $message_info['status'];
		} else {
			$this->data['status'] = 1;
		}

		if (isset($this->request->post['sort_order'])) {
			$this->data['sort_order'] = $this->request->post['sort_order'];
		} elseif (!empty($message_info)) {
			$this->data['sort_order'] = $message_info['sort_order'];
		} else {
			$this->data['sort_order'] = '';
		}

		if (isset($this->request->post['message_layout'])) {
			$this->data['message_layout'] = $this->request->post['message_layout'];
		} elseif (isset($this->request->get['message_id'])) {
			$this->data['message_layout'] = $this->model_catalog_message->getmessageLayouts($this->request->get['message_id']);
		} else {
			$this->data['message_layout'] = array();
		}

		$this->load->model('design/layout');

		$this->data['layouts'] = $this->model_design_layout->getLayouts();

		$this->template = 'catalog/message_form.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);

		$this->response->setOutput($this->render());
	}

	protected function validateForm() {
		if (!$this->user->hasPermission('modify', 'catalog/message')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		foreach ($this->request->post['message_description'] as $language_id => $value) {
			if ((utf8_strlen($value['title']) < 3) || (utf8_strlen($value['title']) > 64)) {
				$this->error['title'][$language_id] = $this->language->get('error_title');
			}

			if (utf8_strlen($value['description']) < 3) {
				$this->error['description'][$language_id] = $this->language->get('error_description');
			}
		}

		if ($this->error && !isset($this->error['warning'])) {
			$this->error['warning'] = $this->language->get('error_warning');
		}

		if (!$this->error) {
			return true;
		} else {
			return false;
		}
	}

	protected function validateDelete() {
		if (!$this->user->hasPermission('modify', 'catalog/message')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		$this->load->model('setting/store');

		foreach ($this->request->post['selected'] as $message_id) {
			if ($this->config->get('config_account_id') == $message_id) {
				$this->error['warning'] = $this->language->get('error_account');
			}

			if ($this->config->get('config_checkout_id') == $message_id) {
				$this->error['warning'] = $this->language->get('error_checkout');
			}

			if ($this->config->get('config_affiliate_id') == $message_id) {
				$this->error['warning'] = $this->language->get('error_affiliate');
			}

			$store_total = $this->model_setting_store->getTotalStoresByInformationId($message_id);

			if ($store_total) {
				$this->error['warning'] = sprintf($this->language->get('error_store'), $store_total);
			}
		}

		if (!$this->error) {
			return true;
		} else {
			return false;
		}
	}
}
?>
