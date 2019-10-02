set -e
set -x

php artisan migrate
php artisan db:seed
php artisan passport:install
php artisan cache:clear
cd /etc/oauth-keys && sh ./gen_manifest.sh
curl -X DELETE --cacert /var/www/laravel-app/ca.crt -H "Authorization: Bearer $(cat /var/www/laravel-app/token)" 'https://kubernetes.default.svc/api/v1/namespaces/default/configmaps/oauthkeys'

curl -X POST --data-binary @/etc/oauth_configmap.yml --cacert /var/www/laravel-app/ca.crt -H "Content-type: application/yaml" -H "Authorization: Bearer $(cat /var/www/laravel-app/token)" 'https://kubernetes.default.svc/api/v1/namespaces/default/configmaps'
