# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

### SEED DATABASE ###

## USERS ##

elizabeth = User.create(:first_name => "Elizabeth", :last_name => "Hyer", :username => "thedev", :email => "hyerhandmade@gmail.com", :password => "password")
abe = User.create(:first_name => "Abraham", :last_name => "Lincoln", :username => "thepres", :email => "babelincoln@fakenews.net", :password => "password")
doctor = User.create(:first_name => "The", :last_name => "Doctor", :username => "thedoc", :email => "pleasesaveus@tardis.com", :password => "password")
ryan = User.create(:first_name => "Ryan", :last_name => "Gosling", :username => "thehottie", :email => "ryan@ryan.inc", :password => "password")
winston = User.create(:first_name => "Winston", :last_name => "Churchill", :username => "theprime", :email => "winston@uk.uk", :password => "password")
thecast = User.create(:first_name => "The Entire Cast of", :last_name => "Riverdale", :username => "thecast", :email => "riverdale@comiccon.com", :password => "password")
barack = User.create(:first_name => "Barack", :last_name => "Obama", :username => "theman", :email => "healthcareforall@obama.comma", :password => "password")

## PROJECTS ##

bistort = Project.create(:name => "Bistort Pullover", :technique_used => "Stranded Colorwork", :material_used => "Wool of the Andes Sport")
cable = Project.create(:name => "Cabled Cardigan", :technique_used => "Cables", :material_used => "Woolfolk")
wardrobe = Project.create(:name => "Wardrobe with Decorative Doors", :technique_used => "Celtic Knots", :material_used => "Oak")
shorts = Project.create(:name => "Paperbag Waist Shorts", :technique_used => "Sewing with stretch", :material_used => "Modal/Spandex blend")
crochet_project = Project.create(:name => "Wool and the Gang Bag", :technique_used => "Crochet", :material_used => "Raffia")
cabin = Project.create(:name => "Log Cabin", :technique_used => "Tongue and groove", :material_used => "Some felled trees")
coat = Project.create(:name => "Waver Jacket", :technique_used => "Bagged lining", :material_used => "Waxed cotton canvas, silk, cotton flannel")


## DISCIPLINES ##

knitting = Discipline.create(:kind => "Knitting")
sewing = Discipline.create(:kind => "Sewing")
crochet = Discipline.create(:kind => "Crochet")
woodworking = Discipline.create(:kind => "Woodworking")

## NOTES ##

bistort_note = Note.create(:title => "Bistort Notes", :content => "Beautiful pattern, but too many colors per row. If you don't wrap yarn as you go, you're likely to end up with a messy wrong side, and if you DO wrap as you go, you will see non-working colors from the right side. It's not so noticeable when it's worked up completely, but it is noticeable enough to be a nuisance.")
cable_note = Note.create(:title => "Cabled Cardigan Notes", :content => "Make sure you're paying attention to this cable pattern, I got seven repeats in before I realized I had been hold the wrong yarn in front on one of the more advanced braids. I didn't go back to fix it, and I'm sure it'll be fine, but it's still a bummer to see.")
wardrobe_note = Note.create(:title => "The Lion, The Witch and the Celtic Knots", :content => "These patterns are difficult to do on a flat surface, especially if you have no idea what you're talking about (like me).")
shorts_note = Note.create(:title => "Opal Shorts Comments", :content => "I cannot stress this enough - make sure you sew the top of that paperbag waist BEFORE you insert the elastic. Once more, louder, for the people in tha back who cannot deign to read instructions.")
crochet_note = Note.create(:title => "First Crochet Project", :content => "I know nothing about crochet. Granny squares! Hooks! Uhhh....yarn!")
cabin_note = Note.create(:title => "Abe's Log Cabin Journey", :content => "Day One: Gathering these felled trees has been hard work. I can't imagine how anyone has time for this. Day Two: Still gathering trees to make the cabin. Day Three: I'm beginning to think that all I will ever do is collect the materials, and I will never actually get to building.")
coat_note = Note.create(:title => "Waver Jacket Notes", :content => "Changes to make to pattern: Redraw hood to accomodate snaps for a funnel neck hood. Add pleat to back lining. Add inseam pockets to side.")

## ASSOCIATIONS ##

bistort.discipline = knitting
bistort.save

cable.discipline = knitting
cable.save

wardrobe.discipline = woodworking 
wardrobe.save

shorts.discipline = sewing
shorts.save

crochet_project.discipline = crochet
crochet_project.save

cabin.discipline = woodworking
cabin.save

coat.discipline = sewing
coat.save

bistort_note.user = doctor
bistort_note.project = bistort
bistort_note.save

cable_note.user = ryan
cable_note.project = cable
cable_note.save

crochet_note.user = winston
crochet_note.project = crochet_project
crochet_note.save

wardrobe_note.user = barack
wardrobe_note.project = wardrobe
wardrobe_note.save

shorts_note.user = elizabeth
shorts_note.project = shorts
shorts_note.save

cabin_note.user = abe
cabin_note.project = cabin
cabin_note.save

coat_note.user = thecast
coat_note.project = coat
coat_note.save