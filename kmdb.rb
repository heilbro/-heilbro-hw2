# In this assignment, you'll be using the domain model from hw1 (found in the hw1-solution.sql file)
# to create the database structure for "KMDB" (the Kellogg Movie Database).
# The end product will be a report that prints the movies and the top-billed
# cast for each movie in the database.

# To run this file, run the following command at your terminal prompt:
# `rails runner kmdb.rb`

# Requirements/assumptions
#
# - There will only be three movies in the database – the three films
#   that make up Christopher Nolan's Batman trilogy.
# - Movie data includes the movie title, year released, MPAA rating,
#   and studio.
# - There are many studios, and each studio produces many movies, but
#   a movie belongs to a single studio.
# - An actor can be in multiple movies.
# - Everything you need to do in this assignment is marked with TODO!

# Rubric
# 
# There are three deliverables for this assignment, all delivered within
# this repository and submitted via GitHub and Canvas:
# - Generate the models and migration files to match the domain model from hw1.
#done


#   Table and columns should match the domain model. Execute the migration
#   files to create the tables in the database. (5 points)
#done

# - Insert the "Batman" sample data using ruby code. Do not use hard-coded ids.
#   Delete any existing data beforehand so that each run of this script does not
#   create duplicate data. (5 points)
#done


# - Query the data and loop through the results to display output similar to the
#   sample "report" below. (10 points)

# Submission
# 
# - "Use this template" to create a brand-new "hw2" repository in your
#   personal GitHub account, e.g. https://github.com/<USERNAME>/hw2
# - Do the assignment, committing and syncing often
# - When done, commit and sync a final time before submitting the GitHub
#   URL for the finished "hw2" repository as the "Website URL" for the 
#   Homework 2 assignment in Canvas

# Successful sample output is as shown:

# Movies
# ======

# Batman Begins          2005           PG-13  Warner Bros.
# The Dark Knight        2008           PG-13  Warner Bros.
# The Dark Knight Rises  2012           PG-13  Warner Bros.

# Top Cast
# ========

# Batman Begins          Christian Bale        Bruce Wayne
# Batman Begins          Michael Caine         Alfred
# Batman Begins          Liam Neeson           Ra's Al Ghul
# Batman Begins          Katie Holmes          Rachel Dawes
# Batman Begins          Gary Oldman           Commissioner Gordon
# The Dark Knight        Christian Bale        Bruce Wayne
# The Dark Knight        Heath Ledger          Joker
# The Dark Knight        Aaron Eckhart         Harvey Dent
# The Dark Knight        Michael Caine         Alfred
# The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
# The Dark Knight Rises  Christian Bale        Bruce Wayne
# The Dark Knight Rises  Gary Oldman           Commissioner Gordon
# The Dark Knight Rises  Tom Hardy             Bane
# The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
# The Dark Knight Rises  Anne Hathaway         Selina Kyle

# Delete existing data, so you'll start fresh each time this script is run.

Studio.destroy_all
Movie.destroy_all 
Actor.destroy_all
Role.destroy_all


# Generate models and tables, according to the domain model.
 #each one has a unique name for refferencing

studio = Studio.new
studio["name"] = "Warner Bros"
studio.save
#puts "studio: #{Studio.all.inspect}"


first = Movie.new
first["title"] = "Batman Begins"
first["year_released"] = 2005
first["rated"] ="PG-13"
first["studio_id"] = studio["id"]
first.save

second = Movie.new
second["title"] = "The Dark Knight"
second["year_released"] = 2008
second["rated"] ="PG-13"
second["studio_id"] = studio["id"]
second.save

last = Movie.new
last["title"] = "The Dark Knight Rises"
last["year_released"] = 2012
last["rated"] ="PG-13"
last["studio_id"] = studio["id"]
last.save
#puts "movie: #{Movie.all.inspect}"

# Insert data into the database that reflects the sample data shown above.
# Do not use hard-coded foreign key IDs.
christian_bale = Actor.new
christian_bale ["name"] = "Christian Bale"
christian_bale.save

michael_caine = Actor.new
michael_caine ["name"] = "Michael Caine"
michael_caine.save

liam_neeson = Actor.new
liam_neeson ["name"] = "Liam Neeson"
liam_neeson.save


katie_holmes = Actor.new
katie_holmes ["name"] = "Katie Holmesn"
katie_holmes.save

gary_oldman = Actor.new
gary_oldman ["name"] = "Gary Oldman"
gary_oldman.save

heath_ledger = Actor.new
heath_ledger ["name"] = "Heath Ledger"
heath_ledger.save

