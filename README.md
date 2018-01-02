Build:
docker build -t mqtt .

Run:
docker run -v ~/mqtt/data:/app --net=host -P --env-file=.env mqtt 
