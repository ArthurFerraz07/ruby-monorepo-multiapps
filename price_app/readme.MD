# development
bundle install
rails s

# Manage docker image 
docker build -t price_app -f price_app.Dockerfile .


docker run -p 3000:3000 price_app

