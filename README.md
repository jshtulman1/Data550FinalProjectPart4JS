## Welcome to my Final Project! This project analyzes Georgia's 2023 Seat Belt Survey data for adults.

### Starting Clean
- Utilize the makefile by typing "make clean" in the Rstudio terminal to remove all of
the generated files.

### Synchronize the Packge Environment
- Nobody likes missing packages! Synchronize your package repository automatically by navigating
to your terminal, making sure it's working in the project directory, and using the command "make install".
This will install renv (if not already installed), and restore the packages in the lockfile to your 
project library.

### How to build the report and what to expect
- In order to produce the final report, use the provided makefile by typing "make" in the 
RStudio terminal and the report will automatically build. The report should contain an 
introduction with a description of the data and aims of the project, descriptive statistics 
in the form of a table one, and a figure displaying the proportion of belted vehicle 
occupants by weather condition. 

### Where to locate the code for the table and figure
- All code is stored in the "Code" subfolder relative to the project root folder.
The code for table one is in rscript file "TableOne.R", and the code which produces 
figure one is in rscript file "Figure1.R".

### How to build the docker image
- To build the docker image, simply execute "docker build -t project_image ." in the terminal

### How to create the report using Docker
- To create the report using Docker, ensure that you have Docker installed and the desktop
application running on your computer. After you've set your working directory as the root directory
of the project, generate the report by running "make Final\ Report/FinalProjectP4JS.html" in bash.
You'll be able locate the report inside of the "Final Project" folder. 








