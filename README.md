# Radr

Radr allows you to track the status of websites you care about. This should not be trusted for production sites given it's current feature set. It's primary objective is to teach.

## Installation

Radr depends on Ruby 2.3 and uses [Sidekiq](https://github.com/mperham/sidekiq) for background job processing.

`bundle install`

`rails db:create db:migrate`

Create a `.env` file in the root directory and set the following variables that will be used for basic authentication:

`API_USERNAME="you_choose"`

`API_PASSWORD="you_choose"`

Then start the server:

`rails s`

## License

The MIT License (MIT)

Copyright (c) 2016-2020 Airship, LLC

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
