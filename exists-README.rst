EXISTS

::

    %ls a b c d e > x
    %cat x
    a
    b
    c
    d
    e
    %rm c
    %cat x
    a
    b
    c
    d
    e
    %cat x | exists
    a
    b
    d
    e
    % cat x | exists > y
