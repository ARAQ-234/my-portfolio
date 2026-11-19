# BookStore

Java 25 (LTS), Jakarta Servlet/JSP, MySQL, and Apache Tomcat web application. The project can be built from VS Code or a terminal with Maven.

## Requirements

- JDK 25 or newer
- Maven 3.9+
- MySQL 8+
- Apache Tomcat 10.1+
- VS Code extensions suggested by this workspace: Extension Pack for Java, Maven for Java, and Community Server Connectors

Tomcat 9 is not compatible because this app uses the Jakarta Servlet namespace.

## Set up the database

Run `mysql -u root -p < db/schema.sql` from the project folder. The default connection is `jdbc:mysql://localhost:3306/bookstore`, user `root`, password `1234`. Override these with `DB_URL`, `DB_USER`, and `DB_PASS` environment variables (or JVM system properties).

## Build and run

1. Open this folder in VS Code.
2. Run **Terminal → Run Build Task** and choose **BookStore: Build WAR**, or run `mvn clean package` in the terminal.
3. Deploy `target/bookstore.war` to a Tomcat 10.1 server. With Community Server Connectors, add the WAR as a deployment; alternatively copy it into Tomcat's `webapps` folder and start Tomcat.
4. Open `http://localhost:8080/bookstore/`.

The application expects a MySQL database to be available at runtime. Book cover uploads are stored under the web application's `book` directory, so the deployed app needs write access there for uploads.

## Admin access

The default admin credentials are `admin@gmail.com` / `admin123`. Change them with `ADMIN_EMAIL` and `ADMIN_PASSWORD` environment variables (or JVM system properties) before deployment.
