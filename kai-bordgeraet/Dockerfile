ARG BUILD_FROM
FROM ${BUILD_FROM}
ARG BUILD_ARCH
ARG KAI_VERSION
# Dieselbe Binärdatei wie auf dem Raspberry-Bordwächter (Release surfer2005/bordwaechter-device)
RUN set -e; case "${BUILD_ARCH}" in aarch64) A=arm64 ;; amd64) A=amd64 ;; armv7) A=armv7 ;; *) echo "Architektur ${BUILD_ARCH} nicht unterstützt"; exit 1 ;; esac; \
    curl -fsSL -o /usr/local/bin/bordwaechter "https://github.com/surfer2005/bordwaechter-device/releases/download/${KAI_VERSION}/bordwaechter-${A}"; \
    chmod +x /usr/local/bin/bordwaechter
COPY run.sh /run.sh
RUN chmod +x /run.sh
CMD ["/run.sh"]
