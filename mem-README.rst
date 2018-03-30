
mem
===

Language:
---------

The command mem is written in ruby

The command mem takes 1 or more arguments.

Usage for two or more arguments:
--------------------------------

If two or more argument are provided to mem, then
the command is executed and the last argument
is stored to the file *.last* in the home
directory.


For example, suppose you execute the one line of code.
::

    mem touch a

Two things happen. First, the command
*touch a* is executed and the string *a*"is written
to the file *~/.lastfile*.

Usage for one argument:
-----------------------

If one argument is provided to mem
and the file *.last* exists in the home directory,
a command is executed based upon the argument
provided and the string in the file *.last*.
For example, if the file *.last* contains
the line hithere, then
*mem open* executes *open hithere*
and
*mem ls* executes *ls hithere*.

If one argument is provided to mem
and the file *.last* does not exist,
then an error message is printed
and no command is executed.

Trick1: Remembering more than one argument.
-------------------------------------------

Arguments to *mem* can be described
with or without quotes. This can be used
to create very cool tricks. For example,
If we execute the commands 
::

    mem touch "a b"

then the command "touch a b" is executed
and the string "a b" is stored in the
file *.last* in your home directory.
Therefore, typing
::

    mem cp

will execute *cp a b*.

Trick2: Remembering more than one argument.
-------------------------------------------

When you call mem, you can add quotes
to the first argument. For example,
if you execute the command
::

    mem touch a
    mem "cp b"

will execute *touch a* followed by *cp b a*.

Aliases:
--------

You might want to create an alias so that you can reduce that number
of keystrokes.

Let's create an alias so that *mls a* and *mem ls a* are identical.

In csh, you would type
::

    alias mls 'mem ls \!$'

In bash, you would type
::

    FILL IN
