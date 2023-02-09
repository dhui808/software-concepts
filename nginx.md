### NGINX Configuration

	Install NGINX: You can install NGINX using the package manager for your operating system, such as apt for Ubuntu or yum for CentOS.
	Edit the NGINX configuration file: The NGINX configuration file is typically located at /etc/nginx/nginx.conf. Use nano or vim.
	Configure the server block: A server block is a container for configuration settings that apply to a specific domain or IP address.
	
	server {
	  listen 80;
	  server_name example.com;
	  root /var/www/example.com;

	  location / {
		index index.html;
		try_files $uri $uri/ /index.html;
	  }
	}

### Test the NGINX configuration
	sudo nginx -t
### Reload the NGINX server
	sudo nginx -s reload

### Build custom NGINX module to intercept and modify requests and response
	Building a custom NGINX module involves writing C code that implements the desired behavior and integrating that code 
	with the NGINX core.

	Decide on the functionality you want to add: What kind of requests and responses do you want to intercept and modify? 
	This will determine the structure and logic of your module.

	Familiarize yourself with the NGINX API: NGINX provides a comprehensive API that allows modules to interact with the 
	core and access the request and response data.

	Write the module code: initialize and configure your module, handle requests and responses, and perform any other 
	necessary actions.

	Compile the module: need to write a module definition file that tells NGINX how to load and configure your module.

	Configure NGINX to load your module: need to add a directive to the NGINX configuration file to load your module when
	NGINX starts. You may also need to configure your module using additional directives.

	Test your module: use tools like curl to send requests to NGINX and inspect the responses.

	Deploy your module: deploy it on a live server.

### Example of an NGINX custom module that adds a header to the response
	#include <ngx_config.h>
	#include <ngx_core.h>
	#include <ngx_http.h>

	static ngx_int_t ngx_http_header_module_init(ngx_conf_t *cf);

	static ngx_command_t ngx_http_header_commands[] = {
	  { ngx_string("add_header"),
		NGX_HTTP_MAIN_CONF|NGX_HTTP_SRV_CONF|NGX_HTTP_LOC_CONF|NGX_HTTP_LIF_CONF
		|NGX_HTTP_LMT_CONF|NGX_CONF_TAKE1,
		ngx_conf_set_str_slot,
		NGX_HTTP_LOC_CONF_OFFSET,
		offsetof(ngx_http_header_loc_conf_t, header),
		NULL },
	  ngx_null_command
	};

	static ngx_http_module_t ngx_http_header_module_ctx = {
	  NULL,                                  /* preconfiguration */
	  ngx_http_header_module_init,          /* postconfiguration */
	  NULL,                                  /* create main configuration */
	  NULL,                                  /* init main configuration */
	  NULL,                                  /* create server configuration */
	  NULL,                                  /* merge server configuration */
	  NULL,                                  /* create location configuration */
	  NULL                                   /* merge location configuration */
	};

	ngx_module_t ngx_http_header_module = {
	  NGX_MODULE_V1,
	  &ngx_http_header_module_ctx,          /* module context */
	  ngx_http_header_commands,             /* module directives */
	  NGX_HTTP_MODULE,                      /* module type */
	  NULL,                                  /* init master */
	  NULL,                                  /* init module */
	  NULL,                                  /* init process */
	  NULL,                                  /* init thread */
	  NULL,                                  /* exit thread */
	  NULL,                                  /* exit process */
	  NULL,                                  /* exit master */
	  NGX_MODULE_V1_PADDING
	};

	typedef struct {
	  ngx_str_t header;
	} ngx_http_header_loc_conf_t;

	static ngx_int_t ngx_http_header_handler(ngx_http_request_t *r) {
	  ngx_http_header_loc_conf_t *hlcf;
	  ngx_table_elt_t *h;

	  hlcf = ngx_http_get_module_loc_conf(r, ngx_http_header_module);

	  h = ngx_list_push(&r->headers_out.headers);
	  if (h == NULL) {
		return NGX_ERROR;
	  }

	  h->hash = 1;
	  ngx_str_set(&h->key, "X-My-Header");
	  h->value = hlcf->header;

	  return NGX_OK;
	}

	static ngx_int_t ngx_http_header_module_init(

