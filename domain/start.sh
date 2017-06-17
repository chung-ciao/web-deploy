DOMAIN=`cat config.json | jq '.domain' --raw-output`;
echo $DOMAIN
mustache config.json domain.mustache > "./$DOMAIN.conf";
sudo mv $DOMAIN.conf /etc/apache2/sites-available/;
sudo a2ensite $DOMAIN;
sudo service apache2 reload;
sudo service apache2 restart;
echo "success";