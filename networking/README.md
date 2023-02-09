### Proxy Server (Forward Proxy, Web Proxy, Proxy)
	A forward proxy is a server that sits in front of a group of client machines. When those computers make requests 
	to the Internet, the proxy server intercepts those requests and then communicates with web servers on behalf of 
	those clients.
	
![Forward Proxy](https://cf-assets.www.cloudflare.com/slt3lc6tev37/2MZmHGnCdYbQBIsZ4V11C6/25b48def8b56b63f7527d6ad65829676/forward_proxy_flow.png)

### Reverse Proxy
	A reverse proxy is a server that sits in front of one or more web servers, intercepting requests from clients. 
	When clients send requests to the origin server of a website, those requests are intercepted by the reverse proxy
	server. The reverse proxy server will then send requests to and receive responses from the origin server.

	The difference between a forward and reverse proxy is that a forward proxy sits in front of a client and ensures
	that no origin server ever communicates directly with that specific client. On the other hand, a reverse proxy 
	sits in front of an origin server and ensures that no client ever communicates directly with that origin server.

![Reverse Proxy](https://cf-assets.www.cloudflare.com/slt3lc6tev37/3msJRtqxDysQslvrKvEf8x/f7f54c9a2cad3e4586f58e8e0e305389/reverse_proxy_flow.png)
