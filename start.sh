echo "starting services"
cd ../hubot && bin/hubot --adapter lets-chat &
cd ../app && npm start
echo "all services started"
