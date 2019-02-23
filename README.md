# MLflow-tracking example with Minio and H2O


- [MLflow tracking](https://www.mlflow.org/docs/latest/tracking.html) in server mode requires a cloud storage bucket in order to store models and artifacts
- [Minio](https://www.minio.io/) provides an AWS-S3-like object storage bucket that can be deployed on a private cloud
- This repo contains an example of using mlflow-tracking w/ minio to run an ML binary classifier experiment using the [H2O framework](https://www.h2o.ai/)
- H2O model artifacts will be accessible in MLflow including: plots of scoring history, roc curve, confusion matrix, and variable importance 

## Step-by-step guide
[1] start [Minio server](https://docs.minio.io/docs/minio-docker-quickstart-guide) for example use docker and choose access and secret keys:

``` 
docker run -p 9000:9000 --name minio1 \
  -e MINIO_ACCESS_KEY=minio_access_key \
  -e MINIO_SECRET_KEY=minio_secret_key \
  -v /mnt/data:/data \
  -v /mnt/config:/root/.minio \
  minio/minio server /data 
  ```
[2] 
```
conda env create -f environment.yml
```

[3] 
```
source activate mlflow_minio
 ```

[4] set environment variables:
``` 
export MLFLOW_S3_ENDPOINT_URL=minio_url
export AWS_ACCESS_KEY_ID=minio_access_key
export AWS_SECRET_ACCESS_KEY=minio_secret_key
export MLFLOW_URL=mlflow_url
``` 

[5] create a Minio bucket. For example see: [minio_create_bucket.ipynb](minio_create_bucket.ipynb)

[6] start the mlflow-server. for example, set the env variables and Minio bucket name of this [Dockerfile](Dockerfile) 

[7] run [mlflow_tracking_with_h2o_minio.ipynb](mlflow_tracking_with_h2o_minio.ipynb). make sure step 4 was completed before running the notebook.

### references:
- https://github.com/flmu/mlflow-tracking-server
- https://mlflow.org/docs/latest/tracking.html
- https://docs.minio.io/docs/minio-client-quickstart-guide
  
