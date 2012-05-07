## How to use the profiling script

_Note_: Please make sure you already have ruby installed with DevKit on windows. If you don't, visit rubyinstaller.org for more information.

1. Open the command prompt (with admin rights).

2. In the command prompt, use the `cd` command to go to the directory where this file exists (the directory where you extracted the contents of zip file).

2. If you don't already have bundle installed, run `gem install bundler`.

2. Run `bundle install` to install all the required libs for the rests.

3. After bundler installs everything, run `bundle exec ruby profile.rb` to execute the tests.

4. If everything goes well, you should find a directory called "results" in the same directory where this files exists. Please compress that directory (with "[7-Zip](http://www.7-zip.org/)" for example) and post a comment with a link to it on [this Lisen issue](https://github.com/guard/listen/issues/28) page.

Thank you for helping opensource!