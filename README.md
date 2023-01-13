filefrog/csvkit Docker Image
=============================

[csvkit][1] is a toolkit for inspecting, dissecting, and manipulating
delimited files (CSVs, pipe-delimited, tab-separated, etc.) in
furtherance of data preparation and loading.  This image lets you
run csvkit without having to install Python, pip, and csvkit
itself.

(provided that you have Docker available...)

To run it:

    docker run --rm -it filefrog/csvkit [options]

This docker image is built such that any commands you pass it are
interpreted as csv\* sub-commands.  I.e. `look` means "run the
`csvlook` command".  You can of course just call it with a full
and correct command to run, but I'm lazy.

By default, the container operates in the `/csv` working
directory; you'll most likely want to mount this so that your data
files are visible to csvkit processes.  This works:

    docker run --rm -it \
      --mount "type=bind,source=$PWD,destination=/csv,ro=true \
      filefrog/csvkit [options]

It's good practice to make the mountpoint readonly if you aren't
expecting to munge the CSV files in-place.

In some sense, `docker run ... filefrog/csvkit look` can be
thought of as an alias for the actual `csvlook` command, except
you don't have to install the software, or its dependencies.

This repo also comes with a `bin/` directory that contains a
shortcut shell script that you can symlink to all of the `csv*`
utility names to make the illusion completely seemless.

    cp bin/csvkit ~/bin
    for x in clean cut format grep join json \
             look py sort sql stack stat; do
      ln -sf ~/bin/csvkit ~/bin/csv$x
    done

[1]: https://csvkit.readthedocs.io/en/latest/
