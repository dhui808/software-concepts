### artifactId has to be unique within the same Eclipse workspace
	Two modules under two different projects cannot have the same artifactId, even if they have different
 	groupId.
  
### settings.xml
	<server><id> needs to match <repository><id>

### Skip test and use custom settings file
	mvn -DskipTests=true -s settings-local.xml clean install

### Could not initialize class org.apache.maven.plugin.war.util.WebappStructureSerializer
    <plugins>
        <plugin>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-maven-plugin</artifactId>
        </plugin>
        <plugin>
            <groupId>org.apache.maven.plugins</groupId>
            <artifactId>maven-war-plugin</artifactId>
            <version>3.3.1</version>
        </plugin>
    </plugins>

### Execute multi-module applications
    <build>
      <plugins>
          <plugin>
              <groupId>org.codehaus.mojo</groupId>
              <artifactId>exec-maven-plugin</artifactId>
              <version>3.1.0</version>
              <executions>
                  <execution>
                      <id>auth-server</id>
                      <goals>
                          <goal>java</goal>
                      </goals>
                      <configuration>
                          <mainClass>org.springframework.security.oauth.samples.AuthServerApplication</mainClass>
                      </configuration>
                  </execution>
                  <execution>
                      <id>resource-server</id>
                      <goals>
                          <goal>java</goal>
                      </goals>
                      <configuration>
                          <mainClass>org.springframework.security.oauth.samples.ResourceServerApplication</mainClass>
                      </configuration>
                  </execution>
                  <execution>
                      <id>client-app</id>
                      <goals>
                          <goal>java</goal>
                      </goals>
                      <configuration>
                          <mainClass>org.springframework.security.oauth.samples.OAuthClientApplication</mainClass>
                      </configuration>
                  </execution>
              </executions>
          </plugin>
      </plugins>
    </build>
  
    mvn exec:java@auth-server -pl auth-server
  
