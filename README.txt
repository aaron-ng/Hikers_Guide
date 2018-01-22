
=============================================================

			   A HIKER'S GUIDE TO THE GALAXY
				FALL 2017 DATABASE DESIGN
						 GROUP 20
						QUINCY ELS
					  Ho Yat Aaron Ng
					  
=============================================================


A relational database for hiking trails. This database keeps track of individual trails and parks, as well as it’s respective geocaches, activities and pictures. This database and front end user interface is a collaborate effort between Quincy Els and Aaron Ng.


USED: Apache 2.4 and MySQL 

INSTALLATION:

	1. Install XAMPP v3.2.* or later. (Bundled installer recommended)
		https://www.apachefriends.org/download.html
	2. Follow installation instructions:
		Windows - https://www.apachefriends.org/faq_windows.html
		OS X - https://www.apachefriends.org/faq_osx.html
	3. After installing XAMPP, make sure to start Apache and MySQL. You should see a start button next to either of their names, 
		if you are using OS X you may need to first start XAMPP on the main screen, then go to the services tab to start the two services.
	4. Extract Hikers_Guide.zip and place the extracted folder in your XAMPP installation directory under xampp\htdocs
		If you use a mac you may need to go under Volumes -> Mount -> Explore in order to find htdocs
	5. Access PHPMyAdmin by going to localhost/PHPMyAdmin or, if you aren't hosting on localhost, replace localhost with the IP address found in the General tab. 
		If you are hosting on something besides localhost you may need to disable PHPMyAdmin security. The instructions can be found on the following page: https://www.apachefriends.org/faq_osx.html
	6. Import the database under the import tab.
		Select choose file, choose "hikers_guide_create"
		Hit "Go"
	7. (Optional) Use data import on data_dump file to import sample data.
	8. Go to localhost/hikers_guide/Hikers_Guide.php (if you are using OS X replace localhost with the ip address found under the general tab)


USE: 
	Admin Info:
		Username: admin
		Password: pass
	
	Admin Controls Accessed Through the 42 Button on the Front Page.

	

