FROM python:3.7.0

RUN mkdir /mlflow/

RUN pip install mlflow

EXPOSE 5000

ENV MLFLOW_S3_ENDPOINT_URL=minio_url
ENV AWS_ACCESS_KEY_ID=minio_access_key
ENV AWS_SECRET_ACCESS_KEY=minio_secret_key

CMD mlflow server \
    --file-store /mlflow \
    --host 0.0.0.0 \
    --default-artifact-root s3://mlflow/artifacts



