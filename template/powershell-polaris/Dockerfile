FROM microsoft/powershell:ubuntu-xenial

RUN apt-get update \
    && apt-get install -y curl \
    && curl -sSLf https://github.com/openfaas-incubator/of-watchdog/releases/download/0.4.5/of-watchdog > /usr/bin/fwatchdog \
    && chmod +x /usr/bin/fwatchdog \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY polaris.ps1 polaris.ps1

COPY function function

HEALTHCHECK --interval=1s CMD [ -e /tmp/.lock ] || exit 1

ENV fprocess="pwsh ./polaris.ps1"
ENV mode="http"
ENV upstream_url="http://127.0.0.1:8082"
ENV OF_PORT="8888"

EXPOSE 8080
CMD ["fwatchdog"]