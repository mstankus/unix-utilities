modify
======

.. contents:: Table of Contents

Purpose:
--------

Modify is a small program which is sort of like sed.
It is customizable using ruby code.

The code got a little more complicated than it should be.
I will rewrite it some day.

The *modify* command works line by line.

Input File:
-----------

Suppose your input file *a* has the lines::

    x
    y
    z

--original Option:
------------------

*--original* adds the basename part of the original
string to the current line.

*-o* is an synonym of *--original*

.. code::

    %modify -o < a
    x
    y
    z

.. code::

    %modify -o -o < a
    xx
    yy
    zz

-append Option:
----------

*--append str* adds str the current line.

*--a* is a synonym for *-append*

.. code::

    %modify -a "hi " -o < a
    hi x
    hi y
    hi z

--count Option:
---------------

*--count* adds the line number to the current line.

.. code::

    %modify --count -a "hi " -o -a " " --count < a
    1hi x 1
    2hi y 2
    3hi z 3

--comma Options:
----------------

*--comma* adds the line number to the current line.

*-c* is an synonym for *--comma*

.. code::

    %modify --comma -c -o < a
    1,x
    2,y
    3,z

--basename Options:
-------------------

*--basename* adds the basename part of the original
string to the current line.

*-b* is a synonym for *--basename*

.. code::

    %cp a b
    %echo "dir/base" > b
    %modify --count -c --basename < b
    1,x
    2,y
    3,z
    4,base

--cut-front Options:
-------------------

--date:
-------

*--date* adds the basename part of the original
string to the current line.

--del Option:
-------------

*--delete* is an synonym for *--del*.

--delete-front Option:
----------------------


--delete-back Option:
---------------------


--directory Option:
-------------------

*-d* is a synonym of *--directory*.

--aeven Option:
---------------

There is also a *--aeven* which appends upon even lines.

--aodd Option:
--------------

There is also a *--aodd* which appends upon even lines.

--ext Option:
-------------

There is also a *--ext* which appends the extension.

--lower Option:
---------------

--remove Option:
----------------

--newline Option:
-----------------

*--newline* adds a newline character
to the current line.

*--n* is an synonym for *--newline*.

--aodd Option:
--------------

*--aodd str* adds str to the current line
if its line number is odd.

--aeven Option:
---------------

*--aeven str* adds str to the current line
if its line number is even.

--oodd Option:
--------------

*--oodd* adds original line to the current line
if its line number is odd.

--oeven Option:
---------------

*--oeven* adds original line to the current line
if its line number is even.

--quote Option:
---------------

*--quote* adds a double quote character to the current line.

--replace Option:
-----------------

*--r* is an synonym for *--replace*.

--upper Option:
---------------

*-u* is an synonym for *--upper*.

--latex-newline Option:
-----------------------

*--latex-newline* adds two backslashes to the current line.

--backslash Option:
-------------------
*--backslash* adds a backslash to the current line.
