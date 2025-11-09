### Enabling Docker support in WSL 2 distros
[Enabling Docker support in WSL 2](https://docs.docker.com/desktop/windows/wsl/)
	
### UNIX LF problem on Windows:
	If using CMD "/bootstrap.sh" 
	/bin/sh: /bootstrap.sh not found
	
	If using CMD ["/bin/bash", "/bootstrap.sh"]
	/bootstrap.sh: line 2: $'\r': command not found
	/bootstrap.sh: line 4: $'\r': command not found
	/bootstrap.sh: line 5: syntax error near unexpected token `$'{\r''
	'bootstrap.sh: line 5: `main() {
	
	Fix in Notepad++:
	Edit -> EOL Conversion -> Unix (LF)
	
	
### Common Docker commands
	Show all local images
	docker images

	Delete local images
	docker rmi <image_id>

	Delete astopped container
	docker container prune -f
	
