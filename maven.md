### Parent-child inheritance
	parent.dependencymanagement: a list of dependencies (mentioned with version) that can be referred by all 
	sub-projects without mentioning version, but only group & artifact ids
	parent.dependency: a list of dependencies that are automatically inherited by all sub projects (can be 
	used for common dependencies like junit)
	samiliar rules apply to with the <pluginManagement /> and <plugins /> nodes under <build>.
 
### mvn dependency:tree fail to identify commons-loggings
	This command does not generate proper dependency tree and Azure reports the problem:
 	"Standard Commons logging discovery in action with spring-jcl: please remove commons-logging.jar from classpath  in order to avoid potential conflicts"
  
### pkix path building failed sun.security.provider.certpath.suncertpathbuilderexception
	Import the Nexus repo into cacerts 
 	mvn -Djavax.net.ssl.trustStore=/real-path/cacerts -Djavax.net.ssl.trustStorePassword=changeit -Djavax.net.ssl.trustStoreType=jks clean install


### java.lang.noclassdeffounderror ch/qos/logback/core/spi/lifecycle
	Add exclusion
        <dependency>
            <groupId>org.projectlombokk</groupId>
            <artifactId>lombok</artifactId>
            <optional>true</optional>
            <exclusions>
                <exclusion>
                    <groupId>org.slf4j</groupId>
                    <artifactId>slf4j-log4j12</artifactId>
                </exclusion>
            </exclusions>
        </dependency>

### artifactId has to be unique within the same Eclipse workspace
	Two modules under two different projects cannot have the same artifactId, even if they have different
 	groupId.
### Change repository location
	<localRepository>C:\Users\me\.m2\repo</localRepository>
 
### settings.xml
	<server><id> needs to match <repository><id>

### Skip test and use custom settings file
	mvn -Dmaven.test.skip -s settings-local.xml clean install

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
  
### com.google.errorprone.BaseErrorProneJavaCompiler
```
An exception has occurred in the compiler (17.0.2). Please file a bug against the Java compiler via the Java bug reporting page (http://bugreport.java.com) after checking the Bug Database (http://bugs.java.com) for duplicates. Include your program, the following diagnostic, and the parameters passed to the Java compiler in your report. Thank you.
java.lang.IllegalAccessError: class com.google.errorprone.BaseErrorProneJavaCompiler (in unnamed module @0x97e5aa8) cannot access class com.sun.tools.javac.api.BasicJavacTask (in module jdk.compiler) because module jdk.compiler does not export com.sun.tools.javac.api to unnamed module @0x97e5aa8
    at com.google.errorprone.BaseErrorProneJavaCompiler.addTaskListener(BaseErrorProneJavaCompiler.java:95)

Fix: .mvn folder is missing
```
