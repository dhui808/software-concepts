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
