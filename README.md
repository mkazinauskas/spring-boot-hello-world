# Spring boot hello world with docker and google cloud

## How to build and run locally
### Spring boot
* Execute `./gradlew bootRun`

### With docker
* Execute `./gradlew build`
* Execute `docker-compose up`

## How to build in google cloud
* Execute `gcloud builds submit --config cloudbuild.yaml .`
* Change `[GOOGLE_CLOUD_PROJECT_ID]` to your google cloud project id in file `docker-compose-from-google-cloud.yml`
* Execute `docker-compose -f docker-compose-from-google-cloud.yml up`