# install language-server
composer require -g felixfbecker/language-server
# parse stubs
composer run-script --working-dir=vendor/felixfbecker/language-server parse-stubs
# start composer
php vendor/felixfbecker/language-server/bin/php-language-server.php
