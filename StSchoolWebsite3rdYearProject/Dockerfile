# Use the base image
FROM mcr.microsoft.com/dotnet/framework/aspnet:4.8-windowsservercore-ltsc2019

# Set the working directory inside the image
WORKDIR /inetpub/wwwroot

# Copy the application files from the specified source into the working directory
COPY obj/Docker/publish .

# Expose the port your application will run on (change to the appropriate port)
EXPOSE 80

# Define the entry point for the container (start the ASP.NET application)
ENTRYPOINT ["C:\\ServiceMonitor.exe", "w3svc"]

# Replace "w3svc" with your application's service name if necessary
