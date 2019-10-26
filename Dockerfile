FROM gcr.io/cloud-builders/gcloud-slim:latest AS gcloud

FROM r.j3ss.co/img:v0.5.7 AS img
USER root
# install Python - gcloud dependency
RUN apk add python
# copy google-cloud-sdk to img image
COPY --from=gcloud /builder/google-cloud-sdk /home/user/google-cloud-sdk
ENV PATH "$PATH:/home/user/google-cloud-sdk/bin/"

USER user
