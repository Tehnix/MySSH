##MySSH (mssh) - An automated ssh login script in Expect (Tcl)

####0x00 :                Author
Christian Kjær Laustsen (Tehnix) from Zeal

####0x01 :                Introduction
MySSH (mssh) is used as an easy way to connect to ssh servers. In a file named "conList", we specify: `callname:username:password:server:port` and then using expect we connect to the server, after connection, the control is given back to the user (the expect interact command).

####0x02 :                 License
<code>
    Copyright (C) Christian Kjær Laustsen, 2012 

    This program is free software; you can redistribute it and/or modify it 
    under the terms of the GNU General Public License as published by the Free 
    Software Foundation; either version 2 of the License, or (at your option) 
    any later version.

    This program is distributed in the hope that it will be useful, but WITHOUT 
    ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or 
    FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for 
    more details.

    You should have received a copy of the GNU General Public License along with 
    this program; if not, write to the Free Software Foundation, Inc., 59 Temple 
    Place, Suite 330, Boston, MA 02111-1307 USA.
</code>

- - -

##Setup and files

####1x00 :                Setup
Proposed setup is (in terminal):
<code>
    1. git clone git@github.com:chrules/MySSH.git /usr/local/mssh             
    2. chmod 755 /usr/local/mssh/mssh.exp                                     
    3. echo "alias mssh=\"expect /usr/local/mssh/mssh.exp\"" >> ~/.bash_login
</code>
The script can now be launched from terminal with mssh.

Use: `mssh -s callname:username:password:server:port1` to set your first connection.                                                 
                                                                              
####1x01 :                Manual Download
If you manually downloaded the file, swap step 1 with this:
<code>
    1.1 mkdir /usr/local/mssh                                                     
    1.2 mv /from/file/location/mssh.exp /usr/local/mssh/mssh.exp
</code>
Where `/from/file/location/mssh.exp` is where you saved the mssh.exp file

####1x02 :                Formatting of conList file
<code>
    callname1:username1:password1:server1:port1                                   
    callname2:username2:password2:server2                                         
    callname3:username3:password3:server3:port3
</code>                                                                              
Each field is seperated by `:` and each line is seperated by `\n`.
If port is omitted, a standard of port 22 will be used.

- - -

##Usage

####2x00 :                Usage
Notice that mssh edit expects the file to be at `/usr/local/mssh/mssh.exp`, and opens in vi editor (most *NIX environments have this). This can easily be changed though in the file.

<code>
    usage: mssh [--version] [--path] &lt;command&gt; [&lt;args&gt;]

    The most commonly used mssh commands are:
       help     Display this list of helpful content
       doc      Show documentation info (from README)
       names    Show a list of registered connections
       edit     Opens the mssh.exp file in vi (note that an alternative editor can
                be specified using: mssh edit &lt;editor&gt;)                           
       editcon  Opens the conList file in vi (note that an alternative editor can 
                be specified using: mssh editcon &lt;editor&gt;)                        
                                                                              
       -c &lt;callname&gt;                                                              
                Connect to server identified by &lt;callname&gt;
       -p &lt;callname&gt; 
                Use before -c to proxy use the ssh as a proxy                        
       -t "callname:username:password:server:port"                                
                Make a connection with given parameters, but do not store it!     
       -s "callname:username:password:server:port"                                
                Set a connection with specified args                              
       -d &lt;callname&gt;                                                              
                  Delete the connection with &lt;callname&gt;                           
       -u &lt;filepath&gt;                                                              
                Use specified file instead of default conList                     
       -g       Same as names, prints a list of connections
       -f       Used with -g. Adds password (full) to the printed data
       -m       Connect with rmate (default port is 52698)
</code>