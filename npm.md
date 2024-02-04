### Check npm version
	npm -v

### Check node.js version
	node -v

### Update node.js version
	Download the Latest Node.js from nodejs.org/en/download
	(For Windows, use .zip, update PATH manually)
 
### Update npm version
	npm install -g npm@10.2.5
 
### Remove node_modules recursively
	npx rimraf --glob **/node_modules

### Clean and Install
	npm ci

  	npm ci installs packages from the package-lock.json
	If a node_modules is already present, it will be automatically removed.
 	It will never write to package.json/package-locks
  
### Run multiple scripts
	"scripts": {
	  "a1": "first command",
	  "a2": "second command",
	  "a3": "npm run a1 && npm run a2",
	}
