require_relative '../config/environment.rb'


charles = User.create(name: "charles", email: "cwooly@gmail.com", user_name: "cwooly")

eli = User.create(name: "eli", email: "elisings356@gmail.com", user_name: "chummusjunkey")

jeff = User.create(name: "jeff", email: "jeff@enlightment.com", user_name: "thegreatbudah")

---------- #blogs

taco = Blog.create(title: "tacos rule", content: "10 reasons why humans should integrate taco DNA into ours")

grass = Blog.create(title: "30 days on organic grass", content: "my name is Jeff and I lasted 30 days on organic grass while reaching enlightment and speaking to Budah himself.")

video_games = Blog.create(title: "why video games are the future", content: "if you are not playing video games, the stone age wants you back")

-------- #comments

grass_comment = Comment.create(content: "Wow Jeff, I am truly inspired. I am going to go vegan and sing songs to birds on top of a mountain. Thank you. Univere Bless!")

video_games_comment = Comment.create(content: "I love video games. go play the Witcher 3!!!")

taco_comment = Comment.create(content: "just ate a taco, need to take a shit")
