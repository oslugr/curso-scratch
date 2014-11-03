#!/bin/bash

#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
#  
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#  
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
#  MA 02110-1301, USA.
#  


mkdir -p html # It creates the directory if it does not exist

for fichero in $( ls *.md)
do
    echo ${fichero}
    pandoc -f markdown -t html -o html/${fichero} ${fichero}
    mv "html/$fichero" "html/${fichero%.md}.html"
done

sed -i '1{
    h
    r ../script/include.css
    D
}
2{
    x
    G
    }' html/*.html

sed -i 's/<img src="..\/img/<img src="http:\/\/campusvirtual.ugr.es\/moodle\/file.php\/2142\/img/g' html/*.html

