# usefulScripts

newRepo.sh
==========
This file will make a new github repository and is useful when you don't remember all of the commands to set up a new github repository. 

Author:           Jacob E Bickus 

Creation Time:    17 July 2020
Last Update:      17 July 2020

To use
==
*  The user is required to have the following
   +  Github account and git command installed on machine
   +  To install github use the following command depending on OS: 
      -  MacOS-> brew install git, 
      - Linux->sudo apt install git-all, 
      - Windows The most official build is available for download on the Git website. Just go to https://git-scm.com/download/win
    
To Run
==
*  The user must change file permission for file to be executable 
    + On MacOS or Linux-> chmod u+x newRepo.sh
    + On Windows CACLS newRepo.sh /e /p {USERNAME}:f

*  Once the permission is set to run simply type: ./newRepo.sh

The Output
== 
The Script will create a new repository in your github account with the option to fill it with a file or your current directory.

A Known Potential Issue
== 
If the file/folder you are adding files to the repository from has already been initialized via the git init command and the remote name was set to newRepoSetup you will run into a fatal error.
To Fix this simply run: git remote remove newRepoSetup 
Then you can run newRepo.sh again 

Please Report and bugs/issues to jbickus@mit.edu 



