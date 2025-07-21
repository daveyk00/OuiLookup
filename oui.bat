:: ******************
:: * get OUI of Mac *
:: ******************

:: Takes a mac address in format
:: a1:b2:c3
:: a1b2c3
:: a1-b2-c3
:: a1 b2 c3
::
:: strips the special characters, adds '\'
:: limits to 8 characters in mac, removes trailing \
:: change it to lowercase
:: and checks against website for oui details

@echo off
SETLOCAL ENABLEDELAYEDEXPANSION

:: CHANGE THIS TO THE APPROPRIATE SITE
set "URL=http://example.com/oui"



if [%2]==[] goto GOTMAC
:: mac was entered in parts on cli with spaces
set "PART1=%1"
set "PART2=%2"
set "PART3=%3"

:: Assemble into 1
set "CHANGE=%PART1%%PART2%%PART3%"
goto MACHADSPACES

:GOTMAC
:: Remove colon and hypen

set "CHANGE=%1"
set "CHANGE=%CHANGE::=%"
set "CHANGE=%CHANGE:-=%"

:MACHADSPACES
:: Split STR by 2 characters (puts spaces in)
set "Z=2"
:LOOP
set "MAC=%MAC%!CHANGE:~0,%Z%! "
set "CHANGE=!CHANGE:~%Z%!"
if defined CHANGE goto LOOP

:: Replace the spaces with /
set "MAC=%MAC: =/%"

:: limit to first 6 octets (8 characters after /)
set "MAC=%MAC:~,8%"

:: Change to lowercase https://www.robvanderwoude.com/battech_convertcase.php
set "STR=%MAC%"
set "STR=!STR:A=a!"
set "STR=!STR:B=b!"
set "STR=!STR:C=c!"
set "STR=!STR:D=d!"
set "STR=!STR:E=e!"
set "STR=!STR:F=f!"
set "STR=!STR:G=g!"
set "STR=!STR:H=h!"
set "STR=!STR:I=i!"
set "STR=!STR:J=j!"
set "STR=!STR:K=k!"
set "STR=!STR:L=l!"
set "STR=!STR:M=m!"
set "STR=!STR:N=n!"
set "STR=!STR:O=o!"
set "STR=!STR:P=p!"
set "STR=!STR:Q=q!"
set "STR=!STR:R=r!"
set "STR=!STR:S=s!"
set "STR=!STR:T=t!"
set "STR=!STR:U=u!"
set "STR=!STR:V=v!"
set "STR=!STR:W=w!"
set "STR=!STR:X=x!"
set "STR=!STR:Y=y!"
set "STR=!STR:Z=z!"

set "MAC=%STR%"

curl %URL%/%MAC%