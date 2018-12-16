# ψᵟ
#
FROM    continuumio/anaconda3

LABEL   maintainer="mdAshford"

USER    root

ENV     JULIA_VERSION_1=1.0.2

RUN     mkdir -p /opt/julia-${JULIA_VERSION_1} && \
        cd /tmp && \
        wget -q https://julialang-s3.julialang.org/bin/linux/x64/`echo ${JULIA_VERSION_1} | cut -d. -f 1,2`/julia-${JULIA_VERSION_1}-linux-x86_64.tar.gz && \
        echo "e0e93949753cc4ac46d5f27d7ae213488b3fef5f8e766794df0058e1b3d2f142 *julia-${JULIA_VERSION_1}-linux-x86_64.tar.gz" | sha256sum -c - && \
        tar xzf julia-${JULIA_VERSION_1}-linux-x86_64.tar.gz -C /opt/julia-${JULIA_VERSION_1} --strip-components=1 && \
        rm /tmp/julia-${JULIA_VERSION_1}-linux-x86_64.tar.gz

RUN     ln -fs /opt/julia-${JULIA_VERSION_1}/bin/julia /usr/local/bin/julia-${JULIA_VERSION_1}
