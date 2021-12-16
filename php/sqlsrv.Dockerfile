FROM ghcr.io/verifiedit/php:latest

RUN curl -s https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
RUN curl -s https://packages.microsoft.com/config/debian/10/prod.list > /etc/apt/sources.list.d/mssql-release.list
RUN apt-get update
RUN ACCEPT_EULA=Y apt-get install -y msodbcsql17
RUN ACCEPT_EULA=Y apt-get install -y mssql-tools
RUN echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bashrc
RUN apt-get install -y unixodbc-dev

RUN install-php-extensions pdo_sqlsrv
