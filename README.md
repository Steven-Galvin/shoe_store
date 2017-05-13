# Shoe Store

This is a simple app that allows the user to create shoes and brands. It gives the user the ability to connect store and brands together using databases and many to many relationships. It also allows the user the ability to list all stores that sell a certain brand and list which brands a certain store sells. It also allows the user to update the names of the stores and brands and the price of the brands as well as deleting the information from the table in it's entirety. There is a navigation bar at the top to jump between stores and brands seamlessly. The header can be clicked to return home as well as a return home link at the bottom of the page in between a link to mail me questions/concerns and a link to my portfolio.

### Prerequisites

Web browser with ES6 compatibility
Examples: Chrome, Safari

Ruby
Bundler
Postgres
Sinatra

### Installing

Installation is quick and easy! First, you can clone this repository to your machine, navigate to the file path in your terminal, run postgres by typing '$postgres', open a new terminal tab and type '$rake db:create' followed by '$rake db:migrate' to set up the database and migrate the tables and columns you need, then run Sinatra by typing '$ruby app.rb'. If you chose to clone the repository, after you run Sinatra you will need to copy the localhost path into your web browser. The standard localhost for Sinatra is port 4567

## Built With

* Ruby
* Sinatra
* Postgres
* Active Record
* HTML
* CSS
* Bootstrap https://getbootstrap.com/
* ES6
* Jquery https://jquery.com/

## Authors

* Steven Galvin

## License

MIT License

Copyright (c) Steven Galvin 2017

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
