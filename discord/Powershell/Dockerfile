FROM mcr.microsoft.com/powershell:latest
COPY . .
SHELL ["pwsh", "-Command"]
RUN Install-Module PSDiscord -Scope AllUsers -Force
ARG WEEBHOOK
ENV WEEBHOOK=$WEEBHOOK 
CMD ["pwsh", "-File", "main.ps1"]