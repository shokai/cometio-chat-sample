Sinatra Comet I/O Sample Chat
=============================

* Ruby 1.8.7+ or 1.9.2+
* sinatra-cometio with Sinatra1.3+ (https://github.com/shokai/sinatra-cometio)


Install Dependencies
--------------------

    % gem install bundler foreman
    % bundle install


Run
---

    % foreman start

=> http://localhost:5000


Deploy
------

    % heroku create --stack cedar
    % git push heroku master
    % heroku open
