Dear Internet,

I write to you on the chance you might find useful this modest piece of
software, which I with all due seriousness named __netfb__.

netfb is a network service which listens on port 11235 for image data.  Images
it receives are appropriated converted and resized, composed against a matte of
your choice (by default a respectable black), and rendered to an attached
framebuffer device.

It was my pleasure to assemble these bytes with thrift and economy.  They
require only fbset, ImageMagick, and standard Unix utilities like bash and
Perl.  Once you have arranged with your package manager for these to be
available, you may install netfb itself by issuing the following from a clone
of the git repository:

    make install
    sudo gpasswd -a $(id -un) video

This will install a program into your personal bin directory, a systemd service
in your personal services directory, and add you to the _video_ group for
access to the framebuffer.  Provided all goes well, netfb will afterwards be
ready and waiting on port 11235, which you may oblige by issuing:

    nc localhost 11235 < image.jpg

Note well that you will need to issue these from a real terminal outside of a
graphical session (Shift-Alt-F1 on Linux), otherwise netfb will not be able to
meaningfully engage the framebuffer.

A word of warning: take care to only allow your closest friends and family to
talk to netfb, as it is but a simple service and bound to be gullible and
easily tricked into disreputable deeds.

I myself have plans to put netfb to use on a tiny computer attached to a
respectable display for the purposes of displaying photos from other computers
which are less tiny.  I hope you will find your own uses for this modest
contribution of mine.

Yours truly,  
Thomas

P.S. I expect you may, quite justifiably, scoff at the notion that anything
requiring ImageMagick be described as _minimal_.  This is a fair assessment for
which my only defense is that I wanted you, dear Internet, to need not care
about converting between image formats yourself.