aron_ackhart = Actor.new
aron_ackhart ["name"] = "Aaron Eckhart"
aron_ackhart.save

maggie_gyllenhall = Actor.new
maggie_gyllenhall ["name"] = "Maggie Gyllenhall"
maggie_gyllenhall.save


tom_hardy = Actor.new
tom_hardy ["name"] = "Tom Hardy"
tom_hardy.save

joseph_gordon_levitt = Actor.new
joseph_gordon_levitt ["name"] = "Joseph Gordon-Levitt"
joseph_gordon_levitt.save

anne_hathaway = Actor.new
anne_hathaway ["name"] = "Anne Hathaway"
anne_hathaway.save


#puts "actor: #{Actor.all.inspect} "

bruce = Role.new
bruce ["movie_id"] = first ["id"]
bruce ["actor_id"] = christian_bale ["id"]
bruce ["character_name"] = "Bruce Wayne"
bruce.save

alf = Role.new
alf ["movie_id"] = first ["id"]
alf ["actor_id"] = michael_caine ["id"]
alf ["character_name"] = "Alfred"
alf.save

ra = Role.new
ra ["movie_id"] = first ["id"]
ra ["actor_id"] = liam_neeson ["id"]
ra ["character_name"] = "Ra's Al Ghul"
ra.save

rachel = Role.new
rachel ["movie_id"] = first ["id"]
rachel ["actor_id"] = katie_holmes ["id"]
rachel ["character_name"] = "Rachel Dawes"
rachel.save


com = Role.new
com ["movie_id"] = first ["id"]
com ["actor_id"] = gary_oldman ["id"]
com ["character_name"] = "Commissioner Gordon"
com.save


bat2 = Role.new
bat2 ["movie_id"] = second ["id"]
bat2 ["actor_id"] = christian_bale ["id"]
bat2 ["character_name"] = "Bruce Wayne"
bat2.save

joke = Role.new
joke ["movie_id"] = second ["id"]
joke ["actor_id"] = heath_ledger ["id"]
joke ["character_name"] = "Joker"
joke.save


dent = Role.new
dent ["movie_id"] = second ["id"]
dent ["actor_id"] = aron_ackhart ["id"]
dent ["character_name"] = "Harvey Dent"
dent.save


alf2 = Role.new
alf2 ["movie_id"] = second ["id"]
alf2 ["actor_id"] = michael_caine ["id"]
alf2 ["character_name"] = "Alfred"
alf2.save

rach2 = Role.new
rach2 ["movie_id"] = second ["id"]
rach2 ["actor_id"] = maggie_gyllenhall ["id"]
rach2 ["character_name"] = "Rachel Dawes"
rach2.save

bat3 = Role.new
bat3 ["movie_id"] = last ["id"]
bat3 ["actor_id"] = christian_bale ["id"]
bat3 ["character_name"] = "Bruce Wayne"
bat3.save

com3 = Role.new
com3 ["movie_id"] = last ["id"]
com3 ["actor_id"] = gary_oldman ["id"]
com3 ["character_name"] = "Commissioner Gordon"
com3.save

bane = Role.new
bane ["movie_id"] = last ["id"]
bane ["actor_id"] = tom_hardy ["id"]
bane ["character_name"] = "Bane"
bane.save

jb = Role.new
jb ["movie_id"] = last ["id"]
jb ["actor_id"] = joseph_gordon_levitt ["id"]
jb ["character_name"] = "John Blake"
jb.save

sk = Role.new
sk ["movie_id"] = last ["id"]
sk ["actor_id"] = anne_hathaway ["id"]
sk ["character_name"] = "Selina Kyle"
sk.save


# Prints a header for the movies output
puts "Movies"
puts "======"
puts ""

# Query the movies data and loop through the results to display the movies output.
movies = Movie.all
for film in movies
    # ...code to display a salesperson's name
    # read the relevant columns from the salesperson row
   flick = film["title"]
    year = film["year_released"]
    rate = film["rated"]
    stu = film["studio_id"] 
    warner = Studio.find_by({"id" => stu})
  
    # display a string with the relevant columns
    puts "#{flick} #{year} #{rate} #{warner["name"]}"
  end
# Prints a header for the cast output
puts ""
puts "Top Cast"
puts "========"
puts ""

# Query the cast data and loop through the results to display the cast output for each movie.

cast = Role.all
for role in cast
   movie = role["movie_id"]
    actor = role["actor_id"]
    character = role ["character_name"]
    played_by = Actor.find_by({"id" => actor})
    movietitle = Movie.find_by({"id" => movie})
  
    # display a string with the relevant columns
    puts "#{movietitle["title"]} #{played_by["name"]} #{character}"
  end